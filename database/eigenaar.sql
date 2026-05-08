-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 07 mei 2026 om 19:17
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
-- Tabelstructuur voor tabel `eigenaar`
--

CREATE TABLE `eigenaar` (
  `id` int(11) NOT NULL,
  `Eigenaarcode` varchar(3) NOT NULL,
  `Deelnemer1` varchar(11) NOT NULL,
  `Deelnemer2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `eigenaar`
--

INSERT INTO `eigenaar` (`id`, `Eigenaarcode`, `Deelnemer1`, `Deelnemer2`) VALUES
(1, 'M&M', 'Marcel', 'Marieke'),
(2, 'B', 'Bjorge', ''),
(3, 'M&L', 'Machiel', 'Loes'),
(4, 'L&R', 'Lindsey', 'Robin');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `eigenaar`
--
ALTER TABLE `eigenaar`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `eigenaar`
--
ALTER TABLE `eigenaar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
