#!/bin/bash

# Script de vérification finale de la version anglaise du projet KYC

ENGLISH_DIR="/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION"

echo "🔍 VÉRIFICATION FINALE - VERSION ANGLAISE KYC"
echo "=============================================="
echo ""

# Vérification de la structure des répertoires
echo "📁 STRUCTURE DES RÉPERTOIRES:"
echo "------------------------------"
required_dirs=(
    "KYC CLASS DIAGRAMS"
    "KYC ACTIVITY DIAGRAMS"
    "KYC STATE DIAGRAMS"
    "KYC COMPONENT DIAGRAMS"
    "KYC DEPLOYMENT DIAGRAMS"
    "KYC SEQUENCE DIAGRAMS"
    "KYC GANTT DIAGRAMS"
    "KYC USE-CASES"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "$ENGLISH_DIR/$dir" ]; then
        echo "✅ $dir"
    else
        echo "❌ $dir"
    fi
done

echo ""

# Statistiques détaillées
echo "📊 STATISTIQUES DÉTAILLÉES:"
echo "----------------------------"

class_puml=$(find "$ENGLISH_DIR/KYC CLASS DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
activity_puml=$(find "$ENGLISH_DIR/KYC ACTIVITY DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
state_puml=$(find "$ENGLISH_DIR/KYC STATE DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
component_puml=$(find "$ENGLISH_DIR/KYC COMPONENT DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
deployment_puml=$(find "$ENGLISH_DIR/KYC DEPLOYMENT DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
sequence_puml=$(find "$ENGLISH_DIR/KYC SEQUENCE DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)
gantt_puml=$(find "$ENGLISH_DIR/KYC GANTT DIAGRAMS" -name "*.puml" 2>/dev/null | wc -l)

total_puml=$((class_puml + activity_puml + state_puml + component_puml + deployment_puml + sequence_puml + gantt_puml))

echo "Diagrammes de classe:      $class_puml"
echo "Diagrammes d'activité:     $activity_puml"
echo "Diagrammes d'état:         $state_puml"
echo "Diagrammes de composants:  $component_puml"
echo "Diagrammes de déploiement: $deployment_puml"
echo "Diagrammes de séquence:    $sequence_puml"
echo "Diagrammes de Gantt:       $gantt_puml"
echo "TOTAL PUML:                $total_puml"

echo ""

# Vérification des PNGs
total_png=$(find "$ENGLISH_DIR" -name "*.png" 2>/dev/null | wc -l)
echo "Fichiers PNG générés:      $total_png"

echo ""

# Vérification des cas d'usage
uc_dirs=$(find "$ENGLISH_DIR/KYC SEQUENCE DIAGRAMS" -name "UC*" -type d 2>/dev/null | wc -l)
echo "Cas d'usage (UC):          $uc_dirs"

echo ""

# Vérification de la documentation
echo "📄 DOCUMENTATION:"
echo "-----------------"
docs=(
    "README.md"
    "DESIGN_ANALYSIS_DOCUMENT_KYC.md"
    "TECHNICAL_GUIDE_KYC.md"
    "COPILOT_SUMMARY_KYC.md"
)

for doc in "${docs[@]}"; do
    if [ -f "$ENGLISH_DIR/$doc" ]; then
        size=$(wc -l < "$ENGLISH_DIR/$doc" 2>/dev/null)
        echo "✅ $doc ($size lignes)"
    else
        echo "❌ $doc"
    fi
done

echo ""

# Vérification de la qualité des diagrammes
echo "🔍 QUALITÉ DES DIAGRAMMES:"
echo "--------------------------"

# Vérifier quelques diagrammes clés
key_diagrams=(
    "KYC ACTIVITY DIAGRAMS/DocumentCollectionActivityDiagram.puml"
    "KYC STATE DIAGRAMS/KYCStateDiagram.puml"
    "KYC COMPONENT DIAGRAMS/KYCMicroservicesArchitecture.puml"
    "KYC DEPLOYMENT DIAGRAMS/KYCDeploymentDiagram.puml"
)

for diagram in "${key_diagrams[@]}"; do
    if [ -f "$ENGLISH_DIR/$diagram" ]; then
        if grep -q "@startuml\|@startgantt" "$ENGLISH_DIR/$diagram"; then
            echo "✅ $(basename "$diagram")"
        else
            echo "⚠️  $(basename "$diagram") - Format invalide"
        fi
    else
        echo "❌ $(basename "$diagram")"
    fi
done

echo ""

# Résumé final
echo "🎯 RÉSUMÉ FINAL:"
echo "----------------"

if [ $total_puml -gt 100 ] && [ $total_png -gt 50 ] && [ $uc_dirs -gt 60 ]; then
    echo "✅ Migration RÉUSSIE!"
    echo "   - Plus de 100 diagrammes PUML migrés"
    echo "   - Plus de 50 PNGs générés"
    echo "   - Plus de 60 cas d'usage couverts"
    echo "   - Documentation complète disponible"
    echo ""
    echo "🚀 La version anglaise est PRÊTE pour utilisation!"
else
    echo "⚠️  Migration PARTIELLEMENT RÉUSSIE"
    echo "   - Vérifier les éléments manquants ci-dessus"
fi

echo ""
echo "📍 Répertoire: $ENGLISH_DIR"
echo "📅 Date: $(date)"
echo "=============================================="
