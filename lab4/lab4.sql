-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2025 at 11:13 PM
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
-- Database: `lab4`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `full_name`, `year_of_birth`, `order_id`, `service_id`) VALUES
(1, 'Anna Petrova', 1995, 1, 3),
(2, 'Ivan Ivanov', 1988, 2, 1),
(3, 'Maria Sokolova', 2000, 3, 4),
(4, 'Petr Voronov', 1992, 4, 2),
(5, 'Elena Smirnova', 1985, 5, 7),
(6, 'Artem Lebedev', 1999, 6, 5),
(7, 'Sofia Volkova', 1993, 7, 9),
(8, 'Maxim Orlov', 1987, 8, 6),
(9, 'Nina Kiseleva', 1991, 9, 8),
(10, 'Dmitry Pavlov', 1996, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`) VALUES
(1, 'Wedding Photoshoot'),
(2, 'Birthday Party'),
(3, 'Graduation Session'),
(4, 'Model Portfolio'),
(5, 'Studio Portraits'),
(6, 'Family Photoshoot'),
(7, 'Corporate Event'),
(8, 'Outdoor Photoshoot'),
(9, 'Product Photoshoot'),
(10, 'Engagement Session');

-- --------------------------------------------------------

--
-- Table structure for table `photographers`
--

CREATE TABLE `photographers` (
  `photo` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phototype_id` int(11) DEFAULT NULL,
  `short_bio` text DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photographers`
--

INSERT INTO `photographers` (`photo`, `full_name`, `phototype_id`, `short_bio`, `date_of_birth`) VALUES
(1, 'Oleg Morozov', 1, 'Specializes in portrait photography for over 8 years.', '1987-04-12'),
(2, 'Svetlana Korneeva', 2, 'Wedding photographer with elegant style.', '1990-06-25'),
(3, 'Roman Alekseev', 3, 'Experienced in commercial and product photography.', '1985-09-10'),
(4, 'Irina Volkova', 4, 'Fashion photographer working with magazines.', '1992-02-18'),
(5, 'Kirill Rybakov', 5, 'Covers events and corporate meetings.', '1988-11-30'),
(6, 'Natalia Ignatova', 6, 'Creates warm family shoots.', '1993-08-14'),
(7, 'Denis Fadeev', 7, 'Street life and candid photography expert.', '1989-03-03'),
(8, 'Marina Frolova', 8, 'Loves nature and landscape photography.', '1995-07-27'),
(9, 'Egor Stepanov', 9, 'Captures fast-paced sports moments.', '1991-01-22'),
(10, 'Julia Petrova', 10, 'Works in studio settings with complex lighting.', '1986-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `photo_type`
--

CREATE TABLE `photo_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photo_type`
--

INSERT INTO `photo_type` (`id`, `name`) VALUES
(1, 'Portrait Photographer'),
(2, 'Wedding Photographer'),
(3, 'Product Photographer'),
(4, 'Fashion Photographer'),
(5, 'Event Photographer'),
(6, 'Family Photographer'),
(7, 'Street Photographer'),
(8, 'Nature Photographer'),
(9, 'Sports Photographer'),
(10, 'Studio Photographer');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'Standard Package', 150.00),
(2, 'Premium Package', 250.00),
(3, 'VIP Package', 400.00),
(4, 'Retouching', 50.00),
(5, 'Printing', 20.00),
(6, 'Express Delivery', 15.00),
(7, 'Photo Album', 80.00),
(8, 'Makeup Service', 100.00),
(9, 'Outdoor Setup', 60.00),
(10, 'Lighting Rental', 120.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photographers`
--
ALTER TABLE `photographers`
  ADD PRIMARY KEY (`photo`),
  ADD KEY `phototype_id` (`phototype_id`);

--
-- Indexes for table `photo_type`
--
ALTER TABLE `photo_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `photographers`
--
ALTER TABLE `photographers`
  MODIFY `photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `photo_type`
--
ALTER TABLE `photo_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `photographers`
--
ALTER TABLE `photographers`
  ADD CONSTRAINT `photographers_ibfk_1` FOREIGN KEY (`phototype_id`) REFERENCES `photo_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
