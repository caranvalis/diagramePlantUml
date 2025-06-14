# Documentation des Use Cases KYC

Ce package contient les diagrammes de cas d'utilisation pour le processus KYC, organisés selon trois vues complémentaires :

## 1. UseCasesKYCParEtapes.puml
**Vue organisationnelle par grandes étapes du processus KYC**

- **8 packages thématiques** correspondant aux grandes étapes :
  1. Pré-enregistrement
  2. Collecte des Documents  
  3. Contrôles KYC
  4. Validation Finale
  5. Création Compte CBS
  6. Signature Électronique
  7. Gestion Opérationnelle
  8. Audit et Reporting

- **74 use cases** numérotés (UC001 à UC074)
- **7 acteurs principaux** : Client Particulier, Client Entreprise, Gestionnaire KYC, Superviseur, Auditeur, Système CBS, Autorité de Certification
- **Relations include/extend** pour modéliser les dépendances

## 2. UseCasesDetailles.puml
**Vue fonctionnelle détaillée des processus métiers**

- **Focus sur les interactions** entre use cases au sein de chaque étape
- **Orchestration des processus** avec les relations de déclenchement
- **Granularité métier** pour chaque fonction
- **Flux de données** entre les différentes étapes

## 3. UseCasesActeurs.puml
**Vue centrée sur les acteurs et leurs responsabilités**

- **Acteurs humains** : Clients, Gestionnaires, Superviseurs, Conformité, Auditeurs, Direction
- **Acteurs systèmes** : CBS, Blacklist, PPE, Autorité Certification, Notifications, Archives
- **Responsabilités** de chaque acteur dans le processus
- **Héritage** entre types de clients
- **Notes explicatives** sur les rôles principaux

## Cohérence avec l'Architecture

Ces use cases sont **alignés** avec :
- Les **diagrammes de classes** spécialisés par étape
- Les **diagrammes de séquence** existants (UC001, UC002, etc.)
- Les **grandes étapes KYC** définies dans le README.md
- L'**architecture paramétrable** du système

## Utilisation

- **Analyse fonctionnelle** : UseCasesKYCParEtapes.puml
- **Conception détaillée** : UseCasesDetailles.puml  
- **Gestion des rôles** : UseCasesActeurs.puml

Ces trois vues permettent une **compréhension complète** du système KYC sous différents angles (organisationnel, fonctionnel, et acteurs).
