#!/bin/bash

# Script pour migrer tous les diagrammes de Gantt vers la version anglaise

SOURCE_DIR="/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE GANTT"
TARGET_DIR="/Users/caranvalis/Documents/test-plantuml/KYC-ENGLISH-VERSION/KYC GANTT DIAGRAMS"

echo "Migration des diagrammes de Gantt vers la version anglaise..."

# Créer le répertoire cible s'il n'existe pas
mkdir -p "$TARGET_DIR"

# Fonction de traduction des termes français vers anglais pour Gantt
translate_gantt_content() {
    local content="$1"
    
    # Traductions des titres
    content=$(echo "$content" | sed 's/Planification Projet KYC/KYC Project Planning/g')
    content=$(echo "$content" | sed 's/Cycle de Vie Document KYC/KYC Document Lifecycle/g')
    content=$(echo "$content" | sed 's/Déploiement Architecture KYC/KYC Architecture Deployment/g')
    content=$(echo "$content" | sed 's/Gestion Risques KYC/KYC Risk Management/g')
    content=$(echo "$content" | sed 's/Maintenance Système KYC/KYC System Maintenance/g')
    content=$(echo "$content" | sed 's/Planification Contrôles KYC/KYC Controls Planning/g')
    content=$(echo "$content" | sed 's/Processus Onboarding Client/Client Onboarding Process/g')
    
    # Traductions des phases
    content=$(echo "$content" | sed 's/ANALYSE ET CONCEPTION/ANALYSIS AND DESIGN/g')
    content=$(echo "$content" | sed 's/DÉVELOPPEMENT SERVICES/SERVICES DEVELOPMENT/g')
    content=$(echo "$content" | sed 's/INFRASTRUCTURE/INFRASTRUCTURE/g')
    content=$(echo "$content" | sed 's/TESTS/TESTING/g')
    content=$(echo "$content" | sed 's/DÉPLOIEMENT/DEPLOYMENT/g')
    content=$(echo "$content" | sed 's/SUPPORT ET MAINTENANCE/SUPPORT AND MAINTENANCE/g')
    
    # Traductions des tâches générales
    content=$(echo "$content" | sed 's/Analyse besoins KYC/KYC Requirements Analysis/g')
    content=$(echo "$content" | sed 's/Conception architecture/Architecture Design/g')
    content=$(echo "$content" | sed 's/Modélisation UML/UML Modeling/g')
    content=$(echo "$content" | sed 's/Développement API Gateway/API Gateway Development/g')
    content=$(echo "$content" | sed 's/Développement Orchestrateur/Orchestrator Development/g')
    content=$(echo "$content" | sed 's/Services Métier Core/Core Business Services/g')
    content=$(echo "$content" | sed 's/Services Techniques/Technical Services/g')
    content=$(echo "$content" | sed 's/Setup Infrastructure/Infrastructure Setup/g')
    content=$(echo "$content" | sed 's/Configuration BDD/Database Configuration/g')
    content=$(echo "$content" | sed 's/Mise en place Cache/Cache Setup/g')
    content=$(echo "$content" | sed 's/Configuration Queue/Queue Configuration/g')
    content=$(echo "$content" | sed 's/Tests Unitaires/Unit Testing/g')
    content=$(echo "$content" | sed 's/Tests Intégration/Integration Testing/g')
    content=$(echo "$content" | sed 's/Tests End-to-End/End-to-End Testing/g')
    content=$(echo "$content" | sed 's/Tests Performance/Performance Testing/g')
    content=$(echo "$content" | sed 's/Préparation Prod/Production Preparation/g')
    content=$(echo "$content" | sed 's/Déploiement UAT/UAT Deployment/g')
    content=$(echo "$content" | sed 's/Tests UAT/UAT Testing/g')
    content=$(echo "$content" | sed 's/Déploiement Production/Production Deployment/g')
    content=$(echo "$content" | sed 's/Formation Équipes/Team Training/g')
    content=$(echo "$content" | sed 's/Documentation Finale/Final Documentation/g')
    content=$(echo "$content" | sed 's/Support Go-Live/Go-Live Support/g')
    
    # Traductions des jalons
    content=$(echo "$content" | sed 's/Validation Architecture/Architecture Validation/g')
    content=$(echo "$content" | sed 's/Livraison MVP/MVP Delivery/g')
    content=$(echo "$content" | sed 's/Go-Live Production/Production Go-Live/g')
    
    # Traductions des commentaires
    content=$(echo "$content" | sed 's/JALONS CRITIQUES/CRITICAL MILESTONES/g')
    content=$(echo "$content" | sed 's/DÉPENDANCES/DEPENDENCIES/g')
    
    echo "$content"
}

# Mapping des noms de fichiers
declare -A file_mapping
file_mapping["PlanificationProjetKYC.puml"]="KYCProjectPlanningComplete.puml"
file_mapping["CycleVieDocumentKYC.puml"]="KYCDocumentLifecycle.puml"
file_mapping["DeploiementArchitectureKYC.puml"]="KYCArchitectureDeployment.puml"
file_mapping["GestionRisquesKYC.puml"]="KYCRiskManagement.puml"
file_mapping["MaintenanceSystemeKYC.puml"]="KYCSystemMaintenance.puml"
file_mapping["PlanificationControlesKYC.puml"]="KYCControlsPlanning.puml"
file_mapping["ProcessusOnboardingClient.puml"]="ClientOnboardingProcess.puml"

# Migrer chaque fichier PUML
for source_file in "$SOURCE_DIR"/*.puml; do
    if [ -f "$source_file" ]; then
        source_filename=$(basename "$source_file")
        
        # Vérifier si un mapping existe
        if [[ -n "${file_mapping[$source_filename]}" ]]; then
            target_filename="${file_mapping[$source_filename]}"
        else
            # Utiliser le nom original si pas de mapping
            target_filename="$source_filename"
        fi
        
        target_file="$TARGET_DIR/$target_filename"
        
        echo "Migration de $source_filename vers $target_filename"
        
        # Lire le contenu et le traduire
        content=$(cat "$source_file")
        translated_content=$(translate_gantt_content "$content")
        
        # Écrire le fichier traduit
        echo "$translated_content" > "$target_file"
    fi
done

# Copier les fichiers PNG avec les nouveaux noms
declare -A png_mapping
png_mapping["PlanificationProjetKYC.png"]="KYCProjectPlanningComplete.png"
png_mapping["CycleVieDocumentKYC.png"]="KYCDocumentLifecycle.png"
png_mapping["DeploiementArchitectureKYC.png"]="KYCArchitectureDeployment.png"
png_mapping["GestionRisquesKYC.png"]="KYCRiskManagement.png"
png_mapping["MaintenanceSystemeKYC.png"]="KYCSystemMaintenance.png"
png_mapping["PlanificationControlesKYC.png"]="KYCControlsPlanning.png"
png_mapping["ProcessusOnboardingClient.png"]="ClientOnboardingProcess.png"

for source_png in "$SOURCE_DIR"/*.png; do
    if [ -f "$source_png" ]; then
        source_png_name=$(basename "$source_png")
        
        # Vérifier si un mapping existe
        if [[ -n "${png_mapping[$source_png_name]}" ]]; then
            target_png_name="${png_mapping[$source_png_name]}"
        else
            target_png_name="$source_png_name"
        fi
        
        target_png="$TARGET_DIR/$target_png_name"
        cp "$source_png" "$target_png"
        echo "Copie de $source_png_name vers $target_png_name"
    fi
done

echo "Migration des diagrammes de Gantt terminée!"
echo "Fichiers migrés: $(find "$TARGET_DIR" -name "*.puml" | wc -l) PUML et $(find "$TARGET_DIR" -name "*.png" | wc -l) PNG"
