-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 11 mars 2024 à 14:25
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
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Classe`
--

CREATE TABLE `Classe` (
  `id_classe` int(255) NOT NULL,
  `nomClasse` varchar(255) NOT NULL,
  `id_niveau` int(255) NOT NULL,
  `effectifClasse` int(255) NOT NULL,
  `id_professeur` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Etablissement`
--

CREATE TABLE `Etablissement` (
  `id_etablissement` int(255) NOT NULL,
  `nomEtablissement` text NOT NULL,
  `nbClasse` int(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codePostale` int(255) NOT NULL,
  `numTel` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_Representant_Mairie` int(255) NOT NULL,
  `id_Representant_APEA` int(255) NOT NULL,
  `actions` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Evenement`
--

CREATE TABLE `Evenement` (
  `id_evenement` int(255) NOT NULL,
  `nom_evenement` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Login`
--

CREATE TABLE `Login` (
  `id_login` int(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `code_privilege` int(255) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `etablissement_lier` int(255) DEFAULT NULL
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
  `numTel` int(255) NOT NULL,
  `id_role` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Niveau`
--

CREATE TABLE `Niveau` (
  `id_niveau` int(255) NOT NULL,
  `niveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Professeur`
--

CREATE TABLE `Professeur` (
  `id_professeur` int(255) NOT NULL,
  `nom` text NOT NULL,
  `civilitee` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Role_APEA`
--

CREATE TABLE `Role_APEA` (
  `id` int(255) NOT NULL,
  `nom_role` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `APEA`
--
ALTER TABLE `APEA`
  ADD PRIMARY KEY (`id_apea`),
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `appartient_a_etablissement` (`id_etablissement`),
  ADD KEY `professeurPrincipale` (`id_professeur`),
  ADD KEY `niveau` (`id_niveau`);

--
-- Index pour la table `Etablissement`
--
ALTER TABLE `Etablissement`
  ADD PRIMARY KEY (`id_etablissement`),
  ADD KEY `lierRepresMairie` (`id_Representant_Mairie`),
  ADD KEY `lierRepresAPEA` (`id_Representant_APEA`),
  ADD KEY `actions` (`actions`);

--
-- Index pour la table `Evenement`
--
ALTER TABLE `Evenement`
  ADD PRIMARY KEY (`id_evenement`);

--
-- Index pour la table `Login`
--
ALTER TABLE `Login`
  ADD KEY `etablissement_lier` (`etablissement_lier`);

--
-- Index pour la table `Mairie`
--
ALTER TABLE `Mairie`
  ADD PRIMARY KEY (`id_mairie`),
  ADD KEY `lier_a_etablissement` (`id_etablissement`);

--
-- Index pour la table `Niveau`
--
ALTER TABLE `Niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Index pour la table `Professeur`
--
ALTER TABLE `Professeur`
  ADD PRIMARY KEY (`id_professeur`);

--
-- Index pour la table `Role_APEA`
--
ALTER TABLE `Role_APEA`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `APEA`
--
ALTER TABLE `APEA`
  MODIFY `id_apea` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Classe`
--
ALTER TABLE `Classe`
  MODIFY `id_classe` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Etablissement`
--
ALTER TABLE `Etablissement`
  MODIFY `id_etablissement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Evenement`
--
ALTER TABLE `Evenement`
  MODIFY `id_evenement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Mairie`
--
ALTER TABLE `Mairie`
  MODIFY `id_mairie` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Niveau`
--
ALTER TABLE `Niveau`
  MODIFY `id_niveau` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Role_APEA`
--
ALTER TABLE `Role_APEA`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `APEA`
--
ALTER TABLE `APEA`
  ADD CONSTRAINT `apea_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `Role_APEA` (`id`);

--
-- Contraintes pour la table `Classe`
--
ALTER TABLE `Classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`id_professeur`) REFERENCES `Professeur` (`id_professeur`),
  ADD CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Contraintes pour la table `Etablissement`
--
ALTER TABLE `Etablissement`
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`id_Representant_Mairie`) REFERENCES `Mairie` (`id_mairie`),
  ADD CONSTRAINT `etablissement_ibfk_2` FOREIGN KEY (`id_Representant_APEA`) REFERENCES `APEA` (`id_apea`),
  ADD CONSTRAINT `etablissement_ibfk_3` FOREIGN KEY (`actions`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`etablissement_lier`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `Mairie`
--
ALTER TABLE `Mairie`
  ADD CONSTRAINT `mairie_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
