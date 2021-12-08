-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 22 nov. 2021 à 10:32
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mangas`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id_commentaire` int(11) NOT NULL,
  `lib_commentaire` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_manga` int(11) NOT NULL,
  `id_lecteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id_commentaire`, `lib_commentaire`, `id_manga`, `id_lecteur`) VALUES
(1, 'Excellent manga qui nous emporte dans une deuxième aventure très passionnante', 1, 4),
(3, 'Je suis d\'accord avec Vincent ce tome 2 est excellent, je le recommande à toutes et à tous.', 1, 5),
(8, 'test', 5, 10);

-- --------------------------------------------------------

--
-- Structure de la table `dessinateur`
--

CREATE TABLE `dessinateur` (
  `id_dessinateur` int(11) NOT NULL,
  `nom_dessinateur` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom_dessinateur` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `dessinateur`
--

INSERT INTO `dessinateur` (`id_dessinateur`, `nom_dessinateur`, `prenom_dessinateur`) VALUES
(1, 'TITE', 'Kubo'),
(2, 'ONE', ''),
(3, 'TORIYAMA', 'Akira'),
(4, 'YUSUKE', 'Murata'),
(5, 'OBA', 'Tsugumi'),
(6, 'IWAAKI', 'Hitoshi '),
(7, 'OBATA', 'Takeshi '),
(8, 'TOGASHI', 'Yoshihiro ');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `lib_genre` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id_genre`, `lib_genre`) VALUES
(1, 'Aventure'),
(2, 'Tanche-de-vie'),
(3, 'Action'),
(4, 'Science-fiction'),
(5, 'Suspense'),
(6, 'Policier'),
(7, 'Sport');

-- --------------------------------------------------------

--
-- Structure de la table `lecteur`
--

CREATE TABLE `lecteur` (
  `id_lecteur` int(11) NOT NULL,
  `nom` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rue` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `lecteur`
--

INSERT INTO `lecteur` (`id_lecteur`, `nom`, `prenom`, `rue`, `cp`, `ville`) VALUES
(1, 'Administrateur', '', '', '', ''),
(2, 'Hochet', 'Eric', '23, Rue de Gallets', '69008', 'Lyon'),
(3, 'Auchon', 'Paul', '18 avenue des Trois lits', '69007', 'Lyon'),
(4, 'Thimaitre', 'Vincent', '24 Rue des Géants', '69005', 'Lyon'),
(5, 'Dhort', 'Louis', '1789 Rue de Versailles', '69006', 'Lyon'),
(6, 'Annie', 'Zhette', '45, Rue des Alouettes', '69004', 'Lyon'),
(7, 'Dhort', 'Jean', '78, Av. 11 Novembre', '69002', 'Lyon'),
(8, 'Seize', 'Louis', '35, Av. de la République', '69001', 'Lyon'),
(9, 'Fassol', 'Rémi', '124, Chemin des Alizés', '69008', 'Lyon'),
(10, 'Thimaitre', 'Vincent', '3, Rue du Mètre', '69005', 'Lyon'),
(11, 'Kyroul', 'Pierre', '12, Rue du Papillon bleu', '69009', 'Lyon'),
(12, 'Dexc', 'Alain', '83, Rue de la Liberté', '69004', 'Lyon'),
(13, 'Néa', 'Ali', '19, Cours Albert Premier', '69007', 'Lyon'),
(14, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

CREATE TABLE `manga` (
  `id_manga` int(11) NOT NULL,
  `id_dessinateur` int(11) NOT NULL,
  `id_scenariste` int(11) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `titre` varchar(250) COLLATE utf8_bin NOT NULL,
  `couverture` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `id_genre` int(11) NOT NULL,
  `id_lecteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `manga`
--

INSERT INTO `manga` (`id_manga`, `id_dessinateur`, `id_scenariste`, `prix`, `titre`, `couverture`, `id_genre`, `id_lecteur`) VALUES
(1, 1, 1, '12.50', 'Akatsuki Vol.2', 'akatsuki-02.jpg', 1, 3),
(2, 2, 2, '10.90', 'Collège Fou Fou Fou (le)', 'college-fou-fou-fou.jpg', 2, 3),
(3, 3, 4, '8.75', 'Yu-Gi-Oh ! 5D\'s Vol.9', 'yu-gi-oh-5d-jp-9_m.jpg', 1, 6),
(4, 5, 6, '9.90', 'Hack - Le bracelet du crépuscule', 'hack_01_m.jpg', 1, 6),
(5, 7, 8, '12.25', '7 Yakuzas', '7yakuzas_m.jpg', 3, 11),
(6, 3, 8, '11.78', '7 milliards d\'aiguilles', '7-milliards-aiguilles.jpg', 6, 11);

--
-- Déclencheurs `manga`
--
DELIMITER $$
CREATE TRIGGER `tbi_manga` BEFORE INSERT ON `manga` FOR EACH ROW begin
	declare ck_manga_prix condition for sqlstate '45000';
	if (new.prix <= 0) then
		signal ck_manga_prix set message_text = 'ck_manga_prix : prix négatif.';
	end if;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tbu_manga` BEFORE UPDATE ON `manga` FOR EACH ROW begin
	declare ck_manga_prix condition for sqlstate '45000';
	if (new.prix <= 0) then
		signal ck_manga_prix set message_text = 'ck_manga_prix : prix négatif.';
	end if;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `scenariste`
--

CREATE TABLE `scenariste` (
  `id_scenariste` int(11) NOT NULL,
  `nom_scenariste` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom_scenariste` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `scenariste`
--

INSERT INTO `scenariste` (`id_scenariste`, `nom_scenariste`, `prenom_scenariste`) VALUES
(1, 'TITE', 'Kubo'),
(2, 'ONE', ''),
(3, 'TORIYAMA', 'Akira'),
(4, 'YUSUKE', 'Murata'),
(5, 'OBA', 'Tsugumi'),
(6, 'IWAAKI', 'Hitoshi '),
(7, 'OBATA', 'Takeshi '),
(8, 'TOGASHI', 'Yoshihiro ');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `etat` enum('actif','inactif') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'actif',
  `role` enum('comment','contrib','admin') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'comment',
  `api_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `etat`, `role`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'administrateur@chezmoi.fr', NULL, '$2y$10$/ijfE87C6d.R.Z0kRyOUAOwL76YqoNfMCLlnd5hK9a5NYj5Yef8uK', 'actif', 'admin', NULL, NULL, '2019-09-30 07:29:38', '2021-10-11 08:33:40'),
(2, 'eric.hochet@chezmoi.fr', NULL, '$2y$10$P2kuQRIGV.cFxgdQrN31tOm8AKAbg1MJzL3WNhwAfV3NRhMIUrep.', 'actif', 'comment', NULL, NULL, '2020-02-09 13:28:10', '2020-02-09 13:28:10'),
(3, 'paul.auchon@chezmoi.fr', NULL, '$2y$10$xxqOyNs5Zf2amp0NjAWBROtOfY4r1D/D9OjneDyL4aWZ5oPB8SbSy', 'actif', 'contrib', NULL, NULL, '2020-02-09 13:28:53', '2021-10-12 06:30:45'),
(4, 'sylvie.anquore@chezmoi.fr', NULL, '$2y$10$ySunSySr1E7rxlHloNyd4OY9Lvwj7HLCj8mBVMRSjQZW4.dgZI3tO', 'actif', 'comment', NULL, NULL, '2020-02-09 13:29:10', '2020-02-09 13:29:10'),
(5, 'louis.dhort@chezmoi.fr', NULL, '$2y$10$gqkbPhXxCOhun1u120RbMOO1HOaWI.PxmaWQLuOMOQpWS3U3MUaPO', 'actif', 'comment', NULL, NULL, '2019-09-30 07:48:38', '2021-10-25 07:01:25'),
(6, 'annie.zhette@chezmoi.fr', NULL, '$2y$10$L4s/YFZcjQowKUEpeheAMOhn8sYfGlm7Quz57D6d7OyKd3293J4l6', 'actif', 'contrib', NULL, NULL, '2020-02-09 13:18:30', '2020-02-09 13:18:30'),
(7, 'jean.dhort@chezmoi.fr', NULL, '$2y$10$kflNjhQe3vHA.TX3vl.ce.1EEhR2IrHldb76NkQC4oHXBCosXPWRe', 'actif', 'comment', NULL, NULL, '2020-02-09 13:20:32', '2020-02-09 13:20:32'),
(8, 'louis.seize@chezmoi.fr', NULL, '$2y$10$fXxIvpDyuejG1BYB68JAAO.Q.YBeVIhKesuNLByrkDH0HBkFPZ4uK', 'actif', 'comment', NULL, NULL, '2020-02-09 13:25:34', '2020-02-09 13:25:34'),
(9, 'remi.fassol@chezmoi.fr', NULL, '$2y$10$IcwLwXUglvYIZx7.IUNJ8u654t5HYWOzwH.ebDurdh8nEuLIwSaEi', 'actif', 'comment', NULL, NULL, '2020-02-09 13:25:51', '2020-02-09 13:25:51'),
(10, 'vincent.thimaitre@chezmoi.fr', NULL, '$2y$10$wgTcpPHKgYLmNIld.t6AxekaMnO./VNxIOr/PxEg6VszLbnr16DQC', 'actif', 'comment', 'Xjy4qQVdNdUvbRbv7RkCuNcCg1vAMNDXQGGyETz14MPN1qP5YOUaWVjAmOby', NULL, '2020-02-09 13:27:05', '2021-10-25 07:06:20'),
(11, 'pierre.kyroul@chezmoi.fr', NULL, '$2y$10$/E5VGDzBwevSvBa9Jgd/Be8gWuAbOUm4klg9USCrAicKszWytByS6', 'actif', 'contrib', NULL, NULL, '2020-02-09 13:27:40', '2021-10-25 05:59:00'),
(12, 'alain.decx@chezmoi.fr', NULL, '$2y$10$Q.O/WfIN8yB3givbYBG02ubH2CfxZAMkMcHUfw/i.0ihpzJkIiVZO', 'actif', 'comment', NULL, NULL, '2020-02-09 13:29:32', '2020-02-09 13:29:32'),
(13, 'ali.nea@chezmoi.fr', NULL, '$2y$10$NlcV1Yq0IfnHWSGZfDqPmOYMTHPmz5I/mslsJKauXTdkpubbfnHTu', 'actif', 'comment', NULL, NULL, '2020-02-09 13:54:09', '2020-02-09 13:54:09'),
(14, 'alex.therrieur@chezmoi.fr', NULL, '$2y$10$5Z5kXNW0PH0aUCjlpApDQuOplg.VMf3eIHASW/1J.YbzOro9JMgki', 'actif', 'comment', 'JBzAde65JBHYVACeZtox6Nh3Y2LBnguZmDsDjSCXpYG9hXjJRuZysN0aJHlV', NULL, '2021-10-04 11:37:34', '2021-10-04 11:37:34');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `fk_commentaire_manga` (`id_manga`),
  ADD KEY `fk_commentaire_lecteur` (`id_lecteur`);

--
-- Index pour la table `dessinateur`
--
ALTER TABLE `dessinateur`
  ADD PRIMARY KEY (`id_dessinateur`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Index pour la table `lecteur`
--
ALTER TABLE `lecteur`
  ADD PRIMARY KEY (`id_lecteur`);

--
-- Index pour la table `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`id_manga`),
  ADD KEY `fk_manga_genre` (`id_genre`),
  ADD KEY `fk_manga_scenariste` (`id_scenariste`),
  ADD KEY `fk_manga_dessinateur` (`id_dessinateur`),
  ADD KEY `fk_manga_lecteur` (`id_lecteur`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `scenariste`
--
ALTER TABLE `scenariste`
  ADD PRIMARY KEY (`id_scenariste`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `dessinateur`
--
ALTER TABLE `dessinateur`
  MODIFY `id_dessinateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `manga`
--
ALTER TABLE `manga`
  MODIFY `id_manga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `scenariste`
--
ALTER TABLE `scenariste`
  MODIFY `id_scenariste` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `fk_commentaire_lecteur` FOREIGN KEY (`id_lecteur`) REFERENCES `lecteur` (`id_lecteur`),
  ADD CONSTRAINT `fk_commentaire_manga` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`);

--
-- Contraintes pour la table `manga`
--
ALTER TABLE `manga`
  ADD CONSTRAINT `fk_manga_dessinateur` FOREIGN KEY (`id_dessinateur`) REFERENCES `dessinateur` (`id_dessinateur`),
  ADD CONSTRAINT `fk_manga_genre` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `fk_manga_lecteur` FOREIGN KEY (`id_lecteur`) REFERENCES `lecteur` (`id_lecteur`),
  ADD CONSTRAINT `fk_manga_scenariste` FOREIGN KEY (`id_scenariste`) REFERENCES `scenariste` (`id_scenariste`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
