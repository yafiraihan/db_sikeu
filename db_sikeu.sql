-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2025 at 05:41 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sikeu`
--

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
  `Anggaran` int(11) NOT NULL,
  `Transaksi` int(11) NOT NULL,
  `pelkeu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi_transaksi`
--

CREATE TABLE `notifikasi_transaksi` (
  `Nim` int(20) NOT NULL,
  `Transaksi` varchar(20) NOT NULL,
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
  `hutang` varchar(30) NOT NULL,
  `pelkeu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Nim` int(20) NOT NULL,
  `username` varchar(22) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(11) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kategori` set('admin','karyawan','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `histori`
--
ALTER TABLE `histori`
  ADD PRIMARY KEY (`histori`);

--
-- Indexes for table `manajemen_anggaran`
--
ALTER TABLE `manajemen_anggaran`
  ADD PRIMARY KEY (`Anggaran`),
  ADD KEY `Nim` (`Nim`,`Kategori`,`Transaksi`),
  ADD KEY `Transaksi` (`Transaksi`);

--
-- Indexes for table `notifikasi_transaksi`
--
ALTER TABLE `notifikasi_transaksi`
  ADD PRIMARY KEY (`Notifikasi`),
  ADD KEY `User` (`Nim`,`Transaksi`),
  ADD KEY `User_2` (`Nim`);

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
-- Constraints for table `manajemen_anggaran`
--
ALTER TABLE `manajemen_anggaran`
  ADD CONSTRAINT `manajemen_anggaran_ibfk_1` FOREIGN KEY (`Nim`) REFERENCES `user` (`Nim`),
  ADD CONSTRAINT `manajemen_anggaran_ibfk_2` FOREIGN KEY (`Transaksi`) REFERENCES `transaksi_keuangan` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
