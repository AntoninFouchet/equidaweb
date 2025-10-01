-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 01 oct. 2025 à 09:26
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
(5, 'Collectionneur confirmé');

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
  `pere_id` int(11) DEFAULT NULL,
  `mere_id` int(11) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `race_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cheval_sire` (`pere_id`),
  KEY `idx_cheval_mere` (`mere_id`),
  KEY `idx_cheval_race` (`race_id`),
  KEY `idx_cheval_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `pere_id`, `mere_id`, `dateNaissance`, `race_id`) VALUES
(5, 'Eclair', 'M', NULL, 9, '2020-04-15', 1),
(6, 'Perle', 'F', NULL, 9, '2019-06-22', 2),
(7, 'Tonnerre', 'M', 5, 6, '2021-05-10', 1),
(8, 'Luna', 'F', 5, 6, '2022-07-03', 3),
(9, 'Bella', 'F', NULL, NULL, '2018-03-12', 4);

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
  KEY `idx_cc_cheval` (`cheval_id`),
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
(9, 2, '1');

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
  `code_postal` varchar(20) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `adresse_messagerie` varchar(255) DEFAULT NULL,
  `pays_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_client_pays` (`pays_code`),
  KEY `idx_client_ville` (`ville`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `titre`, `nom`, `prenom`, `rue`, `code_postal`, `ville`, `adresse_messagerie`, `pays_code`) VALUES
(1, 'M.', 'Dupont', 'Jean', '12 rue des Lilas', '75001', 'Paris', 'jean.dupont@example.com', 'FR'),
(2, 'Mme', 'Martin', 'Sophie', '5 avenue de la République', '69002', 'Lyon', 'sophie.martin@example.com', 'FR'),
(3, 'M.', 'Durand', 'Pierre', '20 boulevard Saint-Michel', '31000', 'Toulouse', 'pierre.durand@example.com', 'FR'),
(4, 'Mme', 'Bernard', 'Claire', '8 rue Victor Hugo', '13001', 'Marseille', 'claire.bernard@example.com', 'FR'),
(5, 'M.', 'Petit', 'Louis', '15 rue de la Paix', '67000', 'Strasbourg', 'louis.petit@example.com', 'FR');

-- --------------------------------------------------------

--
-- Structure de la table `courriel`
--

DROP TABLE IF EXISTS `courriel`;
CREATE TABLE IF NOT EXISTS `courriel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateEnvoi` datetime DEFAULT NULL,
  `objet` varchar(255) DEFAULT NULL,
  `corps` text DEFAULT NULL,
  `vente_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_courriel_vente` (`vente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`id`, `dateEnvoi`, `objet`, `corps`, `vente_id`) VALUES
(1, '2025-03-01 00:00:00', 'Grande Vente Printemps - Invitation', 'Cher client, nous vous invitons à notre Grande Vente Printemps le 15 mars 2025.', 5),
(2, '2025-06-01 00:00:00', 'Vente Prestige - Réservation', 'Ne manquez pas notre Vente Prestige du 10 juin 2025. Réservez dès maintenant votre place.', 6),
(3, '2025-07-01 00:00:00', 'Enchères d’Été', 'Participez aux Enchères d’Été le 5 juillet 2025 et découvrez des lots exceptionnels.', 7),
(4, '2025-09-10 00:00:00', 'Vente en Ligne Automne', 'La Vente en Ligne Automne commence le 20 septembre 2025. Connectez-vous pour participer.', 8);

-- --------------------------------------------------------

--
-- Structure de la table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `dateCourse` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `nom`, `lieu`, `dateCourse`) VALUES
(1, 'Grand Prix de Paris', 'Paris', '2023-06-15'),
(2, 'Coupe de Normandie', 'Deauville', '2023-07-20'),
(3, 'Trophée du Midi', 'Toulouse', '2023-09-05'),
(4, 'Challenge National', 'Lyon', '2023-10-10');

-- --------------------------------------------------------

--
-- Structure de la table `enchere`
--

DROP TABLE IF EXISTS `enchere`;
CREATE TABLE IF NOT EXISTS `enchere` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `montant` decimal(12,2) NOT NULL,
  `dateEnchere` datetime DEFAULT current_timestamp(),
  `acheteur_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_enchere_acheteur` (`acheteur_id`),
  KEY `idx_enchere_lot` (`lot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enchere`
--

INSERT INTO `enchere` (`id`, `numero`, `montant`, `dateEnchere`, `acheteur_id`, `lot_id`) VALUES
(5, 1, 5000.00, '2025-03-15 00:00:00', 1, 11),
(6, 2, 3500.00, '2025-03-15 00:00:00', 2, 12),
(7, 1, 7000.00, '2025-06-10 00:00:00', 3, 13),
(8, 2, 4500.00, '2025-07-05 00:00:00', 4, 14),
(9, 1, 6000.00, '2025-09-20 00:00:00', 5, 15);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville`, `nbBoxes`, `commentaires`) VALUES
(1, 'Paris', 120, 'Grand centre équestre'),
(2, 'Lyon', 80, 'Infrastructure moderne'),
(3, 'Bordeaux', 60, 'Cadre agréable proche du centre'),
(4, 'Toulouse', 100, 'Parc équestre en périphérie');

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
  KEY `idx_lot_prix` (`prixDepart`),
  KEY `fk_lot_cheval` (`cheval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `vente_id`, `cheval_id`) VALUES
(11, 5000.00, 5, 5),
(12, 3500.00, 5, 6),
(13, 7000.00, 6, 7),
(14, 4500.00, 7, 8),
(15, 6000.00, 8, 9);

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
  `nom` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`id`, `nom`, `description`) VALUES
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
(5, 23000.00);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `dateDebutVente` varchar(10) DEFAULT NULL,
  `categvente_code` varchar(50) DEFAULT NULL,
  `lieu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vente_categ` (`categvente_code`),
  KEY `idx_vente_lieu` (`lieu_id`),
  KEY `idx_vente_date` (`dateDebutVente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `nom`, `dateDebutVente`, `categvente_code`, `lieu_id`) VALUES
(5, 'Grande Vente Printemps', '2025-03-15', 'ENCH', 1),
(6, 'Vente Prestige', '2025-06-10', 'PRIV', 2),
(7, 'Enchères d’Été', '2025-07-05', 'ENCH', 3),
(8, 'Vente en Ligne Automne', '2025-09-20', 'ONLI', 4);

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
  ADD CONSTRAINT `fk_cheval_race` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_sire` FOREIGN KEY (`pere_id`) REFERENCES `cheval` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
