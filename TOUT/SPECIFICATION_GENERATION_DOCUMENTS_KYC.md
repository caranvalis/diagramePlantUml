# 📄 SPÉCIFICATION DÉTAILLÉE - GÉNÉRATION DE DOCUMENTS KYC

## 🎯 Introduction
Ce document spécifie en détail le processus de génération de documents dans le système KYC, en respectant les 7 grandes étapes du processus bancaire d'ouverture de compte.

---

## 📋 Les 7 Grandes Étapes KYC et Documents Associés

### Étape 1 : Pré-enregistrement du Client
**Documents générés :**
- **Récépissé de Pré-enregistrement**
  - **Description** : Document temporaire avec numéro d'identification unique (NIU)
  - **Contenu** : Nom, prénom, téléphone, date de pré-enregistrement, NIU
  - **Format** : PDF avec QR Code pour suivi
  - **Actions système** : Génération automatique après saisie des données de base

### Étape 2 : Collecte et Validation des Documents
**Documents générés :**
- **Liste des Documents Requis**
  - **Description** : Checklist personnalisée selon le profil client
  - **Contenu** : Documents obligatoires, optionnels, dates limites
  - **Actions système** : Génération selon le type de client (particulier/entreprise)

- **Accusé de Réception Documents**
  - **Description** : Confirmation de réception des pièces justificatives
  - **Contenu** : Liste des documents reçus, dates, statut de validation
  - **Actions système** : Génération automatique après chaque upload

### Étape 3 : Contrôles d'Identité et de Conformité
**Documents générés :**
- **Rapport de Contrôles KYC**
  - **Description** : Synthèse des vérifications effectuées
  - **Contenu** : 
    - Résultats contrôles identité (CNI, passeport)
    - Vérifications blacklist, PPE, FATCA
    - Score de risque calculé
    - Recommandations d'escalade
  - **Actions système** : Génération automatique après tous les contrôles

### Étape 4 : Validation Finale et Approbation
**Documents générés :**
- **Décision de Validation**
  - **Description** : Document officiel d'approbation ou de rejet
  - **Contenu** : Décision, motifs, signature électronique du validateur
  - **Actions système** : Génération après décision du gestionnaire KYC

- **Fiche KYC Complète**
  - **Description** : Dossier client consolidé et validé
  - **Contenu** : Toutes les informations client, documents, contrôles effectués
  - **Format** : PDF sécurisé avec signature électronique
  - **Actions système** : Génération uniquement si validation positive

### Étape 5 : Création du Compte dans le CBS
**Documents générés :**
- **Contrat d'Ouverture de Compte**
  - **Description** : Convention bancaire personnalisée
  - **Contenu** : Conditions générales, produits souscrits, tarifs
  - **Actions système** : Génération après création réussie du compte CBS

- **Relevé d'Identité Bancaire (RIB)**
  - **Description** : Identifiants du compte nouvellement créé
  - **Contenu** : Numéro de compte, IBAN, BIC, coordonnées agence
  - **Actions système** : Génération automatique via API CBS

### Étape 6 : Signature Électronique
**Documents générés :**
- **Carton de Signature Électronique**
  - **Description** : Spécimen de signature numérisée
  - **Contenu** : Signature bitmap/vectorielle, métadonnées biométriques
  - **Actions système** : Génération après capture sur ePad

- **Conditions Générales Signées**
  - **Description** : Document contractuel avec signature client
  - **Contenu** : Texte réglementaire + signature horodatée
  - **Actions système** : Fusion du contrat avec la signature capturée

### Étape 7 : Attribution du Statut Client et Archivage
**Documents générés :**
- **Certificat d'Activation de Compte**
  - **Description** : Confirmation officielle d'ouverture
  - **Contenu** : Statut "ACTIF", date d'activation, produits activés
  - **Actions système** : Génération finale après toutes validations

- **Dossier Client Archivé**
  - **Description** : Archive complète du dossier KYC
  - **Contenu** : Tous les documents générés, horodatés et signés
  - **Actions système** : Archivage automatique selon plan de classement

---

## ⚙️ Spécifications Techniques de Génération

### Architecture de Génération
```
Service Document Generator
├── Templates Engine (Thymeleaf/Freemarker)
├── PDF Engine (iText/PDFBox)
├── Signature Engine (DSS/eIDAS)
├── QR Code Generator
└── Archive Manager
```

### Processus de Génération
1. **Déclenchement**
   - Événement métier (validation étape, signature, etc.)
   - Appel API REST au service de génération

2. **Préparation des Données**
   - Collecte des informations client depuis la base KYC
   - Enrichissement avec données référentiels

3. **Application du Template**
   - Sélection du template selon type de document et profil client
   - Fusion des données avec le modèle

4. **Génération PDF**
   - Conversion en PDF avec mise en forme
   - Application du branding banque

5. **Sécurisation**
   - Signature électronique si requis
   - Horodatage et metadata

6. **Archivage**
   - Stockage sécurisé avec indexation
   - Attribution du code de classement

### Règles de Gestion
- **Nomenclature** : `[TYPE]_[CLIENT_ID]_[DATE]_[VERSION].pdf`
- **Versioning** : Incrémental pour chaque modification
- **Rétention** : Selon politique légale (5-10 ans)
- **Accès** : Contrôlé par rôles et droits utilisateur

### Intégrations
- **CBS** : Récupération données compte et RIB
- **ePad** : Capture signature électronique
- **Archive** : Stockage selon plan de classement
- **Notification** : Envoi automatique par email/SMS

---

## 📊 Matrice Documents/Étapes

| Étape | Document Principal | Format | Déclencheur | Destinataire |
|-------|-------------------|--------|-------------|--------------|
| 1. Pré-enregistrement | Récépissé NIU | PDF + QR | Saisie données | Client |
| 2. Collecte Documents | Accusé Réception | PDF | Upload document | Client |
| 3. Contrôles KYC | Rapport Contrôles | PDF | Fin contrôles | Gestionnaire |
| 4. Validation | Fiche KYC | PDF sécurisé | Validation positive | Archive |
| 5. Création Compte | RIB + Contrat | PDF | Succès CBS | Client |
| 6. Signature | Carton Signature | PDF + Signature | Capture ePad | Archive |
| 7. Activation | Certificat Activation | PDF | Statut ACTIF | Client |

---

## 🔧 Critères de Validation
- Chaque document doit être généré dans les 30 secondes
- Format PDF/A pour l'archivage légal
- Signature électronique conforme eIDAS
- Traçabilité complète de génération
- Accès sécurisé selon profils utilisateur

---

*Document généré le 17/06/2025 – Spécification Génération Documents KYC*
