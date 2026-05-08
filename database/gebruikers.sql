-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 07 mei 2026 om 19:14
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
-- Database: `dbs15496120`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

CREATE TABLE `gebruikers` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(100) NOT NULL,
  `achternaam` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','User','Gast') NOT NULL,
  `email` varchar(255) NOT NULL,
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_token_expire` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gebruikers`
--

INSERT INTO `gebruikers` (`id`, `voornaam`, `achternaam`, `username`, `password`, `role`, `email`, `reset_token`, `reset_token_expire`) VALUES
(1, 'Marieke', 'Staijen', 'Marieke', '$2y$12$zyzM24c/KC8XVtGEmsJ3m.AZwNM1IzB51Lpa03rJCHm1z5KdiHM6G', 'User', 'Mariekestaijen@gmail.com', NULL, NULL),
(2, 'Marcel', 'Staijen', 'Admin', '$2y$10$TlBJI7LfaKqC1nHasOfiUuvPYnLprQuYnbrnK2j/AAgYz9Yy0tJyO', 'Admin', 'mstaijen@gmail.com', '55c143e37f9e0e1dd63917460bb59e8bc6510a92ab4c160b0a4b0fe34062ba05', '2026-04-16 19:48:04'),
(3, 'Bkorge', 'Staijen', 'Bjorge', '$2y$10$yr9J1r0pRIJdm.S2CQ7M2.i4ehkQ.Tm4.M3E4aHLb5jQ.bvV2qAcO', 'Admin', 'bstaijen@gmail.com', NULL, NULL),
(7, 'Machiel', 'Staijen', 'Machiel', '$2y$12$RZOxfypjxTlJ0stUw2P5nOwDVO8.lHXnpnkRYZSp5oSsttqWmMDi.', 'User', 'machielstaijen@gmail.com', NULL, NULL),
(10, 'Loes', 'Staijen', 'Loes', '', 'User', 'Loes@staijen.eu', NULL, NULL),
(13, 'Lindsey', 'Veenstra', 'Lindsey', '', 'User', 'lindseystaijen@msn.com', NULL, NULL),
(14, 'Robin', 'Veenstra', 'Robin', '', 'User', 'robinveenstra91@gmail.com', NULL, NULL);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
