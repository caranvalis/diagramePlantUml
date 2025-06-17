#!/bin/bash

# Script pour migrer tous les diagrammes de séquence vers la version anglaise
# avec traduction automatique des termes clés

SOURCE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE SEQUENCE"
TARGET_DIR="/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION/KYC SEQUENCE DIAGRAMS"

echo "Migration des diagrammes de séquence vers la version anglaise..."

# Créer le répertoire cible s'il n'existe pas
mkdir -p "$TARGET_DIR"

# Fonction de traduction des termes français vers anglais
translate_content() {
    local content="$1"
    
    # Traductions des termes généraux
    content=$(echo "$content" | sed 's/Diagramme de Séquence/Sequence Diagram/g')
    content=$(echo "$content" | sed 's/Cas d'\''Usage/Use Case/g')
    content=$(echo "$content" | sed 's/Pré-enregistrement/Pre-registration/g')
    content=$(echo "$content" | sed 's/Collecte de Documents/Document Collection/g')
    content=$(echo "$content" | sed 's/Contrôles KYC/KYC Controls/g')
    content=$(echo "$content" | sed 's/Validation Finale/Final Validation/g')
    content=$(echo "$content" | sed 's/Signature Électronique/Electronic Signature/g')
    content=$(echo "$content" | sed 's/Gestion Opérationnelle/Operational Management/g')
    
    # Traductions des acteurs
    content=$(echo "$content" | sed 's/Client/Client/g')
    content=$(echo "$content" | sed 's/Gestionnaire/Manager/g')
    content=$(echo "$content" | sed 's/Superviseur/Supervisor/g')
    content=$(echo "$content" | sed 's/Système/System/g')
    content=$(echo "$content" | sed 's/Service/Service/g')
    
    # Traductions des actions courantes
    content=$(echo "$content" | sed 's/Demander/Request/g')
    content=$(echo "$content" | sed 's/Valider/Validate/g')
    content=$(echo "$content" | sed 's/Contrôler/Control/g')
    content=$(echo "$content" | sed 's/Envoyer/Send/g')
    content=$(echo "$content" | sed 's/Recevoir/Receive/g')
    content=$(echo "$content" | sed 's/Créer/Create/g')
    content=$(echo "$content" | sed 's/Modifier/Modify/g')
    content=$(echo "$content" | sed 's/Supprimer/Delete/g')
    content=$(echo "$content" | sed 's/Sauvegarder/Save/g')
    content=$(echo "$content" | sed 's/Charger/Load/g')
    content=$(echo "$content" | sed 's/Vérifier/Verify/g')
    content=$(echo "$content" | sed 's/Analyser/Analyze/g')
    content=$(echo "$content" | sed 's/Générer/Generate/g')
    content=$(echo "$content" | sed 's/Calculer/Calculate/g')
    content=$(echo "$content" | sed 's/Notifier/Notify/g')
    content=$(echo "$content" | sed 's/Archiver/Archive/g')
    
    # Traductions des réponses
    content=$(echo "$content" | sed 's/Succès/Success/g')
    content=$(echo "$content" | sed 's/Échec/Failure/g')
    content=$(echo "$content" | sed 's/Erreur/Error/g')
    content=$(echo "$content" | sed 's/Confirmation/Confirmation/g')
    content=$(echo "$content" | sed 's/Refus/Rejection/g')
    content=$(echo "$content" | sed 's/Acceptation/Acceptance/g')
    
    # Traductions des statuts
    content=$(echo "$content" | sed 's/En cours/In Progress/g')
    content=$(echo "$content" | sed 's/Terminé/Completed/g')
    content=$(echo "$content" | sed 's/Annulé/Cancelled/g')
    content=$(echo "$content" | sed 's/Suspendu/Suspended/g')
    content=$(echo "$content" | sed 's/Actif/Active/g')
    content=$(echo "$content" | sed 's/Inactif/Inactive/g')
    
    echo "$content"
}

# Parcourir tous les répertoires UC
for uc_dir in "$SOURCE_DIR"/UC*; do
    if [ -d "$uc_dir" ]; then
        uc_name=$(basename "$uc_dir")
        target_uc_dir="$TARGET_DIR/$uc_name"
        
        echo "Migration de $uc_name..."
        mkdir -p "$target_uc_dir"
        
        # Traiter tous les fichiers .puml dans le répertoire
        for puml_file in "$uc_dir"/*.puml; do
            if [ -f "$puml_file" ]; then
                file_name=$(basename "$puml_file")
                target_file="$target_uc_dir/$file_name"
                
                echo "  - Migration de $file_name"
                
                # Lire le contenu et le traduire
                content=$(cat "$puml_file")
                translated_content=$(translate_content "$content")
                
                # Écrire le fichier traduit
                echo "$translated_content" > "$target_file"
            fi
        done
        
        # Copier les fichiers PNG s'ils existent
        for png_file in "$uc_dir"/*.png; do
            if [ -f "$png_file" ]; then
                file_name=$(basename "$png_file")
                cp "$png_file" "$target_uc_dir/$file_name"
                echo "  - Copie de $file_name"
            fi
        done
    fi
done

echo "Migration terminée!"
echo "Nombre de répertoires migrés: $(find "$TARGET_DIR" -maxdepth 1 -type d -name "UC*" | wc -l)"
