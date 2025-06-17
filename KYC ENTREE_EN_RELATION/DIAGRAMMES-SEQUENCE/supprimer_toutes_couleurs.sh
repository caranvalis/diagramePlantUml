#!/bin/bash

# Script pour enlever complètement les couleurs dans les diagrammes de séquence
# Style minimaliste en noir et blanc

echo "Suppression complète des couleurs dans les diagrammes de séquence..."

for file in *.puml; do
    if [ -f "$file" ] && [ "$file" != "TEMPLATE_STANDARD_SEQUENCE.puml" ]; then
        echo "Traitement de $file..."
        
        # Supprimer complètement les configurations de couleur
        sed -i '' '/^skinparam backgroundColor/d' "$file"
        sed -i '' '/^skinparam participant {$/,/^}$/d' "$file"
        sed -i '' '/^skinparam sequence {$/,/^}$/d' "$file"
        sed -i '' '/^skinparam actor {$/,/^}$/d' "$file"
        
        # Garder seulement le shadowing
        if ! grep -q "skinparam shadowing" "$file"; then
            sed -i '' '/^@startuml/a\
skinparam shadowing false
' "$file"
        fi
        
        echo "  ✓ Couleurs supprimées dans $file"
    fi
done

echo "Suppression des couleurs terminée !"
echo "Style minimaliste appliqué à tous les diagrammes de séquence"
