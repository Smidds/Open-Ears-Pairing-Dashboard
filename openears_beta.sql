-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2017 at 06:58 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `openears_beta`
--

-- --------------------------------------------------------

--
-- Table structure for table `friend_info`
--

CREATE TABLE IF NOT EXISTS `friend_info` (
  `SID` varchar(255) NOT NULL,
  `Info_ID` tinyint(4) NOT NULL,
  `Info_Value` text NOT NULL,
  UNIQUE KEY `Friend Info` (`SID`,`Info_ID`),
  KEY `Info_ID` (`Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friend_training`
--

CREATE TABLE IF NOT EXISTS `friend_training` (
  `SID` varchar(255) NOT NULL,
  `Date` date NOT NULL,
  UNIQUE KEY `Training Record` (`SID`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `info_reference`
--

CREATE TABLE IF NOT EXISTS `info_reference` (
  `Info_ID` tinyint(4) NOT NULL,
  `Info_Name` int(11) NOT NULL,
  `Sort_Order` tinyint(4) NOT NULL,
  UNIQUE KEY `Info ID` (`Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `SID` varchar(20) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Grad_Year` year(4) NOT NULL,
  `Major` tinytext NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Cell` int(11) NOT NULL,
  UNIQUE KEY `SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warrior_friend`
--

CREATE TABLE IF NOT EXISTS `warrior_friend` (
  `SID_Warrior` varchar(255) NOT NULL,
  `SID_Friend` varchar(255) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  UNIQUE KEY `pairing` (`SID_Warrior`,`SID_Friend`) COMMENT 'The warrior and friend pair',
  KEY `SID_Friend` (`SID_Friend`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `warrior_info`
--

CREATE TABLE IF NOT EXISTS `warrior_info` (
  `SID` varchar(255) NOT NULL,
  `Info_ID` tinyint(4) NOT NULL,
  `Info_Value` text NOT NULL,
  UNIQUE KEY `Warrior Info` (`SID`,`Info_ID`),
  KEY `Info_ID` (`Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friend_info`
--
ALTER TABLE `friend_info`
  ADD CONSTRAINT `friend_info_ibfk_2` FOREIGN KEY (`Info_ID`) REFERENCES `info_reference` (`Info_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friend_info_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friend_training`
--
ALTER TABLE `friend_training`
  ADD CONSTRAINT `friend_training_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `friend_info` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warrior_friend`
--
ALTER TABLE `warrior_friend`
  ADD CONSTRAINT `warrior_friend_ibfk_2` FOREIGN KEY (`SID_Warrior`) REFERENCES `warrior_info` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warrior_friend_ibfk_1` FOREIGN KEY (`SID_Friend`) REFERENCES `friend_info` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warrior_info`
--
ALTER TABLE `warrior_info`
  ADD CONSTRAINT `warrior_info_ibfk_2` FOREIGN KEY (`Info_ID`) REFERENCES `info_reference` (`Info_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `warrior_info_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
