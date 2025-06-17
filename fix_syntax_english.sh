#!/bin/bash

# Script de correction des erreurs de syntaxe PlantUML - Version Anglaise
# Date: 16 juin 2025

echo "🔧 Correction des erreurs de syntaxe PlantUML - Version Anglaise"
echo "==============================================================="

cd "/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

# Compteur de fichiers corrigés
CORRECTED=0

# Fonction de correction des erreurs de syntaxe
fix_syntax_errors() {
    local file="$1"
    echo "Correction syntaxe: $file"
    
    # Sauvegarde
    cp "$file" "$file.syntax_backup"
    
    # Corrections des erreurs de syntaxe courantes
    sed -i '' '
        s/@induml/@enduml/g
        s/sequince/sequence/g
        s/MessageAlignmint cinter/MessageAlignment center/g
        s/MessageAlignmint center/MessageAlignment center/g
        s/cliint/client/g
        s/Datadatabase/Database/g
        s/ind note/end note/g
        s/^end$/end note/g
    ' "$file"
    
    # Vérifier que le fichier se termine bien par @enduml
    if ! tail -5 "$file" | grep -q "@enduml"; then
        echo "" >> "$file"
        echo "@enduml" >> "$file"
    fi
    
    CORRECTED=$((CORRECTED + 1))
}

echo ""
echo "🔍 Recherche des fichiers avec erreurs de syntaxe..."

# Traitement de tous les fichiers .puml
find . -name "*.puml" | while read file; do
    if grep -q "@induml\|sequince\|MessageAlignmint\|cliint\|Datadatabase\|ind note" "$file" || ! tail -5 "$file" | grep -q "@enduml"; then
        fix_syntax_errors "$file"
    fi
done

echo ""
echo "✅ CORRECTION DE SYNTAXE TERMINÉE"
echo "================================"
echo "Fichiers corrigés: $CORRECTED"
echo ""
echo "🔄 Test de génération après corrections..."

# Test des fichiers problématiques
echo "Test UC022_new.puml..."
plantuml "./KYC SEQUENCE DIAGRAMS/UC022/UC022_new.puml" 2>&1 | head -3

echo "Test UC001_ClientPreRegistration.puml..."
plantuml "./KYC SEQUENCE DIAGRAMS/UC001/UC001_ClientPreRegistration.puml" 2>&1 | head -3

echo ""
echo "🎉 CORRECTION DE SYNTAXE TERMINÉE !"
