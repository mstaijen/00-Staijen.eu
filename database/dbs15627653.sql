-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 02 mei 2026 om 19:07
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs15627653`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `albums`
--

CREATE TABLE `albums` (
  `id` int(11) NOT NULL,
  `catalogus_nr` varchar(50) DEFAULT NULL,
  `discogs_id` varchar(50) DEFAULT NULL,
  `artiest` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `jaar` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `drager` varchar(100) DEFAULT NULL,
  `aantal_dragers` int(11) DEFAULT NULL,
  `laatste_update` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `status` enum('in bezit','ontbreekt','wensenlijst') DEFAULT 'in bezit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `families`
--

CREATE TABLE `families` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `families`
--

INSERT INTO `families` (`id`, `name`, `created_at`) VALUES
(1, 'Staijen', '2026-05-02 15:48:57'),
(2, 'Veenstra', '2026-05-02 15:48:57'),
(3, 'Oortwijn', '2026-05-02 15:48:57');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `gender` enum('m','f','x') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `death_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `people`
--

INSERT INTO `people` (`id`, `first_name`, `last_name`, `gender`, `birth_date`, `death_date`, `notes`, `created_at`, `user_id`) VALUES
(1, 'Marcel', 'Staijen', 'm', NULL, NULL, NULL, '2026-05-02 16:39:29', NULL),
(2, 'Marieke', NULL, 'f', NULL, NULL, NULL, '2026-05-02 16:39:29', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `module` varchar(50) NOT NULL,
  `access` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `permissions`
--

INSERT INTO `permissions` (`id`, `person_id`, `module`, `access`) VALUES
(1, 1, 'music', 1),
(2, 1, 'puzzles', 1),
(3, 1, 'tools', 1),
(4, 1, 'tree', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `relationships`
--

CREATE TABLE `relationships` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `related_person_id` int(11) NOT NULL,
  `relation_type` enum('parent','child','partner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tracks`
--

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `positie` int(11) DEFAULT NULL,
  `artiest` varchar(255) DEFAULT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `duur` varchar(20) DEFAULT NULL,
  `jaar` int(11) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `digitaal` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `family_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `family_id`, `created_at`) VALUES
(1, 'admin', '$2y$10$GGPvzsrbVntzHSQ5pxDfrunhnYNiL1ppGomyZNF576I.IHx/V/.ya', 'admin', NULL, '2026-05-02 15:20:30'),
(2, 'mstaijen', '$2y$10$fLeHZDwvUdBzo7dwO6VEE.uE13R7pcXbRCKXCkJqSPvKnD0A7LaVG', 'admin', NULL, '2026-05-02 15:21:08');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `families`
--
ALTER TABLE `families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `relationships`
--
ALTER TABLE `relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
