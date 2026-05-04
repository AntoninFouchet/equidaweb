# EquidaWeb - Système de Gestion des Ventes aux Enchères de Chevaux

## Description du projet
**EquidaWeb** est une application web développée en Java (Jakarta EE) permettant de gérer intégralement une société de ventes aux enchères de chevaux. L'application facilite la gestion des chevaux, de leur généalogie, de leur palmarès sportif, ainsi que l'organisation physique et digitale des ventes (lots, enchères, lieux, et acheteurs/vendeurs).

## Fonctionnalités Principales
*   **Gestion des Chevaux :** Ajout, modification, consultation détaillée (généalogie père/mère, SIRE, race, sexe).
*   **Gestion des Ventes :** Planification des ventes, affectation de catégories (Enchères, Vente Privée, Yearlings, Online) et de lieux.
*   **Gestion des Lots :** Affectation des chevaux à des lots avec prix de départ.
*   **Palmarès Sportif :** Historique des participations aux courses pour chaque cheval avec leurs résultats.

## Technologies Utilisées
*   **Back-end :** Java (Jakarta EE), Servlets
*   **Front-end :** JSP (JavaServer Pages), HTML5, CSS3, Bootstrap 3.3.7
*   **Base de données :** MariaDB 
*   **Serveur d'application :** Apache Tomcat (v10+)

## Architecture
Le projet respecte l'architecture **MVC (Modèle-Vue-Contrôleur)** :
*   **Modèles (`model.*`) :** Classes métiers (Cheval, Vente, Client, Race, etc.).
*   **Vues (`/WEB-INF/views/*`) :** Fichiers `.jsp` pour l'interface utilisateur. Sécurisées dans `WEB-INF` pour empêcher l'accès direct.
*   **Contrôleurs (`servlet.*`) :** Servlets Java qui interceptent les requêtes HTTP (`doGet`, `doPost`), manipulent les données via les DAO, et renvoient vers les bonnes vues.
*   **DAO (`database.Dao*`) :** Classes contenant les requêtes SQL pour faire le pont entre l'application et la base de données.

## Installation et Déploiement

### Prérequis
*   JDK 11 ou supérieur
*   Apache Tomcat (compatible Jakarta EE)
*   MariaDB

## Structure de la base de données
La base de données est fortement relationnelle et intègre une quinzaine de tables pour couvrir tout le domaine métier, notamment :
*   Héritage des clients : Une table `client` liée aux tables `acheteur` et `vendeur`.
*   Autoréférencement : La table `cheval` contient des clés étrangères vers elle-même pour gérer le `pere_id` et la `mere_id`.
*   Jointures complexes : Gestion des lots (`vente_id`, `cheval_id`) et des participations aux courses (`cheval_id`, `course_id`).

Antonin Fouchet
