-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2025 at 04:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flutter_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`) VALUES
(1, 'Istiaq Ahmad', 'istiaqahmad41@gmail.com', '$2y$10$9Vc.gH6c67dKE7w1KDtwYOR2cgKKQ/Va7UkWmn2YTbSWzniRQOp3S'),
(2, 'John', 'john.m@gmail.com', '123456'),
(3, 'Admin', 'admin@gmail.com', '$2y$10$zicqLgohfV6CK5qnIRfmU..SM51Ja617rsVR9bIcf5rFmOGsfge7S'),
(4, 'Abbas', 'abbas.m@gmail.com', '$2y$10$nFYQlpeY33bZZGULWgOKtOgpweSJU1ewn2.m/b9Wdj9R9FeovN.qG'),
(5, 'Istiaq', 'istiaqahmad@gmail.com', '$2y$10$CBKFeu0jthZukt6s0PQn1.qfo7hnnXA4ANsdfjGDakngPiHbU/iPW'),
(6, 'Istiaq Ahmad', 'istiaqahmad11@gmail.com', '$2y$10$KCYdSfnVArSfKDrbCHpOnezmJJZAROvTX4haF6gtnspOGDnEbfTUG');

-- --------------------------------------------------------

--
-- Table structure for table `subadmins`
--

CREATE TABLE `subadmins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subadmins`
--

INSERT INTO `subadmins` (`id`, `name`, `email`, `password`) VALUES
(1, 'Showvik Barua', 'showvik.b@gmail.com', '$2y$10$mbRQD.HwFoxyU5D1rwBWNOxtEqPSovCLHusxdBr6SmoKOv53u/eOm'),
(2, 'Md Masud', 'md.masud@gmail.com', '$2y$10$wt9spDr64f0Gx0NVvqlSWu3zGRO/jDiWXUpixlhgsPt8c0uJOJkSC'),
(3, 'Demo', 'demosub@gmail.com', '$2y$10$KENjbUEtJ4.9pEiNYfzDI.wUB0q5HVP6iBPtitCcBzb9RK5GNkg9C'),
(4, 'Masfhik Muhaimin', 'masfhik@gmail.com', '$2y$10$CZy1yRB9bTYdf4iYYPps2e0BjlpuNxBH7XPonRcrtn4/87OZlPOye'),
(5, 'Showvik Barua', 'showvikbarua@gmail.com', '$2y$10$EYymyF.kqDq/96m3nRQJZewXNO/xsn5RMfCE1f20Qic5h8YQuqdfi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', '$2y$10$w0errNyQMy7SObi7iEJ0TuQzVsJLLgi.SCZ8M8aMLI2BK2dG9IHku'),
(3, 'Jane Peterson', 'jane.p@gmail.com', '$2y$10$LoCO6rfAMopOb1q6kXAvlONiZwX/nDnyeDvceSTmP3V0m3IvPME7y'),
(4, 'David', 'david.demo@gmail.com', '$2y$10$87TpHfyirKxwxhhvWd2IIO6KjtLeWZzR3dU/MCpg4P1qoxoGv0gDK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `subadmins`
--
ALTER TABLE `subadmins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subadmins`
--
ALTER TABLE `subadmins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
