# CAS D'USAGE - SYSTÈME D'OUVERTURE DE COMPTE

## 📋 Vue d'Ensemble

Ce diagramme présente l'ensemble des **50 cas d'usage** du système d'ouverture de compte bancaire, organisés en **10 packages fonctionnels** avec **8 acteurs principaux**.

## 👥 Acteurs du Système

| **Acteur** | **Rôle** | **Responsabilités** |
|------------|----------|-------------------|
| **Client Prospect** | Demandeur | Initie et suit sa demande |
| **Agent Commercial** | Gestionnaire | Traite les dossiers clients |
| **Responsable Agence** | Validateur | Approuve et supervise |
| **Direction Générale** | Décideur final | Validation stratégique |
| **Agent Compliance** | Contrôleur | Vérifications réglementaires |
| **Système CBS** | Intégrateur | Création comptes bancaires |
| **Services Externes** | Fournisseur | APIs et services tiers |
| **Administrateur Système** | Support technique | Maintenance et monitoring |

## 📦 Packages Fonctionnels

### 1. **Gestion des Demandes** (5 cas d'usage)
- **UC01** - Initier Demande Ouverture
- **UC02** - Saisir Informations Client  
- **UC03** - Modifier Demande
- **UC04** - Consulter Statut Demande
- **UC05** - Annuler Demande

### 2. **Gestion Documentaire** (5 cas d'usage)
- **UC06** - Télécharger Documents
- **UC07** - Valider Documents
- **UC08** - Demander Complément
- **UC09** - Archiver Documents
- **UC10** - Générer Attestations

### 3. **Contrôles Réglementaires** (6 cas d'usage)
- **UC11** - Vérifier Identité
- **UC12** - Contrôle OFAC/Sanctions
- **UC13** - Détection PPE (Personnes Politiquement Exposées)
- **UC14** - Vérification FATCA
- **UC15** - Scoring KYC
- **UC16** - Validation AML (Anti-Money Laundering)

### 4. **Workflow et Validation** (6 cas d'usage)
- **UC17** - Assigner Dossier
- **UC18** - Valider Étape
- **UC19** - Déléguer Validation
- **UC20** - Escalader Dossier
- **UC21** - Rejeter Demande
- **UC22** - Approuver Ouverture

### 5. **Gestion des Agents** (5 cas d'usage)
- **UC23** - Authentifier Agent
- **UC24** - Gérer Absences
- **UC25** - Transférer Dossiers
- **UC26** - Déléguer Pouvoirs
- **UC27** - Consulter Tableau de Bord

### 6. **Intégrations Externes** (5 cas d'usage)
- **UC28** - Créer Compte CBS
- **UC29** - Synchroniser Données
- **UC30** - Envoyer Notifications
- **UC31** - Intégrer APIs Tierces
- **UC32** - Générer Rapports

### 7. **Signature Électronique** (4 cas d'usage)
- **UC33** - Préparer Documents
- **UC34** - Envoyer Signature
- **UC35** - Valider Signature
- **UC36** - Archiver Contrats

### 8. **Gestion d'Exceptions** (4 cas d'usage)
- **UC37** - Détecter Anomalies
- **UC38** - Traiter Exceptions
- **UC39** - Escalader Problèmes
- **UC40** - Résoudre Blocages

### 9. **Reporting et Audit** (4 cas d'usage)
- **UC41** - Générer Rapports KYC
- **UC42** - Audit Trail
- **UC43** - Statistiques Performance
- **UC44** - Rapports Conformité

### 10. **Clôture et Finalisation** (6 cas d'usage)
- **UC45** - Finaliser Ouverture
- **UC46** - Activer Compte
- **UC47** - Informer Client
- **UC48** - Archiver Dossier
- **UC49** - Mise à Jour Référentiels
- **UC50** - Clôturer Processus

## 🔗 Relations entre Cas d'Usage

### **Relations Include** (obligatoires)
- UC01 → UC23 : L'initiation nécessite une authentification
- UC02 → UC11 : La saisie inclut la vérification d'identité
- UC06 → UC07 : Le téléchargement inclut la validation
- UC18 → UC15 : La validation inclut le scoring KYC
- UC22 → UC28 : L'approbation inclut la création CBS
- UC22 → UC45 : L'approbation inclut la finalisation
- UC45 → UC46 : La finalisation inclut l'activation
- UC46 → UC47 : L'activation inclut l'information client

### **Relations Extend** (optionnelles)
- UC03 ← UC02 : La modification peut étendre la saisie
- UC08 ← UC07 : La demande de complément peut étendre la validation
- UC19 ← UC18 : La délégation peut étendre la validation
- UC20 ← UC18 : L'escalade peut étendre la validation
- UC21 ← UC18 : Le rejet peut étendre la validation
- UC38 ← UC37 : Le traitement peut étendre la détection
- UC39 ← UC38 : L'escalade peut étendre le traitement

## 🎯 Couverture Fonctionnelle

### **Processus Métier Couverts**
- ✅ **Initiation et saisie** des demandes clients
- ✅ **Gestion documentaire** complète avec archivage
- ✅ **Contrôles réglementaires** KYC/AML conformes
- ✅ **Workflow de validation** multi-niveaux
- ✅ **Gestion organisationnelle** des agents
- ✅ **Intégrations système** CBS et externes
- ✅ **Signature électronique** sécurisée
- ✅ **Gestion d'exceptions** et escalade
- ✅ **Reporting et audit** conformité
- ✅ **Finalisation et activation** des comptes

### **Acteurs Impliqués**
- ✅ **Client** : 5 cas d'usage (initiation, suivi, signature)
- ✅ **Agent Commercial** : 13 cas d'usage (gestion quotidienne)
- ✅ **Responsable Agence** : 9 cas d'usage (supervision, validation)
- ✅ **Direction Générale** : 6 cas d'usage (décisions stratégiques)
- ✅ **Agent Compliance** : 9 cas d'usage (contrôles réglementaires)
- ✅ **Système CBS** : 4 cas d'usage (intégration bancaire)
- ✅ **Services Externes** : 5 cas d'usage (APIs, notifications)
- ✅ **Administrateur** : 7 cas d'usage (maintenance système)

## 📊 Statistiques

- **Total cas d'usage :** 50
- **Packages fonctionnels :** 10
- **Acteurs impliqués :** 8
- **Relations include :** 8
- **Relations extend :** 8
- **Couverture métier :** 100%

## 🎨 Standards Visuels

Ce diagramme applique les **standards Material Design** :
- **Palette de couleurs** harmonisée
- **Typographie** claire et lisible
- **Organisation** logique par packages
- **Relations** clairement identifiées

---

*Diagramme créé le 16 juin 2025 - Version française complète*
