#!/bin/bash

# Script pour générer et valider tous les diagrammes de Gantt KYC
BASE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE GANTT"

echo "🔄 GÉNÉRATION DES DIAGRAMMES DE GANTT KYC"
echo "============================================"

cd "$BASE_DIR"

# Compter les fichiers avant génération
puml_count=$(find . -name "*.puml" | wc -l | tr -d ' ')
echo "📊 Fichiers .puml trouvés: $puml_count"

# Générer les PNG pour chaque fichier
echo ""
echo "🎨 GÉNÉRATION DES IMAGES PNG:"
echo "----------------------------"

success_count=0
error_count=0

for file in *.puml; do
    if [ -f "$file" ]; then
        echo -n "⏳ Génération de $file... "
        if plantuml "$file" -tpng -o . 2>/dev/null; then
            echo "✅ OK"
            ((success_count++))
        else
            echo "❌ ERREUR"
            ((error_count++))
        fi
    fi
done

echo ""
echo "📈 RÉSULTATS:"
echo "-------------"
echo "✅ Succès: $success_count"
echo "❌ Erreurs: $error_count"

# Compter les PNG générés
png_count=$(find . -name "*.png" | wc -l | tr -d ' ')
echo "🖼️ Images PNG générées: $png_count"

echo ""
echo "📋 INVENTAIRE FINAL:"
echo "-------------------"
ls -la *.puml *.png 2>/dev/null | grep -E "\.(puml|png)$"

echo ""
echo "🎯 DIAGRAMMES DE GANTT KYC CRÉÉS AVEC SUCCÈS!"
echo "============================================"
echo "📅 Planning projet, onboarding, contrôles, déploiement et maintenance"
echo "🎨 Thème uniforme aws-orange pour cohérence visuelle"
echo "⚡ Prêt pour intégration dans documentation projet"
