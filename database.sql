-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 05, 2023 at 06:06 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edoc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aemail`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@dentalcare.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `appoid` int NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `apponum` int DEFAULT NULL,
  `scheduleid` int DEFAULT NULL,
  `appodate` date DEFAULT NULL,
  PRIMARY KEY (`appoid`),
  KEY `pid` (`pid`),
  KEY `scheduleid` (`scheduleid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `docid` int NOT NULL AUTO_INCREMENT,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `specialties` (`specialties`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'doctor@dentalcare.com', 'sam', '123', '000000000', '0110000000', 1),
(7, 'bhumi@dentalcare.com', 'bhumi', '123', '843774', '927828292', 5),
(6, 'appu@dentalcare.com', 'appu', '123', '56887', '+913433768988', 1),
(8, 'sss@dentalcare.com', 'sss', 'Sssss12', '89773', '9876345677', 8);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(11, 'apoo@gmail.com', 'apoo jjj', 'Apoo12345', 'hhh', '7877', '2023-06-30', '0788564455'),
(10, 'swathi@gmail.com', 'swathi s', 'Swathi1234', 'udupi', '8967566', '2023-04-06', '0123456789'),
(13, 'niri@gmail.com', 'niri h', 'Niriksha1234', 'hebri', '67788', '2021-02-06', '+919876654321');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE IF NOT EXISTS `schedule` (
  `scheduleid` int NOT NULL AUTO_INCREMENT,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int DEFAULT NULL,
  PRIMARY KEY (`scheduleid`),
  KEY `docid` (`docid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(22, '6', 'filling', '2023-07-05', '16:30:00', 2),
(23, '1', 'root canal', '2023-07-19', '16:26:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
CREATE TABLE IF NOT EXISTS `specialties` (
  `id` int NOT NULL,
  `sname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(20, 'Dental Oncology'),
(19, 'Sports Dentistry'),
(18, 'Special Needs Dentistry'),
(17, 'Esthetic Dentistry'),
(16, 'Orofacial Pain and Temporomandibular Disorders'),
(15, 'Dental Sleep Medicine'),
(14, 'Geriatric Dentistry'),
(13, 'Forensic Odontology'),
(12, 'Dental Implantology'),
(11, 'Dental Anesthesiology'),
(10, 'Oral Medicine'),
(9, 'Dental Public Health'),
(8, 'Oral and Maxillofacial Pathology'),
(7, 'Oral and Maxillofacial Radiology'),
(6, 'Endodontics'),
(5, 'Prosthodontics'),
(4, 'Periodontics'),
(3, 'Oral and Maxillofacial Surgery'),
(2, 'Pediatric Dentistry'),
(1, 'Orthodontics and Dentofacial Orthopedics');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

DROP TABLE IF EXISTS `webuser`;
CREATE TABLE IF NOT EXISTS `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@dentalcare.com', 'a'),
('doctor@dentalcare.com', 'd'),
('swathi@gmail.com', 'p'),
('bhumi@dentalcare.com', 'd'),
('apoo@gmail.com', 'p'),
('niri@gmail.com', 'p'),
('appu@dentalcare.com', 'd'),
('sss@dentalcare.com', 'd');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
