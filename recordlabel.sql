-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 16, 2019 at 02:34 PM
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
-- Database: `recordlabel`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `Address_ID` int(10) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `record_label_id` int(10) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Address_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `country_name`, `record_label_id`, `city`) VALUES
(1, 'USA', 1, 'New York'),
(2, 'USA', 2, 'Santa Monica'),
(3, 'UK', 3, 'London'),
(4, 'USA', 4, 'New York'),
(5, 'Germany', 5, 'Gutersloh'),
(6, 'Netherlands', 6, 'Baarn'),
(7, 'USA', 7, 'New York'),
(8, 'USA', 8, 'Los Angeles'),
(9, 'USA', 9, 'Los Angeles'),
(10, 'Ireland', 10, 'Limerick');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`Artist_ID`, `artist_name`, `Record_Label_ID`) VALUES
(3, 'David Guetta', 3),
(2, 'Adrian', 11),
(1, 'Stormzy', 1),
(6, 'Ed Sheeran', 4),
(5, 'Ke$ha', 7),
(4, 'Hans Zimmer', 2),
(7, 'Eminem', 5),
(8, 'Lewis Capaldi', 6),
(9, 'The Script', 9),
(10, 'LMFAO', 8),
(11, 'Imagine Dragons', 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Record_Label_ID`, `name`, `age`, `mobile`, `email`, `department`) VALUES
(1, 4, 'David Bromell', 23, 98765431, 'davidb@warner.com', 'Legal'),
(2, 4, 'Michael Toby', 23, 867915243, 'michaelt@warner.com', 'Artist Management'),
(3, 1, 'Adrian Hogan', 25, 863846471, 'adrian.hogan@sonymusic.com', 'CEO'),
(4, 4, 'David Bromell', 23, 98765431, 'davidb@warner.com', 'Legal'),
(5, 4, 'Michael Toby', 23, 867915243, 'michaelt@warner.com', 'Artist Management'),
(6, 1, 'Adrian Hogan', 25, 863846471, 'adrian.hogan@sonymusic.com', 'CEO'),
(7, 3, 'Archit Khanna', 23, 857234891, 'architk@parlophone.uk', 'Artist Management'),
(8, 2, 'Timon Halbach', 25, 163846302, 'timonh@universalmusic.com', 'Human Resources'),
(9, 2, 'Katie Brophy', 23, 186402748, 'katieb@uiversalmusic.com', 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `Genre_ID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Genre_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`Genre_ID`, `name`) VALUES
(1, 'Pop'),
(2, 'RNB'),
(3, 'HipHop'),
(4, 'House'),
(5, 'Dubstep'),
(6, 'Rap'),
(7, 'Latin'),
(8, 'Transe'),
(9, 'Rock'),
(10, 'Disco');

-- --------------------------------------------------------

--
-- Table structure for table `recordlabel`
--

DROP TABLE IF EXISTS `recordlabel`;
CREATE TABLE IF NOT EXISTS `recordlabel` (
  `Record_Label_ID` int(10) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Record_Label_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recordlabel`
--

INSERT INTO `recordlabel` (`Record_Label_ID`, `label_name`) VALUES
(1, 'Sony Music'),
(2, 'Universal'),
(3, 'Parlophone Records'),
(4, 'Warner Music'),
(5, 'EMI'),
(6, 'BMG'),
(7, 'PolyGram'),
(8, 'Paramount'),
(9, 'Virgin Records'),
(10, 'Capitol Records'),
(11, 'Costellos');

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
