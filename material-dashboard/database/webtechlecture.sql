-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2019 at 09:07 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webtechlecture`
--

-- --------------------------------------------------------

--
-- Table structure for table `bldginfo`
--

CREATE TABLE `bldginfo` (
  `roomID` int(11) NOT NULL,
  `roomNumber` int(11) NOT NULL,
  `roomRemarks` varchar(255) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bldginfo`
--

INSERT INTO `bldginfo` (`roomID`, `roomNumber`, `roomRemarks`, `status`) VALUES
(1, 211, 'not available', 'Occupied'),
(2, 212, 'ready for occupancy', 'Vacant'),
(3, 213, 'not available', 'Occupied'),
(4, 214, 'not available', 'Occupied'),
(5, 215, 'ready for occupancy', 'Vacant'),
(6, 216, 'ready for occupancy', 'Vacant');

-- --------------------------------------------------------

--
-- Table structure for table `personnel_accounts`
--

CREATE TABLE `personnel_accounts` (
  `personnel_ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `type` enum('Personnel','Admin') NOT NULL DEFAULT 'Personnel',
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personnel_accounts`
--

INSERT INTO `personnel_accounts` (`personnel_ID`, `username`, `firstName`, `lastName`, `type`, `password`) VALUES
(15, 'admin', 'admin', 'admin', 'Personnel', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `tenantinfo`
--

CREATE TABLE `tenantinfo` (
  `tenantID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pnumber` varchar(11) NOT NULL,
  `roomNumber` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenantinfo`
--

INSERT INTO `tenantinfo` (`tenantID`, `firstName`, `lastName`, `address`, `email`, `pnumber`, `roomNumber`) VALUES
(1, 'Patrick', 'Responde', 'bukaneg street, legarda, baguio city', '2152751@slu.edu.ph', '09123456789', '211'),
(2, 'Jayditch', 'Balansi', 'Tuding, Baguio City', 'jayditch@email.com', '09876543210', '213'),
(3, 'Anne', 'Manahan', 'Goshen, Bakakeng, Baguio City', '2164165@slu.edu.ph', '09653287415', '214'),
(4, 'Destine', 'Aldana', 'San Luis Baguio City', 'aldana@email.com', '09321654987', '216');

-- --------------------------------------------------------

--
-- Table structure for table `tenantreq`
--

CREATE TABLE `tenantreq` (
  `tenantID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `pnumber` int(11) NOT NULL,
  `reqTenant` varchar(255) NOT NULL,
  `roomNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tenantreq`
--

INSERT INTO `tenantreq` (`tenantID`, `firstName`, `lastName`, `pnumber`, `reqTenant`, `roomNumber`) VALUES
(12, 'patrick', 'responde', 902892123, 'need to repair switch', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_accounts`
--

CREATE TABLE `tenant_accounts` (
  `tenantID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `conNum` varchar(12) NOT NULL,
  `roomNumber` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant_accounts`
--

INSERT INTO `tenant_accounts` (`tenantID`, `firstName`, `lastName`, `conNum`, `roomNumber`) VALUES
(7, 'jayditch', 'balansi', '2147483647', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bldginfo`
--
ALTER TABLE `bldginfo`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `personnel_accounts`
--
ALTER TABLE `personnel_accounts`
  ADD PRIMARY KEY (`personnel_ID`);

--
-- Indexes for table `tenantinfo`
--
ALTER TABLE `tenantinfo`
  ADD PRIMARY KEY (`tenantID`);

--
-- Indexes for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  ADD PRIMARY KEY (`tenantID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bldginfo`
--
ALTER TABLE `bldginfo`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personnel_accounts`
--
ALTER TABLE `personnel_accounts`
  MODIFY `personnel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tenantinfo`
--
ALTER TABLE `tenantinfo`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
