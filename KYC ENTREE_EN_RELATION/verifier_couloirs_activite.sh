#!/bin/bash

echo "🏊‍♂️ AJOUT DES COULOIRS (SWIMLANES) AUX DIAGRAMMES D'ACTIVITÉ"
echo "============================================================"

# Compter les diagrammes d'activité
total_files=$(find DIAGRAMMES-ACTIVITE -name "*.puml" | wc -l | tr -d ' ')
echo "📊 Nombre de diagrammes d'activité trouvés: $total_files"

echo ""
echo "🎯 DIAGRAMMES MODIFIÉS AVEC COULOIRS:"
echo "------------------------------------"

# Vérifier les diagrammes qui ont déjà des couloirs
for file in DIAGRAMMES-ACTIVITE/*.puml; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file" .puml)
        
        # Vérifier si le diagramme contient déjà des couloirs
        if grep -q "swimlane\|^|.*|" "$file"; then
            echo "✅ $filename - Couloirs détectés"
        else
            echo "❌ $filename - Pas de couloirs"
        fi
    fi
done

echo ""
echo "🔄 RÉGÉNÉRATION DES DIAGRAMMES:"
echo "------------------------------"

# Essayer de générer tous les diagrammes
cd DIAGRAMMES-ACTIVITE
for file in *.puml; do
    if [[ -f "$file" ]]; then
        filename=$(basename "$file" .puml)
        echo -n "Génération $filename... "
        
        if plantuml "$file" 2>/dev/null; then
            echo "✅ Succès"
        else
            echo "❌ Erreur"
        fi
    fi
done

echo ""
echo "📈 VÉRIFICATION DES PNG GÉNÉRÉS:"
echo "--------------------------------"

# Compter les PNG générés
png_count=$(ls -1 *.png 2>/dev/null | wc -l | tr -d ' ')
puml_count=$(ls -1 *.puml 2>/dev/null | wc -l | tr -d ' ')

echo "📄 Fichiers PUML: $puml_count"
echo "🖼️  Fichiers PNG:  $png_count"

if [ "$png_count" -eq "$puml_count" ]; then
    echo "🟢 Taux de génération: 100% (✅ Parfait !)"
else
    percentage=$((png_count * 100 / puml_count))
    echo "🔴 Taux de génération: $percentage% ($png_count/$puml_count)"
fi

echo ""
echo "🏆 STATUT FINAL DES COULOIRS:"
echo "=============================="

# Résumé final
swimlane_count=0
for file in *.puml; do
    if [[ -f "$file" ]] && grep -q "swimlane\|^|.*|" "$file"; then
        ((swimlane_count++))
    fi
done

echo "🏊‍♂️ Diagrammes avec couloirs: $swimlane_count/$puml_count"

if [ "$swimlane_count" -eq "$puml_count" ]; then
    echo "🎉 Tous les diagrammes ont des couloirs !"
else
    echo "⚠️  Certains diagrammes n'ont pas encore de couloirs"
fi

echo ""
echo "✨ Mission couloirs terminée le $(date '+%d/%m/%Y à %H:%M')"
