# Arborescence du projet Voronkely

## Objectif

Ce document décrit la structure du projet Voronkely pour préparer un empaquetage Windows de type Voronkely.exe, avec une installation simple sur un poste client non informaticien.

Les objectifs visés sont :
- démarrage normal de l’application,
- icône personnalisée,
- nom affiché : Voronkely,
- import d’images possible,
- base SQLite fonctionnelle après installation.

---

## 1. Arborescence générale du projet

```text
Voronkely/
├── pom.xml
├── mvnw
├── mvnw.cmd
├── README.md
├── routes.md
├── Slide-Voronkely.md
├── backup.txt
├── arborescence.md
├── data/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── voronkely/
│   │   │           ├── VoronkelyApplication.java
│   │   │           ├── config/
│   │   │           ├── controller/
│   │   │           ├── dto/
│   │   │           ├── entity/
│   │   │           ├── repository/
│   │   │           └── service/
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── sql/
│   │   │   │   ├── Data.sql
│   │   │   │   ├── Nettoyage.sql
│   │   │   │   ├── Syntaxe.sql
│   │   │   │   ├── Tables.sql
│   │   │   │   └── Views.sql
│   │   │   ├── static/
│   │   │   │   ├── bootstrap/
│   │   │   │   ├── images/
│   │   │   │   │   ├── galerie/
│   │   │   │   │   └── grade/
│   │   │   │   └── javascript/
│   │   │   └── com/
│   │   │       └── voronkely/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           └── views/
│   └── test/
│       └── java/
│           └── com/
│               └── voronkely/
├── target/
├── packaging/
│   └── windows/
│       ├── icon/
│       ├── launcher/
│       └── installer/
└── docs/
```

---

## 2. Rôle des dossiers principaux

### src/main/java
Contient la logique applicative Java du projet.
- VoronkelyApplication.java : point d’entrée Spring Boot.
- config : configuration de sécurité, base de données, filtres, etc.
- controller : gestion des routes web et des vues.
- dto : objets de transfert de données.
- entity : entités JPA / modèles métier.
- repository : accès aux données.
- service : logique métier.

### src/main/resources
Contient les ressources utilisées par l’application.
- application.properties : configuration de l’application.
- sql : scripts SQL de création de tables et vues.
- static : fichiers statiques HTML/CSS/JS/images.
- webapp/WEB-INF/views : vues JSP/HTML si utilisées.

### data
Dossier de données ou de stockage externe utile pour les fichiers d’importation, images et base locale.

### src/test/java
Tests unitaires et d’intégration.

### target
Résultats de compilation Maven, jar généré et fichiers temporaires.

---

## 3. Schéma logique de l’application

```text
Utilisateur
   ↓
Interface web / JSP / Bootstrap
   ↓
Controller
   ↓
Service
   ↓
Repository
   ↓
SQLite / base locale
   ↓
Stockage images et fichiers importés
```

---

## 4. Structure attendue pour l’empaquetage Windows

Pour produire un exécutable Windows simple, il faut prévoir une structure de déploiement propre :

```text
Voronkely-Portable/
├── Voronkely.exe
├── java-runtime/
├── voronkely.jar
├── app/
│   ├── config/
│   ├── data/
│   ├── uploads/
│   ├── images/
│   └── logs/
├── icon/
│   └── voronkely.ico
└── README-install.txt
```

### À prévoir pour l’installation client
- un exécutable avec nom Voronkely,
- une icône personnalisée,
- un lancement automatique de l’application,
- un dossier de données dédié au client,
- une base SQLite accessible localement,
- un accès aux images importées sans problème.

---

## 5. Points essentiels pour le projet Windows

### 5.1 Démarrage de l’application
L’application est une application Spring Boot web. Elle doit être lancée sous forme de jar ou via un wrapper Windows.

### 5.2 Icône
Une icône .ico doit être fournie pour l’application et l’installateur.

### 5.3 Nom de l’application
Le nom visible doit être : Voronkely.

### 5.4 Import d’images
Le dossier d’import et de stockage d’images doit être accessible en écriture sur le poste client.

### 5.5 Base SQLite
La base SQLite doit être stockée dans un emplacement stable, par exemple :
- C:\ProgramData\Voronkely\data\voronkely.db
ou
- C:\Users\<utilisateur>\AppData\Local\Voronkely\data\voronkely.db

Cela évite les problèmes de permissions et permet un fonctionnement fiable.

---

## 6. Plan de packaging conseillé

### Option recommandée
1. Construire le projet en jar avec Maven.
2. Ajouter un launcher Windows (ex. Launch4j ou Exe4j).
3. Emballer l’application avec une runtime Java 17 si nécessaire.
4. Ajouter l’icône Voronkely.
5. Configurer le chemin de la base SQLite et des images dans un dossier utilisateur.
6. Tester l’installation sur un poste Windows sans connaissance technique.

---

## 7. Résumé

Le projet est une application Java/Spring Boot avec :
- logique métier en Java,
- vues web et fichiers statiques,
- base SQLite,
- stockage d’images et fichiers importés,
- besoin d’un packaging Windows propre pour une installation client simple.

Cette structure sera la base pour transformer le projet en une application installable sous forme de Voronkely.exe.
