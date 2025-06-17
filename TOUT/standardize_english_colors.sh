#!/bin/bash

# Script de standardisation des couleurs pour la version anglaise KYC
# Date: 16 juin 2025

echo "🎨 Standardisation des couleurs - Version Anglaise KYC"
echo "=================================================="

cd "/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

# Compteurs
TOTAL_FILES=0
MODIFIED_FILES=0

echo ""
echo "📊 DIAGRAMMES DE SÉQUENCE"
echo "========================="

# Traitement des diagrammes de séquence
find . -name "*.puml" -path "*/KYC SEQUENCE DIAGRAMS/*" | while read file; do
    echo "Traitement: $file"
    TOTAL_FILES=$((TOTAL_FILES + 1))
    
    # Sauvegarde
    cp "$file" "$file.bak"
    
    # Standardisation des couleurs pour diagrammes de séquence
    sed -i '' '
        /^!theme/d
        /^skinparam actorStyle/d
        /^skinparam sequenceBoxBorderColor/d
        /^skinparam participantBackgroundColor/d
        /^skinparam lifeline/,/^}/d
    ' "$file"
    
    # Ajout de notre configuration standard après @startuml
    sed -i '' '/^@startuml/a\
skinparam backgroundColor #F8FBFF\
skinparam participant {\
    BackgroundColor #E3F2FD\
    BorderColor #1976D2\
    FontColor #0D47A1\
}\
skinparam sequence {\
    ArrowColor #1976D2\
    LifeLineBackgroundColor #E8F5E8\
    LifeLineBorderColor #4CAF50\
}\
skinparam shadowing true\

' "$file"
    
    MODIFIED_FILES=$((MODIFIED_FILES + 1))
done

echo ""
echo "📋 DIAGRAMMES D'ACTIVITÉ"
echo "======================="

# Traitement des diagrammes d'activité
find . -name "*.puml" -path "*/KYC ACTIVITY DIAGRAMS/*" | while read file; do
    echo "Traitement: $file"
    TOTAL_FILES=$((TOTAL_FILES + 1))
    
    # Sauvegarde
    cp "$file" "$file.bak"
    
    # Standardisation des couleurs pour diagrammes d'activité
    sed -i '' '
        s/StartColor #1976D2/StartColor #4CAF50/g
        s/EndColor #1976D2/EndColor #F44336/g
        s/DiamondBackgroundColor #FFF3E0/DiamondBackgroundColor #E8F5E8/g
        s/DiamondBorderColor #FF9800/DiamondBorderColor #4CAF50/g
        s/DiamondFontColor #E65100/DiamondFontColor #2E7D32/g
    ' "$file"
    
    # Ajout des paramètres manquants si nécessaire
    if ! grep -q "DiamondBackgroundColor" "$file"; then
        sed -i '' '/BorderColor #1976D2/a\
    FontColor #0D47A1\
    DiamondBackgroundColor #E8F5E8\
    DiamondBorderColor #4CAF50\
    DiamondFontColor #2E7D32
' "$file"
    fi
    
    MODIFIED_FILES=$((MODIFIED_FILES + 1))
done

echo ""
echo "🏗️ DIAGRAMMES DE CLASSES"
echo "======================="

# Traitement des diagrammes de classes
find . -name "*.puml" -path "*/KYC CLASS DIAGRAMS/*" | while read file; do
    echo "Traitement: $file"
    TOTAL_FILES=$((TOTAL_FILES + 1))
    
    # Sauvegarde
    cp "$file" "$file.bak"
    
    # Suppression des anciennes configurations
    sed -i '' '
        /^skinparam class {/,/^}/d
        /^skinparam packageBackgroundColor/d
        /^skinparam packageBorderColor/d
    ' "$file"
    
    # Ajout de notre configuration standard
    if ! grep -q "skinparam backgroundColor #F8FBFF" "$file"; then
        sed -i '' '/^@startuml/a\
skinparam backgroundColor #F8FBFF\
skinparam classBackgroundColor #E8F5E8\
skinparam classBorderColor #1976D2\
skinparam classFontColor #0D47A1\
skinparam shadowing true
' "$file"
    fi
    
    MODIFIED_FILES=$((MODIFIED_FILES + 1))
done

echo ""
echo "✅ STANDARDISATION TERMINÉE"
echo "=========================="
echo "Fichiers traités: $TOTAL_FILES"
echo "Fichiers modifiés: $MODIFIED_FILES"
echo ""
echo "🔄 Régénération des PNG..."

# Régénération des diagrammes
find . -name "*.puml" -exec plantuml {} \;

echo ""
echo "🎉 STANDARDISATION DE LA VERSION ANGLAISE TERMINÉE !"
echo "Tous les diagrammes utilisent maintenant la palette de couleurs cohérente."
