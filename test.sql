-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2019 at 02:34 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `Address_ID` int(10) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Address_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `Album_ID` int(10) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(255) DEFAULT NULL,
  `album_length` time DEFAULT NULL,
  `explicit_` varchar(255) DEFAULT NULL,
  `Artist_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Album_ID`),
  KEY `Artist_ID` (`Artist_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `Artist_ID` int(10) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(255) DEFAULT NULL,
  `Record_Label_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Artist_ID`),
  KEY `Record_Label_ID` (`Record_Label_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
CREATE TABLE IF NOT EXISTS `cd` (
  `CD_ID` int(10) NOT NULL AUTO_INCREMENT,
  `cd_title` varchar(255) DEFAULT NULL,
  `explicit` varchar(255) DEFAULT NULL,
  `record_label_id` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`CD_ID`),
  KEY `record_label_id` (`record_label_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `Employee_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Record_Label_ID` int(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(10) DEFAULT NULL,
  `mobile` int(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Employee_ID`),
  KEY `Record_Label_ID` (`Record_Label_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `Genre_ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recordlabel`
--

DROP TABLE IF EXISTS `recordlabel`;
CREATE TABLE IF NOT EXISTS `recordlabel` (
  `Record_Label_ID` int(10) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) DEFAULT NULL,
  `address_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Record_Label_ID`),
  KEY `address_id` (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `single`
--

DROP TABLE IF EXISTS `single`;
CREATE TABLE IF NOT EXISTS `single` (
  `Song_ID` int(10) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(255) DEFAULT NULL,
  `song_length` time DEFAULT NULL,
  `explicit_` varchar(255) DEFAULT NULL,
  `Artist_ID` int(10) DEFAULT NULL,
  `genre_id` int(10) DEFAULT NULL,
  `album_id` int(10) DEFAULT NULL,
  `CD_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Song_ID`),
  KEY `Artist_ID` (`Artist_ID`),
  KEY `genre_id` (`genre_id`),
  KEY `album_id` (`album_id`),
  KEY `CD_ID` (`CD_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
