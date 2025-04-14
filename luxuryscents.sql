-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Ápr 14. 18:07
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `luxuryscents`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `parfumok`
--

CREATE TABLE `parfumok` (
  `id` int(11) NOT NULL,
  `marka` varchar(100) NOT NULL,
  `szeria` varchar(100) NOT NULL,
  `rovid_leiras` text DEFAULT NULL,
  `ar` decimal(10,2) NOT NULL CHECK (`ar` >= 0),
  `ertekeles` decimal(3,1) DEFAULT NULL CHECK (`ertekeles` >= 0 and `ertekeles` <= 5),
  `kepUrl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `parfumok`
--

INSERT INTO `parfumok` (`id`, `marka`, `szeria`, `rovid_leiras`, `ar`, `ertekeles`, `kepUrl`) VALUES
(1, 'Chanel', 'No. 5', 'Klasszikus női parfüm', 45000.00, 5.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/chanel-n5.png?raw=true'),
(2, 'Dior', 'Sauvage', 'Friss férfi illat', 35000.00, 4.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/dior-sauvage.png?raw=true'),
(3, 'Gucci', 'Bloom', 'Virágos női parfüm', 30000.00, 4.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/gucci-bloom.png?raw=true'),
(4, 'Tom Ford', 'Black Orchid', 'Luxus unisex illat', 50000.00, 5.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/tomford-blackorchid.png?raw=true'),
(5, 'Yves Saint Laurent', 'Black Opium', 'Érzéki női parfüm', 40000.00, 4.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/ysl-blackopium.png?raw=true'),
(6, 'Creed', 'Aventus', 'Exkluzív férfi illat', 60000.00, 5.0, 'https://github.com/SimonIIstvan/parfum-feladat/blob/main/LuxuryScents/luxury-kepek/creed-aventus.png?raw=true');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reszletes`
--

CREATE TABLE `reszletes` (
  `id` int(11) NOT NULL,
  `reszletes_leiras` text DEFAULT NULL,
  `tipus` varchar(50) DEFAULT NULL,
  `nem` enum('férfi','női','unisex') NOT NULL,
  `illatcsalad` varchar(100) DEFAULT NULL,
  `megjelenes_eve` year(4) DEFAULT NULL,
  `raktaron` int(11) NOT NULL CHECK (`raktaron` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `reszletes`
--

INSERT INTO `reszletes` (`id`, `reszletes_leiras`, `tipus`, `nem`, `illatcsalad`, `megjelenes_eve`, `raktaron`) VALUES
(1, 'A Chanel No. 5 egy ikonikus női parfüm, amelyet 1921-ben hoztak létre. Virágos aldehides illatjegyei eleganciát és időtlenséget sugároznak. A parfümöt gyakran a luxus és a nőiesség szimbólumaként emlegetik.', 'Eau de Parfum', 'női', 'virágos', '1921', 50),
(2, 'A Dior Sauvage egy modern férfi illat, amely 2015-ben debütált. Fűszeres és fás jegyei frissességet és markáns karaktert kölcsönöznek viselőjének. A parfümöt a szabadság és a kalandvágy inspirálta.', 'Eau de Toilette', 'férfi', 'fás', '2015', 30),
(3, 'A Gucci Bloom egy virágos női parfüm, amely 2017-ben jelent meg. A tubarózsa, jázmin és rangoon creeper virágok gazdag illata romantikus és nőies aurát teremt. A parfümöt a természet szépsége és a virágok ereje ihlette.', 'Eau de Parfum', 'női', 'virágos', '2017', 40),
(4, 'A Tom Ford Black Orchid egy luxus unisex illat, amely 2006-ban debütált. Gazdag és érzéki jegyei, mint a fekete orchidea, a szarvasgomba és a pacsuli, titokzatos és csábító atmoszférát teremtenek. A parfümöt a ritka és különleges összetevők ihlették.', 'Eau de Parfum', 'unisex', 'orientális', '2006', 20),
(5, 'Az Yves Saint Laurent Black Opium egy érzéki női parfüm, amely 2014-ben jelent meg. A kávé, a vanília és a fehér virágok kombinációja izgalmas és addiktív illatot eredményez. A parfümöt a modern nő merészsége és függetlensége inspirálta.', 'Eau de Parfum', 'női', 'orientális', '2014', 35),
(6, 'A Creed Aventus egy exkluzív férfi illat, amely 2010-ben debütált. A gyümölcsös és fás jegyek, mint az ananász, a bergamott és a tölgymoha, eleganciát és erőt sugároznak. A parfümöt a történelem nagy vezetői és a győzelem inspirálták.', 'Eau de Parfum', 'férfi', 'gyümölcsös', '2010', 15);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `parfumok`
--
ALTER TABLE `parfumok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `reszletes`
--
ALTER TABLE `reszletes`
  ADD PRIMARY KEY (`id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `reszletes`
--
ALTER TABLE `reszletes`
  ADD CONSTRAINT `reszletes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `parfumok` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
