-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2018 at 03:09 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `irate`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_master`
--

CREATE TABLE `course_master` (
  `COURSE_ID` int(11) DEFAULT NULL,
  `COURSE_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_master`
--

INSERT INTO `course_master` (`COURSE_ID`, `COURSE_NAME`) VALUES
(9001, 'SQL'),
(9002, 'PLSQL'),
(9003, 'ETL'),
(9004, 'ADMIN I'),
(9005, 'ADMIN II'),
(9010, 'UNIX'),
(9006, 'GOLDEN GATE'),
(9007, 'RAC'),
(9008, 'SQL SERVER DEV'),
(9009, 'SQL SERVER ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_course_master`
--

CREATE TABLE `faculty_course_master` (
  `FACULTY_ID` int(11) DEFAULT NULL,
  `COURSE_ID` int(11) DEFAULT NULL,
  `COURSE_NAME` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_course_master`
--

INSERT INTO `faculty_course_master` (`FACULTY_ID`, `COURSE_ID`, `COURSE_NAME`) VALUES
(1, 9006, 'GOLDEN GATE'),
(1, 9007, 'RAC'),
(1, 9008, 'SQL SERVER DEV'),
(1, 9005, 'ADMIN II'),
(1, 9004, 'ADMIN I'),
(1, 9003, 'ETL'),
(1, 9002, 'PLSQL'),
(1, 9001, 'SQL');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_master`
--

CREATE TABLE `faculty_master` (
  `FACULTY_ID` int(11) DEFAULT NULL,
  `F_FIRST_NAME` varchar(20) DEFAULT NULL,
  `F_LAST_NAME` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_master`
--

INSERT INTO `faculty_master` (`FACULTY_ID`, `F_FIRST_NAME`, `F_LAST_NAME`) VALUES
(1, 'Mohammad', 'Ahmed'),
(2, 'Vishal', 'Sawant'),
(3, 'Ashutosh', 'Sawai'),
(4, 'Swapnil', 'Dak'),
(5, 'Gauri', 'Tayade'),
(6, 'Mahesh', 'Waghode'),
(7, 'Abhishek', 'Suryawanshi'),
(8, 'Vishal', 'Singh'),
(9, 'Aaisha', 'Ahmed');

-- --------------------------------------------------------

--
-- Table structure for table `rating_master`
--

CREATE TABLE `rating_master` (
  `USER_ID` int(11) DEFAULT NULL,
  `FACULTY_ID` int(11) DEFAULT NULL,
  `FACULTY_NAME` varchar(30) DEFAULT NULL,
  `COURSE_ID` varchar(20) DEFAULT NULL,
  `COURSE_NAME` varchar(50) DEFAULT NULL,
  `TOPIC_ID` varchar(30) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `R_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating_master`
--

INSERT INTO `rating_master` (`USER_ID`, `FACULTY_ID`, `FACULTY_NAME`, `COURSE_ID`, `COURSE_NAME`, `TOPIC_ID`, `RATING`, `R_DATE`) VALUES
(1, 1, 'Mohammad', '9001', 'SQL', '70001', 9, '2017-12-04'),
(1, 1, 'Mohammad', '9001', 'SQL', '70002', 5, '2017-12-06'),
(1, 1, 'Mohammad', '9001', 'SQL', '70003', 7, '2017-12-07'),
(1, 1, 'Mohammad', '9001', 'SQL', '70004', 8, '2017-12-08'),
(1, 1, 'Mohammad', '9001', 'SQL', '70005', 8, '2017-12-09'),
(1, 1, 'Mohammad', '9001', 'SQL', '70006', 4, '2017-12-11'),
(1, 1, 'Mohammad', '9001', 'SQL', '70007', 9, '2017-12-13'),
(1, 1, 'Mohammad', '9001', 'SQL', '70008', 10, '2017-12-15'),
(1, 1, 'Mohammad', '9001', 'SQL', '70009', 10, '2017-12-16'),
(1, 1, 'Mohammad', '9001', 'SQL', '70010', 6, '2017-12-18'),
(1, 1, 'Mohammad', '9001', 'SQL', '70011', 8, '2017-12-20'),
(1, 1, 'Mohammad', '9001', 'SQL', '70012', 9, '2017-12-22'),
(1, 1, 'Mohammad', '9001', 'SQL', '70013', 8, '2017-12-23'),
(1, 1, 'Mohammad', '9001', 'SQL', '70014', 3, '2017-12-25'),
(1, 1, 'Mohammad', '9001', 'SQL', '70015', 8, '2017-12-27'),
(1, 1, 'Mohammad', '9001', 'SQL', '70016', 9, '2017-12-30'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70017', 9, '2017-12-31'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70018', 5, '2018-01-02'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70019', 7, '2018-01-04'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70020', 10, '2018-01-07'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70021', 7, '2018-01-08'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70022', 6, '2018-01-08'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70023', 8, '2018-01-11'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70024', 9, '2018-01-15'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70025', 6, '2018-01-17'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70026', 4, '2018-01-18'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70027', 9, '2018-01-22'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70028', 6, '2018-01-23'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70029', 7, '2018-01-25'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70030', 10, '2018-01-27'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70031', 7, '2018-01-29'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70032', 9, '2018-01-30'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70036', 10, '2018-02-02'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70034', 9, '2018-02-01'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70037', 8, '2018-02-03'),
(1, 1, 'Mohammad', '9002', 'PLSQL', '70033', 10, '2018-01-31'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70035', 10, '2018-02-01'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70038', 6, '2018-02-04'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70039', 8, '2018-02-05'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70040', 5, '2018-02-06'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70041', 8, '2018-02-07'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70042', 9, '2018-02-08'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70043', 9, '2018-02-09'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70044', 7, '2018-02-10'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70045', 5, '2018-02-11'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70046', 6, '2018-02-12'),
(1, 1, 'Mohammad', '9004', 'ADMIN I', '70047', 8, '2018-02-13'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70048', 8, '2018-02-14'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70049', 5, '2018-02-15'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70050', 9, '2018-02-16'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70051', 9, '2018-02-17'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70052', 8, '2018-02-18'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70053', 6, '2018-02-19'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70054', 6, '2018-02-20'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70055', 9, '2018-02-21'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70056', 9, '2018-02-22'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70057', 4, '2018-02-23'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70058', 7, '2018-02-24'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70059', 7, '2018-02-25'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70060', 7, '2018-02-26'),
(1, 1, 'Mohammad', '9005', 'ADMIN II', '70061', 8, '2018-02-27');

-- --------------------------------------------------------

--
-- Table structure for table `topic_master`
--

CREATE TABLE `topic_master` (
  `TOPIC_ID` int(11) DEFAULT NULL,
  `TOPIC_NAME` varchar(30) DEFAULT NULL,
  `COURSE_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic_master`
--

INSERT INTO `topic_master` (`TOPIC_ID`, `TOPIC_NAME`, `COURSE_ID`) VALUES
(70001, 'INTRODUCTION', '9001'),
(70002, 'RDBMS CONCEPT', '9001'),
(70003, 'DQL STATEMENT', '9001'),
(70004, 'SINGLE ROW FUNCTION', '9001'),
(70005, 'MULTIPLE ROW FUNCTION', '9001'),
(70006, 'DATA TYPE CONVERSION', '9001'),
(70007, 'ANALYTICAL FUNCTION', '9001'),
(70008, 'JOIN', '9001'),
(70009, 'SUBQUERY', '9001'),
(70010, 'SET OPERATOR', '9001'),
(70011, 'DML STATEMENT', '9001'),
(70012, 'DCL STATEMENT', '9001'),
(70013, 'TCL STATEMENT', '9001'),
(70014, 'DDL STATEMENT', '9001'),
(70015, 'FLASHBACK TABLE', '9001'),
(70016, 'INTERVIEW', '9001'),
(70017, 'INTRODUCTION', '9002'),
(70018, 'DATA TYPE AND VARIBLE DECLARE', '9002'),
(70019, 'CONTROL STRUCTURES', '9002'),
(70020, 'LOOPS IN PLSQL', '9002'),
(70021, 'COMPOSITE VARIABLE', '9002'),
(70022, 'CURSORS', '9002'),
(70023, 'EXCEPTION HANDLING', '9002'),
(70024, 'PROCEDURES', '9002'),
(70025, 'FUNCTIONS', '9002'),
(70026, 'PACKAGES', '9002'),
(70027, 'ORACLE PREDEFINE PACKAGES', '9002'),
(70028, 'TRIGGERS', '9002'),
(70029, 'COLLECTIONS', '9002'),
(70030, 'BULK COLLECT/BIND', '9002'),
(70031, 'ADVANCE CURSOR', '9002'),
(70032, 'AUTONOMOUS TRANSACTION', '9002'),
(70033, 'NATIVE DYNAMIC SQL', '9002'),
(70034, 'WRAPPER', '9002'),
(70035, 'INTRODUCTION', '9004'),
(70036, 'ORACLE ARCHITECTURE', '9004'),
(70037, 'DATABASE CREATION', '9004'),
(70038, 'ORACLE INSTANCE', '9004'),
(70039, 'MAINTAIN CONTROL AND LOGFILE', '9004'),
(70040, 'ORACLE TABLESPACES(STORAGE)', '9004'),
(70041, 'MANAGING TEMP STORAGE', '9004'),
(70042, 'MANAGING UNDO STORAGE', '9004'),
(70043, 'USER AND SECURITY', '9004'),
(70044, 'LISTENER', '9004'),
(70045, 'FLASHBACK', '9004'),
(70046, 'DATAPUMP', '9004'),
(70047, 'AUDIT', '9004'),
(70048, 'INTRODUCTION', '9005'),
(70049, 'RMAN ARCHITECTURE CONCEPT', '9005'),
(70050, 'RMAN COMMANDS', '9005'),
(70051, 'RMAN BACKUP TYPES', '9005'),
(70052, 'RMAN RECOVERY', '9005'),
(70053, 'RECOVERY CATALOG', '9005'),
(70054, 'BLOCK CORRUPTION', '9005'),
(70055, 'CLONING', '9005'),
(70056, 'TABLE PARTITIONING', '9005'),
(70057, 'ROW CHAINING', '9005'),
(70058, 'AWR/ADDM/ASH REPORT', '9005'),
(70059, 'ASM CONCEPT/INSTALLATION', '9005'),
(70060, 'DATAGUARD CONFIGURATION', '9005'),
(70061, 'UPGRADE AND PATCH', '9005');

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

CREATE TABLE `user_master` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(30) DEFAULT NULL,
  `U_FIRST_NAME` varchar(50) DEFAULT NULL,
  `U_LAST_NAME` varchar(50) DEFAULT NULL,
  `EMAIL_ID` varchar(50) DEFAULT NULL,
  `MOB_NO` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`USER_ID`, `USER_NAME`, `U_FIRST_NAME`, `U_LAST_NAME`, `EMAIL_ID`, `MOB_NO`, `PASSWORD`) VALUES
(1, 'mluffy', 'MONKEY', 'LUFFY', 'LUFFY@GMAIL.COM', '9860494499', 'b779cc3604ddf11e822f8c875fe756a7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_master`
--
ALTER TABLE `user_master`
  ADD PRIMARY KEY (`USER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_master`
--
ALTER TABLE `user_master`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
