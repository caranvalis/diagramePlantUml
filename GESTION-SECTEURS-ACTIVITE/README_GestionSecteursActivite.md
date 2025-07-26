# Package GESTION-SECTEURS-ACTIVITE

## Vue d'ensemble

Ce package couvre la gestion complète des secteurs d'activité et leur impact sur les statuts clients dans le système KYC :

### 📋 **Cas d'Usage Principaux**

#### 1. **Gestion des Secteurs d'Activité**
- UC01: Créer nouveau secteur d'activité
- UC02: Modifier paramètres secteur existant
- UC03: Désactiver/Archiver secteur obsolète
- UC04: Consulter hiérarchie des secteurs

#### 2. **Classification des Clients**
- UC05: Attribuer secteur d'activité à client
- UC06: Reclasser client selon évolution activité
- UC07: Valider cohérence secteur/activité déclarée
- UC08: Détecter incohérences sectorielles

#### 3. **Gestion des Risques Sectoriels**
- UC09: Définir profils de risque par secteur
- UC10: Appliquer restrictions sectorielles
- UC11: Surveiller secteurs à risque élevé
- UC12: Générer alertes sectorielles

#### 4. **Statuts Dérivés des Secteurs**
- UC13: Calculer statut client selon secteur
- UC14: Appliquer règles prudentielles
- UC15: Gérer exceptions sectorielles
- UC16: Audit et reporting sectoriel

### 🏭 **Taxonomie des Secteurs**

#### **Secteurs à Risque Standard**
- **AGRICULTURE** : Production agricole, élevage
- **INDUSTRIE** : Manufacturing, transformation
- **COMMERCE** : Vente détail/gros, distribution
- **SERVICES** : Services aux entreprises/particuliers
- **TRANSPORT** : Logistique, transport personnes/marchandises

#### **Secteurs à Risque Élevé**
- **FINANCE** : Banques, assurances, investissement
- **IMMOBILIER** : Promotion, transaction, gestion
- **ENERGIE** : Pétrole, gaz, mines, énergies
- **TELECOMS** : Télécommunications, média
- **SANTE** : Pharmaceutique, équipements médicaux

#### **Secteurs Sensibles/Réglementés**
- **ARMEMENT** : Défense, sécurité, armes
- **CASINO_JEUX** : Jeux d'argent, paris, casinos
- **TABAC_ALCOOL** : Production, distribution
- **CRYPTO** : Cryptomonnaies, blockchain
- **POLITIQUE** : ONG, fondations, partis politiques

### ⚠️ **Niveaux de Risque Sectoriel**

#### **Risque Minimal (Vert)**
- Secteurs traditionnels stables
- Réglementation claire
- Transparence élevée
- Contrôles standards

#### **Risque Modéré (Orange)**
- Secteurs en évolution
- Réglementation émergente
- Surveillance renforcée
- Due diligence approfondie

#### **Risque Élevé (Rouge)**
- Secteurs sensibles
- Réglementation stricte
- Surveillance continue
- Validations multiples

### 🎯 **Impacts sur les Statuts Client**

#### **Restrictions Sectorielles**
- **ARMEMENT** : Validation DG obligatoire
- **CASINO_JEUX** : Limites de montants
- **CRYPTO** : Surveillance transactions
- **POLITIQUE** : Due diligence renforcée

#### **Obligations Réglementaires**
- **FINANCE** : Reporting spécialisé
- **IMMOBILIER** : Vérification sources fonds
- **ENERGIE** : Contrôles géopolitiques
- **SANTE** : Conformité sanitaire

### 📊 **Matrices de Décision**

#### **Secteur × Profil Client**
| Secteur | Particulier | PME | Grande Entreprise |
|---------|-------------|-----|-------------------|
| Standard | Vert | Vert | Orange |
| Sensible | Orange | Rouge | Rouge |
| Interdit | Rouge | Rouge | Rouge |

#### **Secteur × Montants**
- **< 100K** : Contrôles allégés
- **100K - 1M** : Validation renforcée
- **> 1M** : Due diligence complète

---

## 📁 Contenu du Package

### Diagrammes Inclus
- **UC_Global_GestionSecteurs.puml** - Vue d'ensemble des cas d'usage
- **UC_Detail_SecteursActivite.puml** - Cas d'usage détaillés
- **Activite_ClasserClient.puml** - Processus de classification client
- **Activite_EvaluerRisque.puml** - Évaluation risque sectoriel
- **Sequence_ValidationSectorielle.puml** - Validation par secteur
- **Sequence_AlerteSectorielle.puml** - Gestion des alertes
- **Classe_GestionSecteurs.puml** - Modèle de classes
- **Matrice_RisquesSectoriels.puml** - Matrice des risques
