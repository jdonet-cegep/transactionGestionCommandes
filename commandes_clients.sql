-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 23 oct. 2023 à 21:12
-- Version du serveur : 10.4.28-MariaDB-log
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `commandes_clients`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `codecli` int(11) NOT NULL,
  `nomcli` varchar(50) NOT NULL,
  `ruecli` text DEFAULT NULL,
  `villecli` varchar(100) DEFAULT NULL,
  `cpcli` varchar(10) DEFAULT NULL,
  `payscli` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`codecli`, `nomcli`, `ruecli`, `villecli`, `cpcli`, `payscli`) VALUES
(1, 'John Smith', '123 Main Street', 'Anytown', '12345', 'USA'),
(2, 'Alice Johnson', '456 Elm Street', 'Otherville', '54321', 'USA'),
(3, 'Michael Davis', '789 Oak Avenue', 'Nearby City', '98765', 'USA'),
(4, 'Sarah Williams', '321 Pine Street', 'Big City', '56789', 'USA'),
(5, 'Robert Wilson', '555 Maple Lane', 'Smallville', '43210', 'USA'),
(6, 'Emily Jones', '777 Cedar Road', 'Suburbia', '87654', 'USA'),
(7, 'Sarah Williams', '999 Birch Street', 'Villageville', '32123', 'USA'),
(8, 'Jennifer Lee', '111 Pineapple Lane', 'Sunnytown', '23456', 'USA'),
(9, 'William Taylor', '222 Oak Road', 'Metropolis', '34567', 'USA'),
(10, 'Linda Clark', '444 Elm Avenue', 'Hometown', '45678', 'USA'),
(11, 'Richard White', '666 Maple Drive', 'City Heights', '56789', 'USA'),
(12, 'Patricia Adams', '888 Birch Boulevard', 'Downtown', '67890', 'USA'),
(13, 'James Moore', '333 Pine Place', 'Urbanville', '78901', 'USA'),
(14, 'Mary Hall', '444 Oak Park', 'Countryside', '89012', 'USA'),
(15, 'Charles Allen', '555 Elm Circle', 'Ruralville', '90123', 'USA'),
(16, 'Susan Turner', '777 Maple Court', 'Village Heights', '01234', 'USA'),
(17, 'Joseph Garcia', '222 Birch Avenue', 'Countryville', '12345', 'USA'),
(18, 'James Moore', '333 Cedar Lane', 'Meadowville', '23456', 'USA'),
(19, 'Thomas Hernandez', '444 Pine Road', 'Hillside', '34567', 'USA'),
(20, 'Nancy Martinez', '555 Oak Drive', 'Mountainview', '45678', 'USA');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `codecde` varchar(50) NOT NULL,
  `datecde` date NOT NULL,
  `codecli` int(11) NOT NULL,
  `statutcde` ENUM('passee','validee','envoyee','supprimee') NOT NULL, 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`codecde`, `datecde`, `codecli`) VALUES
('CDE001', '2023-08-01', 1,'passee'),
('CDE002', '2023-08-02', 2,'passee'),
('CDE003', '2023-08-02', 3,'passee'),
('CDE004', '2023-08-04', 4,'passee'),
('CDE005', '2023-08-05', 2,'passee'),
('CDE006', '2023-08-01', 6,'passee'),
('CDE007', '2023-08-07', 7,'passee'),
('CDE008', '2023-08-01', 1,'passee'),
('CDE009', '2023-08-04', 9,'passee'),
('CDE010', '2023-08-10', 1,'passee');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `codecde` varchar(50) NOT NULL,
  `codepro` int(11) NOT NULL,
  `qtecde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`codecde`, `codepro`, `qtecde`) VALUES
('CDE001', 1, 2),
('CDE001', 2, 1),
('CDE001', 3, 3),
('CDE001', 4, 1),
('CDE001', 5, 2),
('CDE001', 9, 5),
('CDE002', 1, 4),
('CDE003', 9, 1),
('CDE003', 11, 2),
('CDE003', 12, 1),
('CDE003', 13, 3),
('CDE003', 14, 1),
('CDE003', 15, 2),
('CDE004', 1, 2),
('CDE004', 4, 3),
('CDE004', 8, 1),
('CDE004', 9, 1),
('CDE004', 16, 2),
('CDE004', 19, 1),
('CDE005', 1, 2),
('CDE005', 2, 1),
('CDE005', 3, 3),
('CDE005', 4, 1),
('CDE005', 5, 2),
('CDE005', 9, 1),
('CDE006', 6, 2),
('CDE006', 7, 1),
('CDE006', 8, 3),
('CDE006', 9, 1),
('CDE006', 10, 2),
('CDE007', 9, 1),
('CDE007', 11, 2),
('CDE007', 12, 1),
('CDE007', 13, 3),
('CDE007', 14, 1),
('CDE007', 15, 2),
('CDE008', 9, 1),
('CDE008', 16, 2),
('CDE008', 17, 1),
('CDE008', 18, 3),
('CDE008', 19, 1),
('CDE008', 20, 2),
('CDE009', 1, 2),
('CDE009', 2, 1),
('CDE009', 3, 3),
('CDE009', 4, 1),
('CDE009', 5, 2),
('CDE009', 9, 1),
('CDE010', 6, 2),
('CDE010', 7, 1),
('CDE010', 8, 8),
('CDE010', 9, 1),
('CDE010', 10, 9);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `codepro` int(11) NOT NULL,
  `designationpro` varchar(50) NOT NULL,
  `prixpro` decimal(15,2) NOT NULL,
  `stockpro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codepro`, `designationpro`, `prixpro`, `stockpro`) VALUES
(1, 'Smartphone', 599.99, -1),
(2, 'Ordinateur portable', 999.99, 34),
(3, 'Écouteurs sans fil', 149.99, 26),
(4, 'Tablette', 349.99, 36),
(5, 'Imprimante', 149.99, 48),
(6, 'Téléviseur 4K', 799.99, 0),
(7, 'Console de jeux', 499.99, 0),
(8, 'Cafetière', 49.99, 0),
(9, 'Aspirateur', 199.99, 56),
(10, 'Micro-ondes', 79.99, 0),
(11, 'Réfrigérateur', 799.99, 0),
(12, 'Lave-linge', 499.99, 0),
(13, 'Sèche-linge', 399.99, 0),
(14, 'Grille-pain', 29.99, 0),
(15, 'Fer à repasser', 39.99, 0),
(16, 'Mixeur', 69.99, 0),
(17, 'Machine à café', 149.99, 0),
(18, 'Laptop', 1299.99, 0),
(19, 'Enceinte Bluetooth', 79.99, 0),
(20, 'Casque audio', 129.99, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`codecli`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`codecde`),
  ADD KEY `codecli` (`codecli`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`codecde`,`codepro`),
  ADD KEY `codepro` (`codepro`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`codepro`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`codecli`) REFERENCES `client` (`codecli`);

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `ligne_commande_ibfk_1` FOREIGN KEY (`codecde`) REFERENCES `commande` (`codecde`),
  ADD CONSTRAINT `ligne_commande_ibfk_2` FOREIGN KEY (`codepro`) REFERENCES `produit` (`codepro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
