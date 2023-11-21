-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 31, 2023 at 06:27 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(75) NOT NULL,
  `areaCode` int(3) NOT NULL,
  `phone1` int(3) NOT NULL,
  `phone2` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `password`, `lastName`, `firstName`, `address`, `email`, `areaCode`, `phone1`, `phone2`) VALUES
(1, 'thea', 'asdf', 'Gregory', 'Thea', '314 Pi Lane', 'thea@thea.com', 222, 333, 4444),
(2, 'gtegse', 'asdfg', 'htrttTTTgt', 'htrshsrTTTgt', 'strhhsrthTTTgt', 'trshhtsrTTTgt', 444, 444, 4444);

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

DROP TABLE IF EXISTS `deliveries`;
CREATE TABLE IF NOT EXISTS `deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `postalCode` varchar(6) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryguy`
--

DROP TABLE IF EXISTS `deliveryguy`;
CREATE TABLE IF NOT EXISTS `deliveryguy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `areaCode` int(3) NOT NULL,
  `phone1` int(3) NOT NULL,
  `phone2` int(4) NOT NULL,
  `deliveryArea` varchar(1000) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deliveryguy`
--

INSERT INTO `deliveryguy` (`id`, `name`, `areaCode`, `phone1`, `phone2`, `deliveryArea`, `username`, `password`) VALUES
(1, 'John Doe', 333, 333, 3333, ' hhh', 'john', 'asdf'),
(2, 'John Smith', 555, 555, 5555, ' lll', 'janedoe', 'asdf');

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `username`, `password`, `restaurant_id`) VALUES
(9, 'oooo', 'asdf', 2),
(11, 'kkkk', 'asdf', 3),
(12, 'testManager', 'asdf', 4);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `restaurant_id`) VALUES
(1, 'rice', '3', 2),
(3, 'beans', '4', 2),
(4, 'fries', '6', 2),
(5, 'burger', '4', 4),
(6, 'pizza', '11', 4),
(7, 'poutine', '6', 4),
(8, 'wings', '8', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE IF NOT EXISTS `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `postalCode` varchar(3) NOT NULL,
  `deliveryHr` int(2) NOT NULL,
  `deliveryMin` int(2) NOT NULL,
  `address` varchar(50) NOT NULL,
  `restaurant` int(11) NOT NULL,
  `complete` int(11) NOT NULL DEFAULT '0',
  `delivered` int(11) NOT NULL DEFAULT '0',
  `delivery_guy_id` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `client` (`client`),
  KEY `restaurant` (`restaurant`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`id`, `client`, `year`, `month`, `day`, `postalCode`, `deliveryHr`, `deliveryMin`, `address`, `restaurant`, `complete`, `delivered`, `delivery_guy_id`) VALUES
(1, 1, 2023, 3, 29, 'hhh', 20, 15, '314 Pi Avenue', 2, 0, 0, -1),
(2, 1, 2023, 3, 29, 'hhh', 8, 20, '314 Pi Avenue', 2, 0, 0, -1),
(3, 1, 2023, 3, 29, 'hhh', 20, 25, '314 Pi Avenue', 2, 0, 0, -1),
(4, 1, 2023, 3, 29, 'hhh', 9, 0, '314 Pi Avenue', 2, 0, 0, -1),
(5, 1, 2023, 3, 30, 'hhh', 12, 45, '314 Pi Avenue', 2, 0, 0, -1),
(6, 1, 2023, 3, 30, 'hhh', 9, 30, '314 Pi Avenue', 4, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `menu_item_id` (`menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `menu_item_id`, `quantity`, `order_id`) VALUES
(1, 4, 6, 1),
(2, 1, 4, 1),
(3, 3, 5, 1),
(4, 4, 8, 1),
(8, 1, 4, 4),
(9, 3, 5, 4),
(10, 4, 3, 4),
(14, 5, 4, 6),
(15, 7, 2, 6),
(16, 6, 1, 6),
(17, 8, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restoName` varchar(50) NOT NULL,
  `restoAddress` varchar(200) NOT NULL,
  `areaCode` int(3) NOT NULL,
  `phone1` int(3) NOT NULL,
  `phone2` int(4) NOT NULL,
  `OpenSunAmHr` int(2) NOT NULL,
  `OpenSunMin` int(2) NOT NULL,
  `CloseSunHr` int(2) NOT NULL,
  `CloseSunMin` int(2) NOT NULL,
  `OpenMonHr` int(2) NOT NULL,
  `OpenMonMin` int(2) NOT NULL,
  `CloseMonHr` int(2) NOT NULL,
  `CloseMonMin` int(2) NOT NULL,
  `OpenTuesHr` int(2) NOT NULL,
  `OpenTuesMin` int(2) NOT NULL,
  `ClosedTuesHr` int(2) NOT NULL,
  `ClosedTuesMin` int(2) NOT NULL,
  `OpenWedHr` int(2) NOT NULL,
  `OpenWedMin` int(2) NOT NULL,
  `ClosedWedHr` int(2) NOT NULL,
  `ClosedWedMin` int(2) NOT NULL,
  `OpenThursHr` int(2) NOT NULL,
  `OpenThursMin` int(2) NOT NULL,
  `ClosedThursHr` int(2) NOT NULL,
  `ClosedThursMin` int(2) NOT NULL,
  `OpenFriHr` int(2) NOT NULL,
  `OpenFriMin` int(2) NOT NULL,
  `ClosedFriHr` int(2) NOT NULL,
  `ClosedFriMin` int(2) NOT NULL,
  `OpenSatHr` int(2) NOT NULL,
  `OpenSatMin` int(2) NOT NULL,
  `ClosedSatHr` int(2) NOT NULL,
  `ClosedSatMin` int(2) NOT NULL,
  `deliveryArea` varchar(1000) NOT NULL,
  `managerUsername` varchar(30) NOT NULL,
  `managerPassword` varchar(30) NOT NULL,
  `restauranteurUsername` varchar(30) NOT NULL,
  `restauranteurPassword` varchar(30) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `restoName`, `restoAddress`, `areaCode`, `phone1`, `phone2`, `OpenSunAmHr`, `OpenSunMin`, `CloseSunHr`, `CloseSunMin`, `OpenMonHr`, `OpenMonMin`, `CloseMonHr`, `CloseMonMin`, `OpenTuesHr`, `OpenTuesMin`, `ClosedTuesHr`, `ClosedTuesMin`, `OpenWedHr`, `OpenWedMin`, `ClosedWedHr`, `ClosedWedMin`, `OpenThursHr`, `OpenThursMin`, `ClosedThursHr`, `ClosedThursMin`, `OpenFriHr`, `OpenFriMin`, `ClosedFriHr`, `ClosedFriMin`, `OpenSatHr`, `OpenSatMin`, `ClosedSatHr`, `ClosedSatMin`, `deliveryArea`, `managerUsername`, `managerPassword`, `restauranteurUsername`, `restauranteurPassword`, `active`) VALUES
(1, 'test', 'test', 444, 444, 4444, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, ' qqq', 'tttt', 'asdf', 'llll', 'asdf', 1),
(2, 'test2', 'test lane', 555, 555, 5555, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, ' jjj', 'oooo', 'asdf', 'pppp', 'asdf', 1),
(3, 'test5', 'yyy 66', 777, 777, 7777, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, 1, 0, 7, 0, ' kkk', 'kkkk', 'asdf', 'llll', 'asdf', 2),
(4, 'Rotten Ronnie\'s', '1234 Blah Lane', 333, 333, 3333, 1, 30, 16, 30, 1, 30, 16, 30, 1, 30, 16, 30, 1, 30, 16, 30, 1, 30, 16, 30, 1, 30, 16, 30, 1, 30, 16, 30, ' ggg', 'testManager', 'asdf', 'testResto', 'asdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `restauranteur`
--

DROP TABLE IF EXISTS `restauranteur`;
CREATE TABLE IF NOT EXISTS `restauranteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restauranteur`
--

INSERT INTO `restauranteur` (`id`, `username`, `password`, `restaurant_id`) VALUES
(1, 'kkkk', 'asdf', 3),
(2, 'testResto', 'asdf', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` int(10) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`, `active`) VALUES
(1, 'admin', 'asdf', 1, 1),
(3, 'thea', 'asdf', 2, 1),
(4, 'gtegse', 'asdfg', 2, 2),
(5, 'rottenManager1', 'asdf', 3, 1),
(6, 'nastyChef', 'asdf', 4, 1),
(7, 'test', 'asdf', 3, 1),
(8, 'test1', 'asdf', 4, 1),
(9, 'test2', 'asdf', 3, 1),
(10, 'test3', 'asdf', 4, 1),
(11, 'hhhh', 'asdf', 3, 1),
(12, 'jjjj', 'asdf', 4, 1),
(13, 'oooo', 'asdf', 3, 1),
(14, 'pppp', 'asdf', 4, 1),
(15, 'kkkk', 'asdf', 4, 1),
(16, 'llll', 'asdf', 4, 1),
(17, 'john', 'asdf', 5, 1),
(18, 'janedoe', 'asdf', 5, 2),
(19, 'testManager', 'asdf', 3, 1),
(20, 'testResto', 'asdf', 4, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderinfo` (`id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `menu_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `menu_ibfk_3` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `orderinfo`
--
ALTER TABLE `orderinfo`
  ADD CONSTRAINT `orderinfo_ibfk_1` FOREIGN KEY (`restaurant`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orderinfo` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu` (`id`);

--
-- Constraints for table `restauranteur`
--
ALTER TABLE `restauranteur`
  ADD CONSTRAINT `restauranteur_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
