# 📋 GESTION-CLIENTS - Organisation des Packages

## 🎯 **Architecture des Packages**

### 📁 **CREATION-CLIENTS**
- `Sequence_CreerClientParticulier.puml` - Création complète client particulier
- `Sequence_CreerEntrepriseCliente.puml` - Création entreprise avec structure
- `Sequence_GestionDossierClient.puml` - Gestion complète dossiers clients
- `Sequence_GestionActionnaires.puml` - Gestion actionnaires et participations
- `Sequence_GestionTiers.puml` - Gestion tiers avec contrôles KYC

### 📁 **GESTION-COMPTES** 
- `Sequence_OuvrirCompte.puml` - Ouverture compte avec évaluation risque
- `Sequence_ModifierCompte.puml` - Modification paramètres compte
- `Sequence_CloturerCompte.puml` - Clôture sécurisée compte

### 📁 **CATEGORIES-INTERNES**
- `Sequence_CreerCategorieInterne.puml` - Création catégorie avec politiques
- `Sequence_ModifierCategorieInterne.puml` - Modification avec migration clients
- `Sequence_SupprimerCategorieInterne.puml` - Suppression sécurisée avec archivage
- `Sequence_RechercherCategorieInterne.puml` - Recherche avancée avec cache

### 📁 **MANDATAIRES-PROCURATIONS**
- `Sequence_GestionMandataires.puml` - Gestion complète mandataires
- `Sequence_CreerProcuration.puml` - Création procuration
- `Sequence_RevoquerMandat.puml` - Révocation sécurisée

### 📁 **DOCUMENTS-BIOMETRIE**
- `Sequence_GestionDocuments.puml` - GED complète avec OCR
- `Sequence_BiometrieClient.puml` - Capture et authentification biométrique
- `Sequence_VerificationSignature.puml` - Vérification spécimens

### 📁 **ANALYSE-RISQUES**
- `Sequence_AnalyseRisqueClient.puml` - Scoring automatique risque
- `Sequence_ReevaluationPeriodique.puml` - Contrôles périodiques
- `Sequence_DetectionAnomalies.puml` - Surveillance comportementale

### 📁 **STATUTS-REFERENTIELS**
- `Sequence_GestionStatutsClient.puml` - Gestion statuts et transitions
- `Sequence_GestionTypesClient.puml` - Types clients (Particulier, Entreprise, Association)
- `Sequence_GestionRegimeMatrimonial.puml` - Régimes matrimoniaux avec validation juridique
- `Sequence_GestionProfilsClient.puml` - Profils et segmentation comportementale
- `Sequence_GestionSecteursActivite.puml` - Classification sectorielle
- `Sequence_GestionPays.puml` - Référentiel pays et zones risque

## 🔧 **Standards Techniques**

### **Optimisation A4**
- FontSize : 7-8pt pour lisibilité optimale
- Participants compacts avec noms abrégés
- Structure simplifiée sans perte fonctionnelle

### **Thème Uniforme**
```plantuml
!theme plain
skinparam backgroundColor #F8FBFF
skinparam sequence {
    ActorBorderColor #1976D2
    ParticipantBackgroundColor #E3F2FD
    MessageTextSize 8
}
```

### **Gestion d'Erreurs**
- Blocs `alt/else` pour scénarios alternatifs
- Validations à chaque étape critique
- Traçabilité et audit intégrés

## 📊 **Couverture Fonctionnelle**

✅ **Complètement couverts :**
- Création clients (particuliers/entreprises)
- Gestion dossiers et actionnaires
- Gestion des tiers avec KYC
- Ouverture/gestion comptes
- Catégories internes (CRUD complet)
- Types de clients et profils
- Régimes matrimoniaux
- Mandataires et procurations
- Documents et biométrie
- Analyse de risques

🔄 **En cours d'extension :**
- Référentiels métier
- Workflows d'approbation
- Intégrations externes

## 🎯 **Utilisation**

1. **Navigation par domaine** : Chaque package couvre un domaine métier spécifique
2. **Séquences complètes** : Chaque diagramme couvre un processus de bout en bout
3. **Format A4** : Tous les diagrammes sont optimisés pour impression/visualisation A4
4. **Cohérence technique** : Thème et standards uniformes
