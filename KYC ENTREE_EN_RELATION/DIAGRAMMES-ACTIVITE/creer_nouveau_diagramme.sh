#!/bin/bash

# Script pour créer un nouveau diagramme d'activité basé sur le template

if [ $# -eq 0 ]; then
    echo "Usage: $0 <NomDuDiagramme> [TitreDuProcessus]"
    echo "Exemple: $0 ValidationClient 'Processus de Validation Client'"
    exit 1
fi

DIAGRAM_NAME=$1
PROCESS_TITLE=${2:-"Nouveau Processus"}
FILE_NAME="${DIAGRAM_NAME}.puml"

echo "Création du diagramme d'activité: $FILE_NAME"

# Copier le template et remplacer les placeholders
sed "s/TemplateStandardActivite/$DIAGRAM_NAME/g; s/\[TITRE DU PROCESSUS\]/$PROCESS_TITLE/g" TEMPLATE_STANDARD.puml > "$FILE_NAME"

echo "✓ Fichier créé: $FILE_NAME"
echo "✓ Titre: $PROCESS_TITLE"
echo ""
echo "Prochaines étapes:"
echo "1. Éditer $FILE_NAME"
echo "2. Ajouter vos couloirs et activités"
echo "3. Générer le PNG: plantuml $FILE_NAME"
