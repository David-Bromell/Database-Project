-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2019 at 02:06 PM
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
-- Database: `database assignment`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `determinerecordstatus`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `determinerecordstatus` ()  READS SQL DATA
BEGIN

DECLARE recordstat char(30);

SELECT RecordStatus(quantity) INTO recordstat FROM cd;

END$$

DROP PROCEDURE IF EXISTS `myProcedure`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `myProcedure` (IN `Job` VARCHAR(30))  BEGIN
select name from employee where department=job;
END$$

DROP PROCEDURE IF EXISTS `Procedure2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Procedure2` ()  Select * FROM artist WHERE artist_id IN (SELECT artist_id FROM single)$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `RecordStatus`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `RecordStatus` (`copiesSold` INT(10) UNSIGNED) RETURNS CHAR(30) CHARSET hp8 BEGIN

DECLARE recordStatus CHAR(30);

IF copiesSold < 100000 THEN
	SET recordStatus = 'NONE';
ELSEIF copiesSold>100000 AND copiesSold<500000 THEN
	SET recordStatus = 'SILVER';
ELSEIF copiesSold>500000 AND copiesSold<1000000 THEN
	SET recordStatus = 'GOLD';
ELSEIF copiesSold>1000000 THEN
	SET recordStatus = 'PLATINUM';
END IF;

RETURN recordStatus;

END$$

DELIMITER ;

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
  KEY `Artist_ID` (`Artist_ID`),
  KEY `album_ind` (`album_length`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`Album_ID`, `album_name`, `album_length`, `explicit_`, `Artist_ID`) VALUES
(1, 'Bullet Tip', '24:23:00', 'N', 2),
(2, 'Life 2.0', '36:27:00', 'Y', 1),
(3, 'Seven', '18:47:00', 'N', 3),
(4, 'Evolve', '31:08:00', 'Y', 11),
(5, 'Sorry For Party Rocking', '23:56:00', 'Y', 10),
(6, 'Animal + Cannibal', '24:00:00', 'N', 5),
(7, 'No. 6 Collaborations', '13:23:00', 'Y', 6),
(8, 'Revival', '41:14:00', 'Y', 7);

-- --------------------------------------------------------

--
-- Stand-in structure for view `album_public`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `album_public`;
CREATE TABLE IF NOT EXISTS `album_public` (
`album_name` varchar(255)
,`album_length` time
,`explicit_` varchar(255)
);

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
  `Record_Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CD_ID`),
  KEY `record_label_id` (`record_label_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cd`
--

INSERT INTO `cd` (`CD_ID`, `cd_title`, `explicit`, `record_label_id`, `quantity`, `Record_Status`) VALUES
(1, 'Now that’s what I call Music 89', 'Y', 1, 30000, 'GOLD'),
(2, 'Irish Chart Toppers 2019', 'N', 2, 20000, 'GOLD'),
(3, 'Running music megaMix', 'Y', 3, 20000, 'GOLD'),
(4, 'MTV Club Anthems', 'Y', 4, 120000, 'GOLD'),
(5, 'Irish Chart Toppers 2019', 'N', 11, 20000, 'GOLD'),
(6, 'New York Noize', 'N', 13, 20000, 'GOLD'),
(7, 'ChartToppers megaMix 2019', 'N', 9, 36000, 'GOLD'),
(8, 'Testing', 'Yes', 3, 1234563, 'GOLD'),
(9, 'abc', 'N', 1, 1278653, 'GOLD'),
(10, 'test', 'Y', 1, 1002928, 'GOLD'),
(11, 'Archit', 'N', 5, 102937, NULL);

--
-- Triggers `cd`
--
DROP TRIGGER IF EXISTS `callprocedure`;
DELIMITER $$
CREATE TRIGGER `callprocedure` AFTER INSERT ON `cd` FOR EACH ROW #BEGIN

#DECLARE recordstat char(50);

CALL determinerecordstatus;
$$
DELIMITER ;

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
  UNIQUE KEY `myconstraint` (`mobile`),
  KEY `Record_Label_ID` (`Record_Label_ID`),
  KEY `employee_index` (`age`),
  KEY `employee_ind` (`age`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Record_Label_ID`, `name`, `age`, `mobile`, `email`, `department`) VALUES
(1, 4, 'David Bromell', 23, 987654321, 'davidb@warner.com', 'Legal'),
(2, 4, 'Michael Toby', 23, 987654312, 'michaelt@warner.com', 'Artist Management'),
(3, 1, 'Adrian Hogan', 25, 987654123, 'adrian.hogan@sonymusic.com', 'CEO'),
(4, 4, 'David Bromell', 23, 987651234, 'davidb@warner.com', 'Legal'),
(5, 4, 'Michael Toby', 23, 987123456, 'michaelt@warner.com', 'Artist Management'),
(6, 1, 'Adrian Hogan', 25, 981234567, 'adrian.hogan@sonymusic.com', 'CEO'),
(7, 3, 'Archit Khanna', 23, 912345678, 'architk@parlophone.uk', 'Artist Management'),
(8, 2, 'Timon Halbach', 25, 912348765, 'timonh@universalmusic.com', 'Human Resources'),
(9, 2, 'Katie Brophy', 23, 186402748, 'katieb@uiversalmusic.com', 'Finance');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_public`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `employee_public`;
CREATE TABLE IF NOT EXISTS `employee_public` (
`name` varchar(255)
,`age` int(10)
,`department` varchar(255)
);

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
  KEY `CD_ID` (`CD_ID`),
  KEY `single_ind` (`explicit_`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `single`
--

INSERT INTO `single` (`Song_ID`, `song_name`, `song_length`, `explicit_`, `Artist_ID`, `genre_id`, `album_id`, `CD_ID`) VALUES
(1, 'Memories', '03:26:00', 'Y', 3, 1, NULL, 1),
(2, 'Believer', '03:26:00', 'N', 11, 1, 4, 2),
(3, 'Thunder', '02:58:23', 'N', 11, 1, 4, 2),
(4, 'Whatever It Takes', '04:11:56', 'N', 11, 1, 4, 2),
(5, 'Battle', '03:41:00', 'N', 3, 4, 3, 3),
(6, 'Say My Name', '03:15:11', 'Y', 3, 4, 3, 3),
(7, 'Freedom', '03:23:00', 'N', 3, 4, 3, 3),
(8, 'Test', '03:22:00', 'N', 1, 2, 1, 2);

--
-- Triggers `single`
--
DROP TRIGGER IF EXISTS `triggerx2`;
DELIMITER $$
CREATE TRIGGER `triggerx2` AFTER INSERT ON `single` FOR EACH ROW CALL Procedure2()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `single_public`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `single_public`;
CREATE TABLE IF NOT EXISTS `single_public` (
`song_name` varchar(255)
,`song_length` time
,`explicit_` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `album_public`
--
DROP TABLE IF EXISTS `album_public`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `album_public`  AS  select `album`.`album_name` AS `album_name`,`album`.`album_length` AS `album_length`,`album`.`explicit_` AS `explicit_` from `album` ;

-- --------------------------------------------------------

--
-- Structure for view `employee_public`
--
DROP TABLE IF EXISTS `employee_public`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_public`  AS  select `employee`.`name` AS `name`,`employee`.`age` AS `age`,`employee`.`department` AS `department` from `employee` ;

-- --------------------------------------------------------

--
-- Structure for view `single_public`
--
DROP TABLE IF EXISTS `single_public`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `single_public`  AS  select `single`.`song_name` AS `song_name`,`single`.`song_length` AS `song_length`,`single`.`explicit_` AS `explicit_` from `single` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
