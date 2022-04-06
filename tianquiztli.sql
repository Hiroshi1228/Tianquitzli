-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2022 at 12:25 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tianquiztli`
--

DROP DATABASE IF EXISTS `tianquiztli`;
CREATE DATABASE `tianquiztli`;
USE `tianquiztli`;
-- --------------------------------------------------------

--
-- Table structure for table `comprador`
--

CREATE TABLE `comprador` (
  `id_C` int(11) NOT NULL,
  `nombreC` varchar(30) NOT NULL,
  `contraseñaC` varchar(10) NOT NULL,
  `dirección` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id_Pe` int(11) NOT NULL,
  `id_C` int(11) NOT NULL,
  `id_R` int(11) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `productos` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id_P` int(11) NOT NULL,
  `id_V` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `repartidor`
--

CREATE TABLE `repartidor` (
  `id_R` int(11) NOT NULL,
  `id_V` int(11) NOT NULL,
  `id_Pe` int(11) DEFAULT NULL,
  `nombreR` varchar(30) NOT NULL,
  `contraseñaR` varchar(10) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `contrato` varchar(20) NOT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vendedor`
--

CREATE TABLE `vendedor` (
  `id_V` int(11) NOT NULL,
  `nombreV` varchar(20) NOT NULL,
  `contraseñaV` varchar(10) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `nombre_negocio` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`id_C`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_Pe`),
  ADD KEY `id_C` (`id_C`),
  ADD KEY `id_R` (`id_R`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_P`),
  ADD KEY `id_V` (`id_V`);

--
-- Indexes for table `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id_R`),
  ADD KEY `id_V` (`id_V`),
  ADD KEY `id_Pe` (`id_Pe`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`id_V`,`nombreV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comprador`
--
ALTER TABLE `comprador`
  MODIFY `id_C` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_Pe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id_P` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id_R` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `id_V` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_C`) REFERENCES `comprador` (`id_C`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_R`) REFERENCES `repartidor` (`id_R`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_V`) REFERENCES `vendedor` (`id_V`);

--
-- Constraints for table `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`id_V`) REFERENCES `vendedor` (`id_V`),
  ADD CONSTRAINT `repartidor_ibfk_2` FOREIGN KEY (`id_Pe`) REFERENCES `pedidos` (`id_Pe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
