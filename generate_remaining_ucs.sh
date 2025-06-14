#!/bin/bash

# Script de génération automatique des diagrammes UC restants
cd "/Users/caranvalis/Documents/test-plantuml/KYC DIAGRAMME DE SEQUENCE"

# Template de diagramme standardisé
create_uc_diagram() {
    local uc_num=$1
    local title=$2
    
    cat > "UC${uc_num}/UC${uc_num}_new.puml" << EOF
@startuml UC${uc_num}
!theme superhero-outline
skinparam backgroundColor #1e1e1e
skinparam actorStyle awesome
skinparam participant {
    BackgroundColor #2d2d2d
    BorderColor #4a90e2
    FontColor #ffffff
}
skinparam sequence {
    ArrowColor #4a90e2
    LifeLineBackgroundColor #2d2d2d
    LifeLineBorderColor #4a90e2
    MessageAlignment center
}

title <color:#4a90e2>UC${uc_num} - ${title}</color>

actor "<color:#ff6b6b>Gestionnaire KYC</color>" as Gestionnaire
participant "<color:#ff6b6b>Interface Web</color>" as WebUI
participant "<color:#4ecdc4>API Gateway</color>" as Gateway
participant "<color:#45b7d1>Orchestrateur KYC</color>" as Orchestrator
participant "<color:#96ceb4>Service Métier</color>" as BusinessService
participant "<color:#feca57>Service Audit</color>" as AuditService
participant "<color:#ff9ff3>Service Notification</color>" as NotificationService
database "<color:#00d2d3>Base KYC</color>" as KYCDB
database "<color:#ff6348>Audit DB</color>" as AuditDB

== Traitement Principal ==

Gestionnaire -> WebUI : <color:#00ff00>Demande traitement UC${uc_num}</color>
activate Gestionnaire
activate WebUI
WebUI -> Gateway : <color:#4ecdc4>POST /kyc/process/${uc_num}</color>
activate Gateway
Gateway -> Orchestrator : <color:#45b7d1>Traiter UC${uc_num}</color>
activate Orchestrator

Orchestrator -> BusinessService : <color:#96ceb4>Exécuter logique métier</color>
activate BusinessService
BusinessService -> KYCDB : <color:#00d2d3>Opérations base de données</color>
activate KYCDB
KYCDB --> BusinessService : <color:#00d2d3>Données traitées</color>
deactivate KYCDB

BusinessService -> AuditService : <color:#feca57>Log opération UC${uc_num}</color>
activate AuditService
AuditService -> AuditDB : Enregistre action
deactivate AuditService

BusinessService -> NotificationService : <color:#ff9ff3>Notifier résultat</color>
activate NotificationService
NotificationService -> Gestionnaire : <color:#00ff00>✅ UC${uc_num} traité avec succès</color>
NotificationService --> BusinessService : <color:#00d2d3>Notification envoyée</color>
deactivate NotificationService

BusinessService --> Orchestrator : <color:#00ff00>Traitement terminé</color>
deactivate BusinessService
Orchestrator --> Gateway : <color:#00ff00>UC${uc_num} terminé</color>
deactivate Orchestrator
Gateway --> WebUI : <color:#00ff00>200 OK</color>
deactivate Gateway
WebUI --> Gestionnaire : <color:#00ff00>✅ Opération réussie</color>
deactivate WebUI
deactivate Gestionnaire

@enduml
EOF
}

# Créer les diagrammes pour les UC restants
create_uc_diagram "035" "Archivage des Dossiers KYC"
create_uc_diagram "036" "Restauration de Dossiers Archivés"
create_uc_diagram "037" "Mise à Jour Automatique des Données Client"
create_uc_diagram "038" "Synchronisation avec Systèmes Externes"
create_uc_diagram "039" "Validation Croisée Multi-Sources"
create_uc_diagram "040" "Gestion des Exceptions et Anomalies"

echo "Diagrammes créés pour UC035-UC040"
