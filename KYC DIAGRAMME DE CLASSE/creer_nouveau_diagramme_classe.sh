#!/bin/bash

# ========================================
# Script de création de nouveaux diagrammes de classe
# Basé sur le template standard minimaliste
# ========================================

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Répertoire de base
BASE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE CLASSE"
TEMPLATE_FILE="$BASE_DIR/TEMPLATE_STANDARD_CLASSE.puml"

# Fonction d'aide
show_help() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}CRÉATEUR DE DIAGRAMMES DE CLASSE${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    echo "Usage: $0 [OPTIONS] NOM_DIAGRAMME"
    echo ""
    echo "Options:"
    echo "  -h, --help      Afficher cette aide"
    echo "  -d, --dir DIR   Répertoire de destination (défaut: répertoire courant)"
    echo "  -t, --title     Titre du diagramme (défaut: basé sur le nom)"
    echo ""
    echo "Exemples:"
    echo "  $0 DiagrammeGestionCompte"
    echo "  $0 -d ./nouveaux-diagrammes ModeleMetier"
    echo "  $0 -t \"Gestion des Utilisateurs\" DiagrammeUtilisateurs"
    echo ""
}

# Fonction pour créer un nouveau diagramme
create_diagram() {
    local nom_diagramme="$1"
    local repertoire_dest="$2"
    local titre="$3"
    
    if [ -z "$nom_diagramme" ]; then
        echo -e "${RED}❌ Erreur: Nom du diagramme requis${NC}"
        show_help
        exit 1
    fi
    
    # Vérifier que le template existe
    if [ ! -f "$TEMPLATE_FILE" ]; then
        echo -e "${RED}❌ Erreur: Template non trouvé à $TEMPLATE_FILE${NC}"
        exit 1
    fi
    
    # Répertoire de destination
    if [ -z "$repertoire_dest" ]; then
        repertoire_dest="."
    fi
    
    # Créer le répertoire si nécessaire
    mkdir -p "$repertoire_dest"
    
    # Nom du fichier
    fichier_dest="$repertoire_dest/${nom_diagramme}.puml"
    
    # Vérifier si le fichier existe déjà
    if [ -f "$fichier_dest" ]; then
        echo -e "${YELLOW}⚠️  Le fichier $fichier_dest existe déjà${NC}"
        read -p "Voulez-vous l'écraser ? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo -e "${BLUE}ℹ️  Opération annulée${NC}"
            exit 0
        fi
    fi
    
    # Titre par défaut
    if [ -z "$titre" ]; then
        titre="$nom_diagramme"
    fi
    
    # Créer le nouveau diagramme
    echo -e "${BLUE}📝 Création du diagramme: $nom_diagramme${NC}"
    
    cat > "$fichier_dest" << EOF
@startuml $nom_diagramme
' ========================================
' $titre
' Diagramme de classe généré automatiquement
' Date de création: $(date '+%d/%m/%Y à %H:%M')
' ========================================

' Configuration du style minimaliste
skinparam linetype polyline
skinparam backgroundColor white
skinparam classBackgroundColor white
skinparam classBorderColor black
skinparam classFontColor black
skinparam classFontSize 12
skinparam classAttributeFontSize 11
skinparam classMethodFontSize 11
skinparam classAttributeIconSize 0
skinparam shadowing false
skinparam roundCorner 0
skinparam nodesep 50
skinparam ranksep 40
skinparam packageBackgroundColor white
skinparam packageBorderColor black
skinparam packageFontColor black

' Orientation du diagramme
left to right direction

' ========================================
' CLASSES DU DOMAINE
' ========================================

' TODO: Ajouter vos classes ici
' Exemple:
' class MaClasse {
'   - attributPrive: Type
'   + attributPublic: Type
'   + methodePublique(): Type
' }

' ========================================
' RELATIONS
' ========================================

' TODO: Ajouter vos relations ici
' Exemples:
' ClasseA "1" -- "0..*" ClasseB : relation
' ClasseC --|> ClasseA : héritage
' ClasseD ..|> InterfaceE : implémentation

@enduml
EOF
    
    echo -e "${GREEN}✅ Diagramme créé: $fichier_dest${NC}"
    
    # Générer le PNG automatiquement si PlantUML est disponible
    if command -v plantuml >/dev/null 2>&1; then
        echo -e "${BLUE}🖼️  Génération du PNG...${NC}"
        if plantuml "$fichier_dest"; then
            echo -e "${GREEN}✅ PNG généré avec succès${NC}"
        else
            echo -e "${YELLOW}⚠️  Erreur lors de la génération du PNG${NC}"
        fi
    else
        echo -e "${YELLOW}ℹ️  PlantUML non disponible, PNG non généré${NC}"
        echo -e "${BLUE}   Installez PlantUML pour la génération automatique des PNG${NC}"
    fi
    
    # Afficher le résumé
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN}🎉 DIAGRAMME CRÉÉ AVEC SUCCÈS${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo -e "📁 Fichier: $fichier_dest"
    echo -e "📝 Titre: $titre"
    echo -e "📅 Date: $(date '+%d/%m/%Y à %H:%M')"
    echo ""
    echo -e "${BLUE}Prochaines étapes:${NC}"
    echo -e "1. Éditer le fichier PUML pour ajouter vos classes"
    echo -e "2. Exécuter: plantuml $fichier_dest"
    echo -e "3. Ouvrir le PNG généré"
    echo ""
}

# Parse des arguments
repertoire_dest=""
titre=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -d|--dir)
            repertoire_dest="$2"
            shift 2
            ;;
        -t|--title)
            titre="$2"
            shift 2
            ;;
        -*)
            echo -e "${RED}❌ Option inconnue: $1${NC}"
            show_help
            exit 1
            ;;
        *)
            nom_diagramme="$1"
            shift
            ;;
    esac
done

# Exécuter la création
create_diagram "$nom_diagramme" "$repertoire_dest" "$titre"
