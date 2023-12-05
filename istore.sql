-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2023 at 06:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `istore`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(12) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(12) NOT NULL,
  `acctype` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `acctype`) VALUES
(1, 'manager', '1234', 'Manager'),
(2, 'cashier', '1234', 'Cashier');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `itemid` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`itemid`, `name`, `category`, `qty`, `price`) VALUES
(1, 'Apple iPhone 13+', 'Phone', 600, 850),
(2, 'Apple Monitor 24\"', 'Monitor', 193, 2500),
(3, 'Apple Earbuds', 'Headset', 246, 1100),
(4, 'Apple Speaker', 'Speaker', 95, 500),
(5, 'Apple Mac 8', 'Desktop Computer', 40, 4000),
(6, 'Apple iPad 7', 'Tablet Computer', 190, 1700),
(7, 'Apple iPod', 'Multimedia Player', 400, 200),
(8, 'Apple iWatch', 'Wrist Watch', 900, 250),
(9, 'Apple AirTag', 'GPS Device', 21, 150),
(10, 'Apple Headphones 6', 'Headphones', 403, 560);

-- --------------------------------------------------------

--
-- Table structure for table `saleitems`
--

CREATE TABLE `saleitems` (
  `saleItemID` int(11) NOT NULL,
  `saleID` int(11) DEFAULT NULL,
  `itemID` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saleitems`
--

INSERT INTO `saleitems` (`saleItemID`, `saleID`, `itemID`, `quantity`, `price`) VALUES
(22, 24, 2, 1, 2500),
(23, 24, 1, 1, 3000),
(24, 25, 1, 1, 3000),
(25, 25, 3, 2, 2500),
(26, 25, 4, 1, 500),
(27, 26, 1, 1, 3000),
(28, 26, 2, 2, 2500),
(29, 27, 1, 1, 3000),
(30, 27, 2, 1, 2500),
(31, 27, 3, 1, 2500),
(32, 27, 4, 1, 500),
(33, 28, 2, 1, 2500),
(34, 28, 4, 1, 500),
(35, 29, 3, 1, 2500),
(36, 29, 4, 2, 500),
(37, 29, 2, 2, 2500),
(38, 30, 1, 1, 3000),
(39, 31, 7, 1, 200);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `saleID` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `balance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`saleID`, `total`, `payment`, `balance`) VALUES
(24, 5500, 6000, -500),
(25, 6000, 9000, -3000),
(26, 5500, 9000, -3500),
(27, 8500, 9000, -500),
(28, 3000, 4000, -1000),
(29, 5500, 9000, -3500),
(30, 3000, 3000, 0),
(31, 200, 200, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `saleitems`
--
ALTER TABLE `saleitems`
  ADD PRIMARY KEY (`saleItemID`),
  ADD KEY `saleID` (`saleID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`saleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `saleitems`
--
ALTER TABLE `saleitems`
  MODIFY `saleItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
