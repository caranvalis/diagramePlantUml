#!/bin/bash

# ========================================
# Script de suppression des couleurs dans les diagrammes de classe
# Standardise vers un style minimaliste
# ========================================

set -e

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Compteurs
total_files=0
modified_files=0

# Fonction de traitement d'un fichier
process_file() {
    local file="$1"
    local modified=false
    
    echo -e "${BLUE}📝 Traitement: $(basename "$file")${NC}"
    
    # Créer une sauvegarde
    cp "$file" "${file}.backup"
    
    # Appliquer les transformations
    sed -i '' '
        # Supprimer les couleurs de fond
        /skinparam backgroundColor/c\
skinparam backgroundColor white
        
        # Supprimer les couleurs des classes
        /skinparam classBackgroundColor/c\
skinparam classBackgroundColor white
        
        /skinparam classBorderColor/c\
skinparam classBorderColor black
        
        /skinparam classFontColor/c\
skinparam classFontColor black
        
        # Supprimer les couleurs des packages
        /skinparam packageBackgroundColor/c\
skinparam packageBackgroundColor white
        
        /skinparam packageBorderColor/c\
skinparam packageBorderColor black
        
        /skinparam packageFontColor/c\
skinparam packageFontColor black
        
        # Supprimer l'\''ombrage
        /skinparam shadowing/c\
skinparam shadowing false
        
        # Supprimer les coins arrondis
        /skinparam roundCorner/c\
skinparam roundCorner 0
        
        # Supprimer les autres couleurs
        /skinparam.*Color.*#/d
        /skinparam.*Background.*#/d
        /skinparam.*Border.*#/d
        /skinparam.*Font.*#/d
        
    ' "$file"
    
    # Vérifier si le fichier a été modifié
    if ! cmp -s "$file" "${file}.backup"; then
        modified=true
        modified_files=$((modified_files + 1))
        echo -e "${GREEN}   ✅ Modifié${NC}"
    else
        echo -e "${YELLOW}   ➖ Aucune modification nécessaire${NC}"
    fi
    
    # Supprimer la sauvegarde si tout s'est bien passé
    rm "${file}.backup"
    
    total_files=$((total_files + 1))
}

# Fonction principale
main() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}SUPPRESSION DES COULEURS - DIAGRAMMES DE CLASSE${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
    
    # Trouver tous les fichiers .puml dans le répertoire des diagrammes de classe
    base_dir="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE CLASSE"
    
    if [ ! -d "$base_dir" ]; then
        echo -e "${RED}❌ Répertoire non trouvé: $base_dir${NC}"
        exit 1
    fi
    
    echo -e "${BLUE}📁 Recherche des fichiers dans: $base_dir${NC}"
    echo ""
    
    # Traiter tous les fichiers .puml
    find "$base_dir" -name "*.puml" -type f | while read -r file; do
        # Ignorer le template
        if [[ "$(basename "$file")" == "TEMPLATE_STANDARD_CLASSE.puml" ]]; then
            echo -e "${YELLOW}⏭️  Ignoré: $(basename "$file") (template)${NC}"
            continue
        fi
        
        process_file "$file"
    done
    
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN}🎉 TRAITEMENT TERMINÉ${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo -e "📊 Statistiques:"
    echo -e "   📁 Fichiers traités: $total_files"
    echo -e "   ✏️  Fichiers modifiés: $modified_files"
    echo ""
    
    if [ $modified_files -gt 0 ]; then
        echo -e "${GREEN}✅ Style minimaliste appliqué avec succès${NC}"
        echo ""
        echo -e "${BLUE}Prochaines étapes:${NC}"
        echo -e "1. Vérifier les fichiers modifiés"
        echo -e "2. Régénérer les PNG: find . -name '*.puml' -exec plantuml {} \\;"
        echo -e "3. Valider visuellement les diagrammes"
    else
        echo -e "${YELLOW}ℹ️  Aucune modification nécessaire${NC}"
    fi
    echo ""
}

# Exécution avec gestion d'erreur
if ! main; then
    echo -e "${RED}❌ Erreur pendant le traitement${NC}"
    exit 1
fi
