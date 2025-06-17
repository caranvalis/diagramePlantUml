# Documentation - Ajout des Couloirs (Swimlanes) aux Diagrammes d'Activité

## ✅ ÉTAT FINAL (Version Simplifiée)

Tous les diagrammes d'activité ont été modifiés pour inclure des couloirs (swimlanes) **avec un fond uniforme et sans couleurs**.

### 📊 Résumé Final
- **Fichiers traités** : 9/9 diagrammes d'activité
- **Couloirs ajoutés** : ✅ Tous les diagrammes
- **PNG générés** : ✅ Tous les fichiers
- **Style** : Couloirs sans couleurs de fond (fond uniforme)

### 📋 Détail par Diagramme
1. **01_ProcessusGlobalOuvertureCompte.puml** : 20 couloirs (Client, Agent Commercial, Système, Agent Compliance, etc.)
2. **02_TransfertDossier.puml** : 14 couloirs (Agent Origine, Système, Responsable, Client, Agent Destination)
3. **03_DelegationDirectionGenerale.puml** : 3 couloirs (Agent Responsable, Système, Service Préparation)
4. **04_GestionAbsences.puml** : 16 couloirs (Agent Titulaire, Système, Responsable, Agent Remplaçant, Client)
5. **05_ProcessusReporting.puml** : 2 couloirs (Système, Service Analyse)
6. **06_GestionDocuments.puml** : 2 couloirs (Système, Service Contrôle)
7. **07_IntegrationsExternes.puml** : 2 couloirs (Système, Service Contrôle)
8. **08_GestionExceptions.puml** : 2 couloirs (Système, Service Analyse)
9. **09_ClotureDossier.puml** : 2 couloirs (Système, Service Communication)

## 🔧 Scripts Créés

### 1. `supprimer_couleurs_couloirs.sh`
Script pour enlever les couleurs de fond des couloirs tout en gardant leur structure :
```bash
# Remplace |#CODE_COULEUR|NOM| par |NOM|
sed -i '' 's/|#[A-F0-9]*|/|/g' "$file"
```

### 2. `ajouter_couloirs_basiques.sh`
Script pour ajouter des couloirs basiques aux diagrammes qui n'en avaient pas.

### 3. `verification_finale_couloirs.sh`
Script de vérification finale comptant les couloirs et les PNG générés.

## 🎨 Style des Couloirs
- **Fond** : Uniforme (pas de couleurs de fond spécifiques)
- **Séparateurs** : Lignes verticales entre les couloirs
- **Clarté** : Amélioration de la lisibilité sans distraction visuelle

## ✅ Avantages de cette Approche
1. **Lisibilité** : Couloirs visibles sans couleurs distrayantes
2. **Consistance** : Style uniforme sur tous les diagrammes
3. **Responsabilités** : Séparation claire des rôles et acteurs
4. **Maintenance** : Plus facile à modifier et maintenir

## 📝 Syntaxe PlantUML des Couloirs
```plantuml
|Acteur/Service|
:Activité dans ce couloir;

|Autre Acteur|
:Activité dans l'autre couloir;
```

---
**Mise à jour** : 16 juin 2025 - Couloirs simplifiés ajoutés à tous les diagrammes d'activité
