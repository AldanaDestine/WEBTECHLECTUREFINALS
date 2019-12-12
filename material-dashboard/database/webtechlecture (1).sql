-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 02:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

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
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tenant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `tenant_id`) VALUES
(1, 'Juan', '123123123', 1);

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
(1, 'a', 'b2', '32'),
(2, 'guest', 'g', '45'),
(3, 'f', 'd', '45');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_request`
--

CREATE TABLE `tenant_request` (
  `id` int(11) NOT NULL,
  `request_message` varchar(255) NOT NULL,
  `tenant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenant_request`
--

INSERT INTO `tenant_request` (`id`, `request_message`, `tenant_id`) VALUES
(1, 'test', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personel_accounts`
--
ALTER TABLE `personel_accounts`
  ADD PRIMARY KEY (`personel_ID`);

--
-- Indexes for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  ADD PRIMARY KEY (`tenantID`);

--
-- Indexes for table `tenant_request`
--
ALTER TABLE `tenant_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personel_accounts`
--
ALTER TABLE `personel_accounts`
  MODIFY `personel_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tenant_accounts`
--
ALTER TABLE `tenant_accounts`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tenant_request`
--
ALTER TABLE `tenant_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
