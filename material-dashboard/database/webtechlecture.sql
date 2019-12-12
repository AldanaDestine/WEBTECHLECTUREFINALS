-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 03:56 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

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
-- Table structure for table `personel_accounts`
--

CREATE TABLE `personel_accounts` (
  `personel_ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `type` enum('Personel','None') NOT NULL DEFAULT 'Personel',
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personel_accounts`
--

INSERT INTO `personel_accounts` (`personel_ID`, `username`, `firstName`, `lastName`, `type`, `password`) VALUES
(9, 'jayditch', 'jayditch', 'balansi', 'Personel', '12345');

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
  `roomNumber` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant_accounts`
--

INSERT INTO `tenant_accounts` (`tenantID`, `firstName`, `lastName`, `roomNumber`) VALUES
(4, 'Patrick', 'Responde', '512');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bldginfo`
--
ALTER TABLE `bldginfo`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `personel_accounts`
--
ALTER TABLE `personel_accounts`
  ADD PRIMARY KEY (`personel_ID`);

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
-- AUTO_INCREMENT for table `personel_accounts`
--
ALTER TABLE `personel_accounts`
  MODIFY `personel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tenantinfo`
--
ALTER TABLE `tenantinfo`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
