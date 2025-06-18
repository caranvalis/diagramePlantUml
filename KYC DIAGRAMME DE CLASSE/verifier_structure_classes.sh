#!/bin/bash

# Script de vérification de la structure standardisée des diagrammes de classes
# Structure attendue :
# - Fond des classes : #E3F2FD (bleu clair)
# - Aucune couleur de fond sur les packages
# - Style cohérent sur tous les diagrammes

echo "🔍 Vérification de la structure standardisée des diagrammes de classes..."
echo "=================================================================="

# Compteurs
total_files=0
correct_background=0
no_package_colors=0
errors=0

# Fonction pour vérifier un fichier
check_file() {
    local file="$1"
    local filename=$(basename "$file")
    
    echo "📄 Vérification: $filename"
    total_files=$((total_files + 1))
    
    # Vérifier le fond des classes
    if grep -q "classBackgroundColor #E3F2FD" "$file"; then
        echo "  ✅ Fond des classes correct (#E3F2FD)"
        correct_background=$((correct_background + 1))
    else
        echo "  ❌ Fond des classes incorrect ou manquant"
        errors=$((errors + 1))
        grep "classBackgroundColor" "$file" || echo "     → Aucun classBackgroundColor trouvé"
    fi
    
    # Vérifier l'absence de couleurs sur les packages
    if grep -q "package.*#" "$file"; then
        echo "  ❌ Packages avec couleurs détectés:"
        grep "package.*#" "$file" | sed 's/^/     → /'
        errors=$((errors + 1))
    else
        echo "  ✅ Aucune couleur sur les packages"
        no_package_colors=$((no_package_colors + 1))
    fi
    
    echo ""
}

# Vérifier tous les diagrammes de classes
echo "🔎 Recherche des diagrammes de classes..."

# Répertoire principal
for file in "/Users/caranvalis/Documents/test-plantuml/KYC ENTREE_EN_RELATION/DIAGRAMMES-CLASSE"/*.puml; do
    if [[ -f "$file" ]]; then
        check_file "$file"
    fi
done

# Répertoires DiagrammeClasse*
find "/Users/caranvalis/Documents/test-plantuml" -path "*/DiagrammeClasse*/*.puml" -type f | while read file; do
    check_file "$file"
done

# Répertoires KYC CLASS DIAGRAMS
find "/Users/caranvalis/Documents/test-plantuml" -path "*KYC*CLASS*/*.puml" -type f | while read file; do
    check_file "$file"
done

# Répertoires ACCOUNT-OPENING-SYSTEM/CLASS-DIAGRAMS
find "/Users/caranvalis/Documents/test-plantuml" -path "*ACCOUNT-OPENING-SYSTEM/CLASS-DIAGRAMS/*.puml" -type f | while read file; do
    check_file "$file"
done

echo "📊 RÉSUMÉ DE LA VÉRIFICATION"
echo "================================"
echo "Total de fichiers vérifiés: $total_files"
echo "Fonds de classes corrects: $correct_background/$total_files"
echo "Sans couleurs de packages: $no_package_colors/$total_files"
echo "Erreurs détectées: $errors"

if [ $errors -eq 0 ]; then
    echo ""
    echo "🎉 SUCCÈS: Tous les diagrammes de classes respectent la structure standardisée!"
    echo "   - Fond bleu clair (#E3F2FD) pour toutes les classes"
    echo "   - Aucune couleur de fond sur les packages"
    echo "   - Style cohérent sur l'ensemble du projet"
else
    echo ""
    echo "⚠️  Des corrections sont nécessaires sur $errors élément(s)"
fi

echo ""
echo "✨ Structure standardisée:"
echo "   skinparam classBackgroundColor #E3F2FD"
echo "   package \"Nom\" {  // Sans couleur"
