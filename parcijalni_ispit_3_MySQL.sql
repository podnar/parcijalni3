-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 02, 2022 at 03:56 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parcijalni_ispit_3_MySQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `odjeli`
--

CREATE TABLE `odjeli` (
  `odjeliID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjeli`
--

INSERT INTO `odjeli` (`odjeliID`, `imeOdjela`) VALUES
(1, 'računovodstvo'),
(2, 'prodaja'),
(3, 'marketing');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `odDatuma`, `doDatuma`) VALUES
(1, 8000, '2020-01-01', '2022-11-11'),
(2, 5700, '2020-01-01', '2022-11-11'),
(3, 18000, '2020-01-01', '2022-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `radnoMjesto`
--

CREATE TABLE `radnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `radnoMjesto` varchar(255) NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radnoMjesto`
--

INSERT INTO `radnoMjesto` (`zaposlenikID`, `radnoMjesto`, `odDatuma`, `doDatuma`) VALUES
(1, 'zidar', '2021-05-05', '2017-06-06'),
(2, 'liječnik', '2021-05-05', '2017-06-06'),
(3, 'vozač', '2021-05-05', '2017-06-06'),
(4, 'ribar', '2021-05-05', '2017-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatume` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatume`) VALUES
(1, 2, '2018-11-11', '2022-05-05'),
(2, 1, '2018-11-11', '2022-05-05'),
(3, 3, '2018-11-11', '2022-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `spol` varchar(255) NOT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `ime`, `prezime`, `datumRodjenja`, `spol`, `datumZaposlenja`) VALUES
(1, 'joza', 'jozak', '1999-10-10', 'muški', '2019-01-01'),
(2, 'josip', 'broz', '1900-10-10', 'muški', '2020-11-11'),
(3, 'pajo', 'patak', '1999-10-10', 'muški', '1981-01-01'),
(4, 'franjo', 'tuđman', '1921-10-10', 'muški', '1948-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleniciOdjeli`
--

CREATE TABLE `zaposleniciOdjeli` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposleniciOdjeli`
--

INSERT INTO `zaposleniciOdjeli` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatuma`) VALUES
(1, 1, '2016-05-07', '2022-01-01'),
(2, 1, '2021-05-07', '2022-01-01'),
(3, 1, '2021-05-07', '2022-01-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjeli`
--
ALTER TABLE `odjeli`
  ADD PRIMARY KEY (`odjeliID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`odDatuma`);

--
-- Indexes for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`radnoMjesto`,`odDatuma`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Indexes for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD CONSTRAINT `radnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;

--
-- Constraints for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
