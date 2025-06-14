# Diagrammes d'État KYC

Cette section contient les diagrammes d'état décrivant les différents cycles de vie dans le processus Know Your Customer (KYC).

## Structure des Diagrammes

### 1. Diagramme d'État Global KYC
- **Fichier** : `DiagrammeEtat.puml`
- **Description** : États principaux du processus KYC depuis la création jusqu'à la clôture
- **Périmètre** : Vue d'ensemble des étapes et transitions principales
- **États clés** : PreEnregistrement, CollecteDocuments, ControlesKYC, ValidationFinale, CreationCompteCBS, SignatureElectronique, Actif, Bloque, Inactif, Cloture

### 2. Diagramme d'État Client Détaillé
- **Fichier** : `DIAGRAMME ETAT CLIENT/EtatClient.puml`
- **Description** : États détaillés du client avec sous-états composites
- **Focus** : Phases Prospect, Validation KYC, Post-Validation avec input/output pins
- **Spécificité** : Utilisation de états composites avec points d'entrée/sortie

### 3. Diagrammes d'État Spécialisés

#### État des Documents KYC
- **Fichier** : `EtatDocumentKYC.puml`
- **Description** : Cycle de vie des documents KYC
- **États** : NonDefini, EnAttente, Recu, EnControle, Valide, Invalide, Expire, Archive
- **Focus** : Gestion des relances, contrôles qualité, gestion des expirations

#### État des Contrôles KYC
- **Fichier** : `EtatControleKYC.puml`
- **Description** : États des contrôles de conformité KYC
- **États** : NonInitie, EnCours, Conforme, AlerteDetectee, AnalyseManuelle, NonConforme, EchecTechnique
- **Focus** : Contrôles automatiques, escalade manuelle, gestion des alertes

## Codes Couleur des Transitions

### Convention Universelle
- **🔵 Bleu (`-[#blue]->`)** : Transitions neutres/techniques
  - Début de processus
  - Passages techniques (input/output pins)
  - Transitions de progression normale

- **🟢 Vert (`-[#green]->`)** : Transitions positives/succès
  - Validation réussie
  - Contrôles conformes
  - Progression vers étape suivante

- **🔴 Rouge (`-[#red]->`)** : Transitions négatives/erreur
  - Rejet/Refus
  - Erreurs bloquantes
  - Clôture/Fermeture

- **🟠 Orange (`-[#orange]->`)** : Transitions de suspension/attente
  - Blocage temporaire
  - Attente de compléments
  - Désactivation

- **⚫ Noir (`-[#black]->`)** : Transitions finales
  - Retour à l'état final `[*]`
  - Fin de cycle de vie

## États et Statuts Client

### États Opérationnels
- **ACTIF** (Vert) : Client opérationnel, toutes fonctions disponibles
- **BLOQUE** (Rouge) : Compte suspendu, aucune opération autorisée
- **INACTIF** (Orange) : Compte désactivé, fonctions limitées
- **CLOTURE** (Gris) : Compte fermé définitivement

### États de Traitement
- **PRE_ENREGISTREMENT** : Saisie initiale des informations
- **COLLECTE_DOCUMENTS** : Upload et validation des pièces justificatives
- **CONTROLES_KYC** : Vérifications automatiques et manuelles
- **VALIDATION_FINALE** : Décision d'acceptation/rejet
- **CREATION_COMPTE_CBS** : Création technique du compte bancaire
- **SIGNATURE_ELECTRONIQUE** : Finalisation contractuelle

### États d'Exception
- **REJETE** : Souscription refusée définitivement
- **ABANDONNE** : Dossier abandonné par timeout
- **ECHEC_TECHNIQUE** : Erreur système nécessitant intervention
- **ATTENTE_COMPLEMENTS** : Informations supplémentaires requises

## Relation avec les Autres Diagrammes

### Diagrammes de Classes
Les états utilisent les entités définies dans les diagrammes de classes :
- `StatutClient` avec codes couleur intégrés
- `DossierKYC` avec états de progression
- `Document` avec statuts de validation
- `Controle` avec résultats et alertes

### Diagrammes d'Activité
Chaque transition d'état correspond à une ou plusieurs activités dans les diagrammes d'activité.

### Diagrammes de Séquence
Les changements d'état déclenchent des interactions détaillées dans les diagrammes de séquence.

## Règles de Transition

### Transitions Obligatoires
1. **PRE_ENREGISTREMENT → COLLECTE_DOCUMENTS** : Données minimales validées
2. **COLLECTE_DOCUMENTS → CONTROLES_KYC** : Dossier complet
3. **CONTROLES_KYC → VALIDATION_FINALE** : Contrôles conformes
4. **VALIDATION_FINALE → CREATION_COMPTE_CBS** : Acceptation
5. **CREATION_COMPTE_CBS → SIGNATURE_ELECTRONIQUE** : Compte créé
6. **SIGNATURE_ELECTRONIQUE → ACTIF** : Signature validée

### Transitions de Gestion
- **ACTIF ↔ BLOQUE** : Blocage/Déblocage temporaire
- **ACTIF ↔ INACTIF** : Désactivation/Réactivation
- **ACTIF/BLOQUE/INACTIF → CLOTURE** : Fermeture définitive

### Transitions d'Exception
- **Tout état → REJETE** : En cas de non-conformité majeure
- **États temporisés → ABANDONNE** : En cas de timeout
- **Tout état → ECHEC_TECHNIQUE** : En cas d'erreur système

## Paramétrage des Délais

### Timeouts par État
- **COLLECTE_DOCUMENTS** : 30 jours (configurable)
- **CONTROLES_KYC** : 5 jours ouvrés
- **VALIDATION_FINALE** : 2 jours ouvrés
- **ATTENTE_COMPLEMENTS** : 15 jours

### Relances Automatiques
- **1ère relance** : J+7 après demande
- **2ème relance** : J+15 après demande
- **Relance finale** : J+25 avant expiration

## Instructions de Compilation

### Prérequis
- PlantUML installé
- Support des caractères UTF-8 (éviter les emojis dans le code source)

### Compilation
```bash
# Compiler tous les diagrammes d'état
plantuml "KYC DIAGRAMME D'ETAT/**/*.puml"

# Compiler un diagramme spécifique
plantuml "KYC DIAGRAMME D'ETAT/DiagrammeEtat.puml"

# Vérifier la syntaxe
plantuml -checkonly "KYC DIAGRAMME D'ETAT/DiagrammeEtat.puml"
```

### Formats de Sortie
- **PNG** : Format par défaut, idéal pour intégration documentaire
- **SVG** : Format vectoriel pour une qualité optimale
- **PDF** : Format pour impression et archivage

## Maintenance et Évolution

### Bonnes Pratiques
1. **Cohérence des couleurs** : Respecter la charte des transitions
2. **Noms d'états** : Utiliser des noms métier explicites
3. **Documentation** : Inclure les conditions de transition
4. **Tests** : Vérifier la compilation après chaque modification

### Points d'Attention
- **Caractères spéciaux** : Éviter les accents et emojis dans le code PlantUML
- **États composites** : Bien définir les points d'entrée/sortie
- **Transitions concurrentes** : Gérer les états parallèles si nécessaire
- **États finaux** : S'assurer que tous les chemins mènent à `[*]`

## Intégration Système

### Mapping avec Base de Données
Chaque état correspond à un code en base :
- Table `STATUT_CLIENT` avec champs `code_statut` et `couleur_statut`
- Table `HISTORIQUE_STATUTS` pour la traçabilité
- Triggers pour automatiser les transitions

### API de Gestion des États
- `GET /client/{id}/statut` : Consultation du statut actuel
- `POST /client/{id}/transition` : Demande de changement d'état
- `GET /client/{id}/historique` : Historique des transitions

## Contact et Support
Pour toute question sur les diagrammes d'état KYC :
- Documentation technique UML
- Guide de modélisation des processus métier
- Manuel d'utilisation PlantUML
