-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 22 nov. 2026 à 11:40
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eventle`
--

-- --------------------------------------------------------

--
-- Structure de la table `game_completions`
--

CREATE TABLE `game_completions` (
  `user_id` int(11) NOT NULL,
  `game_date` date NOT NULL,
  `points_round1` int(11) NOT NULL DEFAULT 0,
  `points_round2` int(11) NOT NULL DEFAULT 0,
  `points_round3` int(11) NOT NULL DEFAULT 0,
  `guess_year` int(11) NOT NULL DEFAULT 0,
  `guess_coord_lat` float NOT NULL DEFAULT 0,
  `guess_coord_lng` float NOT NULL DEFAULT 0,
  `guess_order_1` int(11) NOT NULL DEFAULT 1,
  `guess_order_2` int(11) NOT NULL DEFAULT 2,
  `guess_order_3` int(11) NOT NULL DEFAULT 3,
  `guess_order_4` int(11) NOT NULL DEFAULT 4,
  `current_round` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `game_completions`
--

INSERT INTO `game_completions` (`user_id`, `game_date`, `points_round1`, `points_round2`, `points_round3`, `guess_year`, `guess_coord_lat`, `guess_coord_lng`, `guess_order_1`, `guess_order_2`, `guess_order_3`, `guess_order_4`, `current_round`) VALUES
(1, '2026-11-18', 267, 485, 333, -108, 36.5841, 10.2393, 27, 22, 96, 240, 4),
(1, '2026-11-20', 42, 3, 167, 626, 52.3285, 76.9922, 133, 126, 238, 65, 4),
(1, '2026-11-21', 81, 58, 333, 675, 56.1263, 32.168, 197, 240, 243, 58, 4),
(1, '2026-11-22', 369, 57, 167, 461, 54.3224, 35.4864, 238, 48, 96, 65, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `game_completions`
--
ALTER TABLE `game_completions`
  ADD PRIMARY KEY (`user_id`,`game_date`),
  ADD KEY `game_date` (`game_date`),
  ADD KEY `guess_order_1` (`guess_order_1`),
  ADD KEY `guess_order_2` (`guess_order_2`),
  ADD KEY `guess_order_3` (`guess_order_3`),
  ADD KEY `guess_order_4` (`guess_order_4`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game_completions`
--
ALTER TABLE `game_completions`
  ADD CONSTRAINT `game_completions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `game_completions_ibfk_2` FOREIGN KEY (`game_date`) REFERENCES `archive` (`game_date`),
  ADD CONSTRAINT `game_completions_ibfk_3` FOREIGN KEY (`guess_order_1`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `game_completions_ibfk_4` FOREIGN KEY (`guess_order_2`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `game_completions_ibfk_5` FOREIGN KEY (`guess_order_3`) REFERENCES `events` (`id`),
  ADD CONSTRAINT `game_completions_ibfk_6` FOREIGN KEY (`guess_order_4`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
