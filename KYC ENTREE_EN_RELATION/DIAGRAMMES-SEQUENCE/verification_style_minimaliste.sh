#!/bin/bash

# Script de vérification finale pour les diagrammes de séquence sans couleurs

echo "=== VÉRIFICATION DIAGRAMMES DE SÉQUENCE SANS COULEURS ==="
echo ""

total_files=0
clean_files=0

for file in *.puml; do
    if [ -f "$file" ] && [ "$file" != "TEMPLATE_STANDARD_SEQUENCE.puml" ]; then
        total_files=$((total_files + 1))
        
        # Vérifier l'absence de couleurs
        color_count=$(grep -i "color\|#[0-9A-F]" "$file" | wc -l)
        shadow_status=$(grep "skinparam shadowing" "$file" | grep -o "false\|true" || echo "none")
        
        if [ $color_count -eq 0 ] && [ "$shadow_status" = "false" ]; then
            clean_files=$((clean_files + 1))
            echo "✓ $file : Style minimaliste parfait"
        else
            echo "⚠️ $file : Couleurs détectées: $color_count, Ombrage: $shadow_status"
        fi
    fi
done

echo ""
echo "=== RÉSUMÉ ==="
echo "Fichiers traités : $total_files"
echo "Fichiers épurés : $clean_files"

if [ $clean_files -eq $total_files ]; then
    echo "🎉 SUCCÈS : Tous les diagrammes sont en style minimaliste !"
else
    echo "⚠️ ATTENTION : $((total_files - clean_files)) fichier(s) ont encore des couleurs"
fi

echo ""
echo "=== VÉRIFICATION PNG ==="
png_count=$(ls -1 *.png 2>/dev/null | wc -l)
echo "Fichiers PNG générés : $png_count"

if [ $png_count -eq $total_files ]; then
    echo "✓ Tous les PNG ont été générés en style minimaliste"
else
    echo "⚠️ Certains PNG manquent"
fi
