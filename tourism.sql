-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2024 at 03:22 PM
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
-- Database: `tourism`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `ClientName` varchar(255) NOT NULL DEFAULT 'Group',
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `GroupIndicator` tinyint(1) NOT NULL,
  `ClientAddress` varchar(255) NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `ClientName`, `LastName`, `FirstName`, `GroupIndicator`, `ClientAddress`, `PhoneNumber`) VALUES
(1, 'Group', 'Smith', 'John', 1, '123 Main St', '555-1234'),
(2, 'Corporate', 'Doe', 'Jane', 0, '456 Elm St', '555-5678');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `ContractNumber` int(11) NOT NULL,
  `TourStartDate` date NOT NULL,
  `TourEndDate` date NOT NULL,
  `PaymentDate` date NOT NULL,
  `ClientID` int(11) NOT NULL,
  `TourCode` int(11) NOT NULL,
  `TourPrice` decimal(10,2) NOT NULL,
  `EmployeeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`ContractNumber`, `TourStartDate`, `TourEndDate`, `PaymentDate`, `ClientID`, `TourCode`, `TourPrice`, `EmployeeID`) VALUES
(1, '2024-01-01', '2024-01-10', '2023-12-15', 1, 1, '1500.00', 1),
(2, '2024-02-01', '2024-02-20', '2024-01-10', 2, 2, '2500.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `TourCode` int(11) NOT NULL,
  `CountryName` varchar(255) NOT NULL DEFAULT 'Turkey',
  `Region` int(11) NOT NULL,
  `Hotel` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`TourCode`, `CountryName`, `Region`, `Hotel`) VALUES
(1, 'Turkey', 1, 'Luxury Inn'),
(2, 'Italy', 2, 'Grand Hotel');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Position` varchar(255) NOT NULL,
  `HomePhone` varchar(15) NOT NULL,
  `HireDate` date NOT NULL,
  `BirthDate` date NOT NULL,
  `Salary` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FullName`, `Position`, `HomePhone`, `HireDate`, `BirthDate`, `Salary`) VALUES
(1, 'Alice Johnson', 'Manager', '(123)456-7890', '2015-06-01', '1985-07-20', '7000.00'),
(2, 'Bob Brown', 'Tour Operator', '(123)555-1234', '2018-09-15', '1990-03-10', '5500.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`ContractNumber`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `TourCode` (`TourCode`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`TourCode`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `ContractNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `TourCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `contracts_ibfk_2` FOREIGN KEY (`TourCode`) REFERENCES `countries` (`TourCode`),
  ADD CONSTRAINT `contracts_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
