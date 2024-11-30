-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2024 at 02:54 PM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teachers_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `TeacherID` int(11) NOT NULL,
  `LastName` varchar(15) NOT NULL,
  `FirstName` varchar(15) NOT NULL,
  `MiddleName` varchar(15) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Position` enum('Director','Teacher','Deputy') DEFAULT 'Teacher',
  `Subject` varchar(11) DEFAULT NULL,
  `Phone` varchar(9) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`TeacherID`, `LastName`, `FirstName`, `MiddleName`, `DateOfBirth`, `Position`, `Subject`, `Phone`, `Salary`) VALUES
(1, 'Smith', 'John', 'A.', '1980-05-15', 'Teacher', 'Math', '123456789', '5000.00'),
(2, 'Johnson', 'Emily', NULL, '1975-03-22', 'Director', 'Science', '987654321', '7000.00'),
(3, 'Brown', 'Michael', 'T.', '1990-11-12', 'Deputy', 'History', '564738291', '5500.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
