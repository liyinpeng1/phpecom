-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 07:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `prod_id`, `prod_qty`, `created_at`) VALUES
(20, 1, 2, 1, '2022-10-11 04:05:23');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `popular` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `status`, `popular`, `image`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`) VALUES
(1, 'Mobiles', 'mobiles', 'All kinds of miobiles', 0, 1, '1645864039.jpg', 'Mobiles', 'All kinds of miobiles', 'All kinds of miobiles', '2022-02-22 23:10:08'),
(2, 'Electronics', 'electronics', 'all kinds of good electronics here', 0, 0, '1645686122.jpg', 'Electronics', 'good electronics, electronicsgood electronics, electronics', 'good electronics, electronicsgood electronics, electronics', '2022-02-24 01:32:02'),
(3, 'Fashion', 'fashion', 'All kinds of clothes and dresses', 0, 1, '1645686212.jpg', 'Fashion', 'Fashion, modern fashion, Fashion, modern fashion', 'Fashion, modern fashion', '2022-02-24 01:33:32'),
(4, 'Laptops', 'laptops', 'All kinds of laptops here', 0, 0, '1645686298.jpg', 'Laptops', 'All kinds of laptops here', 'hp laptop, dell laptop,blah , blah', '2022-02-24 01:34:58'),
(5, 'Footwear', 'footwear', 'footwearfootwearfootwearfootwear', 0, 1, '1645687837.jpg', 'Footwear', 'footwearfootwearfootwearfootwear', 'footwearfootwearfootwearfootwear', '2022-02-24 02:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` mediumtext NOT NULL,
  `pincode` int(191) NOT NULL,
  `total_price` int(191) NOT NULL,
  `payment_mode` varchar(191) NOT NULL,
  `payment_id` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `comments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `tracking_no`, `user_id`, `name`, `email`, `phone`, `address`, `pincode`, `total_price`, `payment_mode`, `payment_id`, `status`, `comments`, `created_at`) VALUES
(1, 'sharmacoder63016565998', 1, 'OM prakash', 'om@gmail.com', '656565998', 'testing address', 560088, 46397, 'COD', '', 1, NULL, '2022-08-02 08:59:28'),
(2, 'sharmacoder6023sf', 1, 'asdf', 'asdf@gmai.com', 'adsf', 'adsfasf', 0, 46397, 'COD', '', 0, NULL, '2022-08-02 09:01:35'),
(3, 'sharmacoder6779df', 1, 'adsf', 'asdf@gmail.com', 'asdf', 'sdfa', 0, 47997, 'COD', '', 0, NULL, '2022-08-03 07:37:20'),
(4, 'sharmacoder7435sf', 1, 'asdf', 'adsf', 'adsf', 'adsf', 0, 15999, 'Paid by PayPal', '47X98245JT480770K', 0, NULL, '2022-10-07 07:16:40'),
(5, 'sharmacoder4647df', 1, 'asd', 'fadsf', 'asdf', 'adsf', 0, 22999, 'Paid by PayPal', '88F32539DL1774142', 0, NULL, '2022-10-07 07:21:03'),
(6, 'sharmacoder2684sf', 1, 'asdf', 'asdf', 'adsf', 'a', 0, 15999, 'Paid by PayPal', '4EU871766J269392G', 0, NULL, '2022-10-07 07:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(191) NOT NULL,
  `prod_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` int(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `prod_id`, `qty`, `price`, `created_at`) VALUES
(1, 1, 4, 1, 399, '2022-08-02 08:59:28'),
(2, 1, 2, 2, 22999, '2022-08-02 08:59:28'),
(3, 2, 4, 1, 399, '2022-08-02 09:01:35'),
(4, 2, 2, 2, 22999, '2022-08-02 09:01:35'),
(5, 3, 1, 3, 15999, '2022-08-03 07:37:20'),
(6, 4, 1, 1, 15999, '2022-10-07 07:16:40'),
(7, 5, 2, 1, 22999, '2022-10-07 07:21:03'),
(8, 6, 1, 1, 15999, '2022-10-07 07:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `small_description` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `original_price` int(11) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `trending` tinyint(4) NOT NULL,
  `meta_title` varchar(191) NOT NULL,
  `meta_keywords` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `small_description`, `description`, `original_price`, `selling_price`, `image`, `qty`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(1, 1, 'Redmi Note 7', 'redmi-note-7', 'Redmi Note 7 Redmi Note 7 is a mobile phone nby xaomi', 'Redmi Note 7 Redmi Note 7 is a mobile phone nby xaomiRedmi Note 7 Redmi Note 7 is a mobile phone nby xaomiRedmi Note 7 Redmi Note 7 is a mobile phone nby xaomiRedmi Note 7 Redmi Note 7 is a mobile phone nby xaomi', 17999, 15999, '1646727336.jpg', 15, 0, 1, 'Redmi Note 7', 'Redmi Note 7', 'Redmi Note 7', '2022-03-08 02:45:36'),
(2, 1, 'Redmi K20 Pro', 'redmi-k20-pro', 'Powered by the Qualcomm 855 processor, Adreno 640 GPU, and 6 GB of RAM, the Redmi K20 Pro offers incredible power and efficiency in all your daily tasks', 'The K20 Pro opens up new possibilities. The blazing-fast processor Qualcomm Snapdragon 855 gives you peak performance, while a 48 MP Triple camera setup lets you see things from a different perspective altogether. Be it gaming or everyday tasks this device handles it flawlessly. The beautiful 16.23-cm (6.39) Horizon AMOLED display is a delight when it comes to viewing content on the go. The Aura Prime design gives the device a unique look while the Corning Gorilla Glass 5 on the front and back enhances the overall user experience', 24999, 22999, '1647443533.jpg', 54, 0, 1, 'Redmi K20 Pro', 'Redmi K20 Pro, Redmi K20 Pro, Redmi K20 Pro', 'Powered by the Qualcomm 855 processor, Adreno 640 GPU, and 6 GB of RAM, the Redmi K20 Pro offers incredible power and efficiency in all your daily tasks', '2022-03-09 08:33:31'),
(3, 4, 'HP 15s-dy3501TU', 'hp-core-i3-15s-dy3501tu', 'HP Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 15s-dy3501TU Thin and Light Laptop  (15.6 inch, Natural Silver, 1.75 kg, With MS Office)', 'HP Core i3 11th Gen - (8 GB/512 GB SSD/Windows 11 Home) 15s-dy3501TU Thin and Light Laptop  (15.6 inch, Natural Silver, 1.75 kg, With MS Office)\r\nStylish & Portable Thin and Light Laptop\r\n15.6 inch HD, micro-edge, anti-glare, Brightness: 250 nits, 101 ppi, Color Gamut: 45% NTSC\r\nLight Laptop without Optical Disk Drive', 49999, 45999, '1646834878.jpg', 10, 0, 0, 'HP 15s-dy3501TU', 'HP 15s-dy3501TU', 'HP 15s-dy3501TU', '2022-03-09 08:37:58'),
(4, 3, 'T shirt Black - Men', 't-shirt-black-for-men', 'The Lifestyle Co Men Navy & Blue Melange Colourblocked Contrast Pocket T-shirt\r\n', 'The Lifestyle Co Men Navy & Blue Melange Colourblocked Contrast Pocket T-shirt and The Lifestyle Co Men Navy & Blue Melange Colourblocked Contrast Pocket T-shirt\r\n', 599, 399, '1646835204.jpg', 50, 0, 0, 'T shirt Black - Men', 'T shirt Black - Men', 'T shirt Black - Men', '2022-03-09 08:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(191) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`, `role_as`, `created_at`) VALUES
(1, 'om', 'om@gmail.com', '2147483647', '1234', 1, '2022-02-14 10:49:59'),
(2, 'user', 'user@gmail.com', '1231231233', '1234', 0, '2022-02-14 10:51:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
