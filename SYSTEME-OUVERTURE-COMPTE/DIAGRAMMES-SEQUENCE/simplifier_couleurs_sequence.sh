#!/bin/bash

# Script pour simplifier les couleurs dans les diagrammes de séquence
# Garde un style minimal et épuré

echo "Simplification des couleurs dans les diagrammes de séquence..."

for file in *.puml; do
    if [ -f "$file" ] && [ "$file" != "TEMPLATE_STANDARD_SEQUENCE.puml" ]; then
        echo "Traitement de $file..."
        
        # Créer une sauvegarde
        cp "$file" "${file}.backup"
        
        # Remplacer la configuration skinparam par une version simplifiée
        sed -i '' '/^skinparam backgroundColor/d' "$file"
        sed -i '' '/^skinparam participant {$/,/^}$/c\
skinparam participant {\
    BackgroundColor #FFFFFF\
    BorderColor #333333\
    FontColor #000000\
}' "$file"
        
        sed -i '' '/^skinparam sequence {$/,/^}$/c\
skinparam sequence {\
    ArrowColor #333333\
    LifeLineBackgroundColor #F5F5F5\
    LifeLineBorderColor #666666\
}' "$file"
        
        sed -i '' '/^skinparam actor {$/,/^}$/c\
skinparam actor {\
    BackgroundColor #E0E0E0\
    BorderColor #333333\
    FontColor #000000\
}' "$file"
        
        echo "  ✓ Couleurs simplifiées dans $file"
    fi
done

echo "Simplification des couleurs terminée !"
echo "Les sauvegardes sont disponibles avec l'extension .backup"
