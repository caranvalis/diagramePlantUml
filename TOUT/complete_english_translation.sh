#!/bin/bash

# Script de traduction complète vers l'anglais - Version Anglaise
# Date: 16 juin 2025

echo "🌍 Traduction complète vers l'anglais - Version Anglaise"
echo "======================================================="

cd "/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

# Compteur de fichiers modifiés
MODIFIED=0

# Fonction de traduction complète
translate_to_english() {
    local file="$1"
    echo "Traduction: $file"
    
    # Sauvegarde
    cp "$file" "$file.translate_backup"
    
    # Traductions génériques
    sed -i '' '
        s/succès/success/g
        s/Succès/Success/g
        s/échec/failure/g
        s/Échec/Failure/g
        s/erreur/error/g
        s/Erreur/Error/g
        s/reçu/received/g
        s/Reçu/Received/g
        s/envoi/sending/g
        s/Envoi/Sending/g
        s/enregistre/save/g
        s/Enregistre/Save/g
        s/gestionnaire/manager/g
        s/Gestionnaire/Manager/g
        s/équipe/team/g
        s/Équipe/Team/g
        s/technique/technical/g
        s/Technique/Technical/g
        s/alertée/alerted/g
        s/Alertée/Alerted/g
        s/résultat/result/g
        s/Résultat/Result/g
        s/vérification/verification/g
        s/Vérification/Verification/g
        s/recherche/search/g
        s/Recherche/Search/g
        s/sanctions/sanctions/g
        s/Sanctions/Sanctions/g
        s/indisponible/unavailable/g
        s/Indisponible/Unavailable/g
        s/indisponibilité/unavailability/g
        s/Indisponibilité/Unavailability/g
        s/demande/request/g
        s/Demande/Request/g
        s/validation/validation/g
        s/Validation/Validation/g
        s/conformité/compliance/g
        s/Conformité/Compliance/g
        s/historique/history/g
        s/Historique/History/g
        s/base/database/g
        s/Base/Database/g
        s/file d'\''attente/queue/g
        s/File d'\''attente/Queue/g
        s/retry/retry/g
        s/Retry/Retry/g
        s/mise/put/g
        s/Mise/Put/g
        s/mettre/put/g
        s/Mettre/Put/g
        s/dans/in/g
        s/Dans/In/g
        s/en/in/g
        s/En/In/g
        s/score/score/g
        s/Score/Score/g
        s/match/match/g
        s/Match/Match/g
        s/Union/Union/g
        s/européenne/European/g
        s/Européenne/European/g
    ' "$file"
    
    MODIFIED=$((MODIFIED + 1))
}

echo ""
echo "🔍 Traduction de tous les fichiers PUML..."

# Traitement de tous les fichiers .puml avec termes français
find . -name "*.puml" | while read file; do
    if grep -q "succès\|échec\|erreur\|reçu\|envoi\|enregistre\|gestionnaire\|équipe\|technique\|alertée\|résultat\|vérification\|recherche\|sanctions\|indisponible\|demande\|validation\|conformité\|historique\|base\|file d'attente\|retry\|mise\|mettre\|dans\|score\|match\|Union\|européenne" "$file"; then
        translate_to_english "$file"
    fi
done

echo ""
echo "✅ TRADUCTION TERMINÉE"
echo "====================="
echo "Fichiers modifiés: $MODIFIED"
echo ""
echo "🔄 Test de génération des PNG..."

# Test sur quelques fichiers problématiques
echo "Test UC022_new.puml..."
plantuml "./KYC SEQUENCE DIAGRAMS/UC022/UC022_new.puml" 2>&1 | head -5

echo "Test UC029_new.puml..."
plantuml "./KYC SEQUENCE DIAGRAMS/UC029/UC029_new.puml" 2>&1 | head -5

echo "Test UC028_new.puml..."
plantuml "./KYC SEQUENCE DIAGRAMS/UC028/UC028_new.puml" 2>&1 | head -5

echo ""
echo "🎉 TRADUCTION COMPLÈTE TERMINÉE !"
