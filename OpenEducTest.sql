-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 21 mars 2024 à 08:50
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
-- Structure de la table `Classe`
--

CREATE TABLE `Classe` (
  `id_classe` int(255) NOT NULL,
  `nomClasse` varchar(255) NOT NULL,
  `id_niveau` int(255) NOT NULL,
  `id_professeur` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Etablissement`
--

CREATE TABLE `Etablissement` (
  `id_etablissement` int(255) NOT NULL,
  `nomEtablissement` varchar(255) NOT NULL,
  `nbClasse` int(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `codePostale` int(255) NOT NULL,
  `numTel` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_evenements` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Evenement`
--

CREATE TABLE `Evenement` (
  `id_evenement` int(255) NOT NULL,
  `nom_evenement` varchar(255) NOT NULL,
  `description` varchar(3000) NOT NULL
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
  `nom` varchar(255) NOT NULL,
  `civilitee` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `id_role` int(255) NOT NULL,
  `nom_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE `Utilisateurs` (
  `id_utilisateur` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `civilite` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `numTel` int(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `id_role` int(255) NOT NULL,
  `id_etablissement` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

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
  ADD KEY `id_evenements` (`id_evenements`);

--
-- Index pour la table `Evenement`
--
ALTER TABLE `Evenement`
  ADD PRIMARY KEY (`id_evenement`);

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
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_etablissement` (`id_etablissement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

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
-- AUTO_INCREMENT pour la table `Niveau`
--
ALTER TABLE `Niveau`
  MODIFY `id_niveau` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `id_utilisateur` int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

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
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`id_evenements`) REFERENCES `Evenement` (`id_evenement`);

--
-- Contraintes pour la table `Evenement`
--
ALTER TABLE `Evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `Etablissement` (`id_evenements`);

--
-- Contraintes pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `Role` (`id_role`),
  ADD CONSTRAINT `utilisateurs_ibfk_2` FOREIGN KEY (`id_etablissement`) REFERENCES `Etablissement` (`id_etablissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
