# Template Standard pour Diagrammes de Classe PlantUML

## Vue d'ensemble
Ce template fournit une base standardisée pour créer des diagrammes de classe PlantUML avec un style minimaliste et sans couleurs.

## Caractéristiques du style

### Style Minimaliste
- **Pas de couleurs** : Fond blanc, bordures noires
- **Pas d'ombrage** : `shadowing false`
- **Coins droits** : `roundCorner 0`
- **Police simple** : Taille 12 pour les classes, 11 pour les attributs/méthodes

### Configuration des espacements
- **Séparation des nœuds** : 50 pixels
- **Séparation des rangs** : 40 pixels
- **Orientation** : De gauche à droite par défaut

## Structure du template

### 1. Configuration du style
```plantuml
skinparam linetype polyline
skinparam backgroundColor white
skinparam classBackgroundColor white
skinparam classBorderColor black
skinparam classFontColor black
skinparam shadowing false
skinparam roundCorner 0
```

### 2. Types de classes supportés
- **Classes abstraites** : `abstract class`
- **Classes concrètes** : `class`
- **Interfaces** : `interface`
- **Énumérations** : `enum`

### 3. Visibilité des membres
- **Public** : `+`
- **Privé** : `-`
- **Protégé** : `#`
- **Package** : `~`

### 4. Types de relations
- **Héritage** : `--|>`
- **Implémentation** : `..|>`
- **Association** : `--`
- **Composition** : `*--`
- **Agrégation** : `o--`
- **Dépendance** : `..>`

## Utilisation

### 1. Copier le template
```bash
cp TEMPLATE_STANDARD_CLASSE.puml MonNouveauDiagramme.puml
```

### 2. Personnaliser
- Remplacer le titre `@startuml TemplateStandardClasse`
- Supprimer les exemples
- Ajouter vos classes et relations

### 3. Générer le PNG
```bash
plantuml MonNouveauDiagramme.puml
```

## Exemple d'utilisation

```plantuml
@startuml MonDiagrammeMetier

' Utiliser la configuration du template
!include TEMPLATE_STANDARD_CLASSE.puml

' Vos classes métier
class Client {
  - id: String
  - nom: String
  + getNom(): String
}

class Commande {
  - numero: String
  - date: Date
  + traiter(): Boolean
}

Client "1" -- "0..*" Commande : passe

@enduml
```

## Bonnes pratiques

### Nommage
- Classes : PascalCase (`ClientParticulier`)
- Attributs : camelCase (`numeroCompte`)
- Méthodes : camelCase (`validerIdentite()`)

### Organisation
- Grouper les classes liées
- Utiliser les packages pour structurer
- Éviter les croisements de relations

### Lisibilité
- Limiter le nombre de classes par diagramme
- Utiliser des noms explicites
- Documenter les relations complexes

## Scripts d'automatisation

Voir le script `creer_nouveau_diagramme_classe.sh` pour automatiser la création de nouveaux diagrammes basés sur ce template.
