-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 09, 2017 at 01:08 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `openears_official`
--
CREATE DATABASE IF NOT EXISTS `openears_official` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `openears_official`;

-- --------------------------------------------------------

--
-- Table structure for table `info_reference`
--

CREATE TABLE IF NOT EXISTS `info_reference` (
  `Info_ID` tinyint(4) NOT NULL,
  `Info_Type` varchar(255) NOT NULL,
  UNIQUE KEY `Info_Reference_Index` (`Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pairing_record`
--

CREATE TABLE IF NOT EXISTS `pairing_record` (
  `SID_Friend` varchar(50) NOT NULL,
  `SID_Warrior` varchar(50) NOT NULL,
  `Date_Start` datetime NOT NULL,
  `Date_End` datetime DEFAULT NULL,
  `End_Reason` text NOT NULL,
  UNIQUE KEY `Pair_Record_Index` (`SID_Friend`,`SID_Warrior`,`Date_Start`),
  KEY `SID_Warrior` (`SID_Warrior`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `SID` varchar(50) NOT NULL,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Major` varchar(255) NOT NULL,
  `Grad_Year` year(4) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Cell` varchar(13) NOT NULL,
  `Is_Friend` tinyint(1) NOT NULL,
  `Is_Warrior` tinyint(1) NOT NULL,
  `Friend_Is_Paired` tinyint(1) DEFAULT '0',
  `Warrior_Is_Paired` tinyint(1) DEFAULT '0',
  UNIQUE KEY `Person_Main_Index` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person_info`
--

CREATE TABLE IF NOT EXISTS `person_info` (
  `SID` varchar(50) NOT NULL,
  `Info_ID` tinyint(4) NOT NULL,
  `Info_Value` text NOT NULL,
  UNIQUE KEY `Person_Info_Index` (`SID`,`Info_ID`,`Info_Value`(767)),
  KEY `Info_ID` (`Info_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `training_record`
--

CREATE TABLE IF NOT EXISTS `training_record` (
  `SID` varchar(255) NOT NULL,
  `Training_Date` date NOT NULL,
  UNIQUE KEY `Training_Index` (`SID`,`Training_Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pairing_record`
--
ALTER TABLE `pairing_record`
  ADD CONSTRAINT `pairing_record_ibfk_2` FOREIGN KEY (`SID_Warrior`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pairing_record_ibfk_1` FOREIGN KEY (`SID_Friend`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person_info`
--
ALTER TABLE `person_info`
  ADD CONSTRAINT `person_info_ibfk_2` FOREIGN KEY (`Info_ID`) REFERENCES `info_reference` (`Info_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `person_info_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `training_record`
--
ALTER TABLE `training_record`
  ADD CONSTRAINT `training_record_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `person` (`SID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
