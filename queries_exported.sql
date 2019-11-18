-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2016 at 06:25 PM
-- Server version: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `game_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `Game_ID` int(4) NOT NULL AUTO_INCREMENT,
  `Stock` tinyint(2) NOT NULL,
  `Genre_ID` tinyint(2) NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `Genre ID` (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`Game_ID`, `Stock`, `Genre_ID`, `Price`) VALUES
(1, 20, 1, 29.99),
(4, 7, 2, 45.99),
(5, 4, 6, 35.99);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `Genre ID (Restrict Delete - genre)` FOREIGN KEY (`Genre_ID`) REFERENCES `genres` (`Genre_ID`);

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `Customer_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Purchases` int(4) NOT NULL,
  `First_Name` tinytext NOT NULL,
  `Last_Name` tinytext NOT NULL,
  `Contact_Number` bigint(20) NOT NULL,
  `Email` varchar(40) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_ID`, `Number_Of_Purchases`) VALUES
(5, 5);

--
-- Stand-in structure for view `games_priced_higher_than_avg`
--
DROP VIEW IF EXISTS `games_priced_higher_than_avg`;
CREATE TABLE IF NOT EXISTS `games_priced_higher_than_avg` (
`Game_ID` int(4)
,`Stock` tinyint(2)
,`Genre_ID` tinyint(2)
,`Price` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `reward_purchases`
--
DROP VIEW IF EXISTS `reward_purchases`;
CREATE TABLE IF NOT EXISTS `reward_purchases` (
`Customer_ID` int(10)
,`Number_Of_Purchases` bigint(23)
);

-- --------------------------------------------------------

--
-- Structure for view `games_priced_higher_than_avg`
--
DROP TABLE IF EXISTS `games_priced_higher_than_avg`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `games_priced_higher_than_avg`  AS  select `games`.`Game_ID` AS `Game_ID`,`games`.`Stock` AS `Stock`,`games`.`Genre_ID` AS `Genre_ID`,`games`.`Price` AS `Price` from `games` where `games`.`Game_ID` in (select `games`.`Game_ID` from `games` where (`games`.`Price` > (select avg(`games`.`Price`) from `games`))) ;

-- --------------------------------------------------------

--
-- Structure for view `reward_purchases`
--
DROP TABLE IF EXISTS `reward_purchases`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reward_purchases`  AS  select `customers`.`Customer_ID` AS `Customer_ID`,((count(`sales`.`Sale_ID`) + `sales`.`Quantity`) - 1) AS `Number_Of_Purchases` from (`sales` join `customers` on((`sales`.`Customer_ID` = `customers`.`Customer_ID`))) group by `customers`.`Customer_ID` having ((`Number_Of_Purchases` = 5) or (`Number_Of_Purchases` = 10) or (`Number_Of_Purchases` = 15)) ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
