-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 24 mars 2024 à 13:34
-- Version du serveur : 5.7.11
-- Version de PHP : 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `openeduc`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(255) NOT NULL,
  `nomClasse` varchar(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `classe-niveau`
--

CREATE TABLE `classe-niveau` (
  `id_classe-niveau` int(255) NOT NULL,
  `id_classe` int(255) NOT NULL,
  `id_niveau` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classe-professeur`
--

CREATE TABLE `classe-professeur` (
  `id_classe-professeur` int(255) NOT NULL,
  `id_classe` int(255) NOT NULL,
  `id_professeur` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id_etablissement` int(255) NOT NULL,
  `nomEtablissement` varchar(255) NOT NULL,
  `nbClasse` int(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codePostale` int(255) NOT NULL,
  `numTel` int(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement-evenement`
--

CREATE TABLE `etablissement-evenement` (
  `id_etablissement-evenement` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL,
  `id_evenement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(255) NOT NULL,
  `nom_evenement` varchar(255) NOT NULL,
  `description` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` int(255) NOT NULL,
  `niveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id_professeur` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `civilitee` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(255) NOT NULL,
  `nom_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `civilite` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `numTel` int(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `id_role` int(255) NOT NULL,
  `id_etablissement` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `appartient_a_etablissement` (`id_etablissement`);

--
-- Index pour la table `classe-niveau`
--
ALTER TABLE `classe-niveau`
  ADD PRIMARY KEY (`id_classe-niveau`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `classe-niveau_ibfk_1` (`id_niveau`);

--
-- Index pour la table `classe-professeur`
--
ALTER TABLE `classe-professeur`
  ADD PRIMARY KEY (`id_classe-professeur`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `classe-professeur_ibfk_1` (`id_professeur`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Index pour la table `etablissement-evenement`
--
ALTER TABLE `etablissement-evenement`
  ADD PRIMARY KEY (`id_etablissement-evenement`),
  ADD KEY `id_etablissement` (`id_etablissement`),
  ADD KEY `etablissement-evenement_ibfk_1` (`id_evenement`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`id_evenement`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`id_niveau`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_professeur`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `classe-niveau`
--
ALTER TABLE `classe-niveau`
  MODIFY `id_classe-niveau` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `classe-professeur`
--
ALTER TABLE `classe-professeur`
  MODIFY `id_classe-professeur` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etablissement-evenement`
--
ALTER TABLE `etablissement-evenement`
  MODIFY `id_etablissement-evenement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `classe-niveau`
--
ALTER TABLE `classe-niveau`
  ADD CONSTRAINT `classe-niveau_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Contraintes pour la table `classe-professeur`
--
ALTER TABLE `classe-professeur`
  ADD CONSTRAINT `classe-professeur_ibfk_1` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`);

--
-- Contraintes pour la table `etablissement-evenement`
--
ALTER TABLE `etablissement-evenement`
  ADD CONSTRAINT `etablissement-evenement_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
