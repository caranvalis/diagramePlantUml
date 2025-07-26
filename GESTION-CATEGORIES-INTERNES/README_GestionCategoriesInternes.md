# Package GESTION-CATEGORIES-INTERNES

## Vue d'ensemble

Ce package couvre la gestion complète des catégories internes de clients dans le système KYC, permettant une segmentation fine pour l'application de politiques différenciées :

### 📋 **Cas d'Usage Principaux**

#### 1. **Gestion du Référentiel Catégories**
- UC01: Créer nouvelle catégorie interne
- UC02: Modifier paramètres catégorie existante
- UC03: Désactiver/Archiver catégorie obsolète
- UC04: Hiérarchiser catégories et sous-catégories

#### 2. **Classification des Clients**
- UC05: Attribuer catégorie initiale à client
- UC06: Reclasser client selon évolution
- UC07: Calculer catégorie automatique selon règles
- UC08: Valider changement de catégorie

#### 3. **Politiques Différenciées**
- UC09: Définir politiques par catégorie
- UC10: Appliquer tarifications spécifiques
- UC11: Configurer services autorisés
- UC12: Gérer limites et plafonds

#### 4. **Surveillance et Contrôle**
- UC13: Surveiller répartition par catégorie
- UC14: Analyser migration entre catégories
- UC15: Détecter anomalies de classification
- UC16: Générer reporting catégoriel

### 🏷️ **Taxonomie des Catégories Internes**

#### **Catégories par Taille (Chiffre d'Affaires)**
- **PARTICULIER** : Personnes physiques
- **MICRO_ENTREPRISE** : CA < 100K€
- **PETITE_ENTREPRISE** : CA 100K€ - 1M€
- **MOYENNE_ENTREPRISE** : CA 1M€ - 10M€
- **GRANDE_ENTREPRISE** : CA > 10M€

#### **Catégories par Segment Métier**
- **RETAIL** : Clients particuliers et professionnels
- **CORPORATE** : Grandes entreprises et groupes
- **PREMIUM** : Clients à fort potentiel
- **PRIVATE** : Gestion de fortune
- **INSTITUTIONNEL** : Organismes publics/collectivités

#### **Catégories par Profil de Risque**
- **STANDARD** : Profil risque normal
- **SURVEILLE** : Surveillance renforcée
- **SENSIBLE** : Profil délicat nécessitant précautions
- **VIP** : Clients stratégiques à protéger
- **RESTREINT** : Accès limité aux services

#### **Catégories par Origine/Canal**
- **AGENCE** : Clients acquis en agence
- **DIGITAL** : Clients 100% digitaux
- **PARTENAIRE** : Via partenariats commerciaux
- **RECOMMANDATION** : Cooptation/recommandation
- **PROSPECTION** : Acquisition commerciale active

### 🎯 **Impacts des Catégories**

#### **Tarification Différenciée**
- **PREMIUM/VIP** : Tarifs préférentiels
- **STANDARD** : Grille tarifaire normale
- **MICRO** : Tarifs adaptés aux petites structures
- **RESTREINT** : Tarification majorée

#### **Services Autorisés**
- **CORPORATE** : Tous services y compris trade finance
- **RETAIL** : Services standards particuliers/pro
- **DIGITAL** : Services dématérialisés uniquement
- **RESTREINT** : Services basiques seulement

#### **Limites et Plafonds**
- **GRANDE_ENTREPRISE** : Pas de limites
- **MOYENNE_ENTREPRISE** : Plafonds élevés
- **PETITE_ENTREPRISE** : Plafonds moyens
- **MICRO** : Plafonds bas adaptés

#### **Niveau de Service**
- **VIP/PREMIUM** : Gestionnaire dédié, priorité
- **CORPORATE** : Équipe spécialisée
- **STANDARD** : Service normal
- **DIGITAL** : Libre-service avec support

### 🔄 **Règles de Classification**

#### **Critères Automatiques**
- **Chiffre d'affaires** : Classification par seuils
- **Type de structure** : PP/PM/Organisme
- **Canal d'acquisition** : Origine du client
- **Historique** : Ancienneté et comportement

#### **Critères Manuels**
- **Potentiel commercial** : Évaluation gestionnaire
- **Relation stratégique** : Importance pour la banque
- **Complexité** : Besoins spécialisés
- **Risque particulier** : Circonstances spéciales

### 📊 **Politiques par Catégorie**

#### **Politique Commerciale**
- Objectifs de développement
- Stratégies d'approche
- Produits à proposer en priorité
- Conditions tarifaires

#### **Politique de Risque**
- Niveaux d'exposition acceptés
- Garanties requises
- Fréquence de révision
- Seuils d'alerte

#### **Politique Opérationnelle**
- Processus de traitement
- Délais de réponse
- Niveau de validation requis
- Reporting spécialisé

---

## 📁 Contenu du Package

### Diagrammes Inclus
- **UC_Global_GestionCategories.puml** - Vue d'ensemble des cas d'usage
- **UC_Detail_CategoriesInternes.puml** - Cas d'usage détaillés
- **Activite_ClasserClient.puml** - Processus de classification client
- **Activite_AppliquerPolitiques.puml** - Application des politiques
- **Sequence_ValidationCategorie.puml** - Validation des changements
- **Sequence_MigrationCategorie.puml** - Migration entre catégories
- **Classe_GestionCategories.puml** - Modèle de classes
- **Matrice_PolitiquesCategories.puml** - Matrice des politiques
