-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 28 mars 2024 à 10:26
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
-- Structure de la table `classe_niveau`
--

CREATE TABLE `classe_niveau` (
  `id_classe-niveau` int(255) NOT NULL,
  `id_classe` int(255) NOT NULL,
  `id_niveau` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe_niveau`
--

INSERT INTO `classe_niveau` (`id_classe-niveau`, `id_classe`, `id_niveau`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(4, 3, 2),
(5, 3, 3),
(6, 4, 4),
(7, 5, 5),
(8, 6, 1),
(9, 7, 2),
(10, 8, 3),
(11, 9, 4),
(12, 10, 5),
(13, 11, 1),
(14, 12, 1),
(15, 12, 2),
(16, 13, 1),
(17, 13, 2),
(18, 14, 1),
(19, 14, 2),
(20, 15, 2),
(21, 16, 2),
(22, 16, 3),
(23, 17, 3),
(24, 18, 3),
(25, 19, 4),
(26, 20, 4),
(27, 21, 4),
(28, 21, 5),
(29, 22, 5),
(30, 23, 5);

-- --------------------------------------------------------

--
-- Structure de la table `classe_professeur`
--

CREATE TABLE `classe_professeur` (
  `id_classe-professeur` int(255) NOT NULL,
  `id_classe` int(255) NOT NULL,
  `id_professeur` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `classe_professeur`
--

INSERT INTO `classe_professeur` (`id_classe-professeur`, `id_classe`, `id_professeur`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 11, 12),
(13, 12, 11),
(14, 12, 12),
(15, 13, 13),
(16, 14, 14),
(17, 15, 15),
(18, 15, 16),
(19, 16, 17),
(20, 17, 18),
(21, 18, 19),
(22, 18, 20),
(23, 19, 21),
(24, 20, 22),
(25, 21, 23),
(26, 22, 19),
(27, 22, 20),
(28, 23, 24);

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
(2, 'Ecole &eacute;l&eacute;mentaire publique Charles Spindler', 5, '21 rue Mgr M&eacute;dard Barth', 67530, 388481337, 'ce.0671238G@ac-strasbourg.fr'),
(3, 'Ecole &eacute;l&eacute;mentaire publique groupe scolaire du Rosenmeer', 13, '11 rue de l\'Eglise', 67560, 388481337, 'ce.0672868D@ac-strasbourg.fr');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement_evenement`
--

CREATE TABLE `etablissement_evenement` (
  `id_etablissement-evenement` int(255) NOT NULL,
  `id_etablissement` int(255) NOT NULL,
  `id_evenement` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etablissement_evenement`
--

INSERT INTO `etablissement_evenement` (`id_etablissement-evenement`, `id_etablissement`, `id_evenement`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 3, 3);

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
(1, 'Achat de livre group&eacute;', 'L\'APEA organise des achats de livres pour les &eacute;tablissements qui en expriment le besoin. Cela peut inclure des livres de cours pour plusieurs classes, des dictionnaires qui seront assign&eacute;s &agrave; des salles de classes ou encore des livres pour le CDI de l\'&eacute;cole.'),
(2, 'Organisation de voyages scolaires', 'L\'APEA aide les &eacute;tablissements &agrave; organiser des voyages scolaires, que ce soit en plein air, des voyages d\'int&eacute;grations, des stages de sport d\'une semaine ou encore des voyages dans le cadre de certaines mati&egrave;res.'),
(3, 'Organisation de manifestations avec intervenants ext&eacute;rieurs', 'L\'APEA permet aux &eacute;tablissements d\'organiser des &eacute;v&egrave;nements avec des intervenants ext&eacute;rieurs, tels que des apr&egrave;s midi sur le th&egrave;me de la s&eacute;curit&eacute; routi&egrave;re, des pr&eacute;sentations de certains aspects des forces de l\'ordre ou encore des pr&eacute;sentations de diff&eacute;rents m&eacute;tiers aux &eacute;l&egrave;ves.');

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
(2, 'Repr&eacute;sentant APEA'),
(3, 'Repr&eacute;sentant mairie'),
(4, 'Directeur d\\\'&eacute;tablissement'),
(5, 'Secr&eacute;taire g&eacute;n&eacute;ral APEA'),
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
(1, 'admin', 'admin', 'Madame', 'admin@admin.admin', 0, 'admin', 6, NULL),
(2, 'Hatt', 'Laurent', 'monsieur', 'laurent.hatt@yahoo.com', 638475536, '$2y$10$aW1hXg/JcSFR8S3/7hHJo.aoVGsdQPRBcMnkd8LO51Qoo3uiYTU2W', 5, NULL),
(3, 'admin', 'admin', 'madame', 'admin@admin.ad', 0, '$2y$10$yoBS4zqMujr7fNJpLvMH6ubx/xgHn8QVzKma5YAx9An4162xby9T.', 6, NULL),
(4, 'Bollor&eacute;', 'Yvette', 'madame', 'mairie@boersch.net', 388492865, '$2y$10$nZlXPrJ8aKdcVhhrBL/c5eZoqpXkqyPoe2T8.d3hF2lCFaKnzu6CC', 3, 1),
(5, 'Bourg', 'Yves', 'monsieur', 'education@rosheim.com', 388492760, '$2y$10$3r3tgXV6us1gYcMYERFfm.DaTLmL9tLTkUBjOIYFkwfQkePym5vEO', 3, 3);

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
-- Index pour la table `classe_niveau`
--
ALTER TABLE `classe_niveau`
  ADD PRIMARY KEY (`id_classe-niveau`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `classe-niveau_ibfk_1` (`id_niveau`);

--
-- Index pour la table `classe_professeur`
--
ALTER TABLE `classe_professeur`
  ADD PRIMARY KEY (`id_classe-professeur`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `classe-professeur_ibfk_1` (`id_professeur`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id_etablissement`);

--
-- Index pour la table `etablissement_evenement`
--
ALTER TABLE `etablissement_evenement`
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
  MODIFY `id_classe` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `classe_niveau`
--
ALTER TABLE `classe_niveau`
  MODIFY `id_classe-niveau` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `classe_professeur`
--
ALTER TABLE `classe_professeur`
  MODIFY `id_classe-professeur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id_etablissement` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `etablissement_evenement`
--
ALTER TABLE `etablissement_evenement`
  MODIFY `id_etablissement-evenement` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id_utilisateur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`);

--
-- Contraintes pour la table `classe_niveau`
--
ALTER TABLE `classe_niveau`
  ADD CONSTRAINT `classe_niveau_ibfk_1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau` (`id_niveau`);

--
-- Contraintes pour la table `classe_professeur`
--
ALTER TABLE `classe_professeur`
  ADD CONSTRAINT `classe_professeur_ibfk_1` FOREIGN KEY (`id_professeur`) REFERENCES `professeur` (`id_professeur`);

--
-- Contraintes pour la table `etablissement_evenement`
--
ALTER TABLE `etablissement_evenement`
  ADD CONSTRAINT `etablissement_evenement_ibfk_1` FOREIGN KEY (`id_evenement`) REFERENCES `evenement` (`id_evenement`);

--
-- Contraintes pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD CONSTRAINT `utilisateurs_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
