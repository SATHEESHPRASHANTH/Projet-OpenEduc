-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 25 mars 2024 à 14:29
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
  `effectif` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`id_classe`, `nomClasse`, `effectif`, `id_etablissement`) VALUES
(1, 'CP Mme Borleau', 20, 1),
(2, 'CE1/CE2 Mme Hetre', 32, 1),
(3, 'CE1/CE2 M Dupent', 34, 1),
(4, 'CM1 M Karma', 28, 1),
(5, 'CM2 Mme Kieffa', 32, 1),
(6, 'CP Mme Bouleau', 29, 2),
(7, 'CE1 Mme Kadifa', 26, 2),
(8, 'CE2 M Sprung', 25, 2),
(9, 'CM1 M Heitz', 28, 2),
(10, 'CM2 Mme Lorentz', 15, 2),
(11, 'CP Bilingue Mme Kumpf, M King', 23, 3),
(12, 'CP/CE1 Bilingue Mme Kumpf, M King', 24, 3),
(13, 'CP/CE1 Mme Laroute', 26, 3),
(14, 'CP/CE1 Mme Charlot', 25, 3),
(15, 'CE1 Bilingue Mme Paturelle, Mme Troussi', 25, 3),
(16, 'CE1/CE2 M Raoult', 28, 3),
(17, 'CE2 M Vinasse', 29, 3),
(18, 'CE2 Bilingue Mme Schwartz, Mme Longlet', 25, 3),
(19, 'CM1 Bilingue M DeTibot', 23, 3),
(20, 'CM1 M Eicher', 25, 3),
(21, 'CM1/CM2 Mme Lallemand', 25, 3),
(22, 'CM2 Bilingue Mme Schwartz, Mme Longlet', 24, 3),
(23, 'CM2 Mme Lalanne', 27, 3);

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

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id_etablissement`, `nomEtablissement`, `nbClasse`, `adresse`, `codePostale`, `numTel`, `email`) VALUES
(1, 'Ecole primaire publique des fontaines', 5, '2 rue des Ecoles', 67870, 388502124, 'ce.0671236E@ac-strasbourg.fr'),
(2, 'Ecole elementaire publique Charles Spindler', 5, '21 rue Mgr Médard Barth', 67530, 388481337, 'ce.0671238G@ac-strasbourg.fr'),
(3, 'Ecole elementaire publique groupe scolaire du Rosenmeer', 13, '11 rue de l\'Eglise', 67560, 388481337, 'ce.0672868D@ac-strasbourg.fr');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `id_evenement` int(255) NOT NULL,
  `nom_evenement` varchar(255) NOT NULL,
  `description` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id_evenement`, `nom_evenement`, `description`) VALUES
(1, 'Achat de livre groupé', 'L\'APEA organise des achats de livres pour les établissements qui en expriment le besoin. Cela peut inclure des livres de cours pour plusieurs classes, des dictionnaires qui seront assignés à des salles de classes ou encore des livres pour le CDI de l\'école.'),
(2, 'Organisation de voyages scolaires', 'L\'APEA aide les établissements à organiser des voyages scolaires, que ce soit en plein air, des voyages d\'intégrations, des stages de sport d\'une semaine ou encore des voyages dans le cadre de certaines matières.'),
(3, 'Organisation de manifestations avec intervenants extérieurs', 'L\'APEA permet aux établissements d\'organiser des évènements avec des intervenants extérieurs, tels que des après midi sur le thème de la sécurité routière, des présentations de certains aspects des forces de l\'ordre ou encore des présentations de différents métiers aux élèves.');

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `id_niveau` int(255) NOT NULL,
  `niveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`id_niveau`, `niveau`) VALUES
(1, 'CP'),
(2, 'CE1'),
(3, 'CE2'),
(4, 'CM1'),
(5, 'CM2');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id_professeur` int(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `civilitee` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_professeur`, `nom`, `civilitee`) VALUES
(1, 'Borleau', 'Madame'),
(2, 'Hetre', 'Madame'),
(3, 'Dupent', 'Monsieur'),
(4, 'Karma', 'Monsieur'),
(5, 'Kieffa', 'Madame'),
(6, 'Bouleau', 'Madame'),
(7, 'Kadifa', 'Madame'),
(8, 'Sprung', 'Monsieur'),
(9, 'Heitz', 'Monsieur'),
(10, 'Lorentz', 'Madame'),
(11, 'Kumpf', 'Madame'),
(12, 'King', 'Monsieur'),
(13, 'Laroute', 'Madame'),
(14, 'Charlot', 'Madame'),
(15, 'Paturelle', 'Madame'),
(16, 'Troussi', 'Madame'),
(17, 'Raoult', 'Monsieur'),
(18, 'Vinasse', 'Monsieur'),
(19, 'Schwartz', 'Madame'),
(20, 'Longlet', 'Madame'),
(21, 'DeTibot', 'Monsieur'),
(22, 'Eicher', 'Monsieur'),
(23, 'Lallemand', 'Madame'),
(24, 'Lalanne', 'Monsieur');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id_role` int(255) NOT NULL,
  `nom_role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nom_role`) VALUES
(1, 'Membre APEA'),
(2, 'Représentant APEA'),
(3, 'Représentant mairie'),
(4, 'Directeur d\'établissement'),
(5, 'Secrétaire général APEA'),
(6, 'admin');

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
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `civilite`, `email`, `numTel`, `pwd`, `id_role`, `id_etablissement`) VALUES
(1, 'admin', 'admin', 'Madame', 'admin@admin.admin', 0, 'admin', 6, NULL);

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
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

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
  MODIFY `id_classe` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `id_evenement` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `id_niveau` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
