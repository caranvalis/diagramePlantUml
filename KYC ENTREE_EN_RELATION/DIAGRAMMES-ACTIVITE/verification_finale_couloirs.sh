#!/bin/bash

# Script de vérification finale des couloirs dans les diagrammes d'activité

echo "=== VÉRIFICATION FINALE DES COULOIRS ==="
echo ""

total_files=0
files_with_swimlanes=0

for file in *.puml; do
    if [ -f "$file" ]; then
        total_files=$((total_files + 1))
        swimlanes=$(grep -c "^|" "$file")
        
        if [ $swimlanes -gt 0 ]; then
            files_with_swimlanes=$((files_with_swimlanes + 1))
            echo "✓ $file : $swimlanes couloirs détectés"
        else
            echo "✗ $file : AUCUN couloir détecté"
        fi
    fi
done

echo ""
echo "=== RÉSUMÉ ==="
echo "Fichiers traités : $total_files"
echo "Fichiers avec couloirs : $files_with_swimlanes"

if [ $files_with_swimlanes -eq $total_files ]; then
    echo "🎉 SUCCÈS : Tous les diagrammes ont des couloirs !"
else
    echo "⚠️  ATTENTION : $((total_files - files_with_swimlanes)) fichier(s) sans couloirs"
fi

echo ""
echo "=== VÉRIFICATION PNG ==="
png_count=$(ls -1 *.png 2>/dev/null | wc -l)
echo "Fichiers PNG générés : $png_count"

if [ $png_count -eq $total_files ]; then
    echo "✓ Tous les PNG ont été générés"
else
    echo "⚠️  Certains PNG manquent"
fi
