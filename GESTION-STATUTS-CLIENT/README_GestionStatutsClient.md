# Package GESTION-STATUTS-CLIENT

## Vue d'ensemble

Ce package couvre la gestion complète des statuts des clients dans le système KYC :

### 📋 **Cas d'Usage Principaux**

#### 1. **Définition des Statuts**
- UC01: Créer nouveau statut client
- UC02: Modifier paramètres statut existant
- UC03: Désactiver/Archiver statut obsolète
- UC04: Consulter historique des statuts

#### 2. **Attribution des Statuts**
- UC05: Attribuer statut initial à nouveau client
- UC06: Modifier statut client existant
- UC07: Calculer statut automatique selon règles
- UC08: Valider changement de statut

#### 3. **Gestion des Transitions**
- UC09: Définir règles de transition entre statuts
- UC10: Valider transition autorisée
- UC11: Tracer historique des changements
- UC12: Notifier changements de statut

#### 4. **Contrôles et Restrictions**
- UC13: Appliquer restrictions par statut
- UC14: Contrôler accès aux services selon statut
- UC15: Gérer exceptions et dérogations
- UC16: Audit et reporting des statuts

### 🏷️ **Types de Statuts Client**

#### **Statuts de Base**
- **PROSPECT** : Client potentiel en phase de prospection
- **ACTIF** : Client avec compte ouvert et actif
- **INACTIF** : Client sans mouvement depuis X mois
- **SUSPENDU** : Client temporairement suspendu
- **CLOTURE** : Client avec comptes fermés

#### **Statuts de Conformité**
- **CONFORME** : KYC complet et à jour
- **NON_CONFORME** : Manque documents ou contrôles
- **EN_ATTENTE** : En cours de régularisation
- **PPE** : Personne Politiquement Exposée
- **SANCTIONS** : Soumis à sanctions internationales

#### **Statuts de Risque**
- **FAIBLE** : Profil de risque minimal
- **MOYEN** : Risque standard avec surveillance normale
- **ELEVE** : Risque élevé nécessitant vigilance renforcée
- **CRITIQUE** : Risque maximal avec restrictions sévères

### 🔄 **Règles de Transition**

#### **Transitions Automatiques**
- PROSPECT → ACTIF (ouverture compte)
- ACTIF → INACTIF (inactivité > 12 mois)
- CONFORME → NON_CONFORME (expiration documents)

#### **Transitions Manuelles**
- Changements de statut de risque (validation hiérarchique)
- Suspension/Réactivation (décision DA/Conformité)
- Classification PPE (validation Conformité)

### 🎯 **Impacts des Statuts**

#### **Services Autorisés**
- ACTIF + CONFORME : Tous services
- INACTIF : Services limités
- SUSPENDU : Consultation uniquement
- NON_CONFORME : Blocage opérations

#### **Surveillance**
- FAIBLE : Contrôles standard
- MOYEN : Vérifications périodiques
- ELEVE : Surveillance renforcée
- PPE : Procédures spéciales

### 📊 **Métriques et Reporting**

#### **Indicateurs Clés**
- Répartition clients par statut
- Taux de conformité par segment
- Durée moyenne de régularisation
- Évolution des profils de risque

#### **Alertes Automatiques**
- Expiration prochaine de documents
- Dépassement seuils d'inactivité
- Changements de statut critique
- Anomalies dans les transitions

---

## 📁 Contenu du Package

### Diagrammes Inclus
- **UC_Global_GestionStatuts.puml** - Vue d'ensemble des cas d'usage
- **UC_Detail_StatutsClient.puml** - Cas d'usage détaillés
- **Activite_DefinirStatut.puml** - Processus de définition des statuts
- **Activite_ChangerStatut.puml** - Workflow de changement de statut
- **Sequence_ValidationStatut.puml** - Séquence de validation
- **Sequence_NotificationStatut.puml** - Notifications des changements
- **Classe_GestionStatuts.puml** - Modèle de classes
- **Etat_CycleVieClient.puml** - Diagramme d'états du client
