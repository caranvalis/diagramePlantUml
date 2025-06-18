#!/bin/bash

# Script pour standardiser automatiquement un diagramme de classe
# Usage: ./standardiser_diagramme_classe.sh <fichier.puml>

if [ $# -ne 1 ]; then
    echo "Usage: $0 <fichier.puml>"
    echo "Exemple: $0 MonDiagramme.puml"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "❌ Erreur: Le fichier '$FILE' n'existe pas"
    exit 1
fi

echo "🔧 Standardisation du diagramme de classe: $(basename "$FILE")"
echo "=============================================================="

# Sauvegarde
cp "$FILE" "${FILE}.backup"
echo "💾 Sauvegarde créée: ${FILE}.backup"

# 1. Standardiser le fond des classes vers bleu
if grep -q "classBackgroundColor" "$FILE"; then
    sed -i '' 's/skinparam classBackgroundColor #[A-Fa-f0-9]\{6\}/skinparam classBackgroundColor #E3F2FD/g' "$FILE"
    echo "✅ Fond des classes standardisé vers #E3F2FD (bleu clair)"
else
    echo "ℹ️  Aucun classBackgroundColor trouvé dans le fichier"
fi

# 2. Supprimer les couleurs des packages
if grep -q "package.*#" "$FILE"; then
    echo "🎨 Suppression des couleurs de packages..."
    # Supprimer les couleurs des définitions de packages
    sed -i '' 's/package \("[^"]*"\|[^[:space:]]*\) #[A-Fa-f0-9]\{6\} {/package \1 {/g' "$FILE"
    echo "✅ Couleurs de packages supprimées"
else
    echo "✅ Aucune couleur de package détectée"
fi

# 3. Vérification finale
echo ""
echo "🔍 Vérification finale..."

# Vérifier le fond des classes
if grep -q "classBackgroundColor #E3F2FD" "$FILE"; then
    echo "✅ Fond des classes: #E3F2FD (correct)"
else
    echo "⚠️  Fond des classes: non standard ou manquant"
fi

# Vérifier l'absence de couleurs sur les packages
if grep -q "package.*#" "$FILE"; then
    echo "⚠️  Couleurs de packages encore présentes:"
    grep "package.*#" "$FILE" | sed 's/^/   → /'
else
    echo "✅ Packages: aucune couleur (correct)"
fi

echo ""
echo "✨ Standardisation terminée!"
echo "📁 Fichier original sauvegardé: ${FILE}.backup"
echo "📄 Fichier standardisé: $FILE"

echo ""
echo "📋 Structure appliquée:"
echo "   - skinparam classBackgroundColor #E3F2FD"
echo "   - package \"Nom\" { // Sans couleur"
