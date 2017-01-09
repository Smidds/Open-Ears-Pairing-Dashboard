-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 09, 2017 at 01:06 PM
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

--
-- Dumping data for table `info_reference`
--

INSERT INTO `info_reference` (`Info_ID`, `Info_Type`) VALUES
(1, 'Gender_Pref'),
(2, 'Meeting_Pref'),
(3, 'Contact_Pref'),
(4, 'Fight_Experience'),
(5, 'Fight_Current'),
(6, 'Fight_Avoid');

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

--
-- Dumping data for table `pairing_record`
--

INSERT INTO `pairing_record` (`SID_Friend`, `SID_Warrior`, `Date_Start`, `Date_End`, `End_Reason`) VALUES
('isaachs2', 'kpatel2', '2016-11-16 17:14:25', NULL, ''),
('isaachs2', 'skotaski2', '2016-11-07 00:00:00', '2017-01-05 03:55:16', 'I think, thanks to Isaac, that I don''t need to talk anymore! I think I''ve finally won my battle, so I''ll just go back to being just a friend :)'),
('isaachs2', 'ssue2', '2016-11-08 17:19:33', NULL, ''),
('kpatel2', 'hvinnuchi2', '2016-11-16 12:51:18', NULL, ''),
('kpatel2', 'ssue2', '2017-01-05 00:00:00', NULL, ''),
('mpascale2', 'mclark2', '2017-01-11 11:45:11', NULL, ''),
('skotaski2', 'mpascale2', '2016-11-15 00:00:00', '2017-01-03 08:40:54', 'I''m feeling better now thanks to Steve, but I''d like to talk to someone new.');

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

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`SID`, `FName`, `LName`, `Major`, `Grad_Year`, `Email`, `Cell`, `Is_Friend`, `Is_Warrior`, `Friend_Is_Paired`, `Warrior_Is_Paired`) VALUES
('hvinnuchi2', 'Harvey', 'Vinnuchi', 'Actuarial Science', 2017, 'hvinnuchi2@illinois.edu', '7086744571', 0, 1, 0, 1),
('isaachs2', 'Isaac', 'Smith', 'Undeclared', 2020, 'isaachs2@illinois.edu', '7086744571', 1, 0, 1, 0),
('jsmith2', 'John', 'Smith', 'Journalism', 2019, 'jsmith2@illinois.edu', '7086744571', 0, 1, 0, 0),
('kpatel2', 'Krupa', 'Patel', 'Computer Science', 2018, 'kpatel2@illinois.edu', '7086744571', 1, 1, 1, 1),
('mclark2', 'Molly', 'Clark', 'Chemistry', 2020, 'mclark2@illinois.edu', '7086744571', 0, 1, 0, 1),
('mpascale2', 'Marissa', 'Pascaleff', 'Economics', 2019, 'mpascale2@illinois.edu', '7086744571', 1, 1, 1, 0),
('skotaski2', 'Steve', 'Kotaski', 'French', 2020, 'skotaski2@illinois.edu', '7086744571', 1, 0, 0, 0),
('ssue2', 'Sally', 'Sue', 'Biological Engineering', 2018, 'ssue2@illinois.edu', '7086744571', 0, 1, 0, 1);

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

--
-- Dumping data for table `person_info`
--

INSERT INTO `person_info` (`SID`, `Info_ID`, `Info_Value`) VALUES
('hvinnuchi2', 1, 'M'),
('hvinnuchi2', 3, 'Call Cell'),
('hvinnuchi2', 3, 'Text Cell'),
('hvinnuchi2', 3, 'Email'),
('hvinnuchi2', 5, 'Depression and Anxiety'),
('isaachs2', 1, 'NA'),
('isaachs2', 2, 'Anywhere'),
('isaachs2', 3, 'In Person'),
('isaachs2', 3, 'Text Cell'),
('isaachs2', 3, 'Call Cell'),
('isaachs2', 3, 'Email'),
('isaachs2', 4, 'Depression and Anxiety'),
('jsmith2', 1, 'Female'),
('jsmith2', 2, 'Private'),
('jsmith2', 3, 'In Person'),
('jsmith2', 3, 'Text Cell'),
('jsmith2', 3, 'Call Cell'),
('jsmith2', 3, 'Email'),
('jsmith2', 5, 'Test Anxiety'),
('kpatel2', 1, 'Female'),
('kpatel2', 2, 'Public'),
('kpatel2', 3, 'In Person'),
('kpatel2', 3, 'Text Cell'),
('kpatel2', 4, 'Test Anxiety'),
('kpatel2', 5, 'Test Anxiety'),
('kpatel2', 6, 'Sexual Assault'),
('mclark2', 1, 'F'),
('mclark2', 2, 'Private'),
('mclark2', 3, 'In Person'),
('mclark2', 3, 'Text Cell'),
('mclark2', 5, 'Sexual Assault'),
('mpascale2', 1, 'NA'),
('mpascale2', 3, 'Text Cell'),
('mpascale2', 3, 'Call Cell'),
('mpascale2', 3, 'Email'),
('mpascale2', 4, 'Test Anxiety, Depression, and Eating Disorders'),
('mpascale2', 5, 'Depression'),
('mpascale2', 6, 'Test Anxiety'),
('skotaski2', 1, 'NA'),
('skotaski2', 2, 'In Person'),
('skotaski2', 3, 'Anywhere'),
('skotaski2', 3, 'Text Cell'),
('skotaski2', 3, 'Call Cell'),
('skotaski2', 3, 'Email'),
('skotaski2', 4, 'Self Harm'),
('skotaski2', 6, 'Assualt or Self Harm'),
('ssue2', 1, 'F'),
('ssue2', 3, 'Email'),
('ssue2', 3, 'Text Cell'),
('ssue2', 5, 'Sexual Assault and Self Harm');

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
-- Dumping data for table `training_record`
--

INSERT INTO `training_record` (`SID`, `Training_Date`) VALUES
('isaachs2', '2016-10-05'),
('isaachs2', '2016-11-16'),
('kpatel2', '2016-12-21'),
('kpatel2', '2017-01-03'),
('mpascale2', '2016-11-16'),
('mpascale2', '2017-01-11'),
('skotaski2', '2017-01-19');

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
