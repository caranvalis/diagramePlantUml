#!/bin/bash

# Script pour générer tous les PNGs des diagrammes UML anglais

ENGLISH_DIR="/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

echo "Génération des PNGs pour tous les diagrammes UML anglais..."

# Vérifier si PlantUML est disponible
if ! command -v plantuml &> /dev/null; then
    echo "PlantUML n'est pas installé. Installation via Homebrew..."
    brew install plantuml
fi

# Fonction pour générer les PNGs dans un répertoire
generate_pngs_in_dir() {
    local dir="$1"
    local dir_name=$(basename "$dir")
    
    echo "Génération des PNGs dans: $dir_name"
    
    # Compter le nombre de fichiers PUML
    puml_count=$(find "$dir" -name "*.puml" | wc -l)
    echo "  Fichiers PUML trouvés: $puml_count"
    
    if [ $puml_count -gt 0 ]; then
        # Générer tous les PNGs
        find "$dir" -name "*.puml" -exec plantuml -tpng {} \;
        
        # Compter les PNGs générés
        png_count=$(find "$dir" -name "*.png" -newer "$dir" | wc -l)
        echo "  PNGs générés: $png_count"
    fi
}

# Générer PNGs pour chaque type de diagramme
echo "=== DIAGRAMMES DE CLASSE ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC CLASS DIAGRAMS"

echo ""
echo "=== DIAGRAMMES D'ACTIVITÉ ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC ACTIVITY DIAGRAMS"

echo ""
echo "=== DIAGRAMMES D'ÉTAT ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC STATE DIAGRAMS"

echo ""
echo "=== DIAGRAMMES DE COMPOSANT ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC COMPONENT DIAGRAMS"

echo ""
echo "=== DIAGRAMMES DE DÉPLOIEMENT ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC DEPLOYMENT DIAGRAMS"

echo ""
echo "=== DIAGRAMMES DE SÉQUENCE ==="
for uc_dir in "$ENGLISH_DIR/KYC SEQUENCE DIAGRAMS"/UC*; do
    if [ -d "$uc_dir" ]; then
        generate_pngs_in_dir "$uc_dir"
    fi
done

echo ""
echo "=== DIAGRAMMES DE GANTT ==="
generate_pngs_in_dir "$ENGLISH_DIR/KYC GANTT DIAGRAMS"

echo ""
echo "Génération terminée!"

# Statistiques finales
total_puml=$(find "$ENGLISH_DIR" -name "*.puml" | wc -l)
total_png=$(find "$ENGLISH_DIR" -name "*.png" | wc -l)

echo ""
echo "=== STATISTIQUES FINALES ==="
echo "Total fichiers PUML: $total_puml"
echo "Total fichiers PNG: $total_png"
