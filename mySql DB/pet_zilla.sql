-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 08:20 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_zilla`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `phone_no` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `unique_key` char(15) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`phone_no`, `email`, `unique_key`, `password`) VALUES
('00000000000', 'mridul@gmail.com', 'aaaa', '0000'),
('01856497305', 'turjo@gmail.com', 'qqqq', '1111');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `vet_id` int(11) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `date`, `time`, `status`, `vet_id`, `pet_id`) VALUES
(1, '2024-12-01', '10:30:00', 'Scheduled', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `payment_method` enum('cash_on_delivery','bkash') NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `name`, `address`, `payment_method`, `transaction_id`, `total_amount`, `order_date`) VALUES
(1, 28, 'mridul', 'sdfds', '', '', 134.94, '2024-12-19 11:05:43'),
(2, 28, 'joy', 'ewrew', 'bkash', '543454', 203.27, '2024-12-19 11:06:18'),
(3, 28, 'mridul', 'kjk', 'bkash', '6876', 150.80, '2024-12-19 11:07:21'),
(4, 28, 'mridul', 'sds', '', '', 122.05, '2024-12-19 11:14:07'),
(5, 28, 'mridul', 'saa', '', '', 66.88, '2024-12-19 11:24:35'),
(6, 28, 'we', 'ew', '', '', 106.81, '2024-12-19 11:27:39'),
(7, 28, 'we', 'ew', '', '', 106.81, '2024-12-19 11:27:39'),
(8, 28, 'mridul', '2342', '', '', 35.00, '2024-12-19 11:28:25'),
(9, 28, 'ds', 'gt', 'bkash', '23434', 141.13, '2024-12-19 11:30:57'),
(10, 28, 'mridul', 'sasa', '', '23434', 152.68, '2024-12-19 11:31:25'),
(11, 28, 'mridul', 'kjhhj', '', NULL, 141.13, '2024-12-19 11:32:01'),
(12, 28, 'mridul', 'Dhaka', '', NULL, 142.28, '2024-12-19 11:38:06'),
(13, 28, 'ds', 'sds', '', NULL, 107.90, '2024-12-19 11:53:10'),
(14, 28, 'mridul', 'ghf', '', NULL, 75.77, '2024-12-19 11:55:38'),
(15, 28, 'mridul', 'dssd', '', NULL, 122.05, '2024-12-19 12:00:08'),
(16, 28, 'mridul', 'ewew', 'bkash', '23434', 77.28, '2024-12-19 12:00:56'),
(21, 24, 'mridul', 'dfdf', '', NULL, 116.22, '2024-12-19 12:47:30'),
(22, 24, 'mridul', '2eww', 'bkash', '23434', 40.82, '2024-12-19 12:48:10'),
(23, 24, 'mridul', 'ki', '', NULL, 76.18, '2024-12-19 12:50:09'),
(25, 24, 'df', 'rtt', '', NULL, 47.17, '2024-12-19 12:54:36'),
(26, 24, 'mridul', 'ter', '', NULL, 43.11, '2024-12-19 12:54:50'),
(27, 24, 'mridul', 'wew', '', NULL, 101.82, '2024-12-19 12:55:10'),
(28, 24, 'mridul', 'sds', '', NULL, 197.45, '2024-12-19 12:55:19'),
(30, 24, 'mridul', 'sa', '', NULL, 145.93, '2024-12-19 12:57:44'),
(31, 24, 'joy', 'sa', '', NULL, 252.41, '2024-12-19 12:58:06'),
(32, 24, 'mridul', 'asa', '', NULL, 198.59, '2024-12-19 12:58:30'),
(33, 24, 'mridul', 'ass', '', NULL, 116.22, '2024-12-19 12:58:44'),
(34, 24, 'mridul', 'as', '', NULL, 71.45, '2024-12-19 12:58:56'),
(35, 24, 'as', 'as', '', NULL, 61.05, '2024-12-19 12:59:04'),
(36, 24, 'as', 'as', '', NULL, 104.68, '2024-12-19 12:59:19'),
(37, 24, 'as', 'asa', '', NULL, 59.96, '2024-12-19 12:59:28'),
(38, 24, 'as', 'as', '', NULL, 146.65, '2024-12-19 12:59:42'),
(40, 24, 'fg', 'dfgf', '', NULL, 116.22, '2024-12-19 13:00:27'),
(44, 24, 'df', 'df', '', NULL, 39.21, '2024-12-19 13:10:29'),
(47, 24, 'sd', 'sd', '', NULL, 41.45, '2024-12-19 13:12:46'),
(48, 24, 'sd', 'sd', '', NULL, 152.68, '2024-12-19 13:12:59'),
(51, 24, 'df', 'df', '', NULL, 48.52, '2024-12-19 13:14:01'),
(57, 24, 'dffd', 'dfd', '', NULL, 97.50, '2024-12-19 13:16:11'),
(58, 24, 'sdd', 'dsds', '', NULL, 84.09, '2024-12-19 13:33:44'),
(59, 24, 'mridul', 'sddsfdfsdsd', '', NULL, 614.19, '2024-12-19 13:35:54'),
(60, 24, 're', 'er', '', NULL, 109.47, '2024-12-19 13:36:14'),
(61, 24, 'ere', 'rer', '', NULL, 150.24, '2024-12-19 13:36:30'),
(65, 24, 'ass', 'ass', '', NULL, 75.47, '2024-12-19 13:43:16'),
(66, 24, 'mridul', 'saa', '', NULL, 70.36, '2024-12-19 13:43:26'),
(67, 24, 'sds', 'sdds', '', NULL, 125.38, '2024-12-19 13:43:37'),
(68, 24, 'sdd', 'sds', '', NULL, 105.25, '2024-12-19 13:43:51'),
(69, 24, 'mridul', 'dsd', 'bkash', '3232', 89.81, '2024-12-19 13:44:10'),
(70, 24, 'mridul', 'sdds', 'bkash', '2222', 116.38, '2024-12-19 14:58:32'),
(71, 24, 'mridul', 'dsfs', 'bkash', '3333', 120.44, '2024-12-19 14:59:58'),
(72, 29, 'Mithun Da', 'Khulna', 'bkash', '684894', 56.94, '2024-12-21 07:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 42, 2, 35.05),
(2, 1, 34, 2, 13.00),
(3, 2, 25, 1, 5.60),
(4, 2, 43, 2, 78.10),
(5, 3, 26, 1, 6.20),
(6, 3, 42, 3, 35.05),
(7, 4, 43, 1, 78.10),
(8, 4, 25, 1, 5.60),
(9, 5, 41, 1, 25.05),
(10, 5, 25, 1, 5.60),
(11, 6, 42, 1, 35.05),
(12, 6, 31, 1, 34.00),
(13, 7, 42, 1, 35.05),
(14, 7, 31, 1, 34.00),
(15, 9, 42, 1, 35.05),
(16, 9, 40, 1, 67.00),
(17, 10, 42, 1, 35.05),
(18, 10, 43, 1, 78.10),
(19, 11, 42, 1, 35.05),
(20, 11, 40, 1, 67.00),
(26, 14, 29, 1, 4.15),
(27, 15, 43, 1, 78.10),
(28, 15, 25, 1, 5.60),
(29, 16, 42, 1, 35.05),
(30, 16, 25, 1, 5.60),
(43, 21, 43, 1, 78.10),
(44, 22, 25, 1, 5.60),
(45, 23, 37, 1, 34.00),
(46, 23, 25, 1, 5.60),
(51, 25, 27, 3, 3.90),
(52, 26, 28, 1, 3.90),
(53, 26, 27, 1, 3.90),
(54, 27, 42, 1, 35.05),
(55, 27, 41, 1, 25.05),
(56, 27, 29, 1, 4.15),
(57, 28, 43, 1, 78.10),
(58, 28, 43, 1, 78.10),
(62, 30, 43, 1, 78.10),
(63, 30, 1, 1, 28.56),
(64, 31, 43, 1, 78.10),
(65, 31, 40, 1, 67.00),
(66, 31, 36, 1, 29.95),
(67, 31, 31, 1, 34.00),
(68, 32, 40, 1, 67.00),
(69, 32, 27, 1, 3.90),
(70, 32, 29, 1, 4.15),
(71, 32, 29, 1, 4.15),
(72, 32, 43, 1, 78.10),
(73, 33, 43, 1, 78.10),
(74, 34, 42, 1, 35.05),
(75, 35, 41, 1, 25.05),
(76, 36, 40, 1, 67.00),
(77, 37, 39, 1, 24.00),
(78, 38, 31, 1, 34.00),
(79, 38, 42, 1, 35.05),
(80, 38, 29, 1, 4.15),
(81, 38, 1, 1, 28.56),
(82, 38, 25, 1, 5.60),
(86, 40, 43, 1, 78.10),
(93, 44, 45, 1, 4.05),
(96, 47, 26, 1, 6.20),
(97, 48, 42, 1, 35.05),
(98, 48, 43, 1, 78.10),
(101, 51, 33, 1, 13.00),
(107, 57, 42, 1, 35.05),
(108, 57, 41, 1, 25.05),
(109, 58, 49, 1, 43.05),
(110, 58, 29, 1, 4.15),
(111, 59, 49, 1, 43.05),
(112, 59, 48, 1, 0.25),
(113, 59, 47, 1, 0.25),
(114, 59, 46, 1, 4.05),
(115, 59, 45, 1, 4.05),
(116, 59, 39, 1, 24.00),
(117, 59, 40, 1, 67.00),
(118, 59, 41, 1, 25.05),
(119, 59, 42, 1, 35.05),
(120, 59, 43, 1, 78.10),
(121, 59, 39, 1, 24.00),
(122, 59, 34, 1, 13.00),
(123, 59, 35, 1, 14.00),
(124, 59, 36, 1, 29.95),
(125, 59, 37, 1, 34.00),
(126, 59, 38, 1, 23.00),
(127, 59, 28, 1, 3.90),
(128, 59, 29, 1, 4.15),
(129, 59, 30, 1, 45.00),
(130, 59, 31, 1, 34.00),
(131, 59, 33, 1, 13.00),
(132, 59, 1, 1, 28.56),
(133, 59, 25, 1, 5.60),
(134, 59, 27, 1, 3.90),
(135, 60, 49, 1, 43.05),
(136, 60, 1, 1, 28.56),
(137, 61, 43, 1, 78.10),
(138, 61, 1, 1, 28.56),
(139, 61, 29, 1, 4.15),
(143, 65, 26, 1, 6.20),
(144, 65, 1, 1, 28.56),
(145, 65, 29, 1, 4.15),
(146, 66, 31, 1, 34.00),
(147, 67, 34, 1, 13.00),
(148, 67, 35, 1, 14.00),
(149, 67, 36, 1, 29.95),
(150, 67, 36, 1, 29.95),
(151, 68, 35, 1, 14.00),
(152, 68, 36, 1, 29.95),
(153, 68, 34, 1, 13.00),
(154, 68, 26, 1, 6.20),
(155, 68, 29, 1, 4.15),
(156, 68, 47, 1, 0.25),
(157, 69, 48, 1, 0.25),
(158, 69, 25, 1, 5.60),
(159, 69, 28, 1, 3.90),
(160, 69, 34, 1, 13.00),
(161, 69, 36, 1, 29.95),
(162, 70, 55, 1, 0.15),
(163, 70, 43, 1, 78.10),
(164, 71, 53, 1, 4.05),
(165, 71, 43, 1, 78.10),
(166, 72, 52, 1, 4.05),
(167, 72, 53, 1, 4.05),
(168, 72, 34, 1, 13.00);

-- --------------------------------------------------------

--
-- Table structure for table `pet`
--

CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `breed` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `health_notes` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pet`
--

INSERT INTO `pet` (`pet_id`, `name`, `type`, `breed`, `age`, `health_notes`, `user_id`) VALUES
(1, 'Buddy', 'Dog', 'Labrador', 5, 'No known allergies', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `product_img` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `category`, `description`, `price`, `stock`, `product_img`) VALUES
(1, 'Winalot Shapes', 'food', '5 Wholesome buscuits', 28.56, 8, 'https://i.ibb.co.com/m5H2Tbr/images-6.jpg'),
(25, 'parle g biscuit', 'dog-food', 'very good', 5.60, 7, 'https://i.ibb.co/whL96zz/437eb8ec25b0.jpg'),
(26, 'Brew Biscuit', 'dog-food', 'good biscuits', 6.20, 5, 'https://i.ibb.co/YXbVDLr/2a558c4075f2.jpg'),
(27, 'Plastic Indur', 'cat-toy', 'Platicer khelna for your cat', 3.90, 7, 'https://i.ibb.co/BPp0TP6/95c1ffafd1b6.jpg'),
(28, 'Plastic Indur', 'cat-toy', 'Platicer khelna for your cat', 3.90, 7, 'https://i.ibb.co/rQNyd8G/54c7b5904e62.jpg'),
(29, 'plat Fish', 'cat-toy', 'Plastic cat toys', 4.15, 5, 'https://i.ibb.co/54T3rkL/bd3fb0415a9f.jpg'),
(30, 'Cat Star', 'cat-medicine', 'get medicine for cats good health', 45.00, 5, 'https://i.ibb.co/SR5fKKD/e3fc69104223.jpg'),
(31, 'Revolution Plus', 'cat-medicine', 'selami pin and Sarolina Topical Solutions', 34.00, 7, 'https://i.ibb.co/1sQNqvm/8418626a39a2.jpg'),
(33, 'Feverin-P', 'cat-medicine', 'fever in P for cats fever', 13.00, 5, 'https://i.ibb.co/wMrgJ1X/56f133d6aa84.jpg'),
(34, 'Nose reliefer', 'cat-medicine', 'gentle and natural support for healthy national and sinus tract', 13.00, 6, 'https://i.ibb.co/QQPH9TH/b73a772c13b2.jpg'),
(35, 'pyleot power', 'dog-medicine', 'pilot bar fix your dog\'s new vision for your dog', 14.00, 6, 'https://i.ibb.co/yXKWZVB/84072cfafd6e.jpg'),
(36, 'himalaya liv .52', 'cat-medicine', 'PBD Himalaya lead 52 pet liquid 200ML', 29.95, 10, 'https://i.ibb.co/smh9Nmm/1f11f4106426.png'),
(37, 'smoothies golf', 'cat-medicine', 'top **** **** smoothies **** and throat', 34.00, 5, 'https://i.ibb.co/Nshbt0r/5759e229c63c.jpg'),
(38, 'Defender Pro', 'dog-medicine', 'defender pro for your dog', 23.00, 34, 'https://i.ibb.co/qFCBLZy/9a4579d42e37.jpg'),
(39, 'Digyton syrup', 'cat-medicine', 'Himalaya digiton syrup works for your cat and dog to keep their health good', 24.00, 7, 'https://i.ibb.co/pj5XBzH/2226cb1aafc8.jpg'),
(40, 'parle g biscuit', 'cat-medicine', 'gsgfdf', 67.00, 7, 'https://i.ibb.co.com/6tqjHJ1/c8d10bef137d.webp'),
(41, 'Bright Blends', 'bird-food', 'Bright blends bird food', 25.05, 6, 'https://i.ibb.co/b1HvfqJ/1c28fcab8bcd.jpg'),
(42, 'Pnnnigton', 'bird-food', 'Classic willd feed', 35.05, 9, 'https://i.ibb.co/V9SfdSk/1a6e2cf7fd4a.jpg'),
(43, 'Bright Blends', 'bird-food', 'tttt', 78.10, 5, 'https://i.ibb.co/0Zx9nNZ/4ce5d68e2e0a.jpg'),
(45, 'parle g biscuit', 'cat-food', 'dsfdsfd', 4.05, 15, 'https://i.ibb.co/RzyVhVM/46edf76a6977.webp'),
(46, 'parle g biscuit', 'cat-food', 'dsfdsfd', 4.05, 15, 'https://i.ibb.co/RzyVhVM/46edf76a6977.webp'),
(47, 'parle g biscuit', 'cat-food', 'dfgfd', 0.25, 15, 'https://i.ibb.co/gZ7LRX6/96e471ea8112.jpg'),
(48, 'parle g biscuit', 'cat-food', 'dfgfd', 0.25, 15, 'https://i.ibb.co/gZ7LRX6/96e471ea8112.jpg'),
(49, 'parle g biscuit', 'cat-food', 'afsd', 43.05, 15, 'https://i.ibb.co/WgKsnRC/d6babe3c8a41.jpg'),
(50, 'parle g biscuit3', 'dog-food', '3dss', 3.05, 15, 'https://i.ibb.co/YPk6Xd3/60a863ed5e8b.webp'),
(51, 'parle g biscuit3', 'dog-food', '3dss', 3.05, 15, 'https://i.ibb.co/YPk6Xd3/60a863ed5e8b.webp'),
(52, 'parle g biscuit', 'dog-food', 'xzvcx', 4.05, 7, 'https://i.ibb.co/bFfbvKy/9f495c6c3dcf.jpg'),
(53, 'parle g biscuit', 'dog-food', 'xzvcx', 4.05, 7, 'https://i.ibb.co/bFfbvKy/9f495c6c3dcf.jpg'),
(54, 'parle g biscuit', 'dog-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/2kSDqgC/571a7a8d4da6.jpg'),
(55, 'parle g biscuit', 'cat-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/n8zBm1P/9004c2bb86d0.jpg'),
(56, 'parle g biscuit', 'cat-food', 'sdsd', 0.15, 15, 'https://i.ibb.co/58JYCN0/a0c4146f2d58.jpg'),
(57, 'kjkj', 'dog-medicine', 'knrdkfnr', 44.80, 5, 'https://i.ibb.co/Ph9jXfL/5a37bd715ed4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `phone`, `address`, `created_at`) VALUES
(1, 'john_doe', 'turjjohalder41@gmail.com', 'govhaigo483&', '1234567890', 'jhalakathi sadar', '2024-11-13 15:16:19'),
(2, 'mridul', 'mridul123@gmail.com', 'dfhuaifhe8435347', '9482573443', 'nabogram, kafurkathi', '2025-01-24 14:22:44'),
(3, 'ratatta', 'tatata@ksdfm.com', 'ppppppppp', '34523543256', 'Khulna', '2024-11-16 14:22:44'),
(4, 'sdjnfjind', 'tatdsfdsata@ksdfm.com', 'pppppppsdfpp', '323543256', 'Dhaka', '2024-11-16 14:22:44'),
(20, 'yolo', 'oooo@gmail.com', 'pbkdf2:sha256:1000000$HYyX51aZuHJ1Ia7n$7d17471273ab826be66c9625aa859471a9d1d746a08aca94449f577bfa4cd', '4356464536534', 'gdbfhgfbt', '2024-11-30 04:38:15'),
(22, 'salman khan', 'salmankhan@gmail.com', 'pbkdf2:sha256:1000000$rhpf0iAbgGHozATT$41c01ec0e3d698f0a9f6df331ff95f51ce10ad7ddf54e9d1c569e0a9aabb08b4', '0164897520', 'delhi', '2024-11-30 04:58:35'),
(24, 'Turjjo', 'turjohaldermridul@gmail.com', 'pbkdf2:sha256:1000000$7whrlMDPXoZT5uI4$1e67fcb04a151d05d0d55efa0c73e3919fd5f037e60a3ad1f6ebc72b88117553', '01642649050', 'Kafurkathi ,Jhalakathi', '2024-11-30 07:09:01'),
(27, 'Jolil', 'j@j.com', 'pbkdf2:sha256:1000000$hrBj2dBTbKverBpi$0b308b0e8c7f38b2eccd179c55a4e4bf93ef44f5fd3d465d1195786d7e29f27c', '789076', 'Dhaka', '2024-12-12 06:34:37'),
(28, 'juel', 'j@u.com', 'pbkdf2:sha256:1000000$PsHba1S9ssqUd1yu$e1aec238aa56a06a511c7858aa9ac81730fa0a09e822fa67a69050e5a0494bb2', '01913935078', 'Dhaka', '2024-12-19 10:39:15'),
(29, 'Mithun', 'm@t.com', 'pbkdf2:sha256:1000000$EcHmPYsxi39RtS2b$005393dd955c094a99777753f5a78aaba417417379ec9d4dc4516fa7cc2e994f', '789', 'Khulna', '2024-12-21 07:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `veterinarian`
--

CREATE TABLE `veterinarian` (
  `vet_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `veterinarian`
--

INSERT INTO `veterinarian` (`vet_id`, `name`, `specialty`, `phone`, `address`, `email`) VALUES
(1, 'Dr. Smith', 'Canine Specialist', '9876543210', '456 Vet Road', 'dr.smith@vetclinic.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`unique_key`),
  ADD UNIQUE KEY `unique_key` (`unique_key`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `vet_id` (`vet_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `veterinarian`
--
ALTER TABLE `veterinarian`
  ADD PRIMARY KEY (`vet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `veterinarian`
--
ALTER TABLE `veterinarian`
  MODIFY `vet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `veterinarian` (`vet_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `pet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
