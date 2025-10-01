-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : mer. 01 oct. 2025 à 09:12
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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cheval`
--
ALTER TABLE `cheval`
  ADD CONSTRAINT `fk_cheval_mere` FOREIGN KEY (`mere_id`) REFERENCES `cheval` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_race` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cheval_sire` FOREIGN KEY (`pere_id`) REFERENCES `cheval` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
