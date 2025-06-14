#!/bin/bash

# Script pour personnaliser les titres des UC créés
BASE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE SEQUENCE"

# Fonction pour mettre à jour le titre d'un UC
update_uc_title() {
    local uc="$1"
    local new_title="$2"
    local file="$BASE_DIR/$uc/$uc.puml"
    
    if [ -f "$file" ]; then
        echo "Mise à jour titre pour $uc : $new_title"
        # Remplacer le titre dans le fichier
        sed -i '' "s/title .*/title $new_title/" "$file"
        sed -i '' "s/Requête .*/Requête $new_title/" "$file"
        sed -i '' "s/Orchestrer .*/Orchestrer $new_title/" "$file"
        sed -i '' "s/Résultat .*/Résultat $new_title/" "$file"
        sed -i '' "s/Réponse .*/Réponse $new_title/" "$file"
        sed -i '' "s/Confirmation .*/Confirmation $new_title/" "$file"
        
        # Régénérer le PNG
        plantuml "$file" -tpng -o "$BASE_DIR/$uc" 2>/dev/null
    fi
}

# Mise à jour des titres spécifiques
update_uc_title "UC016" "Mise à jour profil client"
update_uc_title "UC036" "Activation compte épargne"
update_uc_title "UC037" "Blocage temporaire compte"
update_uc_title "UC038" "Déblocage compte client"
update_uc_title "UC039" "Clôture compte définitive"
update_uc_title "UC040" "Réouverture compte suspendu"
update_uc_title "UC041" "Audit conformité mensuel"
update_uc_title "UC042" "Génération rapport KYC"
update_uc_title "UC043" "Mise à jour réglementaire"
update_uc_title "UC044" "Contrôle qualité documents"
update_uc_title "UC045" "Validation signature électronique"
update_uc_title "UC046" "Archivage documents KYC"
update_uc_title "UC047" "Restauration données client"
update_uc_title "UC048" "Migration données legacy"
update_uc_title "UC049" "Synchronisation référentiels"
update_uc_title "UC050" "Contrôle anti-blanchiment"
update_uc_title "UC051" "Détection transactions suspectes"
update_uc_title "UC052" "Déclaration autorités"
update_uc_title "UC053" "Mise à jour listes sanctions"
update_uc_title "UC054" "Contrôle PEP (Personnes Politiquement Exposées)"
update_uc_title "UC055" "Évaluation risque client"
update_uc_title "UC056" "Classification niveau risque"
update_uc_title "UC057" "Révision périodique dossier"
update_uc_title "UC062" "Déclaration automatique échange"
update_uc_title "UC063" "Mise à jour statut fiscal"
update_uc_title "UC064" "Validation résidence fiscale"
update_uc_title "UC067-C" "Signature contrat - Version C"
update_uc_title "UC069" "Finalisation onboarding client"

echo "Mise à jour des titres terminée!"
