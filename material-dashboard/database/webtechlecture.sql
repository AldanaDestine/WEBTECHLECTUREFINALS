-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2019 at 02:34 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.2.20

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
(1, 'Patrick', 'Responde', 'bukaneg street, legarda, baguio city', '2152751@slu.edu.ph', '1234567891', '211'),
(2, 'Jayditch', 'Balansi', 'Tuding, Baguio City', 'jayditch@email.com', '1987654321', '212'),
(3, 'Anne', 'Manahan', 'Goshen, Bakakeng, Baguio City', '2164165@slu.edu.ph', '1234569871', '213'),
(4, 'Destine', 'Aldana', 'San Luis Baguio City', 'aldana@email.com', '09123658746', '214'),
(5, 'Rico', 'Pangan', 'Baguio City', 'pangan@email.com', '09846325176', '215');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tenantinfo`
--
ALTER TABLE `tenantinfo`
  ADD PRIMARY KEY (`tenantID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tenantinfo`
--
ALTER TABLE `tenantinfo`
  MODIFY `tenantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
