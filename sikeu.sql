-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 05:38 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sikeu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `nim` int(22) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `no_tlp` int(22) NOT NULL,
  `kategori` varchar(54) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bendahara`
--

CREATE TABLE `bendahara` (
  `nim` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `kategori` varchar(55) NOT NULL,
  `no_tlp` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histori`
--

CREATE TABLE `histori` (
  `histori` int(11) NOT NULL,
  `notifikasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keamanan_backup_data`
--

CREATE TABLE `keamanan_backup_data` (
  `User` varchar(20) NOT NULL,
  `Data` varchar(20) NOT NULL,
  `Enkripsi` int(11) NOT NULL,
  `Autentifikasi_2_Faktor` int(11) NOT NULL,
  `Back_Up` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manajemen_anggaran`
--

CREATE TABLE `manajemen_anggaran` (
  `Nim` int(20) NOT NULL,
  `Kategori` varchar(20) NOT NULL,
  `nama anggaran` varchar(55) NOT NULL,
  `Transaksi` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `tanggal` date NOT NULL,
  `total_anggaran` decimal(60,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_transaksi`
--

CREATE TABLE `notifikasi_transaksi` (
  `Nim` int(20) NOT NULL,
  `Transaksi` int(55) NOT NULL,
  `Notifikasi` varchar(20) NOT NULL,
  `Notifikasi_Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_keuangan`
--

CREATE TABLE `transaksi_keuangan` (
  `id_transaksi` int(11) NOT NULL,
  `Nim` int(20) NOT NULL,
  `pajak` varchar(30) NOT NULL,
  `gaji` varchar(30) NOT NULL,
  `hutang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Nim` int(20) NOT NULL,
  `kategori` set('admin','bendahara','') NOT NULL,
  `password` int(52) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `bendahara`
--
ALTER TABLE `bendahara`
  ADD KEY `nim` (`nim`);

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`histori`),
  ADD KEY `notifikasi` (`notifikasi`);

--
-- Indexes for table `manajemen_anggaran`
--
ALTER TABLE `manajemen_anggaran`
  ADD PRIMARY KEY (`nama anggaran`),
  ADD KEY `Nim` (`Nim`,`Kategori`,`Transaksi`),
  ADD KEY `Transaksi` (`Transaksi`);

--
-- Indexes for table `notifikasi_transaksi`
--
ALTER TABLE `notifikasi_transaksi`
  ADD PRIMARY KEY (`Notifikasi`),
  ADD KEY `User` (`Nim`,`Transaksi`),
  ADD KEY `User_2` (`Nim`),
  ADD KEY `Transaksi` (`Transaksi`),
  ADD KEY `Transaksi_2` (`Transaksi`);

--
-- Indexes for table `transaksi_keuangan`
--
ALTER TABLE `transaksi_keuangan`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Nim`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `user` (`Nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bendahara`
--
ALTER TABLE `bendahara`
  ADD CONSTRAINT `bendahara_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `user` (`Nim`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `histori`
--
ALTER TABLE `histori`
  ADD CONSTRAINT `histori_ibfk_1` FOREIGN KEY (`notifikasi`) REFERENCES `notifikasi_transaksi` (`Notifikasi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manajemen_anggaran`
--
ALTER TABLE `manajemen_anggaran`
  ADD CONSTRAINT `manajemen_anggaran_ibfk_1` FOREIGN KEY (`Nim`) REFERENCES `user` (`Nim`),
  ADD CONSTRAINT `manajemen_anggaran_ibfk_2` FOREIGN KEY (`Transaksi`) REFERENCES `transaksi_keuangan` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifikasi_transaksi`
--
ALTER TABLE `notifikasi_transaksi`
  ADD CONSTRAINT `notifikasi_transaksi_ibfk_1` FOREIGN KEY (`Transaksi`) REFERENCES `transaksi_keuangan` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
