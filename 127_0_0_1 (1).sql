-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Nov 24. 11:15
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nyaralas`
--

CREATE TABLE `nyaralas` (
  `hely_id` int(11) NOT NULL,
  `indulo_nev` varchar(40) COLLATE utf8_hungarian_ci NOT NULL,
  `nyaralas_orszag` int(11) NOT NULL,
  `mettol_datum` date NOT NULL,
  `nyaralas_napszam` int(11) NOT NULL,
  `nyaralas_kep` varchar(255) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `nyaralas`
--

INSERT INTO `nyaralas` (`hely_id`, `indulo_nev`, `nyaralas_orszag`, `mettol_datum`, `nyaralas_napszam`, `nyaralas_kep`) VALUES
(1, 'Korfu 10 napos körút', 1, '2022-11-24', 10, '1.jpg'),
(3, 'Athen 10 napos út', 1, '2022-12-08', 10, '2.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszagok`
--

CREATE TABLE `orszagok` (
  `orszag_id` int(11) NOT NULL,
  `orszag_nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orszagok`
--

INSERT INTO `orszagok` (`orszag_id`, `orszag_nev`) VALUES
(1, 'Görögország'),
(2, 'Kanada');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `nyaralas`
--
ALTER TABLE `nyaralas`
  ADD PRIMARY KEY (`hely_id`),
  ADD KEY `nyaralas_orszag` (`nyaralas_orszag`);

--
-- A tábla indexei `orszagok`
--
ALTER TABLE `orszagok`
  ADD PRIMARY KEY (`orszag_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `nyaralas`
--
ALTER TABLE `nyaralas`
  MODIFY `hely_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `orszagok`
--
ALTER TABLE `orszagok`
  MODIFY `orszag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `nyaralas`
--
ALTER TABLE `nyaralas`
  ADD CONSTRAINT `nyaralas_ibfk_1` FOREIGN KEY (`nyaralas_orszag`) REFERENCES `orszagok` (`orszag_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
