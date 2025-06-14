# 📅 DIAGRAMMES DE GANTT KYC

## 🎯 Objectif
Les diagrammes de Gantt KYC permettent de visualiser la planification temporelle, les dépendances et le suivi des différents processus et phases du système KYC.

## 📊 Contenu du Package

### 🗓️ Diagrammes Disponibles

1. **`PlanificationProjetKYC.puml`** - Planning global du projet KYC (8 mois)
2. **`ProcessusOnboardingClient.puml`** - Timeline onboarding client (22 jours)
3. **`CycleVieDocumentKYC.puml`** - Cycle de vie des documents (6 phases)
4. **`PlanificationControlesKYC.puml`** - Planning des contrôles périodiques
5. **`DeploiementArchitectureKYC.puml`** - Timeline déploiement architecture (7 phases)
6. **`MaintenanceSystemeKYC.puml`** - Planning maintenance système annuel
7. **`GestionRisquesKYC.puml`** - Processus gestion des risques continu

## 🚀 Utilisation

### Génération des diagrammes
```bash
# Générer tous les diagrammes Gantt
plantuml *.puml -tpng

# Générer un diagramme spécifique
plantuml PlanificationProjetKYC.puml -tpng
```

### Mise à jour
Les diagrammes de Gantt doivent être mis à jour régulièrement pour refléter l'avancement réel des projets et processus.

## 🎨 Standards Visuels

- **Thème** : `aws-orange` pour cohérence avec les autres diagrammes
- **Couleurs** : 
  - 🔵 Bleu : Phases de conception
  - 🟢 Vert : Phases de développement
  - 🟡 Jaune : Phases de test
  - 🔴 Rouge : Phases critiques
  - 🟣 Violet : Phases de déploiement

## 📈 Métriques de Suivi

- **Durée planifiée** vs **Durée réelle**
- **Jalons critiques** et dates butoirs
- **Dépendances** entre tâches
- **Ressources allouées** par phase
- **Risques** et points d'attention

## 🎯 Coverage Temporel

### 📅 Plannings Disponibles
- **Projet global** : 8 mois (conception → production)
- **Onboarding client** : 22 jours (pré-enregistrement → activation)
- **Cycle documents** : 6 phases (collecte → archivage)
- **Contrôles périodiques** : Quotidiens, hebdomadaires, mensuels
- **Déploiement** : 7 phases (infrastructure → monitoring)
- **Maintenance** : Planning annuel avec cycles préventifs
- **Gestion risques** : Processus continu 365j/an

---
*Package complet : 7 diagrammes de Gantt avec 7 images PNG générées*  
*Dernière mise à jour : 14 juin 2025*
