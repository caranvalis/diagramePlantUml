#!/bin/bash

# Script de correction des caractères accentués dans la version anglaise
# Date: 16 juin 2025

echo "🔧 Correction des caractères accentués - Version Anglaise"
echo "======================================================="

cd "/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

# Compteur de fichiers modifiés
MODIFIED=0

# Fonction de remplacement des caractères accentués
fix_accents() {
    local file="$1"
    echo "Correction: $file"
    
    # Sauvegarde
    cp "$file" "$file.accent_backup"
    
    # Remplacements des caractères accentués les plus courants
    sed -i '' '
        s/clôture/closure/g
        s/Clôture/Closure/g
        s/déblocage/unblocking/g
        s/Déblocage/Unblocking/g
        s/créé/created/g
        s/Créé/Created/g
        s/créée/created/g
        s/Créée/Created/g
        s/vérifie/verifies/g
        s/Vérifie/Verifies/g
        s/vérifié/verified/g
        s/Vérifié/Verified/g
        s/intégrité/integrity/g
        s/Intégrité/Integrity/g
        s/délégué/delegate/g
        s/Délégué/Delegate/g
        s/déléguée/delegated/g
        s/Déléguée/Delegated/g
        s/réussi/successful/g
        s/Réussi/Successful/g
        s/réussie/successful/g
        s/Réussie/Successful/g
        s/générée/generated/g
        s/Générée/Generated/g
        s/généré/generated/g
        s/Généré/Generated/g
        s/différée/deferred/g
        s/Différée/Deferred/g
        s/différé/deferred/g
        s/Différé/Deferred/g
        s/terminée/completed/g
        s/Terminée/Completed/g
        s/terminé/completed/g
        s/Terminé/Completed/g
        s/contrôlé/controlled/g
        s/Contrôlé/Controlled/g
        s/contrôlée/controlled/g
        s/Contrôlée/Controlled/g
        s/autorisé/authorized/g
        s/Autorisé/Authorized/g
        s/autorisée/authorized/g
        s/Autorisée/Authorized/g
    ' "$file"
    
    MODIFIED=$((MODIFIED + 1))
}

echo ""
echo "🔍 Recherche des fichiers PUML avec caractères accentués..."

# Traitement de tous les fichiers .puml
find . -name "*.puml" | while read file; do
    if grep -q "clôture\|déblocage\|créé\|vérifie\|intégrité\|délégué\|réussi\|générée\|différée\|terminée\|contrôlé\|autorisé" "$file"; then
        fix_accents "$file"
    fi
done

echo ""
echo "✅ CORRECTION TERMINÉE"
echo "====================="
echo "Fichiers modifiés: $MODIFIED"
echo ""
echo "🔄 Régénération des PNG..."

# Régénération des diagrammes modifiés
find . -name "*.puml" -exec plantuml {} \;

echo ""
echo "🎉 CORRECTION DES CARACTÈRES ACCENTUÉS TERMINÉE !"
