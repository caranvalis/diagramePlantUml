#!/bin/bash

# Script pour corriger la syntaxe des couloirs dans les diagrammes d'activité

echo "🔧 Correction de la syntaxe des couloirs dans les diagrammes d'activité..."

# Fonction pour corriger un fichier
corriger_fichier() {
    local file="$1"
    echo "📝 Correction de $file..."
    
    # Supprimer les lignes orphelines | entre couloirs
    sed -i '' '/^|$/d' "$file"
    
    # Corriger les transitions orphelines
    sed -i '' 's/|#[^|]*|[^|]*|$//' "$file"
    
    echo "✅ $file corrigé"
}

# Liste des fichiers à corriger
fichiers=(
    "03_DelegationDirectionGenerale.puml"
    "05_ProcessusReporting.puml"
    "06_GestionDocuments.puml"
    "07_IntegrationsExternes.puml"
    "08_GestionExceptions.puml"
    "09_ClotureDossier.puml"
)

# Corriger chaque fichier
for fichier in "${fichiers[@]}"; do
    if [ -f "$fichier" ]; then
        corriger_fichier "$fichier"
    else
        echo "⚠️  Fichier $fichier non trouvé"
    fi
done

echo "🎯 Correction terminée !"
echo "🔄 Tentative de génération PNG..."

# Tenter la génération PNG
for fichier in "${fichiers[@]}"; do
    if [ -f "$fichier" ]; then
        echo "🖼️  Génération PNG pour $fichier..."
        plantuml -tpng "$fichier" 2>/dev/null && echo "✅ PNG généré pour $fichier" || echo "❌ Erreur PNG pour $fichier"
    fi
done

echo "🏁 Script terminé !"
