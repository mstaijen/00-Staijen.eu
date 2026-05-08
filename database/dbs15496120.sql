-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 04 mei 2026 om 19:23
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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `puzzels`
--

CREATE TABLE `puzzels` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) DEFAULT NULL,
  `uitgever` varchar(255) DEFAULT NULL,
  `eigenaar_id` int(11) DEFAULT NULL,
  `aantal_stukjes` varchar(255) DEFAULT NULL,
  `jaar` int(11) DEFAULT NULL,
  `compleet` int(11) DEFAULT 1,
  `bijlage` varchar(255) DEFAULT NULL,
  `afbeelding` varchar(255) DEFAULT NULL,
  `aanmaak_datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `mutatie_datum` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_uitgeleend` tinyint(1) NOT NULL DEFAULT 0,
  `uitgeleend_aan` int(11) NOT NULL,
  `uitgeleend_datum` datetime DEFAULT NULL,
  `status_changed_at` datetime DEFAULT NULL,
  `status` enum('beschikbaar','uitgeleend','gelegd') DEFAULT 'beschikbaar',
  `bezig_since` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `puzzels`
--

INSERT INTO `puzzels` (`id`, `titel`, `uitgever`, `eigenaar_id`, `aantal_stukjes`, `jaar`, `compleet`, `bijlage`, `afbeelding`, `aanmaak_datum`, `mutatie_datum`, `is_uitgeleend`, `uitgeleend_aan`, `uitgeleend_datum`, `status_changed_at`, `status`, `bezig_since`) VALUES
(1, 'Sanquin bloedbank', 'Jan van Haasteren', 2, '500', 2022, 1, NULL, '1_sanquin_bloedbank-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(2, 'Wereldkampioenschappen Veldrijden', 'Jan van Haasteren', 2, '1000', 2019, 1, NULL, '2_wereldkampioenschappen_veldrijden-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(3, 'Crazy Casino, Het park, Biljarten', 'Jan van Haasteren', 4, '3 x 1000', 2014, 1, NULL, 'Park, Casino, Biljart.png', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(4, 'Noach\'s Ark', 'Jumbo', 1, '3000', 0, 1, NULL, '4_noach_s_ark-jumbo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(5, 'Aan de lopende band', 'Jan van Haasteren', 4, '950', 2023, 1, '', '5_aan_de_lopende_band-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(6, 'Sinterklaas pakjesavond', 'King', 4, '1000', 0, 1, NULL, '6_sinterklaas_pakjesavond-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(7, 'Sneeuwpret', 'Jan van Haasteren', 4, '950', 2016, 1, NULL, '7_sneeuwpret-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(8, 'Feyenoord Stadion', 'Feyenoord', 4, '1000', 0, 1, NULL, '8_feyenoord_stadion-feyenoord.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(9, 'de IJffeltoren', 'Fluoriseren', 4, '1000', 0, 1, NULL, '9_de_ijffeltoren-fluoriseren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(10, 'Letter for Santa', 'King', 4, '1000', 0, 1, NULL, '10_letter_for_santa-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(11, 'BBQ Feest, de Food truck', 'Jan van Haasteren', 4, '2 x 1000', 2018, 1, NULL, '11_bbq_feest__de_food_truck-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(12, 'Animal World', 'King', 4, '1000', 0, 1, NULL, '12_animal_world-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(13, 'Cruise', 'King', 4, '1000', 0, 1, NULL, '13_cruise-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(14, 'Darts', 'Jan van Haasteren', 4, '1000', 2018, 1, NULL, '14_darts-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(15, 'Times Square (tot hier)', 'King', 3, '1000', 0, 1, NULL, '15_times_square__tot_hier_-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(16, 'Las Vegas', 'King', 3, '1000', 0, 1, NULL, '16_las_vegas-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(17, 'Parijs', 'King', 3, '1000', 0, 1, NULL, '17_parijs-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(18, 'Soccer stadium', 'King', 3, '1000', 0, 1, NULL, '18_soccer_stadium-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(19, 'Pole position', 'King', 3, '1000', 0, 1, NULL, '19_pole_position-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(20, 'Amsterdam King\'s day', 'King', 3, '1000', 0, 1, NULL, '20_amsterdam_king_s_day-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(21, 'Venice', 'King', 3, '1000', 0, 1, NULL, '21_venice-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(22, 'USS Forrestal', 'King', 3, '1000', 0, 1, NULL, '22_uss_forrestal-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(23, 'Santa Express', 'King, That\'s life', 3, '1000', 0, 1, NULL, '23_santa_express-king__that_s_life.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(24, 'Fire station', 'Jan van Haasteren', 3, '950', 2022, 1, NULL, '24_fire_station-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(25, 'The Artiesten', 'Jan van Haasteren', 1, '500', 2011, 1, NULL, '1776350383_b345fe0e.png', '2025-02-13 23:00:00', '2026-04-18 08:41:01', 1, 4, '2026-02-23 16:30:19', NULL, '', NULL),
(26, 'Cottage collection', 'King', 1, '4 x 1000', 0, 1, NULL, '26_cottage_collection-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(27, 'Cottage Pub', 'King', 1, '1000', 0, 1, NULL, '27_cottage_pub-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(28, 'Dolomites kollfusch', 'King', 1, '1000', 0, 1, NULL, '28_dolomites_kollfusch-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(30, 'de Winterspelen', 'Jan van Haasteren', 1, '1000', 2018, 1, NULL, '30_de_winterspelen-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(31, 'Antwerpen', 'Ravensburger', 1, '925', 0, 1, NULL, '31_antwerpen-ravensburger.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(32, 'Brussel', 'Ravensburger', 1, '925', 0, 1, NULL, '32_brussel-ravensburger.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(33, 'Hubo Jubileum puzzel', 'Hubo', 1, '1000', 0, 1, NULL, '33_hubo_jubileum_puzzel-hubo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(34, 'Grand Prix', 'Jan van Haasteren', 1, '1000', 2019, 1, NULL, '34_grand_prix-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(35, 'Top 2000', 'Denksport', 1, '1000', 0, 1, NULL, '35_top_2000-denksport.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(36, 'Nachtwacht', 'Ravensburger', 1, '5000', 0, 1, NULL, '36_nachtwacht-ravensburger.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(37, 'Puzzel Jelte', 'Foto puzzel', 1, '1000', 0, 1, NULL, '37_puzzel_jelte-foto_puzzel.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(38, 'Puzzel Collega\'s Marcel', 'Foto puzzel', 1, '1000', 0, 1, NULL, '38_puzzel_collega_s_marcel-foto_puzzel.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(39, 'Classic puzzelcollection', 'King', 1, '5 x 1000', 0, 1, NULL, '39_classic_puzzelcollection-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(40, 'Amsterdam', 'King', 3, '925', 0, 1, NULL, '40_amsterdam-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(41, 'Poffertjeskraam', 'Anton Pieck', 3, '1000', 0, 1, NULL, '41_poffertjeskraam-anton_pieck.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(42, 'de Kruidenier', 'Anton Pieck', 1, '1000', 0, 1, NULL, '42_de_kruidenier-anton_pieck.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(43, 'Kamperen in het Bos', 'Jan van Haasteren', 1, '1000', 2019, 1, NULL, '43_kamperen_in_het_bos-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(44, 'Vertrekhal', 'Jan van Haasteren', 1, '1000', 2004, 1, NULL, '44_vertrekhal-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(45, 'Volkstuintjes', 'Jan van Haasteren', 1, '1000', 2017, 1, NULL, '45_volkstuintjes-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-18 08:19:37', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(46, 'Uitverkoop', 'Jan van Haasteren', 1, '1000', 2001, 1, NULL, '46_uitverkoop-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(47, 'de Bakkerij', 'Jan van Haasteren', 1, '1000', 2024, 1, NULL, '47_de_bakkerij-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(48, 'Hockey Kampioenschappen', 'Jan van Haasteren', 1, '1000', 2024, 1, NULL, 'Hockey Kampioenschappen.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(49, 'Hoera Nijntje 65 jaar', 'Jan van Haasteren', 1, '1000', 2020, 1, NULL, '49_hoera_nijntje_65_jaar-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(50, 'Westminster Abbey', 'Castorland Puzzels', 1, '3000', 2023, 1, NULL, '50_westminster_abbey-castorland_puzzels.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(51, 'Forrest Cottage', 'Castorland Puzzels', 1, '3000', 2023, 1, NULL, 'Forrest Cottage.png', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(52, 'Montmartre Sacre Coeur', 'Castorland Puzzels', 1, '3000', 2023, 1, NULL, '52_montmartre_sacre_coeur-castorland_puzzels.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(53, 'Street Art', 'Jan van Haasteren', 4, '950', 0, 1, NULL, '53_street_art-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(55, 'Happy Bingo', 'Wasgij Mystery', 1, '1000', 2024, 1, NULL, '55_happy_bingo-wasgij_mystery.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(56, 'de Hondenshow', 'Jan van Haasteren', 1, '1500', 2024, 1, NULL, '56_de_hondenshow-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(57, 'In het fitness-centrum', 'Jan van Haasteren', 1, '1000', 2002, 1, NULL, '57_in_het_fitness-centrum-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(58, 'Camping chaos', 'Jan van Haasteren', 1, '1500', 1986, 0, NULL, '58_camping_chaos-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(59, 'Tour de France', 'Jan van Haasteren', 1, '1500', 2086, 1, NULL, '59_tour_de_france-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(60, 'Vrijdag de 13e', 'Jan van Haasteren', 1, '1500', 2018, 1, NULL, '60_vrijdag_de_13e-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(61, 'de Storm & Safarie', 'Jan van Haasteren', 1, '2 x 1000', 2024, 1, NULL, '61_de_storm___safarie-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(63, 'de Motorrace', 'Jan van Haasteren', 1, '1000', 2024, 1, NULL, '63_de_motorrace-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(64, 'Carnaval - Limited edition 2', 'Jan van Haasteren', 1, '1000', 2012, 1, NULL, '64_carnaval_-_limited_edition_2-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(65, 'Casino - Limited edition 1', 'Jan van Haasteren', 1, '1000', 2012, 1, NULL, 'Casino - Limited edition 1.png', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(66, 'Biljarten - Limited edition 3', 'Jan van Haasteren', 1, '1000', 2012, 0, NULL, '66_biljarten_-_limited_edition_3-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(67, 'Biljarten - oldtimers', 'Jan van Haasteren', 1, '1000', 0, 1, NULL, '67_biljarten_-_oldtimers-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(69, 'Keuken', 'King, That\'s life', 2, '1000', 0, 1, NULL, '69_keuken-king__that_s_life.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(70, 'Kerstman', 'King, That\'s life', 2, '1000', 0, 1, NULL, '70_kerstman-king__that_s_life.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(71, 'Piccadilly Circus', 'King, Comic', 2, '1000', 0, 1, NULL, '71_piccadilly_circus-king__comic.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(72, 'van Harte Beterschap', 'Jan van Haasteren', 2, '1000', 0, 1, NULL, '72_van_harte_beterschap-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(73, 'Disney land Parijs', 'Disneyland', 2, '1000', 0, 1, NULL, '73_disney_land_parijs-disneyland.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(75, 'Tower Bridge, London', 'King', 2, '1000', 0, 1, NULL, '75_tower_bridge__london-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(76, 'Paard in de Wei', 'Ravensburger', 2, '1000', 0, 1, NULL, '76_paard_in_de_wei-ravensburger.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(77, 'Dieren', 'Jumbo', 2, '1000', 0, 1, NULL, '78_jumbo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(78, 'Runderen', 'Fame puzzels', 2, '1000', 0, 1, NULL, '78_runderen-fame_puzzels.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(79, 'Rijksmuseum', 'Rijksmuseum', 2, '500', 0, 1, NULL, '79_rijksmuseum-rijksmuseum.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(80, 'Hubo Jubileum puzzel', 'Hubo', 3, '1000', 0, 1, NULL, '80_hubo_jubileum_puzzel-hubo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(81, '300 jaar Raalte', 'Jumbo', 3, '1000', 1, 1, NULL, '81_300_jaar_raalte-jumbo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(82, 'Amsterdam', 'Ravensburger', 3, '1000', 0, 1, NULL, '82_amsterdam-ravensburger.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(83, 'Brand meester', 'Jan van Haasteren', 3, '500', 0, 1, NULL, '83_brand_meester-jan_van_haasteren.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(84, 'Boomtown Berlijn', 'King', 3, '1000', 0, 1, NULL, '84_boomtown_berlijn-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(85, 'Christmas fair', 'King', 3, '1000', 0, 1, NULL, '85_christmas_fair-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(86, 'Christmas house', 'King', 3, '1000', 0, 1, NULL, '86_christmas_house-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(87, 'Christmas village', 'King', 3, '1000', 0, 1, NULL, '87_christmas_village-king.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(88, 'Hof van Twente', 'Jumbo', 1, '1000', 0, 1, NULL, '88_hof_van_twente-jumbo.jpg', '2025-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(89, 'Santa playing outside', 'King', 3, '1000', 0, 1, NULL, '89_santa_playing_outside-king.jpg', '2024-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(90, 'Santa Polar Express', 'King', 3, '1000', 0, 1, NULL, '90_santa_polar_express-king.jpg', '2024-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(91, 'Santa\'s gifts', 'King', 3, '1000', 0, 1, NULL, '91_santa_s_gifts-king.jpg', '2023-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(92, 'Santa\'s train', 'King', 3, '1000', 0, 1, NULL, '92_santa_s_train-king.jpg', '2023-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(93, 'Santa\'s workshop', 'King', 3, '1000', 0, 1, NULL, '93_santa_s_workshop-king.jpg', '2024-02-13 23:00:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(94, 'Tower Bridge', 'King', 3, '1000', 0, 1, NULL, '94_tower_bridge-king.jpg', '2024-02-13 23:01:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(95, 'Winter fair', 'King', 3, '1000', 0, 1, NULL, '95_winter_fair-king.jpg', '2024-02-13 23:02:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(96, 'Winter fun', 'King', 3, '1000', 0, 1, NULL, '96_winter_fun-king.jpg', '2024-02-13 23:03:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(97, 'Het Dorp van de Kerstman', 'Jan van Haasteren', 1, '1000', 2024, 1, NULL, '97_het_dorp_van_de_kerstman-jan_van_haasteren.jpg', '2024-02-13 23:04:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(98, 'Adventskalender', 'Jan van Haasteren', 1, '1000', 2025, 1, NULL, '98_adventskalender-jan_van_haasteren.jpg', '2025-02-13 23:05:00', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(99, 'Zeepkisten race', 'Jan van Haasteren', 1, '1000', 2025, 1, NULL, '1776498668_2ccad9db.jpg', '2025-02-13 23:06:00', '2026-04-18 07:51:08', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(100, 'Dias de los Mortos', 'Jan van Haasteren', 1, '1000', 2026, 1, NULL, '100_dias_de_los_mortos-jan_van_haasteren.jpg', '2026-04-13 08:12:51', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(101, 'Waterglijbaan gekte', 'Jan van Haasteren - JUNIOR', 1, '360', 2026, 1, NULL, '101_waterglijbaan_gekte-jan_van_haasteren_-_junior.jpg', '2026-04-13 12:55:59', '2026-04-16 11:05:36', 0, 0, NULL, NULL, 'beschikbaar', NULL),
(102, 'de Manege', 'Jan van Haasteren - JUNIOR', 1, '360', 2026, 1, NULL, '102_de_manege-jan_van_haasteren_-_junior.jpg', '2026-04-13 12:56:32', '2026-04-19 02:31:28', 1, 4, '2026-04-19 04:31:28', NULL, 'uitgeleend', NULL),
(103, 'de Ambachtelijke brouwerij', 'Jan van Haasteren', 1, '1000', 2026, 1, NULL, 'De_ambachtelijke_brouwerij_-_Jan_van_Haasteren.jpg', '2026-04-13 17:16:20', '2026-04-18 10:09:00', 0, 0, NULL, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `puzzel_log`
--

CREATE TABLE `puzzel_log` (
  `id` int(11) NOT NULL,
  `puzzel_id` int(11) NOT NULL,
  `eigenaar_id` int(11) NOT NULL,
  `status` enum('beschikbaar','uitgeleend','gelegd') DEFAULT 'beschikbaar',
  `start_datum` datetime NOT NULL,
  `eind_datum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `puzzel_log`
--

INSERT INTO `puzzel_log` (`id`, `puzzel_id`, `eigenaar_id`, `status`, `start_datum`, `eind_datum`) VALUES
(1, 102, 1, '', '2026-04-19 03:35:57', '2026-04-19 03:42:32'),
(2, 102, 4, 'uitgeleend', '2026-04-19 03:42:32', '2026-04-19 03:45:40'),
(3, 102, 4, 'uitgeleend', '2026-04-19 03:45:40', '2026-04-19 04:03:28'),
(4, 102, 0, 'uitgeleend', '2026-04-19 04:03:28', NULL),
(5, 102, 1, 'gelegd', '2026-04-19 04:31:13', NULL),
(6, 102, 1, 'gelegd', '2026-04-19 04:31:15', NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `uitgever`
--

CREATE TABLE `uitgever` (
  `id` int(11) NOT NULL,
  `Naam uitgever` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `uitgever`
--

INSERT INTO `uitgever` (`id`, `Naam uitgever`) VALUES
(1, 'Jan van Haasteren'),
(2, 'King'),
(3, 'Jan van Haasteren - JUNIOR'),
(4, 'Ravensburger'),
(5, 'Fluoriseren'),
(6, 'Jumbo'),
(7, 'Disneyland'),
(8, 'Anton Pieck'),
(9, 'Feyenoord'),
(10, 'Castorland Puzzels'),
(11, 'Hubo'),
(12, 'King, That\'s life'),
(13, 'Hasbro'),
(14, 'Foto puzzel'),
(15, 'Rijksmuseum'),
(16, 'Fame puzzels'),
(17, 'Wasgij');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `eigenaar`
--
ALTER TABLE `eigenaar`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexen voor tabel `puzzels`
--
ALTER TABLE `puzzels`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `puzzel_log`
--
ALTER TABLE `puzzel_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `uitgever`
--
ALTER TABLE `uitgever`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `eigenaar`
--
ALTER TABLE `eigenaar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT voor een tabel `puzzels`
--
ALTER TABLE `puzzels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT voor een tabel `puzzel_log`
--
ALTER TABLE `puzzel_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `uitgever`
--
ALTER TABLE `uitgever`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
