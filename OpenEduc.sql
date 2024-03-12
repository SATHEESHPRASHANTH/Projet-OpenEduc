-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 22 fév. 2024 à 15:05
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `OpenEduc`
--

-- --------------------------------------------------------

--
-- Structure de la table `APEA`
--

CREATE TABLE `APEA` (
  `id_apea` int(255) NOT NULL,
  `id_role` int(255) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `civiliter` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `nomClasse` varchar(255) NOT NULL,
  `niveau` text NOT NULL,
  `effectifClasse` int(255) NOT NULL,
  `professeurPrincipale` int(255) NOT NULL,
  `appartient_a_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(255) NOT NULL,
  `nomEtablissement` text NOT NULL,
  `nbClasse` int(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codePostale` int(255) NOT NULL,
  `NumTel` int(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `lierRepresMairie` int(255) NOT NULL,
  `lierRepresAPEA` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Mairie`
--

CREATE TABLE `Mairie` (
  `id_mairie` int(255) NOT NULL,
  `nomRepresentant` text NOT NULL,
  `prenomRepresentant` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` int(255) NOT NULL,
  `role` text NOT NULL,
  `lier_a_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` int(255) NOT NULL,
  `niveau` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur`
--

CREATE TABLE `Professeur` (
  `id_professeur` int(255) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `appartientClasse` varchar(255) NOT NULL,
  `appartient_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `APEA`
--
ALTER TABLE `APEA`
  ADD PRIMARY KEY (`id_apea`);

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`nomClasse`),
  ADD KEY `appartient_a_etablissement` (`appartient_a_etablissement`),
  ADD KEY `professeurPrincipale` (`professeurPrincipale`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`),
  ADD KEY `lierRepresMairie` (`lierRepresMairie`),
  ADD KEY `lierRepresAPEA` (`lierRepresAPEA`);

--
-- Index pour la table `Mairie`
--
ALTER TABLE `Mairie`
  ADD PRIMARY KEY (`id_mairie`),
  ADD KEY `lier_a_etablissement` (`lier_a_etablissement`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Index pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD PRIMARY KEY (`id_professeur`),
  ADD KEY `appartientClasse` (`appartientClasse`),
  ADD KEY `appartient_etablissement` (`appartient_etablissement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `APEA`
--
ALTER TABLE `APEA`
  MODIFY `id_apea` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Mairie`
--
ALTER TABLE `Mairie`
  MODIFY `id_mairie` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`appartient_a_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`professeurPrincipale`) REFERENCES `Professeur` (`id_professeur`);

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`lierRepresMairie`) REFERENCES `Mairie` (`id_mairie`),
  ADD CONSTRAINT `etablissement_ibfk_2` FOREIGN KEY (`lierRepresAPEA`) REFERENCES `APEA` (`id_apea`);

--
-- Contraintes pour la table `Mairie`
--
ALTER TABLE `Mairie`
  ADD CONSTRAINT `mairie_ibfk_1` FOREIGN KEY (`lier_a_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`appartientClasse`) REFERENCES `classe` (`nomClasse`),
  ADD CONSTRAINT `professeur_ibfk_2` FOREIGN KEY (`appartient_etablissement`) REFERENCES `etablissement` (`id_etablissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
