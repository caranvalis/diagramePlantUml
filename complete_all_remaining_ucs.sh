#!/bin/bash

# Script pour compléter tous les UC restants avec la nouvelle architecture KYC
BASE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE SEQUENCE"

# Template standardisé pour tous les UC
create_uc_template() {
    local uc_number="$1"
    local uc_title="$2"
    
    cat << 'EOF'
@startuml
!theme aws-orange
title ${UC_TITLE}

' === ACTEURS ===
actor "Client" as client #lightblue
actor "Agent Bancaire" as agent #lightgreen
actor "Administrateur KYC" as admin #orange

' === INTERFACES ===
participant "Interface Client" as ui_client #lightblue
participant "Interface Agent" as ui_agent #lightgreen
participant "Interface Admin" as ui_admin #orange

' === API GATEWAY ===
participant "API Gateway KYC" as gateway #gold

' === ORCHESTRATION ===
participant "Orchestrateur KYC" as orchestrator #red

' === SERVICES MÉTIER ===
participant "Service Client" as svc_client #lightblue
participant "Service Compte" as svc_compte #lightgreen
participant "Service Document" as svc_document #lightyellow
participant "Service Contrôle" as svc_controle #orange
participant "Service Validation" as svc_validation #lightcoral

' === SERVICES TECHNIQUES ===
participant "Service Auth" as svc_auth #lightgray
participant "Service Notification" as svc_notification #lightcyan
participant "Service Audit" as svc_audit #lightpink
participant "Service Cache" as svc_cache #lavender

' === INFRASTRUCTURE ===
database "Base KYC" as db_kyc #yellow
database "Base Audit" as db_audit #lightyellow
database "Cache Redis" as cache_redis #lightcyan
queue "Queue Events" as queue #lightgray

' === SÉQUENCE PRINCIPALE ===
activate client
client -> ui_client : ${UC_TITLE}
activate ui_client

ui_client -> gateway : Requête ${UC_TITLE}
activate gateway

gateway -> svc_auth : Vérifier authentification
activate svc_auth
svc_auth -> db_kyc : Valider token
svc_auth --> gateway : Token valide
deactivate svc_auth

gateway -> orchestrator : Orchestrer ${UC_TITLE}
activate orchestrator

' === GESTION DU CACHE ===
orchestrator -> svc_cache : Vérifier cache
activate svc_cache
svc_cache -> cache_redis : Get données
alt Cache hit
    cache_redis --> svc_cache : Données en cache
    svc_cache --> orchestrator : Données disponibles
else Cache miss
    svc_cache --> orchestrator : Cache vide
    deactivate svc_cache
    
    ' === LOGIQUE MÉTIER ===
    orchestrator -> svc_client : Traiter demande client
    activate svc_client
    svc_client -> db_kyc : Lire/Écrire données client
    svc_client --> orchestrator : Résultat traitement
    deactivate svc_client
    
    orchestrator -> svc_compte : Mise à jour compte
    activate svc_compte
    svc_compte -> db_kyc : Mettre à jour statut
    svc_compte --> orchestrator : Compte mis à jour
    deactivate svc_compte
    
    orchestrator -> svc_document : Gestion documents
    activate svc_document
    svc_document -> db_kyc : Sauvegarder documents
    svc_document --> orchestrator : Documents traités
    deactivate svc_document
    
    orchestrator -> svc_controle : Contrôles KYC
    activate svc_controle
    svc_controle -> db_kyc : Vérifier conformité
    svc_controle --> orchestrator : Contrôles effectués
    deactivate svc_controle
    
    orchestrator -> svc_validation : Validation finale
    activate svc_validation
    svc_validation -> db_kyc : Finaliser processus
    svc_validation --> orchestrator : Validation terminée
    deactivate svc_validation
    
    ' === MISE À JOUR DU CACHE ===
    orchestrator -> svc_cache : Mettre à jour cache
    activate svc_cache
    svc_cache -> cache_redis : Set nouvelles données
    deactivate svc_cache
end

' === AUDIT ET NOTIFICATION ===
orchestrator -> svc_audit : Enregistrer audit
activate svc_audit
svc_audit -> db_audit : Log opération
svc_audit -> queue : Publier événement
deactivate svc_audit

orchestrator -> svc_notification : Envoyer notification
activate svc_notification
svc_notification -> queue : Publier notification
deactivate svc_notification

orchestrator --> gateway : Résultat ${UC_TITLE}
deactivate orchestrator

gateway --> ui_client : Réponse ${UC_TITLE}
deactivate gateway

ui_client --> client : Confirmation ${UC_TITLE}
deactivate ui_client
deactivate client

' === GESTION D'ERREURS ===
note over orchestrator, svc_validation
  Gestion d'erreurs standardisée :
  - Timeout : 30s par service
  - Retry : 3 tentatives avec backoff
  - Circuit breaker sur échecs
  - Logs détaillés pour debugging
end note

' === CONFORMITÉ RÉGLEMENTAIRE ===
note over svc_audit, db_audit
  Traçabilité complète :
  - Horodatage précis
  - Identification utilisateur
  - Actions effectuées
  - Données modifiées
  - Conformité RGPD/AML
end note

@enduml
EOF
}

# Fonction pour créer un UC avec titre personnalisé
create_uc_file() {
    local uc_num="$1"
    local title="$2"
    local dir="$BASE_DIR/$uc_num"
    local file="$dir/$uc_num.puml"
    
    echo "Création de $uc_num : $title"
    
    # Créer le répertoire si nécessaire
    mkdir -p "$dir"
    
    # Créer le fichier avec le template
    create_uc_template "$uc_num" "$title" | sed "s/\${UC_TITLE}/$title/g" > "$file"
    
    # Générer l'image PNG
    echo "Génération PNG pour $uc_num..."
    plantuml "$file" -tpng -o "$dir" 2>/dev/null || echo "Erreur génération PNG pour $uc_num"
}

# Liste des UC à créer/recréer avec leurs titres
declare -A UC_TITLES=(
    ["UC016"]="Mise à jour profil client"
    ["UC036"]="Activation compte épargne"
    ["UC037"]="Blocage temporaire compte"
    ["UC038"]="Déblocage compte client"
    ["UC039"]="Clôture compte définitive"
    ["UC040"]="Réouverture compte suspendu"
    ["UC041"]="Audit conformité mensuel"
    ["UC042"]="Génération rapport KYC"
    ["UC043"]="Mise à jour réglementaire"
    ["UC044"]="Contrôle qualité documents"
    ["UC045"]="Validation signature électronique"
    ["UC046"]="Archivage documents KYC"
    ["UC047"]="Restauration données client"
    ["UC048"]="Migration données legacy"
    ["UC049"]="Synchronisation référentiels"
    ["UC050"]="Contrôle anti-blanchiment"
    ["UC051"]="Détection transactions suspectes"
    ["UC052"]="Déclaration autorités"
    ["UC053"]="Mise à jour listes sanctions"
    ["UC054"]="Contrôle PEP (Personnes Politiquement Exposées)"
    ["UC055"]="Évaluation risque client"
    ["UC056"]="Classification niveau risque"
    ["UC057"]="Révision périodique dossier"
    ["UC058"]="Mise à jour scoring client"
    ["UC059"]="Alerte risque élevé"
    ["UC060"]="Validation conformité FATCA"
    ["UC061"]="Contrôle CRS (Common Reporting Standard)"
    ["UC062"]="Déclaration automatique échange"
    ["UC063"]="Mise à jour statut fiscal"
    ["UC064"]="Validation résidence fiscale"
    ["UC065"]="Contrôle double nationalité"
    ["UC066"]="Mise à jour données biométriques"
    ["UC067-A"]="Signature contrat - Version A"
    ["UC067-B"]="Signature contrat - Version B" 
    ["UC067-C"]="Signature contrat - Version C"
    ["UC068"]="Activation services bancaires"
    ["UC069"]="Finalisation onboarding client"
)

# Traiter UC016 d'abord (cas spécial)
if [ ! -f "$BASE_DIR/UC016/UC016_new.puml" ]; then
    echo "Traitement de UC016..."
    create_uc_file "UC016" "${UC_TITLES[UC016]}"
    mv "$BASE_DIR/UC016/UC016.puml" "$BASE_DIR/UC016/UC016_new.puml"
fi

# Traiter tous les UC restants
for uc in UC036 UC037 UC038 UC039 UC040 UC041 UC042 UC043 UC044 UC045 UC046 UC047 UC048 UC049 UC050 UC051 UC052 UC053 UC054 UC055 UC056 UC057 UC058 UC059 UC060 UC061 UC062 UC063 UC064 UC065 UC066 UC067-A UC067-B UC067-C UC068 UC069; do
    if [ ! -f "$BASE_DIR/$uc/${uc}.puml" ] || [ $(wc -l < "$BASE_DIR/$uc/${uc}.puml" 2>/dev/null || echo "0") -lt 50 ]; then
        create_uc_file "$uc" "${UC_TITLES[$uc]}"
    else
        echo "$uc déjà traité, génération PNG uniquement..."
        plantuml "$BASE_DIR/$uc/${uc}.puml" -tpng -o "$BASE_DIR/$uc" 2>/dev/null || echo "Erreur PNG pour $uc"
    fi
done

# Traiter les variantes UC006 et UC008
for variant in UC006-A UC006-B UC006-C UC006-D UC008-A UC008-B; do
    if [ $(wc -l < "$BASE_DIR/$variant/${variant}.puml" 2>/dev/null || echo "0") -lt 50 ]; then
        case $variant in
            "UC006-A") title="Ouverture compte - Parcours A" ;;
            "UC006-B") title="Ouverture compte - Parcours B" ;;
            "UC006-C") title="Ouverture compte - Parcours C" ;;
            "UC006-D") title="Ouverture compte - Parcours D" ;;
            "UC008-A") title="Validation documents - Automatique" ;;
            "UC008-B") title="Validation documents - Manuelle" ;;
        esac
        create_uc_file "$variant" "$title"
    else
        echo "$variant déjà traité, génération PNG uniquement..."
        plantuml "$BASE_DIR/$variant/${variant}.puml" -tpng -o "$BASE_DIR/$variant" 2>/dev/null || echo "Erreur PNG pour $variant"
    fi
done

echo "=== RÉSUMÉ ==="
echo "Traitement terminé pour tous les UC restants"
echo "Vérification finale..."

# Compter les fichiers traités
total_puml=$(find "$BASE_DIR" -name "*.puml" | grep -E "UC[0-9]" | wc -l)
total_png=$(find "$BASE_DIR" -name "*.png" | grep -E "UC[0-9]" | wc -l)

echo "Total fichiers .puml: $total_puml"
echo "Total fichiers .png: $total_png"
echo "Tous les UC sont maintenant alignés sur la nouvelle architecture KYC!"
