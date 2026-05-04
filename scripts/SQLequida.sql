-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 04 mai 2026 à 13:31
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
(2, 'Investisseur scientifique'),
(4, 'Spécialiste de l\'élevage britannique'),
(7, 'Écurie de course prestigieuse'),
(11, 'Enchères débutant'),
(14, 'Investisseur privé'),
(15, 'Représentant Haras Suisse'),
(51, 'Propriétaire Haras Normand'),
(53, 'Investisseur Suisse'),
(54, 'Amateur de Trotteurs'),
(101, 'Syndicat d\'achat britannique'),
(102, 'Éleveur professionnel'),
(103, 'Investisseur particulier'),
(104, 'Représentant de fonds d\'investissement'),
(151, 'Collectionneur d\'art et chevaux'),
(153, 'Investisseur sportif'),
(201, 'Syndicat d\'investissement irlandais'),
(203, 'Acheteur privé indépendant'),
(204, 'Représentante écurie royale'),
(206, 'Courtier international'),
(207, 'Amateur éclairé'),
(209, 'Collectionneur de champions');

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
('ELIT', 'Vente Élite Prestige'),
('ENCH', 'Vente aux enchères'),
('ONLI', 'Vente en ligne'),
('YEAR', 'Vente de Yearlings');

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
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cheval`
--

INSERT INTO `cheval` (`id`, `nom`, `sexe`, `sire`, `pere_id`, `mere_id`, `dateNaissance`, `race_id`, `vendeur_id`) VALUES
(1, 'Étalon Noir', 'M', '1111.000.111A', NULL, NULL, '2015-05-10', 1, 1),
(2, 'Jument Céleste', 'F', '2222.000.222B', NULL, NULL, '2016-04-12', 1, 3),
(3, 'Prince des Nuées', 'M', '3333.000.333C', 1, 2, '2021-02-20', 1, 1),
(4, 'Princesse de l\'Aube', 'F', '4444.000.444D', 1, 2, '2022-03-15', 1, 5),
(5, 'Trotteur Vaillant', 'G', '5555.000.555E', NULL, NULL, '2018-09-05', 2, 5),
(6, 'Flèche d\'Argent', 'F', '6666.000.666F', NULL, NULL, '2023-01-10', 3, 3),
(7, 'Tornade Blanche', 'F', '7777.000.777G', NULL, NULL, '2020-05-10', 4, 5),
(8, 'Éclair Noir', 'M', '8888.000.888H', 1, 2, '2023-04-01', 1, 1),
(9, 'Saut d\'Ange', 'F', '9999.000.999I', NULL, NULL, '2019-08-15', 3, 6),
(10, 'Vainqueur', 'M', '1010.000.101J', NULL, NULL, '2021-11-20', 2, 6),
(11, 'Tempête du Désert', 'M', '1212.000.121K', NULL, 7, '2024-02-14', 4, 5),
(20, 'Roi des Vents', 'M', '2020.111.111A', NULL, NULL, '2016-03-12', 1, 10),
(21, 'Déesse de l\'Olympe', 'F', '2021.222.222B', NULL, NULL, '2017-05-20', 1, 12),
(22, 'Cavalier Noir', 'M', '2022.333.333C', 20, 21, '2022-04-10', 1, 10),
(23, 'Lumière du Matin', 'F', '2023.444.444D', 20, 21, '2023-03-25', 1, 12),
(24, 'Trotteur des Bois', 'M', '2024.555.555E', NULL, NULL, '2019-08-14', 2, 13),
(25, 'Saut de l\'Ange', 'G', '2025.666.666F', NULL, NULL, '2018-11-01', 3, 10),
(26, 'Étoile Filante II', 'F', '2026.777.777G', NULL, NULL, '2020-02-28', 4, 12),
(27, 'Vent du Nord', 'M', '2027.888.888H', NULL, 26, '2024-05-15', 4, 12),
(28, 'Majesté', 'F', '2028.999.999I', 20, NULL, '2024-01-10', 1, 10),
(29, 'Foudre d\'Irlande', 'M', '2029.000.000J', NULL, NULL, '2022-06-18', 1, 13),
(50, 'Sultan Blanc', 'M', '5050.111.111A', NULL, NULL, '2016-04-12', 4, 50),
(51, 'Dune du Désert', 'F', '5051.222.222B', NULL, NULL, '2017-06-25', 4, 50),
(52, 'Oasis Étoilée', 'F', '5052.333.333C', 50, 51, '2023-05-10', 4, 50),
(53, 'Mirage Doré', 'M', '5053.444.444D', 50, 51, '2024-03-22', 4, 50),
(54, 'Ourasi du Nord', 'M', '5054.555.555E', NULL, NULL, '2015-08-14', 2, 52),
(55, 'Victoire Rapide', 'F', '5055.666.666F', NULL, NULL, '2018-02-11', 2, 55),
(56, 'Trotteur de Feu', 'M', '5056.777.777G', 54, 55, '2022-11-30', 2, 52),
(57, 'Championne Céleste', 'F', '5057.888.888H', 54, 55, '2024-01-15', 2, 55),
(58, 'Éclair de Bretagne', 'G', '5058.999.999I', NULL, NULL, '2020-07-07', 3, 52),
(59, 'Irish Legend', 'M', '5059.000.000J', NULL, NULL, '2021-04-18', 1, 55),
(100, 'Jumping King', 'M', '1000.111.111A', NULL, NULL, '2014-04-10', 3, 100),
(101, 'Queen of Sky', 'F', '1001.222.222B', NULL, NULL, '2015-05-15', 3, 102),
(102, 'Sky Jumper', 'M', '1002.333.333C', 100, 101, '2020-03-20', 3, 100),
(103, 'Golden Wings', 'F', '1003.444.444D', 100, 101, '2022-04-12', 3, 102),
(104, 'Thunderbolt', 'G', '1004.555.555E', NULL, NULL, '2019-02-28', 1, 100),
(105, 'Night Rider', 'M', '1005.666.666F', NULL, NULL, '2021-06-18', 1, 102),
(150, 'Empereur Allemand', 'M', '1500.111.111A', NULL, NULL, '2016-05-22', 1, 150),
(151, 'Bella Donna', 'F', '1501.222.222B', NULL, NULL, '2017-04-18', 1, 150),
(152, 'Prince de Bavière', 'M', '1502.333.333C', 150, 151, '2025-02-10', 1, 150),
(153, 'Étoile de Munich', 'F', '1503.444.444D', 150, 151, '2026-01-05', 1, 150),
(154, 'Trotteur Normand', 'M', '1504.555.555E', NULL, NULL, '2021-08-14', 2, 152),
(155, 'Brise de Mer', 'F', '1505.666.666F', NULL, NULL, '2022-05-30', 2, 152),
(200, 'Roi Soleil', 'M', '2000.111.111A', NULL, NULL, '2014-03-10', 1, 200),
(201, 'Reine des Prés', 'F', '2001.222.222B', NULL, NULL, '2015-05-15', 1, 200),
(202, 'Duc de Normandie', 'M', '2002.333.333C', 200, 201, '2024-02-20', 1, 200),
(203, 'Duchesse Royale', 'F', '2003.444.444D', 200, 201, '2025-01-12', 1, 200),
(204, 'Prince Charmant', 'M', '2004.555.555E', 200, 201, '2026-04-05', 1, 200),
(205, 'Vitesse Max', 'M', '2005.666.666F', NULL, NULL, '2016-08-14', 2, 202),
(206, 'Étoile du Nord', 'F', '2006.777.777G', NULL, NULL, '2017-09-22', 2, 202),
(207, 'Bolide Belge', 'M', '2007.888.888H', 205, 206, '2023-11-30', 2, 202),
(208, 'Comète des Flandres', 'F', '2008.999.999I', 205, 206, '2024-12-15', 2, 202),
(209, 'Celtic Warrior', 'M', '2009.000.000J', NULL, NULL, '2019-03-17', 1, 208),
(210, 'Irish Mist', 'F', '2010.111.111K', NULL, NULL, '2020-04-10', 1, 208),
(211, 'Shamrock', 'M', '2011.222.222L', 209, 210, '2025-05-25', 1, 208),
(212, 'Sultan Majestueux', 'M', '2012.333.333M', NULL, NULL, '2021-07-07', 4, 205),
(213, 'Saut de l\'Aigle', 'G', '2013.444.444N', NULL, NULL, '2018-02-28', 3, 205),
(214, 'Ombre Fuyante', 'F', '2014.555.555O', NULL, NULL, '2022-10-10', 1, 200);

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
(1, 1, '1'),
(3, 1, '3'),
(4, 3, '5'),
(5, 2, '2'),
(7, 5, '1'),
(8, 1, '4'),
(9, 4, '2'),
(20, 10, '1'),
(20, 11, '2'),
(22, 10, '4'),
(24, 13, '1'),
(29, 12, '3'),
(50, 51, '1'),
(54, 50, '3'),
(56, 52, '2'),
(59, 1, '4'),
(100, 100, '1'),
(102, 101, '2'),
(104, 100, '4'),
(105, 1, '5'),
(150, 151, '1'),
(154, 150, '2'),
(155, 150, '5'),
(200, 200, '1'),
(200, 201, '2'),
(205, 203, '1'),
(209, 200, '3'),
(213, 202, '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `titre`, `nom`, `prenom`, `rue`, `copos`, `ville`, `adresseMessagerie`, `pays_code`) VALUES
(1, 'M.', 'Baudelaire', 'Charles', '12 rue des Fleurs', '75004', 'Paris', 'charles.b@mail.fr', 'FR'),
(2, 'Mme', 'Curie', 'Marie', 'Science Avenue', '1000', 'Bruxelles', 'marie.c@mail.be', 'BE'),
(3, 'M.', 'Wilde', 'Oscar', '15 Temple Bar', 'D02', 'Dublin', 'oscar.w@mail.ie', 'IE'),
(4, 'Mme', 'Austen', 'Jane', 'High Street', 'CB8', 'Newmarket', 'jane.a@mail.gb', 'GB'),
(5, 'M.', 'Dumas', 'Alexandre', 'Chemin des Mousquetaires', '1200', 'Genève', 'alex.d@mail.ch', 'CH'),
(6, 'M.', 'Hugo', 'Victor', 'Place des Vosges', '75004', 'Paris', 'vhugo@mail.fr', 'FR'),
(7, 'Mme', 'Shelley', 'Mary', 'Oxford Street', 'W1D', 'Londres', 'mshelley@mail.gb', 'GB'),
(10, 'M.', 'Lombard', 'Jean', 'Route des champs', '69000', 'Lyon', 'jlombard@mail.fr', 'FR'),
(11, 'Mme', 'Dupuis', 'Aline', 'Avenue Foch', '75016', 'Paris', 'aline.d@mail.fr', 'FR'),
(12, 'M.', 'Morel', 'Alain', 'Chemin du Bois', '14000', 'Caen', 'amorel@mail.fr', 'FR'),
(13, 'Mme', 'Keane', 'Fiona', 'Cork Street', 'C01', 'Cork', 'fkeane@mail.ie', 'IE'),
(14, 'M.', 'Davies', 'John', 'Thames Road', 'W1', 'Londres', 'jdavies@mail.gb', 'GB'),
(15, 'Mme', 'Rousseau', 'Chloé', 'Rue du Val', '1000', 'Lausanne', 'crousseau@mail.ch', 'CH'),
(50, 'M.', 'Weber', 'Klaus', 'Seestrasse 12', '8000', 'Zurich', 'klaus.weber@mail.ch', 'CH'),
(51, 'Mme', 'Lefevre', 'Sophie', '10 Rue de la Paix', '75002', 'Paris', 'slefevre@mail.fr', 'FR'),
(52, 'M.', 'Peeters', 'Jan', 'Rue Neuve 50', '1000', 'Bruxelles', 'jan.peeters@mail.be', 'BE'),
(53, 'Mme', 'Müller', 'Anna', 'Bundesplatz 8', '3000', 'Berne', 'amuller@mail.ch', 'CH'),
(54, 'M.', 'Garnier', 'Louis', 'Chemin des Vignes', '33000', 'Bordeaux', 'lgarnier@mail.fr', 'FR'),
(55, 'Mme', 'O\'Sullivan', 'Claire', 'Grafton St', 'D02', 'Dublin', 'cosullivan@mail.ie', 'IE'),
(100, 'M.', 'Lemaire', 'Antoine', 'Domaine des Écuyers', '14800', 'Deauville', 'alemaire@mail.fr', 'FR'),
(101, 'Mme', 'Wellington', 'Victoria', '10 Downing Lane', 'SW1A', 'Londres', 'vwellington@mail.gb', 'GB'),
(102, 'M.', 'Vanderbilt', 'Paul', 'Avenue des Flandres', '8000', 'Bruges', 'pvanderbilt@mail.be', 'BE'),
(103, 'Mme', 'Rostand', 'Élodie', 'Allée des Cavaliers', '78600', 'Maisons-Laffitte', 'erostand@mail.fr', 'FR'),
(104, 'M.', 'Giacometti', 'Marco', 'Via Roma 15', '6900', 'Lugano', 'mgiacometti@mail.ch', 'CH'),
(150, 'M.', 'Schulz', 'Heinrich', 'Hauptstrasse 45', '80331', 'Munich', 'hschulz@mail.de', 'CH'),
(151, 'Mme', 'Moretti', 'Isabella', 'Via Firenze', '50122', 'Florence', 'imoretti@mail.it', 'FR'),
(152, 'M.', 'Lefort', 'Gilles', 'Avenue de la Mer', '14390', 'Cabourg', 'glefort@mail.fr', 'FR'),
(153, 'Mme', 'Meyer', 'Clara', 'Rue des Alpes', '1204', 'Genève', 'cmeyer@mail.ch', 'CH'),
(200, 'M.', 'Benoit', 'Luc', 'Haras des Érables', '14800', 'Deauville', 'lbenoit@haras.fr', 'FR'),
(201, 'Mme', 'Gallagher', 'Fiona', 'Temple Street 42', 'D01', 'Dublin', 'fgallagher@mail.ie', 'IE'),
(202, 'M.', 'Van Der Beek', 'Hans', 'Rue de l\'Élevage', '4000', 'Liège', 'hvanderbeek@mail.be', 'BE'),
(203, 'M.', 'Russo', 'Giovanni', 'Via Montenapoleone', '20121', 'Milan', 'grusso@mail.it', 'CH'),
(204, 'Mme', 'Kensington', 'Diana', 'Oxford St', 'W1D', 'Londres', 'dkensington@mail.gb', 'GB'),
(205, 'M.', 'Martin', 'Philippe', 'Avenue du Cheval', '60500', 'Chantilly', 'pmartin@mail.fr', 'FR'),
(206, 'Mme', 'Lange', 'Sarah', 'Königsallee', '40212', 'Düsseldorf', 'slange@mail.ch', 'CH'),
(207, 'M.', 'Dubois', 'Marc', 'Route de Vincennes', '75012', 'Paris', 'mdubois@mail.fr', 'FR'),
(208, 'Mme', 'O\'Connor', 'Liam', 'Kildare Road', 'R56', 'Kildare', 'loconnor@mail.ie', 'IE'),
(209, 'M.', 'Bernard', 'Jacques', 'Chemin Vert', '33000', 'Bordeaux', 'jbernard@mail.fr', 'FR');

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
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courriel`
--

INSERT INTO `courriel` (`id`, `date`, `objet`, `corps`, `vente_id`) VALUES
(1, '2026-07-01 10:00:00', 'Catalogue Vente d\'Août', 'Découvrez nos exceptionnels yearlings.', 1),
(2, '2026-06-01 10:00:00', 'Catalogue Vente Élite Arabes', 'Voici les plus beaux pur-sang arabes pour cette vente.', 5),
(10, '2027-02-15 09:00:00', 'Catalogue Vente de Printemps', 'Voici les lots de notre prochaine vente courante.', 10),
(11, '2027-09-01 14:30:00', 'Invitation Vente Élite', 'Ne manquez pas la Grande Vente Élite d\'Automne.', 12),
(50, '2027-07-01 08:00:00', 'Catalogue Pur-Sang Arabes', 'Découvrez la somptueuse lignée de Sultan Blanc.', 50),
(51, '2027-09-15 10:00:00', 'Catalogue Trotteurs', 'Préparez-vous pour la grande vente de Vincennes.', 51),
(100, '2026-11-05 09:30:00', 'Spécial Obstacle', 'Préparez votre saison avec notre vente spécialisée en chevaux d\'obstacle.', 100),
(101, '2026-11-20 14:00:00', 'The December Sale', 'Join us at Newmarket for the prestigious December Sale.', 101),
(150, '2026-09-01 10:00:00', 'Participez à notre Vente 100% Online', 'Inscrivez-vous dès maintenant pour la vente digitale.', 150),
(151, '2026-07-15 08:30:00', 'Catalogue Vente d\'Été', 'Les meilleurs trotteurs vous attendent à Vincennes.', 151),
(200, '2027-07-15 08:00:00', 'Catalogue des Yearlings', 'Les futures stars de demain sont à Deauville.', 200),
(201, '2027-09-01 10:00:00', 'Tattersalls October Preview', 'A first look at the incredible entries for October.', 203),
(202, '2027-04-20 12:00:00', 'Alerte Vente Flash', 'Connectez-vous vite pour nos lots exclusifs en ligne.', 204);

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
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `course`
--

INSERT INTO `course` (`id`, `nom`, `lieu`, `date`) VALUES
(1, 'Prix de l\'Arc de Triomphe', 'ParisLongchamp', '2026-10-04'),
(2, 'Prix d\'Amérique', 'Vincennes', '2026-01-25'),
(3, 'Epsom Derby', 'Epsom Downs', '2026-06-06'),
(4, 'Grand Steeple-Chase de Paris', 'Paris', '2026-05-18'),
(5, 'Prix de Diane', 'Chantilly', '2026-06-14'),
(10, 'Prix du Jockey Club', 'Chantilly', '2026-06-01'),
(11, 'Grand Prix de Paris', 'ParisLongchamp', '2026-07-14'),
(12, 'Irish Derby', 'Curragh', '2026-06-28'),
(13, 'Prix de Cornulier', 'Vincennes', '2026-01-18'),
(50, 'Prix René Ballière', 'Vincennes', '2026-06-21'),
(51, 'Dubai Arabian Classic', 'Deauville', '2026-08-10'),
(52, 'Critérium des 4 ans', 'Vincennes', '2026-05-02'),
(100, 'Cheltenham Gold Cup', 'Cheltenham', '2026-03-15'),
(101, 'Grand Steeple-Chase de Deauville', 'Deauville', '2026-08-25'),
(150, 'Grand Prix de Cabourg', 'Cabourg', '2026-07-20'),
(151, 'Munich Classic', 'Munich', '2026-09-12'),
(200, 'King George VI and Queen Elizabeth Stakes', 'Ascot', '2026-07-25'),
(201, 'Prix Rothschild', 'Deauville', '2026-08-02'),
(202, 'Grand Prix d\'Automne', 'Auteuil', '2026-11-08'),
(203, 'Critérium Continental', 'Vincennes', '2026-12-27');

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
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enchere`
--

INSERT INTO `enchere` (`id`, `numero`, `montant`, `acheteur_id`, `lot_id`) VALUES
(1, 1, 160000.00, 2, 1),
(2, 2, 175000.00, 4, 1),
(3, 1, 210000.00, 4, 2),
(4, 1, 90000.00, 2, 3),
(5, 1, 28000.00, 7, 5),
(6, 1, 190000.00, 2, 8),
(7, 2, 200000.00, 4, 8),
(20, 1, 130000.00, 14, 20),
(21, 2, 145000.00, 15, 20),
(22, 1, 185000.00, 7, 21),
(23, 1, 46000.00, 11, 22),
(24, 1, 65000.00, 2, 23),
(25, 2, 70000.00, 14, 23),
(26, 1, 260000.00, 4, 26),
(27, 2, 275000.00, 7, 26),
(50, 1, 160000.00, 53, 50),
(51, 2, 175000.00, 51, 50),
(52, 1, 250000.00, 53, 51),
(53, 1, 65000.00, 54, 52),
(54, 1, 45000.00, 54, 53),
(55, 2, 52000.00, 51, 53),
(56, 1, 360000.00, 2, 55),
(57, 2, 380000.00, 4, 55),
(100, 1, 85000.00, 101, 100),
(101, 2, 90000.00, 103, 100),
(102, 1, 100000.00, 104, 101),
(103, 1, 160000.00, 101, 102),
(104, 2, 175000.00, 102, 102),
(105, 1, 210000.00, 101, 103),
(106, 2, 230000.00, 53, 103),
(107, 3, 250000.00, 101, 103),
(150, 1, 48000.00, 151, 150),
(151, 2, 52000.00, 153, 150),
(152, 1, 60000.00, 151, 151),
(153, 1, 28000.00, 153, 152),
(154, 1, 35000.00, 2, 153),
(200, 1, 160000.00, 203, 200),
(201, 2, 180000.00, 204, 200),
(202, 3, 210000.00, 206, 200),
(203, 1, 85000.00, 201, 201),
(204, 1, 320000.00, 204, 203),
(205, 2, 350000.00, 209, 203),
(206, 1, 62000.00, 207, 205),
(207, 2, 65000.00, 203, 205),
(208, 1, 410000.00, 201, 207),
(209, 2, 450000.00, 204, 207),
(210, 3, 480000.00, 206, 207),
(211, 4, 520000.00, 201, 207),
(212, 1, 48000.00, 203, 209),
(213, 2, 55000.00, 207, 209);

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
(1, 'Deauville', 300, 'Élie de Brignac, pôle international.'),
(2, 'Chantilly', 150, 'Hippodrome historique.'),
(3, 'Vincennes', 400, 'Temple du trot.'),
(4, 'Newmarket', 200, 'Lieu mythique en Angleterre.');

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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lot`
--

INSERT INTO `lot` (`id`, `prixDepart`, `vente_id`, `cheval_id`) VALUES
(1, 150000.00, 1, 3),
(2, 200000.00, 1, 4),
(3, 85000.00, 2, 5),
(4, 45000.00, 3, 6),
(5, 25000.00, 4, 9),
(6, 30000.00, 4, 10),
(7, 100000.00, 5, 7),
(8, 180000.00, 1, 8),
(20, 120000.00, 12, 22),
(21, 180000.00, 11, 23),
(22, 45000.00, 13, 24),
(23, 60000.00, 10, 25),
(24, 85000.00, 12, 27),
(25, 110000.00, 11, 28),
(26, 250000.00, 12, 29),
(50, 150000.00, 50, 52),
(51, 200000.00, 50, 53),
(52, 60000.00, 51, 56),
(53, 40000.00, 51, 57),
(54, 25000.00, 52, 58),
(55, 350000.00, 52, 59),
(100, 80000.00, 100, 102),
(101, 95000.00, 100, 103),
(102, 150000.00, 101, 104),
(103, 200000.00, 101, 105),
(150, 45000.00, 150, 152),
(151, 55000.00, 150, 153),
(152, 25000.00, 151, 154),
(153, 30000.00, 151, 155),
(200, 150000.00, 200, 203),
(201, 80000.00, 200, 204),
(202, 120000.00, 200, 211),
(203, 300000.00, 201, 202),
(204, 250000.00, 201, 214),
(205, 60000.00, 202, 207),
(206, 50000.00, 202, 208),
(207, 400000.00, 203, 209),
(208, 350000.00, 203, 210),
(209, 45000.00, 204, 212),
(210, 30000.00, 204, 213);

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
('FR', 'France'),
('GB', 'Royaume-Uni'),
('IE', 'Irlande');

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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `piecejointe`
--

INSERT INTO `piecejointe` (`id`, `chemin`, `description`, `courriel_id`) VALUES
(1, '/fichiers/catalogue_aout_2026.pdf', 'Catalogue complet en PDF', 1),
(2, '/fichiers/catalogue_arabes_2026.pdf', 'Catalogue Arabes', 2),
(10, '/fichiers/printemps_2027.pdf', 'Lots Printemps', 10),
(11, '/fichiers/elite_automne_2027.pdf', 'Brochure Prestige', 11),
(12, '/images/cheval_22.jpg', 'Photo Cavalier Noir', 11),
(50, '/fichiers/arabes_2027.pdf', 'Catalogue complet Vente Arabes', 50),
(51, '/fichiers/trotteurs_automne_2027.pdf', 'Brochure officielle des Trotteurs', 51),
(100, '/fichiers/obstacle_hiver_2026.pdf', 'Catalogue Vente Obstacle', 100),
(101, '/images/sky_jumper_action.jpg', 'Photo de Sky Jumper en course', 100),
(102, '/fichiers/tattersalls_december.pdf', 'Official December Catalogue', 101),
(150, '/fichiers/guide_encheres_online.pdf', 'Guide de connexion', 150),
(151, '/images/prince_baviere.jpg', 'Photo de Prince de Bavière', 150),
(152, '/fichiers/trotteurs_ete_2026.pdf', 'Catalogue été PDF', 151),
(200, '/docs/deauville_yearlings_2027.pdf', 'Brochure officielle Deauville', 200),
(201, '/images/duc_normandie.jpg', 'Photo de Duc de Normandie', 200),
(202, '/docs/tattersalls_preview_2027.pdf', 'Tattersalls Preview PDF', 201),
(203, '/images/celtic_warrior.png', 'Portrait de Celtic Warrior', 201),
(204, '/fichiers/liens_vente_online.pdf', 'Notice de connexion', 202);

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
(1, 'Pur-sang Anglais', 'Cheval de course rapide, galop.'),
(2, 'Trotteur Français', 'Spécialiste du trot attelé.'),
(3, 'Selle Français', 'Cheval de sport, saut d\'obstacles.'),
(4, 'Arabe', 'Race très endurante.');

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
(1, 150000.00),
(3, 45000.00),
(5, 320000.00),
(6, 12000.00),
(10, 85000.00),
(12, 120000.00),
(13, 0.00),
(50, 450000.00),
(52, 180000.00),
(55, 30000.00),
(100, 340000.00),
(102, 510000.00),
(150, 650000.00),
(152, 110000.00),
(200, 1500000.00),
(202, 850000.00),
(205, 320000.00),
(208, 950000.00);

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
(1, 'Vente de Yearlings d\'Août', '2026-08-15', 'YEAR', 1),
(2, 'Élite du Trot Français', '2026-09-10', 'ELIT', 3),
(3, 'Vente Mixte Internationale', '2026-11-05', 'ENCH', 4),
(4, 'Vente Courante d\'Hiver', '2026-12-10', 'COUR', 2),
(5, 'Élite Chevaux Arabes', '2026-07-20', 'ELIT', 1),
(10, 'Vente de Printemps de Chantilly', '2027-03-20', 'COUR', 2),
(11, 'Sélection de Yearlings Newmarket', '2027-09-15', 'YEAR', 4),
(12, 'Grande Vente Élite d\'Automne', '2027-10-10', 'ELIT', 1),
(13, 'Vente aux Enchères Trotteurs', '2027-02-05', 'ENCH', 3),
(50, 'Vente Internationale d\'Arabes', '2027-08-12', 'ELIT', 1),
(51, 'Vente de Trotteurs d\'Automne', '2027-10-25', 'ENCH', 3),
(52, 'Vente Mixte Européenne', '2027-11-15', 'COUR', 2),
(100, 'Vente d\'Obstacle d\'Hiver', '2026-12-05', 'COUR', 1),
(101, 'Tattersalls December Sale', '2026-12-15', 'ELIT', 4),
(150, 'Vente Online Internationale', '2026-10-01', 'ONLI', 1),
(151, 'Vente d\'Été des Trotteurs', '2026-08-10', 'COUR', 3),
(200, 'Grande Vente de Yearlings', '2027-08-20', 'YEAR', 1),
(201, 'Vente Élite d\'Automne', '2027-10-15', 'ELIT', 2),
(202, 'Enchères du Trot', '2027-12-05', 'ENCH', 3),
(203, 'Tattersalls October', '2027-10-01', 'COUR', 4),
(204, 'Vente Online Flash', '2027-05-15', 'ONLI', 1);

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
