# Diagrammes d'Activité KYC

Cette section contient les diagrammes d'activité décrivant les processus Know Your Customer (KYC) de l'établissement bancaire.

## Structure des Diagrammes

### 1. Diagramme Global KYC
- **Fichier** : `GLOBALKYC/GlobalKYC.puml`
- **Description** : Processus complet de KYC depuis l'initiation jusqu'à l'activation du compte
- **Périmètre** : Toutes les grandes étapes du parcours client KYC
- **Acteurs** : Client, Pré-enregistrement, Collecte Documents, Contrôles KYC, Gestionnaire KYC, Validation Finale, Création Compte CBS, Signature Électronique, Attribution Statut, Audit et Archivage

### 2. Diagrammes Spécialisés par Étape

#### Pré-enregistrement
- **Fichier** : `DiagrammeActivitePreEnregistrement.puml`
- **Description** : Processus de pré-enregistrement client avec génération du NIU
- **Focus** : Saisie initiale, validation des données, création de session temporaire

#### Collecte de Documents
- **Fichier** : `DiagrammeActiviteCollecteDocuments.puml`
- **Description** : Processus de collecte et validation des documents KYC
- **Focus** : Upload, contrôles qualité, gestion des relances, calcul de complétude

#### Gestion Opérationnelle (Blocage/Déblocage)
- **Fichier** : `Diagramme Activite Blocage deblocage/DiagrammeActivitéBlocageDeblocage.puml`
- **Description** : Processus de gestion opérationnelle post-ouverture
- **Focus** : Blocage, déblocage, clôture, modification de profil

### 3. Diagramme Existant
- **Fichier** : `DiagrammeActivité.puml`
- **Description** : Diagramme d'activité principal existant
- **Fichier** : `Diagramme Activite Blocage deblocage/DiagrammeActivitéBlocageDeblo.puml`
- **Description** : Diagramme de blocage/déblocage existant

## Codes Couleur et Conventions

### Couleurs des Swimlanes
- **Client** : Bleu clair - Actions initiées par le client
- **Système** : Bleu standard - Traitements automatisés
- **Gestionnaire** : Bleu foncé - Interventions manuelles
- **Notification** : Gris - Communications externes

### Conventions UML
- **Losanges** : Points de décision avec conditions explicites
- **Rectangles** : Actions ou activités
- **Cercles pleins** : Points de début (start)
- **Cercles avec cercle** : Points de fin (stop)
- **Notes** : Informations complémentaires ou explicatives

## Relation avec les Autres Diagrammes

### Diagrammes de Classes
Les activités décrites ici utilisent les entités définies dans les diagrammes de classes :
- `Client`, `DossierKYC`, `Document`, `Controle`, `StatutClient`
- `ParametrageControle`, `ReglesMetier`, `NotificationKYC`

### Diagrammes de Séquence
Chaque grande étape d'activité peut être détaillée par des diagrammes de séquence spécifiques (UC001 à UC069).

### Use Cases
Les activités correspondent aux use cases fonctionnels définis dans le répertoire `KYC USES-CASES`.

## Instructions de Compilation

### Prérequis
- PlantUML installé
- Navigateur web ou viewer PlantUML pour visualiser les diagrammes

### Compilation
```bash
# Compiler tous les diagrammes d'activité
plantuml "KYC DIAGRAMME D'ACTIVITÉ/**/*.puml"

# Compiler un diagramme spécifique
plantuml "KYC DIAGRAMME D'ACTIVITÉ/GLOBALKYC/GlobalKYC.puml"

# Vérifier la syntaxe sans générer d'image
plantuml -checkonly "KYC DIAGRAMME D'ACTIVITÉ/GLOBALKYC/GlobalKYC.puml"
```

### Formats de Sortie
- **PNG** : Format par défaut pour intégration dans documents
- **SVG** : Format vectoriel pour qualité optimale
- **PDF** : Format pour impression et archivage

## Maintenance et Évolution

### Règles de Modification
1. **Cohérence** : Maintenir la cohérence avec les diagrammes de classes
2. **Traçabilité** : Documenter les changements dans les notes
3. **Validation** : Tester la compilation après chaque modification
4. **Versioning** : Archiver les versions précédentes si nécessaire

### Points d'Attention
- **Swimlanes** : Éviter les couleurs dans les définitions de partitions
- **Conditions** : Bien fermer toutes les structures if/else/endif
- **Boucles** : Utiliser repeat/repeat while pour les itérations
- **Parallélisme** : Utiliser fork/join pour les traitements parallèles

## Contact et Support
Pour toute question sur les diagrammes d'activité KYC, consulter :
- Documentation technique UML
- Référentiel des processus métier KYC
- Guide de modélisation PlantUML
