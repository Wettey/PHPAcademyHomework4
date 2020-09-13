-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2020 at 03:22 PM
-- Server version: 10.4.14-MariaDB-1:10.4.14+maria~buster-log
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_backup`
--

-- --------------------------------------------------------

--
-- Table structure for table `battle`
--

CREATE TABLE `battle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `battle`
--

INSERT INTO `battle` (`id`, `name`, `event_time`, `completed`, `description`) VALUES
(1, 'The Great War', '1171-04-27 00:00:00', 0, 'It was horrible.'),
(2, 'Markarth Incident', '1173-07-13 00:00:00', 0, 'Ulfric yeeted the savages off some walls or something.'),
(3, 'Capture of Ulfric', '1200-12-25 00:00:00', 0, 'Gotem. Oh, and Dragoborn comes!'),
(4, 'Battle for Whiterun', '1201-03-01 00:00:00', 0, 'Lorem ipsum dolor sit amet etc.'),
(5, 'Battle for the Rift', '1201-05-13 00:00:00', 0, 'Lorem ipsum dolor sit amet etc.'),
(6, 'Battle for the Pale', '1201-07-15 00:00:00', 0, 'Lorem ipsum dolor sit amet etc.'),
(7, 'Battle for Windhelm', '1202-01-01 00:00:00', 1, 'Lorem ipsum dolor sit amet etc.');

--
-- Triggers `battle`
--
DELIMITER $$
CREATE TRIGGER `soldier_after_war` AFTER UPDATE ON `battle` FOR EACH ROW BEGIN
    UPDATE soldier SET active = 0
    WHERE faction = 2;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `battle_fought`
--

CREATE TABLE `battle_fought` (
  `soldier` int(11) DEFAULT NULL,
  `battle` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `battle_fought`
--

INSERT INTO `battle_fought` (`soldier`, `battle`) VALUES
(2, 1),
(2, 2),
(2, 7),
(3, 1),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 4),
(10, 4),
(11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `faction`
--

CREATE TABLE `faction` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faction`
--

INSERT INTO `faction` (`id`, `name`, `leader`) VALUES
(1, 'Empire', 1),
(2, 'Stormcloaks', 2),
(3, 'Thalmor', 3);

-- --------------------------------------------------------

--
-- Table structure for table `magic`
--

CREATE TABLE `magic` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lethal` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `magic`
--

INSERT INTO `magic` (`id`, `name`, `school`, `lethal`) VALUES
(1, 'Flame', 'Destruction', 1),
(2, 'Frost', 'Destruction', 1),
(3, 'Spark', 'Destruction', 1),
(4, 'Heal', 'Restoration', 0),
(5, 'Stoneflesh', 'Alteration', 0),
(6, 'Candlelight', 'Alteration', 0),
(7, 'Rally', 'Illusion', 0),
(8, 'Summon', 'Conjuration', 1),
(9, 'Unrelenting force', 'Thu\'um', 1),
(10, 'Fire breath', 'Thu\'um', 1);

-- --------------------------------------------------------

--
-- Table structure for table `soldier`
--

CREATE TABLE `soldier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faction` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soldier`
--

INSERT INTO `soldier` (`id`, `name`, `title`, `faction`, `age`, `height`, `active`) VALUES
(1, 'Tullius', 'General', 1, 59, 175.5, 1),
(2, 'Ulfric', 'General', 2, 47, 186.3, 0),
(3, 'Elenwen', 'General', 3, 673, 199, 0),
(4, 'Bleiz', 'Legate', 1, 37, 175.5, 1),
(5, 'Kaire', 'Legate', 3, 145, 175.5, 0),
(6, 'Ralof', 'Private', 2, 32, 175.5, 0),
(7, 'Hadvar', 'Private', 1, 34, 175.5, 1),
(8, 'Rikke', 'Legate', 1, 54, 175.5, 1),
(9, 'Galmar', 'Legate', 2, 57, 175.5, 0),
(10, 'Olfrid', 'Supporter', 1, 82, 175.5, 1),
(11, 'Vignar', 'Supporter', 2, 84, 175.5, 0),
(12, 'Thorald', 'Auxiliary', 2, 47, 175.5, 0),
(13, 'Eorlund', 'Supporter', 2, 65, 175.5, 0),
(14, 'Ondolemar', 'Legate', 3, 170, 204.3, 0),
(15, 'Ancano', 'Agent', 3, 325, 175.5, 0),
(16, 'Hjedu', 'Auxiliary', 1, 29, 175.5, 1),
(17, 'Kurchina', 'Agent', 1, 420, 69, 1),
(18, 'Kyrnold', 'Agent', 2, 23, 175.5, 0),
(19, 'Vinyald', 'Auxiliary', 2, 19, 175.5, 0),
(20, 'Vanabhi', 'Auxiliary', 3, 156, 175.5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `soldier_weapon_magic`
--

CREATE TABLE `soldier_weapon_magic` (
  `soldier` int(11) DEFAULT NULL,
  `weapon` int(11) DEFAULT NULL,
  `magic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soldier_weapon_magic`
--

INSERT INTO `soldier_weapon_magic` (`soldier`, `weapon`, `magic`) VALUES
(1, 4, NULL),
(3, 7, 1),
(3, NULL, 7),
(5, 4, 10),
(6, 5, NULL),
(7, 2, 2),
(8, 9, 3),
(9, 8, 4),
(10, 9, 5),
(11, 9, 5),
(12, 1, 6),
(13, 3, 6),
(14, 6, 7),
(15, 5, 7),
(16, 4, 8),
(17, 3, 8),
(18, 4, 3),
(19, 4, 2),
(20, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `weapon`
--

CREATE TABLE `weapon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weapon`
--

INSERT INTO `weapon` (`id`, `name`, `type`) VALUES
(1, 'Iron piercer', 'Sword'),
(2, 'Iron cutter', 'Axe'),
(3, 'Iron smasher', 'Mace'),
(4, 'Steel cracker', 'Sword'),
(5, 'Steel blood-letter', 'Axe'),
(6, 'Steel crusher', 'Mace'),
(7, 'Elven grace', 'Sword'),
(8, 'Elven swiftness', 'Axe'),
(9, 'Elven might', 'Mace');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `battle`
--
ALTER TABLE `battle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `battle_fought`
--
ALTER TABLE `battle_fought`
  ADD KEY `soldier` (`soldier`),
  ADD KEY `battle` (`battle`);

--
-- Indexes for table `faction`
--
ALTER TABLE `faction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magic`
--
ALTER TABLE `magic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soldier`
--
ALTER TABLE `soldier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faction` (`faction`);

--
-- Indexes for table `soldier_weapon_magic`
--
ALTER TABLE `soldier_weapon_magic`
  ADD KEY `soldier` (`soldier`),
  ADD KEY `weapon` (`weapon`),
  ADD KEY `magic` (`magic`);

--
-- Indexes for table `weapon`
--
ALTER TABLE `weapon`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `battle`
--
ALTER TABLE `battle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `faction`
--
ALTER TABLE `faction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `magic`
--
ALTER TABLE `magic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `soldier`
--
ALTER TABLE `soldier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `weapon`
--
ALTER TABLE `weapon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `battle_fought`
--
ALTER TABLE `battle_fought`
  ADD CONSTRAINT `battle_fought_ibfk_1` FOREIGN KEY (`soldier`) REFERENCES `soldier` (`id`),
  ADD CONSTRAINT `battle_fought_ibfk_2` FOREIGN KEY (`battle`) REFERENCES `battle` (`id`);

--
-- Constraints for table `soldier`
--
ALTER TABLE `soldier`
  ADD CONSTRAINT `soldier_ibfk_1` FOREIGN KEY (`faction`) REFERENCES `faction` (`id`);

--
-- Constraints for table `soldier_weapon_magic`
--
ALTER TABLE `soldier_weapon_magic`
  ADD CONSTRAINT `soldier_weapon_magic_ibfk_1` FOREIGN KEY (`soldier`) REFERENCES `soldier` (`id`),
  ADD CONSTRAINT `soldier_weapon_magic_ibfk_2` FOREIGN KEY (`weapon`) REFERENCES `weapon` (`id`),
  ADD CONSTRAINT `soldier_weapon_magic_ibfk_3` FOREIGN KEY (`magic`) REFERENCES `magic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
