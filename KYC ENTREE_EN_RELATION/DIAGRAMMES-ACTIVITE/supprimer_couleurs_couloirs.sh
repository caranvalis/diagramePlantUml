#!/bin/bash

# Script pour supprimer les couleurs des couloirs dans les diagrammes d'activité
# Garde la structure des couloirs mais enlève les couleurs de fond

echo "Suppression des couleurs dans les couloirs des diagrammes d'activité..."

for file in *.puml; do
    if [ -f "$file" ]; then
        echo "Traitement de $file..."
        
        # Remplacer |#CODE_COULEUR|NOM| par |NOM|
        sed -i '' 's/|#[A-F0-9]*|/|/g' "$file"
        
        echo "  ✓ Couleurs supprimées dans $file"
    fi
done

echo "Suppression des couleurs terminée !"
