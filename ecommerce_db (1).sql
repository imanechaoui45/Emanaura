-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2025 at 04:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `quantity`, `product_id`, `user_id`) VALUES
(2, 4, 1, 6),
(6, 1, 39, 6),
(7, 1, 5, 6),
(8, 1, 9, 6),
(9, 1, 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `image_name`, `is_active`, `name`) VALUES
(1, 'img1.png', b'1', 'Women'),
(2, 'img3.png', b'1', 'Men'),
(3, 'img6.png', b'1', 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sentiment_category` enum('POSITIVE','NEUTRAL','NEGATIVE') DEFAULT NULL,
  `sentiment_score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `created_at`, `updated_at`, `product_id`, `user_id`, `sentiment_category`, `sentiment_score`) VALUES
(1, 'nice', '2025-05-26 21:37:40.000000', '2025-05-26 21:37:40.000000', 1, 6, NULL, NULL),
(3, 'I LIKE IT', '2025-05-26 22:38:28.000000', '2025-05-26 22:38:28.000000', 1, 6, NULL, NULL),
(4, 'I like this shirt', '2025-05-26 22:48:48.000000', '2025-05-26 22:48:48.000000', 29, 9, NULL, NULL),
(5, 'nice price', '2025-05-26 23:03:03.000000', '2025-05-26 23:03:03.000000', 5, 6, NULL, NULL),
(6, 'hi', '2025-05-26 23:20:36.000000', '2025-05-26 23:20:36.000000', 1, 6, NULL, NULL),
(8, 'salam', '2025-05-26 23:54:23.000000', '2025-05-26 23:54:23.000000', 1, 6, NULL, NULL),
(9, 'niiice', '2025-05-26 23:54:47.000000', '2025-05-26 23:54:47.000000', 11, 6, NULL, NULL),
(10, 'OMG I LOVE IT', '2025-05-26 23:55:32.000000', '2025-05-26 23:55:32.000000', 39, 6, NULL, NULL),
(11, 'oooh nice', '2025-05-27 00:00:24.000000', '2025-05-27 00:00:24.000000', 1, 9, NULL, NULL),
(12, 'My Favorite one', '2025-05-27 02:05:49.000000', '2025-05-27 02:05:49.000000', 6, 6, NULL, NULL),
(13, 'nice', '2025-05-27 11:42:31.000000', '2025-05-27 11:42:36.000000', 2, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_address`
--

CREATE TABLE `order_address` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `discount` int(11) NOT NULL,
  `discount_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category`, `description`, `discount`, `discount_price`, `image`, `is_active`, `price`, `stock`, `title`) VALUES
(1, 'Women', 'Elegant red dress with long sleeves.', 0, NULL, 'img1.png', b'1', 750, 20, 'Red Dress'),
(2, 'Women', 'Charming maroon dress with a belt.', 0, NULL, 'img2.png', b'1', 599, 15, 'Maroon Dress'),
(3, 'Women', 'Classic black dress with long sleeves.', 0, NULL, 'img3.png', b'1', 499, 10, 'Black Dress'),
(4, 'Women', 'Sophisticated olive green dress with buttons.', 0, NULL, 'img4.png', b'1', 300, 12, 'Olive Green Dress'),
(5, 'Women', 'Stylish beige blazer for formal occasions.', 0, NULL, 'img5.png', b'1', 120, 8, 'Beige Blazer'),
(6, 'Women', 'Elegant cream-colored dress with a flowing design.', 0, NULL, 'img6.png', b'1', 100, 15, 'Cream Dress'),
(7, 'Women', 'Modern gray blazer suitable for business meetings.', 0, NULL, 'img7.png', b'1', 110, 10, 'Gray Blazer'),
(8, 'Women', 'Casual light blue dress with short sleeves.', 0, NULL, 'img8.png', b'1', 55, 25, 'Light Blue Dress'),
(9, 'Women', 'Summer yellow dress with floral patterns.', 0, NULL, 'img9.png', b'1', 60, 30, 'Yellow Dress'),
(10, 'Women', 'Classy navy blue dress with a bow tie.', 0, NULL, 'img10.png', b'1', 85, 12, 'Navy Blue Dress'),
(11, 'Women', 'Slim fit navy blue blazer for men.', 0, NULL, 'img11.png', b'1', 130, 8, 'Navy Blue Blazer'),
(12, 'Women', 'Stylish pink dress with ruffles.', 0, NULL, 'img12.png', b'1', 70, 20, 'Pink Dress'),
(13, 'Women', 'Luxury black blazer with satin lapels.', 0, NULL, 'img13.png', b'1', 150, 5, 'Black Blazer'),
(14, 'Women', 'Graceful purple dress with lace details.', 0, NULL, 'img14.png', b'1', 95, 10, 'Purple Dress'),
(15, 'Women', 'Formal white dress with pleats.', 0, NULL, 'img15.png', b'1', 110, 8, 'White Dress'),
(16, 'Women', 'Classic brown blazer for casual wear.', 0, NULL, 'img16.png', b'1', 100, 12, 'Brown Blazer'),
(17, 'Women', 'Chic turquoise dress with a high slit.', 0, NULL, 'img17.png', b'1', 105, 15, 'Turquoise Dress'),
(18, 'Women', 'Vintage green dress with polka dots.', 0, NULL, 'img18.png', b'1', 85, 20, 'Green Polka Dot Dress'),
(19, 'Women', 'Trendy charcoal gray blazer with a modern cut.', 0, NULL, 'img19.png', b'1', 125, 10, 'Charcoal Gray Blazer'),
(20, 'Women', 'Cute baby pink dress with puff sleeves.', 0, NULL, 'img20.png', b'1', 75, 25, 'Baby Pink Dress'),
(21, 'Women', 'Unique orange dress with geometric patterns.', 0, NULL, 'img21.png', b'1', 80, 18, 'Orange Geometric Dress'),
(22, 'Women', 'Fashionable burgundy blazer with velvet texture.', 0, NULL, 'img22.png', b'1', 140, 7, 'Burgundy Blazer'),
(23, 'Women', 'Glamorous gold sequin dress for parties.', 0, NULL, 'img23.png', b'1', 130, 5, 'Gold Sequin Dress'),
(24, 'Women', 'Comfortable striped dress in blue and white.', 0, NULL, 'img24.png', b'1', 60, 30, 'Blue & White Striped Dress'),
(25, 'men', ' white button-up shirt and beige pants.', 0, NULL, 'img25.png', b'1', 49.99, 50, 'shirt and beige pants'),
(26, 'men', ' brown knitted sweater over white shirt.', 0, NULL, 'img26.png', b'1', 59.99, 40, ' sweater over white shirt'),
(27, 'men', ' black zip-up jacket over white shirt.', 0, NULL, 'img27.png', b'1', 69.99, 30, ' jacket over white shirt'),
(28, 'men', ' dark blue button-up shirt and beige pants.', 0, NULL, 'img28.png', b'1', 79.99, 20, 'shirt '),
(29, 'men', ' light-colored striped shirt and beige pants.', 0, NULL, 'img29.png', b'1', 89.99, 10, 'shirt '),
(30, 'men', 'brown jacket and black pants, carrying a backpack.', 0, NULL, 'img30.png', b'1', 99.99, 15, 'brown jacket '),
(31, 'men', ' green button-up shirt and beige pants.', 0, NULL, 'img31.png', b'1', 109.99, 25, ' green button-up shirt '),
(32, 'men', ' light green polo shirt and beige pants.', 0, NULL, 'img32.png', b'1', 119.99, 35, 'green polo shirt '),
(33, 'men', 'black t-shirt and white sneakers.', 0, NULL, 'img33.png', b'1', 129.99, 45, 'polo shirt '),
(34, 'men', 'light-colored button-up shirt and beige pants.', 0, NULL, 'img34.png', b'1', 139.99, 55, ' button-up shirt'),
(35, 'men', 'long coat and beige pants.', 0, NULL, 'img35.png', b'1', 149.99, 60, 'coat'),
(36, 'men', 'light-colored button-up shirt and beige pants.', 0, NULL, 'img36.png', b'1', 159.99, 70, ' button-up shirt'),
(37, 'men', 'dark-colored button-up shirt and beige pants.', 0, NULL, 'img37.png', b'1', 169.99, 80, ' button-up shirt'),
(38, 'men', 'light green polo shirt and beige pants.', 0, NULL, 'img38.png', b'1', 179.99, 80, 'polo shirt'),
(39, 'Accessories', 'A close-up of a hand wearing a ring.', 0, NULL, 'img39.png', b'1', 29.99, 100, ' ring'),
(40, 'Accessories', 'A brown belt.', 0, NULL, 'img40.png', b'1', 19.99, 80, 'brown belt'),
(41, 'Accessories', 'A wristwatch with a gold band.', 0, NULL, 'img41.png', b'1', 79.99, 50, 'wristwatch'),
(42, 'Accessories', 'A person wearing a smartwatch.', 0, NULL, 'img42.png', b'1', 99.99, 40, 'watch'),
(43, 'Accessories', 'A pair of black sunglasses.', 0, NULL, 'img43.png', b'1', 39.99, 60, 'sunglasses'),
(44, 'Accessories', 'A necklace with a pendant.', 0, NULL, 'img44.png', b'1', 49.99, 70, 'necklace'),
(45, 'Accessories', 'A gold necklace with a small pendant.', 0, NULL, 'img45.png', b'1', 59.99, 90, ' gold necklace '),
(46, 'Accessories', 'Exquisite Diamond Necklace with a stunning pendant featuring a large, sparkling diamond.', 0, NULL, 'img46.png', b'1', 5000, 5, 'Diamond Necklace');

-- --------------------------------------------------------

--
-- Table structure for table `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `order_address_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` bigint(20) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_dtls`
--

CREATE TABLE `user_dtls` (
  `id` int(11) NOT NULL,
  `account_non_locked` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `failed_attempt` int(11) DEFAULT NULL,
  `is_enable` bit(1) DEFAULT NULL,
  `lock_time` datetime(6) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_dtls`
--

INSERT INTO `user_dtls` (`id`, `account_non_locked`, `address`, `city`, `email`, `failed_attempt`, `is_enable`, `lock_time`, `mobile_number`, `name`, `password`, `pincode`, `profile_image`, `reset_token`, `role`, `state`) VALUES
(3, b'1', 'Essaouira', 'Essaouira', 'imane@gmail.com', 0, b'1', NULL, '0710297724', 'imane', '$2a$10$IVp53ra7U8PZk2Vpi8.ciOvJ.KIrVtd3K4HjDKLnX2D74fB6FMQzu', '44250', 'imane.jpg', NULL, 'ROLE_ADMIN', 'essaouira'),
(4, b'1', 'Casablanca', 'Casablanca', 'illiase@gmail.com', 0, b'1', NULL, '0687996284', 'Illiasse', '$2a$10$RORj5.K8kYU9p0oFKbwbveg/42BCFhf1pNj0koWE2Za2U305ZVqfa', '4455', 'default.jpg', NULL, 'ROLE_ADMIN', 'Casablanca'),
(6, b'1', 'Rabat', 'Rabat', 'hiba@gmail.com', 1, b'1', NULL, '0755332244', 'hiba', '$2a$10$AO5CFJEGrlPb/GXFzf0tVeCfTvonYUOsm6m7s5BwKXAC7r8WJQumK', '665544', 'hiba.jpg', NULL, 'ROLE_USER', 'Rabat'),
(7, b'1', 'dddddddd', 'ffffff', 'user@gmail.com', 0, b'1', NULL, '8888888888888888', 'werer', '$2a$10$J.z.PhwX0BgUSCFa1OgMPu.sujb6WV.UrXrcwkj/tuLbW3QH0hybS', '1234', 'COLOR_PALETTE.jpg', NULL, 'ROLE_USER', 'rrttyy'),
(9, b'1', 'Essaouira', 'essaouira', 'salah@gmail.com', 0, b'1', NULL, '0722331144', 'Salah', '$2a$10$w3Z9GeleJwFdUpbLUmCLCugy5hahwOEC.r0bNQevpPKgfzyaiTgDm', '3322', 'salah.jpg', NULL, 'ROLE_USER', 'Essaouira');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  ADD KEY `FK9x4wn098i53ikun1ynxet2ynj` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_comment` (`product_id`),
  ADD KEY `FK_user_comment` (`user_id`);

--
-- Indexes for table `order_address`
--
ALTER TABLE `order_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_qcdbxaeuc7c5gahwh0dutg04r` (`order_address_id`),
  ADD KEY `FKh73acsd9s5wp6l0e55td6jr1m` (`product_id`),
  ADD KEY `FK4f2ycr32kigtux5ag3tv0xu5m` (`user_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe4hdbsmrx9bs9gpj1fh4mg0ku` (`category_id`);

--
-- Indexes for table `user_dtls`
--
ALTER TABLE `user_dtls`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_address`
--
ALTER TABLE `order_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_dtls`
--
ALTER TABLE `user_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK9x4wn098i53ikun1ynxet2ynj` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_product_comment` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `FK4f2ycr32kigtux5ag3tv0xu5m` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`),
  ADD CONSTRAINT `FK8frxalwc79tpxo7hgqp3hsjck` FOREIGN KEY (`order_address_id`) REFERENCES `order_address` (`id`),
  ADD CONSTRAINT `FKh73acsd9s5wp6l0e55td6jr1m` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `FKe4hdbsmrx9bs9gpj1fh4mg0ku` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
