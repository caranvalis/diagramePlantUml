#!/bin/bash

# Script pour ajouter des couloirs basiques aux diagrammes qui n'en ont pas

echo "Ajout de couloirs basiques aux diagrammes manquants..."

# Fonction pour ajouter couloirs basiques
add_basic_swimlanes() {
    local file=$1
    local temp_file=$(mktemp)
    
    echo "Traitement de $file..."
    
    # Remplacer les patterns de base pour ajouter des couloirs
    sed '
        # Ajouter couloir Système au début
        /^start$/i\
|Système|
        
        # Ajouter couloirs aux activités principales
        s/^:Générer/|Système|\
:Générer/
        s/^:Créer/|Système|\
:Créer/
        s/^:Calculer/|Système|\
:Calculer/
        s/^:Analyser/|Service Analyse|\
:Analyser/
        s/^:Vérifier/|Service Contrôle|\
:Vérifier/
        s/^:Contrôler/|Service Contrôle|\
:Contrôler/
        s/^:Notifier/|Service Communication|\
:Notifier/
        s/^:Informer/|Service Communication|\
:Informer/
        s/^:Demander/|Client|\
:Demander/
        s/^:Fournir/|Client|\
:Fournir/
        s/^:Escalader/|Manager|\
:Escalader/
        s/^:Programmer/|Système|\
:Programmer/
        s/^:Stocker/|Système|\
:Stocker/
        s/^:Archiver/|Système|\
:Archiver/
    ' "$file" > "$temp_file"
    
    mv "$temp_file" "$file"
    echo "  ✓ Couloirs ajoutés à $file"
}

# Traiter les fichiers sans couloirs
for file in 05_ProcessusReporting.puml 06_GestionDocuments.puml 07_IntegrationsExternes.puml 08_GestionExceptions.puml 09_ClotureDossier.puml; do
    if [ -f "$file" ]; then
        swimlanes=$(grep -c "^|" "$file")
        if [ $swimlanes -eq 0 ]; then
            add_basic_swimlanes "$file"
        fi
    fi
done

echo "Ajout de couloirs terminé !"
