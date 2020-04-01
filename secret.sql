-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2020 at 06:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `secret`
--

CREATE TABLE `secret` (
  `id` int(11) NOT NULL,
  `plaintext` varchar(255) NOT NULL,
  `md5` varchar(40) NOT NULL,
  `length` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `secret`
--

INSERT INTO `secret` (`id`, `plaintext`, `md5`, `length`) VALUES
(1, 'password', '5f4dcc3b5aa765d61d8327deb882cf99', 8),
(2, '123456', 'e10adc3949ba59abbe56e057f20f883e', 6),
(3, '12345678', '25d55ad283aa400af464c76d713c07ad', 8),
(4, 'qwerty', 'd8578edf8458ce06fbc5bb76a58c5ca4', 6),
(5, 'letmein', '0d107d09f5bbe40cade3de5c71e9e9b7', 7),
(7, '1234567890', 'e807f1fcf82d132f9bb018ca6738a19f', 10),
(9, '654321', 'c33367701511b4f6020ec61ded352059', 6),
(10, '123123', '4297f44b13955235245b2497399d7a93', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `secret`
--
ALTER TABLE `secret`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `secret`
--
ALTER TABLE `secret`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
