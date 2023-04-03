-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 01. 23:51
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas1`
--
CREATE DATABASE IF NOT EXISTS `utazas1` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `utazas1`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ajanlat_hotel`
--

CREATE TABLE `ajanlat_hotel` (
  `ajanlat_hotel_id` int(11) NOT NULL,
  `ajanlat_hotel_nev` varchar(50) NOT NULL,
  `ajanlat_hotel_szobak_szama` int(11) NOT NULL,
  `ajanlat_hotel_ar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ajanlat_hotel`
--

INSERT INTO `ajanlat_hotel` (`ajanlat_hotel_id`, `ajanlat_hotel_nev`, `ajanlat_hotel_szobak_szama`, `ajanlat_hotel_ar`) VALUES
(1, 'Point A London Liverpool Street', 2, 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ajanlat_varos`
--

CREATE TABLE `ajanlat_varos` (
  `ajanlat_id` int(11) NOT NULL,
  `ajanlat_nev` varchar(50) NOT NULL,
  `ajanlat_nap` varchar(25) NOT NULL,
  `ajanlat_ar` int(11) NOT NULL,
  `ajanlat_varosnev` varchar(25) NOT NULL,
  `ajanlat_kep` varchar(100) NOT NULL,
  `ajanlat_leiras` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `ajanlat_varos`
--

INSERT INTO `ajanlat_varos` (`ajanlat_id`, `ajanlat_nev`, `ajanlat_nap`, `ajanlat_ar`, `ajanlat_varosnev`, `ajanlat_kep`, `ajanlat_leiras`) VALUES
(1, '10 napos kikapcsolódás Londonban', '10', 110000, 'London', 'varoskep1.jpg', 'Utazz Londonba!'),
(2, '10 napos kikapcsolódás Párizsban', '10', 130000, 'Párizs', 'varoskep2.jpg', 'Utazz Párizsba!'),
(3, '10 napos kikapcsolódás Athénban', '10', 90000, 'Athén', 'varoskep3.jpg', 'Utazz Athénba!'),
(4, '10 napos kikapcsolódás Fiji-szigetekre!', '10', 150000, 'Fiji-szigetek', 'varoskep4.jpg', 'Utazz Fiji-szigetekre!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `auto`
--

CREATE TABLE `auto` (
  `auto_id` int(11) NOT NULL,
  `auto_nev` varchar(100) NOT NULL,
  `auto_evjarat` timestamp NULL DEFAULT current_timestamp(),
  `auto_kep` varchar(100) NOT NULL,
  `auto_akcio` varchar(11) NOT NULL,
  `auto_ar` varchar(100) NOT NULL,
  `auto_akcios_ar` varchar(100) NOT NULL,
  `auto_pontozas` float NOT NULL,
  `auto_napiar` varchar(1000) NOT NULL,
  `auto_adatok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `auto`
--

INSERT INTO `auto` (`auto_id`, `auto_nev`, `auto_evjarat`, `auto_kep`, `auto_akcio`, `auto_ar`, `auto_akcios_ar`, `auto_pontozas`, `auto_napiar`, `auto_adatok`) VALUES
(1, 'Mercedes C 300', '2019-06-11 00:24:11', '1.png', '', '75000 Ft', '☒', 8, '14580 Ft/nap', '5 ülés |4 ajtó\r\nLégkondicionáló\r\nAutomata\r\n⛽Felvételkori szint \r\nIngyenes lemondás'),
(2, 'Toyota 2020 Yaris', '2020-01-28 12:13:08', '2.png', 'Akció!', '120000 Ft', '100000 Ft \r\n', 7, '4250 Ft /nap', '5 ülés |5 ajtó\r\nLégkondicionáló\r\nKézi\r\n⛽Felvételkori szint\r\nIngyenes lemondás'),
(3, 'Mazda 2017 CX5', '2017-12-11 22:00:00', '3.png', '', '115000 Ft', '☒', 0, '6580 Ft/nap', '5 ülés |5 ajtó\r\nLégkondicionáló\r\nAutomata\r\n⛽Felvételkori szint\r\nIngyenes lemondás'),
(4, 'BMW i3', '2019-04-16 20:00:00', '4.png', '', '220000 Ft', '☒', 0, '26890 Ft/nap', '4 ülés |5 ajtó\r\nLégkondicionáló\r\nAutomata\r\n⛽Felvételkori szint\r\nIngyenes lemondás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elerhetoseg`
--

CREATE TABLE `elerhetoseg` (
  `el_id` int(11) NOT NULL,
  `el_nev` varchar(100) NOT NULL,
  `eler_szam` int(12) NOT NULL,
  `eler_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `elerhetoseg`
--

INSERT INTO `elerhetoseg` (`el_id`, `el_nev`, `eler_szam`, `eler_email`) VALUES
(1, 'Rácz Péter', 204118483, 'terkosky@gmail.com'),
(2, 'Boros Tamás', 205607454, 'borostamas@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznalo_foid` int(11) NOT NULL,
  `felhasznalo_nev` varchar(40) NOT NULL,
  `felhasznalo_id` varchar(25) NOT NULL,
  `felhasznalo_jelszo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznalo_foid`, `felhasznalo_nev`, `felhasznalo_id`, `felhasznalo_jelszo`) VALUES
(1, '', '123456', 'valami'),
(2, '', '1234567', 'valami2');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznaloutazas`
--

CREATE TABLE `felhasznaloutazas` (
  `felhasznaloutazas_kivalasztott_id` int(11) NOT NULL,
  `felhasznaloutazas_felhasznalokkivalasztott_id` int(11) NOT NULL,
  `felhasznaloutazas_ajanlathonnanvaros` varchar(50) NOT NULL,
  `felhasznaloutazas_ajanlathovavaros` varchar(100) NOT NULL,
  `felhasznaloutazas_kivalasztottdatum` date NOT NULL,
  `felhasznaloutazas_hazamenetdatum` date NOT NULL,
  `felhasznaloutazas_fodarab` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznaloutazas`
--

INSERT INTO `felhasznaloutazas` (`felhasznaloutazas_kivalasztott_id`, `felhasznaloutazas_felhasznalokkivalasztott_id`, `felhasznaloutazas_ajanlathonnanvaros`, `felhasznaloutazas_ajanlathovavaros`, `felhasznaloutazas_kivalasztottdatum`, `felhasznaloutazas_hazamenetdatum`, `felhasznaloutazas_fodarab`) VALUES
(42, 1234567, 'Debrecen', 'London', '2023-03-26', '2023-04-05', '1'),
(43, 123456, 'Debrecen', 'London', '2023-04-10', '2023-04-20', '1');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feltoltes`
--

CREATE TABLE `feltoltes` (
  `feltoltes_id` int(11) NOT NULL,
  `auto_id` int(11) NOT NULL,
  `feltoltes_kep` varchar(100) NOT NULL,
  `feltoltes_ar` varchar(100) NOT NULL,
  `feltoltes_nev` int(11) NOT NULL,
  `feltoltes_evjarat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `feltoltes_adatok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kolcsonzes`
--

CREATE TABLE `kolcsonzes` (
  `kolcsonzes_id` int(11) NOT NULL,
  `auto_id` int(11) NOT NULL,
  `kolcsonzes_datum` date NOT NULL,
  `kolcsonzes_nap` int(11) NOT NULL,
  `kolcsonzes_telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kolcsonzes`
--

INSERT INTO `kolcsonzes` (`kolcsonzes_id`, `auto_id`, `kolcsonzes_datum`, `kolcsonzes_nap`, `kolcsonzes_telefon`) VALUES
(1, 1, '2023-01-16', 7, 20635481),
(2, 2, '2023-01-09', 5, 30967451),
(3, 4, '2023-01-02', 7, 20635481),
(4, 3, '2022-05-16', 7, 20635754);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszagok`
--

CREATE TABLE `orszagok` (
  `orszag_id` int(11) NOT NULL,
  `orszag_nev` varchar(50) NOT NULL,
  `orszag_kep` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orszagok`
--

INSERT INTO `orszagok` (`orszag_id`, `orszag_nev`, `orszag_kep`) VALUES
(1, 'SPANYOLORSZÁG', 'orszagkep1.jpg'),
(2, 'PORTUGÁLIA', 'orszagkep2.jpg'),
(3, 'FRANCIAORSZÁG', 'orszagkep3.jpg'),
(4, 'NAGY-BRITANNIA', 'orszagkep4.jpg'),
(5, 'NORVÉGIA', 'orszagkep5.jpg'),
(6, 'SVÉDORSZÁG', 'orszagkep6.jpg'),
(7, 'FINNORSZÁG', 'orszagkep7.jpg'),
(8, 'NÉMETORSZÁG', 'orszagkep8.jpg'),
(9, 'SVÁJC', 'orszagkep9.jpg'),
(10, 'AUSZTRIA', 'orszagkep10.jpg'),
(11, 'OLASZORSZÁG', 'orszagkep11.jpg'),
(12, 'SZERBIA', 'orszagkep12.jpg'),
(13, 'BULGÁRIA', 'orszagkep13.jpg'),
(14, 'ROMÁNIA', 'orszagkep14.jpg'),
(15, 'SZLOVÁKIA', 'orszagkep15.jpg'),
(16, 'CSEHORSZÁG', 'orszagkep16.jpg'),
(17, 'LENGYELORSZÁG', 'orszagkep17.jpg'),
(18, 'OROSZORSZÁG', 'orszagkep18.jpg'),
(19, 'GÖRÖGORSZÁG', 'orszagkep19.jpg'),
(20, 'TÖRÖKORSZÁG', 'orszagkep20.jpg'),
(21, 'DÁNIA', 'orszagkep21.jpg'),
(22, 'IZLAND', ''),
(23, 'ALBÁNIA', ''),
(24, 'BELGIUM', ''),
(25, 'HOLLANDIA', ''),
(26, 'LUXEMBURG', ''),
(27, 'LIECHTENSTEIN', ''),
(28, 'MÁLTA', ''),
(29, 'CIPRUS', ''),
(30, 'ÍRORSZÁG', ''),
(31, 'EGYIPTOM', ''),
(32, 'MAROKKÓ', ''),
(33, 'INDIA', ''),
(34, 'JAPÁN', ''),
(35, 'KÍNA', ''),
(36, 'KANADA', ''),
(37, 'MEXIKÓ', ''),
(38, 'KUBA', ''),
(39, 'BRAZÍLIA', ''),
(40, 'ARGENTÍNA', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szalloda`
--

CREATE TABLE `szalloda` (
  `szalloda_id` int(11) NOT NULL,
  `szalloda_neve` varchar(100) NOT NULL,
  `csillagok_ertek` int(11) NOT NULL,
  `szalloda_kep` varchar(100) NOT NULL,
  `szalloda_hely` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szalloda`
--

INSERT INTO `szalloda` (`szalloda_id`, `szalloda_neve`, `csillagok_ertek`, `szalloda_kep`, `szalloda_hely`) VALUES
(1, 'Hotel Divinus', 5, 'sz_1.png', ''),
(2, 'PlatanHotel', 4, 'sz_2.png', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varosok`
--

CREATE TABLE `varosok` (
  `varos_id` int(11) NOT NULL,
  `varos_nev` varchar(50) NOT NULL,
  `orszag_id_nev` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `varosok`
--

INSERT INTO `varosok` (`varos_id`, `varos_nev`, `orszag_id_nev`) VALUES
(1, 'MADRID', 1),
(2, 'LISSZABON', 2),
(3, 'PÁRIZS', 3),
(4, 'LONDON', 4),
(5, 'OSLO', 5),
(6, 'STOCKHOLM', 6),
(7, 'HELSINKI', 7),
(8, 'BERLIN', 8),
(9, 'BERN', 9),
(10, 'BÉCS', 10),
(11, 'RÓMA', 11),
(12, 'BELGRÁD', 12),
(13, 'SZÓFIA', 13),
(14, 'POZSONY', 14),
(15, 'PRÁGA', 15),
(16, 'VARSÓ', 16),
(17, 'MOSZKVA', 17),
(18, 'ATHÉN', 18),
(19, 'ANKARA', 19),
(20, 'KOPPENHÁGA', 20),
(21, 'REYKJAVIK', 21),
(22, 'TIRANA', 22),
(23, 'BRÜSSZEL', 23),
(24, 'AMSZTERDAM', 24),
(25, 'LUXEMBOURG', 25),
(26, 'VADUZ', 26),
(27, 'VALLETTA', 27),
(28, 'NICOSIA', 28),
(29, 'DUBLIN', 29),
(30, 'KAIRÓ', 30),
(31, 'RABAT', 31),
(32, 'NEW DELHI', 32),
(33, 'TOKIÓ', 33),
(34, 'PEKING', 34),
(35, 'OTTAWA', 35),
(36, 'MEXIKÓVÁROS', 36),
(37, 'HAVANNA', 37),
(38, 'BRASÍLIA', 38),
(39, 'BUENOS AIRES', 39);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ajanlat_hotel`
--
ALTER TABLE `ajanlat_hotel`
  ADD PRIMARY KEY (`ajanlat_hotel_id`);

--
-- A tábla indexei `ajanlat_varos`
--
ALTER TABLE `ajanlat_varos`
  ADD PRIMARY KEY (`ajanlat_id`),
  ADD KEY `ajanlat_varosnev` (`ajanlat_varosnev`);

--
-- A tábla indexei `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`auto_id`);

--
-- A tábla indexei `elerhetoseg`
--
ALTER TABLE `elerhetoseg`
  ADD PRIMARY KEY (`el_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznalo_foid`),
  ADD KEY `felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `felhasznaloutazas`
--
ALTER TABLE `felhasznaloutazas`
  ADD PRIMARY KEY (`felhasznaloutazas_kivalasztott_id`),
  ADD KEY `felhasznaloutazas_felhasznalokkivalasztott_id` (`felhasznaloutazas_felhasznalokkivalasztott_id`);

--
-- A tábla indexei `feltoltes`
--
ALTER TABLE `feltoltes`
  ADD PRIMARY KEY (`feltoltes_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- A tábla indexei `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  ADD PRIMARY KEY (`kolcsonzes_id`),
  ADD KEY `auto_id` (`auto_id`);

--
-- A tábla indexei `orszagok`
--
ALTER TABLE `orszagok`
  ADD PRIMARY KEY (`orszag_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `szalloda`
--
ALTER TABLE `szalloda`
  ADD PRIMARY KEY (`szalloda_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A tábla indexei `varosok`
--
ALTER TABLE `varosok`
  ADD PRIMARY KEY (`varos_id`),
  ADD KEY `orszag_id_nev` (`orszag_id_nev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ajanlat_hotel`
--
ALTER TABLE `ajanlat_hotel`
  MODIFY `ajanlat_hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `ajanlat_varos`
--
ALTER TABLE `ajanlat_varos`
  MODIFY `ajanlat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `auto`
--
ALTER TABLE `auto`
  MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznalo_foid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `felhasznaloutazas`
--
ALTER TABLE `felhasznaloutazas`
  MODIFY `felhasznaloutazas_kivalasztott_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT a táblához `feltoltes`
--
ALTER TABLE `feltoltes`
  MODIFY `feltoltes_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  MODIFY `kolcsonzes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `orszagok`
--
ALTER TABLE `orszagok`
  MODIFY `orszag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `varosok`
--
ALTER TABLE `varosok`
  MODIFY `varos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `feltoltes`
--
ALTER TABLE `feltoltes`
  ADD CONSTRAINT `feltoltes_ibfk_1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

--
-- Megkötések a táblához `kolcsonzes`
--
ALTER TABLE `kolcsonzes`
  ADD CONSTRAINT `kolcsonzes_ibfk_1` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `varosok`
--
ALTER TABLE `varosok`
  ADD CONSTRAINT `varosok_ibfk_1` FOREIGN KEY (`orszag_id_nev`) REFERENCES `orszagok` (`orszag_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
