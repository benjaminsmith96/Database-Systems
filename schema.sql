-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2016 at 04:31 PM
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

INSERT INTO `customers` (`Customer_ID`, `Purchases`, `First_Name`, `Last_Name`, `Contact_Number`, `Email`) VALUES
(1, 2, 'Alfred', 'Zane', 353874305928, 'zane.alfred@gmail.com'),
(2, 1, 'Bruce', 'O''Leary', 353892368475, 'oleary.bruce@gmail.com'),
(3, 3, 'Charles', 'Rogers', 353860237945, 'charlesrogers96@hotmail.com'),
(4, 1, 'David', 'Smith', 353983685356, 'smithdavid1@live.com'),
(5, 5, 'Evan', 'Hogan', 353607912898, 'evanhogan88@ymail.com'),
(6, 10, 'Francis', 'Ryan', 353319670343, 'ryan.francis90@gmail.com'),
(7, 0, 'Grace', 'Kelly', 353459702547, 'kellygrace91@live.com'),
(8, 0, 'Hillary', 'King', 353231784632, 'hillary.king1@hotmail.com'),
(9, 0, 'Isaac', 'Keane', 353687093129, 'keane.isaac@gmail.com'),
(10, 0, 'Jim', 'Hartnett', 353857452845, 'jim.hartnett84@gmail.com');

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
(2, 6, 3, 24.99),
(3, 13, 7, 19.99),
(4, 7, 2, 45.99),
(5, 3, 6, 35.99),
(6, 10, 4, 19.99);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `Genre_ID` tinyint(2) NOT NULL AUTO_INCREMENT,
  `Genre_Name` tinytext NOT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`Genre_ID`, `Genre_Name`) VALUES
(1, 'First Person Shooter'),
(2, 'Role Playing'),
(3, 'Racing'),
(4, 'Adventure'),
(5, 'Action'),
(6, 'Fighting'),
(7, 'Strategy');

-- --------------------------------------------------------

--
-- Table structure for table `paytypes`
--

DROP TABLE IF EXISTS `paytypes`;
CREATE TABLE IF NOT EXISTS `paytypes` (
  `Payment_Type_ID` tinyint(2) NOT NULL AUTO_INCREMENT,
  `Payment_Type` text NOT NULL,
  PRIMARY KEY (`Payment_Type_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paytypes`
--

INSERT INTO `paytypes` (`Payment_Type_ID`, `Payment_Type`) VALUES
(1, 'Cash'),
(2, 'Visa Credit'),
(3, 'Visa Debit'),
(4, 'Mastercard Credit'),
(5, 'Mastercard Debit'),
(6, 'American Express Credit'),
(7, 'American Express Debit');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `Sale_ID` bigint(50) NOT NULL AUTO_INCREMENT,
  `Customer_ID` int(10) NOT NULL,
  `Game_ID` int(4) NOT NULL,
  `Quantity` tinyint(2) NOT NULL,
  `Payment_Type_ID` tinyint(2) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Sale_ID`),
  KEY `Customer ID` (`Customer_ID`),
  KEY `Payment Type ID` (`Payment_Type_ID`),
  KEY `Game ID` (`Game_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Sale_ID`, `Customer_ID`, `Game_ID`, `Quantity`, `Payment_Type_ID`, `Date`) VALUES
(1, 1, 1, 1, 1, '2016-01-23 15:22:00'),
(2, 2, 4, 1, 1, '2016-01-24 13:45:00'),
(3, 3, 3, 2, 3, '2016-01-26 14:47:00'),
(4, 1, 3, 1, 1, '2016-01-26 16:29:00'),
(5, 4, 5, 1, 4, '2016-01-29 12:11:00'),
(6, 3, 2, 1, 1, '2016-02-01 12:50:00'),
(7, 5, 4, 5, 3, '2016-02-02 11:13:00'),
(8, 6, 5, 3, 5, '2016-04-02 12:18:00'),
(9, 7, 5, 7, 4, '2016-02-04 16:10:00'),
(10, 8, 5, 6, 2, '2016-02-06 16:10:00'),
(11, 2, 5, 4, 3, '2016-02-06 17:32:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `Genre ID (Restrict Delete - genre)` FOREIGN KEY (`Genre_ID`) REFERENCES `genres` (`Genre_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `Customer ID (Restrict Delete - customer)` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  ADD CONSTRAINT `Game ID (Restrict Delete - game)` FOREIGN KEY (`Game_ID`) REFERENCES `games` (`Game_ID`),
  ADD CONSTRAINT `Payment Type ID (Restrict Delete - paytype)` FOREIGN KEY (`Payment_Type_ID`) REFERENCES `paytypes` (`Payment_Type_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
