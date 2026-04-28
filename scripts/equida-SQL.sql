-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mar. 28 avr. 2026 à 12:39
-- Version du serveur : 11.3.2-MariaDB
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `equida`
--

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

DROP TABLE IF EXISTS `acheteur`;
CREATE TABLE IF NOT EXISTS `acheteur` (
  `client_id` int(11) NOT NULL,
  `formation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acheteur`
--

INSERT INTO `acheteur` (`client_id`, `formation`) VALUES
(1, 'Enchères débutant'),
(2, 'Collectionneur confirmé'),
(3, 'Enchères débutant'),
(4, 'Expert en art'),
(5, 'Collectionneur confirmé'),
(103, 'Expertise en Pur-sang'),
(104, 'Enchères en ligne'),
(105, 'Acheteur international'),
(202, 'Amateur passionné'),
(203, 'Investisseur international'),
(204, 'Spécialiste Pur-sang');

-- --------------------------------------------------------

--
-- Structure de la table `categvente`
--

DROP TABLE IF EXISTS `categvente`;
CREATE TABLE IF NOT EXISTS `categvente` (
  `code` varchar(50) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categvente`
--

INSERT INTO `categvente` (`code`, `libelle`) VALUES
('COUR', 'Vente courante'),
('ENCH', 'Vente aux enchères'),
('ONLI', 'Vente en ligne'),
('PRIV', 'Vente privée');

-- --------------------------------------------------------

--
-- Structure de la table `cheval`
--

DROP TABLE IF EXISTS `cheval`;
CREATE TABLE IF NOT EXISTS `cheval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `sexe` enum('M','F','G') DEFAULT 'M',
  `sire` varchar(50) DEFAULT NULL,
  `pere_id` int(11) DEFAULT NULL,
  `mere_id` int(11) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `race_id` int(11) NOT NULL,
  `vendeur_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cheval_pere` (`pere_id`),
  KEY `idx_cheval_mere` (`mere_id`),
  KEY `idx_cheval_race` (`race_id`),
  KEY `idx_cheval_vendeur` (`vendeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `sire`, `pere_id`, `mere_id`, `dateNaissance`, `race_id`, `vendeur_id`) VALUES
(5, 'Eclair', 'M', '1111.222.333A', NULL, 9, '2020-04-15', 1, 1),
(6, 'Perle', 'F', '4444.555.666B', NULL, 9, '2019-06-22', 2, 2),
(7, 'Tonnerre', 'M', '7777.888.999C', 5, 6, '2021-05-10', 1, 3),
(8, 'Luna', 'F', '0000.111.222D', 5, 6, '2022-07-03', 3, 4),
(9, 'Bella', 'F', '3333.444.555E', NULL, NULL, '2018-03-12', 4, 5),
(100, 'Ouragan', 'M', '1000.200.300A', NULL, NULL, '2018-05-12', 1, 100),
(101, 'Tempête', 'F', '2000.300.400B', NULL, NULL, '2019-04-20', 2, 101),
(102, 'Foudre', 'G', '3000.400.500C', NULL, NULL, '2017-08-11', 1, 100),
(103, 'Diamant', 'M', '4000.500.600D', 100, 101, '2022-03-01', 1, 101),
(104, 'Saphir', 'M', '5000.600.700E', NULL, NULL, '2020-02-14', 3, 100),
(105, 'Rubis', 'F', '6000.700.800F', 104, NULL, '2023-01-10', 3, 101),
(106, 'Tornade', 'F', '7000.800.900G', NULL, NULL, '2021-06-30', 2, 100),
(107, 'Pégase', 'M', '8000.900.000H', 100, 106, '2024-01-05', 1, 101),
(108, 'Etoile', 'F', '9000.000.100I', NULL, NULL, '2019-11-22', 4, 100),
(109, 'Champion', 'M', '1111.999.888J', NULL, 108, '2022-05-18', 4, 101),
(200, 'Vulcain', 'M', '2222.111.000A', NULL, NULL, '2019-02-15', 1, 200),
(201, 'Athena', 'F', '2222.111.001B', NULL, NULL, '2020-03-22', 2, 201),
(202, 'Apollon', 'M', '2222.111.002C', 200, 201, '2023-04-10', 1, 200),
(203, 'Hera', 'F', '2222.111.003D', NULL, NULL, '2018-09-05', 3, 201),
(204, 'Zeus', 'M', '2222.111.004E', NULL, 203, '2022-07-14', 3, 200),
(205, 'Hermes', 'G', '2222.111.005F', NULL, NULL, '2017-11-30', 1, 201),
(206, 'Iris', 'F', '2222.111.006G', 200, NULL, '2021-01-25', 4, 200),
(207, 'Orion', 'M', '2222.111.007H', NULL, NULL, '2020-08-19', 4, 201),
(208, 'Venus', 'F', '2222.111.008I', 207, 206, '2024-02-10', 4, 200),
(209, 'Titan', 'M', '2222.111.009J', 200, 201, '2024-03-01', 1, 201);

-- --------------------------------------------------------

--
-- Structure de la table `cheval_course`
--

DROP TABLE IF EXISTS `cheval_course`;
CREATE TABLE IF NOT EXISTS `cheval_course` (
  `cheval_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `resultat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cheval_id`,`course_id`),
  KEY `idx_cc_course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheval_course`
--

INSERT INTO `cheval_course` (`cheval_id`, `course_id`, `resultat`) VALUES
(5, 1, '2'),
(5, 3, '1'),
(6, 1, '4'),
(6, 4, '2'),
(7, 1, '1'),
(7, 3, '2'),
(8, 2, '3'),
(8, 4, '1'),
(9, 2, '1'),
(100, 100, '5'),
(100, 101, '2'),
(101, 104, '1'),
(102, 102, '3'),
(104, 103, '1'),
(106, 105, '4'),
(200, 200, '1'),
(200, 201, '3'),
(201, 202, '2'),
(203, 203, '5'),
(205, 200, '2'),
(205, 204, '4'),
(207, 201, '1');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(20) DEFAULT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(150) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `copos` varchar(20) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `adresseMessagerie` varchar(255) DEFAULT NULL,
  `pays_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_client_pays` (`pays_code`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `titre`, `nom`, `prenom`, `rue`, `copos`, `ville`, `adresseMessagerie`, `pays_code`) VALUES
(1, 'M.', 'Dupont', 'Jean', '12 rue des Lilas', '75001', 'Paris', 'jean.dupont@example.com', 'FR'),
(2, 'Mme', 'Martin', 'Sophie', '5 avenue de la République', '69002', 'Lyon', 'sophie.martin@example.com', 'FR'),
(3, 'M.', 'Durand', 'Pierre', '20 boulevard Saint-Michel', '31000', 'Toulouse', 'pierre.durand@example.com', 'FR'),
(4, 'Mme', 'Bernard', 'Claire', '8 rue Victor Hugo', '13001', 'Marseille', 'claire.bernard@example.com', 'FR'),
(5, 'M.', 'Petit', 'Louis', '15 rue de la Paix', '67000', 'Strasbourg', 'louis.petit@example.com', 'FR'),
(100, 'M.', 'Lefebvre', 'Antoine', '12 rue du Haras', '60500', 'Chantilly', 'antoine.l@email.fr', 'FR'),
(101, 'Mme', 'Roux', 'Emilie', '4 avenue des Chevaux', '14800', 'Deauville', 'eroux@email.fr', 'FR'),
(102, 'M.', 'Moreau', 'Lucas', '7 chemin vert', '77300', 'Fontainebleau', 'lucas.moreau@email.fr', 'FR'),
(103, 'Mme', 'Dubois', 'Alice', '89 rue royale', '75008', 'Paris', 'alice.d@email.fr', 'FR'),
(104, 'M.', 'Garnier', 'Paul', '1 place de la gare', '69001', 'Lyon', 'paul.g@email.fr', 'FR'),
(105, 'M.', 'Peeters', 'Marc', '10 avenue Louise', '1000', 'Bruxelles', 'marc.p@email.be', 'BE'),
(200, 'M.', 'Boucher', 'Hugo', '55 route des haras', '50000', 'Saint-Lô', 'hugo.boucher@email.fr', 'FR'),
(201, 'Mme', 'Simon', 'Chloé', '12 place du marché', '49400', 'Saumur', 'csimon@email.fr', 'FR'),
(202, 'M.', 'Michel', 'Thomas', '9 rue de la paix', '65000', 'Tarbes', 'thomas.m@email.fr', 'FR'),
(203, 'Mme', 'Garcia', 'Inès', 'Calle Mayor 12', '28001', 'Madrid', 'ines.g@email.es', 'ES'),
(204, 'M.', 'Rossi', 'Marco', 'Via Roma 45', '00100', 'Rome', 'marco.rossi@email.it', 'IT');

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

DROP TABLE IF EXISTS `courriel`;
CREATE TABLE IF NOT EXISTS `courriel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `objet` varchar(255) DEFAULT NULL,
  `corps` text DEFAULT NULL,
  `vente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_courriel_vente` (`vente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`id`, `date`, `objet`, `corps`, `vente_id`) VALUES
(1, '2025-03-01 00:00:00', 'Grande Vente Printemps - Invitation', 'Cher client, nous vous invitons...', 5),
(2, '2025-06-01 00:00:00', 'Vente Prestige - Réservation', 'Ne manquez pas notre Vente Prestige...', 6),
(3, '2025-07-01 00:00:00', 'Enchères d’Été', 'Participez aux Enchères d’Été...', 7),
(4, '2025-09-10 00:00:00', 'Vente en Ligne Automne', 'La Vente en Ligne Automne commence...', 8);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `nom`, `lieu`, `date`) VALUES
(1, 'Grand Prix de Paris', 'Paris', '2023-06-15'),
(2, 'Coupe de Normandie', 'Deauville', '2023-07-20'),
(3, 'Trophée du Midi', 'Toulouse', '2023-09-05'),
(4, 'Challenge National', 'Lyon', '2023-10-10'),
(100, 'Prix de l\'Arc de Triomphe', 'ParisLongchamp', '2023-10-01'),
(101, 'Prix de Diane', 'Chantilly', '2023-06-18'),
(102, 'Grand Steeple-Chase', 'Auteuil', '2023-05-21'),
(103, 'Critérium des 3 ans', 'Vincennes', '2023-12-10'),
(104, 'Derby de l\'Ouest', 'Nantes', '2023-07-14'),
(105, 'Prix du Haras', 'Deauville', '2024-08-15'),
(200, 'Prix d\'Amérique', 'Paris-Vincennes', '2024-01-28'),
(201, 'Grand Prix de Saint-Cloud', 'Saint-Cloud', '2024-06-30'),
(202, 'Poule d\'Essai des Poulains', 'ParisLongchamp', '2024-05-12'),
(203, 'Prix Jacques Le Marois', 'Deauville', '2024-08-11'),
(204, 'Prix Morny', 'Deauville', '2024-08-18');

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

DROP TABLE IF EXISTS `enchere`;
CREATE TABLE IF NOT EXISTS `enchere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `montant` decimal(12,2) NOT NULL,
  `acheteur_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enchere_acheteur` (`acheteur_id`),
  KEY `idx_enchere_lot` (`lot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enchere`
--

INSERT INTO `enchere` (`id`, `numero`, `montant`, `acheteur_id`, `lot_id`) VALUES
(5, 1, 5000.00, 1, 11),
(6, 2, 3500.00, 2, 12),
(7, 1, 7000.00, 3, 13),
(8, 2, 4500.00, 4, 14),
(9, 1, 6000.00, 5, 15);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville` varchar(255) DEFAULT NULL,
  `nbBoxes` int(11) DEFAULT 0,
  `commentaires` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaires`) VALUES
(1, 'Paris', 120, 'Grand centre équestre'),
(2, 'Lyon', 80, 'Infrastructure moderne'),
(3, 'Bordeaux', 60, 'Cadre agréable proche du centre'),
(4, 'Toulouse', 100, 'Parc équestre en périphérie'),
(100, 'Chantilly', 250, 'Capitale du cheval, grand hippodrome'),
(101, 'Deauville', 150, 'Proche mer, idéal ventes de yearlings'),
(102, 'Fontainebleau', 100, 'Cadre forestier, grand espace d\'entraînement'),
(103, 'Pau', 80, 'Spécialisé dans les courses d\'obstacles'),
(104, 'Maisons-Laffitte', 200, 'Cité du cheval, grand centre d\'entraînement'),
(200, 'Saint-Lô', 180, 'Pôle hippique prestigieux, Normandie'),
(201, 'Saumur', 120, 'Cadre Noir, grande tradition équestre'),
(202, 'Tarbes', 90, 'Spécialisé dans les races anglo-arabes'),
(203, 'Pompadour', 140, 'Haras national, magnifique domaine'),
(204, 'Le Pin-au-Haras', 220, 'Le \"Versailles du cheval\"');

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prixDepart` decimal(12,2) NOT NULL DEFAULT 0.00,
  `vente_id` int(11) NOT NULL,
  `cheval_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lot_vente` (`vente_id`),
  KEY `fk_lot_cheval` (`cheval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `vente_id`, `cheval_id`) VALUES
(11, 5000.00, 5, 5),
(12, 3500.00, 5, 6),
(13, 7000.00, 6, 7),
(14, 4500.00, 7, 8),
(15, 6000.00, 8, 9),
(100, 15000.00, 100, 103),
(101, 8000.00, 100, 105),
(102, 25000.00, 102, 107),
(103, 12000.00, 101, 100),
(104, 9500.00, 101, 101),
(105, 5000.00, 104, 102),
(106, 18000.00, 103, 104),
(107, 7000.00, 103, 106),
(108, 3000.00, 104, 108),
(109, 4500.00, 104, 109),
(200, 18500.00, 200, 200),
(201, 22000.00, 200, 201),
(202, 12000.00, 201, 202),
(203, 9000.00, 203, 203),
(204, 15000.00, 203, 204),
(205, 7500.00, 202, 205),
(206, 4000.00, 204, 206),
(207, 5500.00, 204, 207),
(208, 3500.00, 204, 208),
(209, 28000.00, 201, 209);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `code` varchar(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`code`, `nom`) VALUES
('BE', 'Belgique'),
('CH', 'Suisse'),
('ES', 'Espagne'),
('FR', 'France'),
('IT', 'Italie');

-- --------------------------------------------------------

--
-- Structure de la table `piecejointe`
--

DROP TABLE IF EXISTS `piecejointe`;
CREATE TABLE IF NOT EXISTS `piecejointe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chemin` varchar(1024) NOT NULL,
  `description` text DEFAULT NULL,
  `courriel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_piecejointe_courriel` (`courriel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `piecejointe`
--

INSERT INTO `piecejointe` (`id`, `chemin`, `description`, `courriel_id`) VALUES
(1, '/docs/grande_vente_printemps.pdf', 'Catalogue de la Grande Vente Printemps', 1),
(2, '/docs/vente_prestige_invitation.pdf', 'Invitation à la Vente Prestige', 2),
(3, '/docs/encheres_ete_lots.pdf', 'Liste des lots pour les Enchères d’Été', 3),
(4, '/docs/vente_en_ligne_automne.pdf', 'Catalogue de la Vente en Ligne Automne', 4),
(5, '/images/photo_lot1.jpg', 'Photo du lot 1', 3),
(6, '/images/photo_lot2.jpg', 'Photo du lot 2', 1);

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

DROP TABLE IF EXISTS `race`;
CREATE TABLE IF NOT EXISTS `race` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`id`, `libelle`, `description`) VALUES
(1, 'Pur-sang', 'Cheval de course rapide'),
(2, 'Arabe', 'Race très ancienne, endurante'),
(3, 'Frison', 'Cheval élégant, souvent noir'),
(4, 'Shetland', 'Petit poney robuste');

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

DROP TABLE IF EXISTS `vendeur`;
CREATE TABLE IF NOT EXISTS `vendeur` (
  `client_id` int(11) NOT NULL,
  `ca` decimal(14,2) DEFAULT 0.00,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`client_id`, `ca`) VALUES
(1, 12000.50),
(2, 8500.75),
(3, 15700.00),
(4, 6400.25),
(5, 23000.00),
(100, 45000.00),
(101, 125000.00),
(102, 0.00),
(200, 89000.00),
(201, 215000.00);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `dateDebutVente` date DEFAULT NULL,
  `categvente_code` varchar(50) DEFAULT NULL,
  `lieu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vente_categ` (`categvente_code`),
  KEY `idx_vente_lieu` (`lieu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebutVente`, `categvente_code`, `lieu_id`) VALUES
(5, 'Grande Vente Printemps', '2025-03-15', 'ENCH', 1),
(6, 'Vente Prestige', '2025-06-10', 'PRIV', 2),
(7, 'Enchères d’Été', '2025-07-05', 'ENCH', 3),
(8, 'Vente en Ligne Automne', '2025-09-20', 'ONLI', 4),
(100, 'Vente des Yearlings de Deauville', '2024-08-20', 'ENCH', 101),
(101, 'Grande Vente d\'Hiver', '2023-12-15', 'COUR', 100),
(102, 'Vente Privée Elite', '2026-05-10', 'PRIV', 102),
(103, 'Enchères Flash en Ligne', '2026-06-01', 'ONLI', 104),
(104, 'Vente d\'Automne', '2025-10-15', 'COUR', 103),
(200, 'Vente de Printemps de Saumur', '2025-04-10', 'ENCH', 201),
(201, 'Sélection Elite Pompadour', '2025-07-22', 'PRIV', 203),
(202, 'Enchères Numériques Internationales', '2025-11-05', 'ONLI', 200),
(203, 'Vente Mixte d\'Automne', '2025-10-30', 'COUR', 204),
(204, 'Vente de Yearlings Anglo-Arabes', '2025-09-12', 'ENCH', 202);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acheteur`
--
ALTER TABLE `acheteur`
  ADD CONSTRAINT `fk_acheteur_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `fk_cheval_mere` FOREIGN KEY (`mere_id`) REFERENCES `cheval` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_pere` FOREIGN KEY (`pere_id`) REFERENCES `cheval` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_race` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_vendeur` FOREIGN KEY (`vendeur_id`) REFERENCES `vendeur` (`client_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `cheval_course`
--
ALTER TABLE `cheval_course`
  ADD CONSTRAINT `fk_cc_cheval` FOREIGN KEY (`cheval_id`) REFERENCES `cheval` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cc_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_pays` FOREIGN KEY (`pays_code`) REFERENCES `pays` (`code`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `courriel`
--
ALTER TABLE `courriel`
  ADD CONSTRAINT `fk_courriel_vente` FOREIGN KEY (`vente_id`) REFERENCES `vente` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `enchere`
--
ALTER TABLE `enchere`
  ADD CONSTRAINT `fk_enchere_acheteur` FOREIGN KEY (`acheteur_id`) REFERENCES `acheteur` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_enchere_lot` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `fk_lot_cheval` FOREIGN KEY (`cheval_id`) REFERENCES `cheval` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lot_vente` FOREIGN KEY (`vente_id`) REFERENCES `vente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `piecejointe`
--
ALTER TABLE `piecejointe`
  ADD CONSTRAINT `fk_piecejointe_courriel` FOREIGN KEY (`courriel_id`) REFERENCES `courriel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD CONSTRAINT `fk_vendeur_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `fk_vente_categ` FOREIGN KEY (`categvente_code`) REFERENCES `categvente` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vente_lieu` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
