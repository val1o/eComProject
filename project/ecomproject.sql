-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 05:53 AM
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
-- Database: `3dprintmtl`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `timeOfCreation` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `header` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `template_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `timeOfCreation`, `header`, `body`, `user_id`, `template_id`) VALUES
(1, '2023-11-07 00:12:49', 'Like it!', 'Really nice', 1, 2),
(2, '2023-12-15 13:04:42', 'Scenery', 'very nice photo, reminds me of touching grass', 2, 2),
(3, '2023-12-15 22:53:47', 'wowow', 'zooweemama!!', 2, NULL),
(4, '2023-12-15 22:58:05', 'cat', 'there\'s a hidden cat at the top!!', 2, 2),
(5, '2023-12-15 23:04:44', '', '', 2, 2),
(6, '2023-12-16 02:19:59', 'i love art', 'this is a masterpiece i must say', 2, 2),
(7, '2023-12-16 02:23:44', 'mystery', 'i wonder what the time is', 2, 2),
(13, '2023-12-16 02:35:15', 'what a creature', 'i just love these animals', 2, 1),
(14, '2023-12-16 02:37:10', 'testing add', 'hopefully now it fully works', 2, 1),
(40, '2023-12-16 04:51:07', 'fboeufbuoef', 'fbiewufbouewbfuoe', 2, 1),
(41, '2023-12-16 04:51:31', 'bfeiufeb', 'fbewiufebwui', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `prints`
--

CREATE TABLE `prints` (
  `printID` int(255) NOT NULL,
  `completionProgress` int(3) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(255) DEFAULT NULL,
  `template_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prints`
--

INSERT INTO `prints` (`printID`, `completionProgress`, `timestamp`, `user_id`, `template_id`) VALUES
(1, 100, '2023-12-01 05:05:50', 1, 1),
(2, 50, '2023-12-01 05:05:50', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `refundID` int(255) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `timeIssued` datetime NOT NULL,
  `print_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refunds`
--

INSERT INTO `refunds` (`refundID`, `reason`, `timeIssued`, `print_id`, `user_id`) VALUES
(1, 'no moners', '2023-11-06 19:15:20', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `reportID` int(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `header` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `comment_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`reportID`, `status`, `header`, `body`, `user_id`, `comment_id`) VALUES
(1, 'Regected', 'Reported!', 'I love spy', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `shipmentID` int(255) NOT NULL,
  `completionProgress` int(3) NOT NULL,
  `timeOfCreation` datetime NOT NULL,
  `print_id` int(255) DEFAULT NULL,
  `user_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`shipmentID`, `completionProgress`, `timeOfCreation`, `print_id`, `user_id`) VALUES
(1, 100, '2023-11-06 19:12:21', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tagID` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `template_id` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `templateID` int(255) NOT NULL,
  `file` tinytext NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `theme` enum('Fanatasy','Industrial','Educational','Hobby','Other') NOT NULL,
  `title` varchar(50) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`templateID`, `file`, `creationDate`, `theme`, `title`, `user_id`, `description`) VALUES
(1, 'https://images.unsplash.com/photo-1533450718592-29d45635f0a9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEyMDd9', '2023-11-06 19:09:31', '', 'LegoStarWars', 1, 'This is the description for the first file.'),
(2, 'https://images3.alphacoders.com/165/thumb-1920-165265.jpg', '2023-11-06 19:10:25', '', 'Tree', 2, 'This is the description for the second file.'),
(3, 'https://wallpapercave.com/wp/wp2568544.jpg', '2023-11-06 19:10:25', '', 'gym', 3, 'This is the description for the third file.'),
(4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.uhdpaper.com%2Fwallpaper%2Fstray-kids-maniac-felix-109%401%40g-pc-4k.jpg&f=1&nofb=1&ipt=1b297219f1b5c80a4d19402daf883d9fa60e25256812c957bd1447e0d42e7b11&ipo=images', NULL, '', 'Felix', NULL, 'Statue of Felix'),
(5, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.allkpop.com%2Fupload%2F2022%2F12%2Fcontent%2F131144%2F1670949858-untitled-1.jpg&f=1&nofb=1&ipt=41008e29bd972b630541a88e0c324eca7a0cfbdfa8db40670e66427d612d69da&ipo=images', NULL, '', 'Statue of HAN', NULL, 'SKZ AAA 2023 LESSS GOOOOOOOO'),
(6, 'watch', NULL, '', 'My wathc, yayayaya', NULL, 'i bought this watch a while ago');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uID` int(255) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `telephoneNumber` varchar(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `postalCode` varchar(8) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uID`, `firstName`, `lastName`, `telephoneNumber`, `address`, `postalCode`, `username`, `password`, `isAdmin`) VALUES
(1, 'valentin', 'atanasov', '438-630-2425', '394 51e Ave. Lachine', 'H8T2W5', 'valio', 'sum123', 1),
(2, 'daniel', 'levitin', '514-123-4567', '123 funny street', 'H1H2H3', 'daniel', 'sum345', 0),
(3, 'sebastian', 'parachievescu', '263-234-5432', 'the woods', 'H7H8H9', 'waccy', 'chad', 0),
(4, 'Sani', 'Atanasov', '222-222-2222', '27348273ss', 'H8H6H7', 'sani', 'ata', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `associatedWithUserFromComment` (`user_id`),
  ADD KEY `associatedWithTemplateFromComment` (`template_id`);

--
-- Indexes for table `prints`
--
ALTER TABLE `prints`
  ADD PRIMARY KEY (`printID`),
  ADD KEY `associatedWithUserFromPrint` (`user_id`),
  ADD KEY `associatedWithTemplateFromPrint` (`template_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`refundID`),
  ADD KEY `associatedWithUserFromRefun` (`user_id`),
  ADD KEY `associatedWithPrintFromRefund` (`print_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`reportID`),
  ADD KEY `associatedWithUserFromReport` (`user_id`),
  ADD KEY `associatedWithUseCommentFromReport` (`comment_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`shipmentID`),
  ADD KEY `associatedWithUserFromShipment` (`user_id`),
  ADD KEY `associatedWithPrintFromShipment` (`print_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tagID`),
  ADD KEY `associatedWithTemplateFromTag` (`template_id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`templateID`),
  ADD KEY `associatedWithUserFromTemplate` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `prints`
--
ALTER TABLE `prints`
  MODIFY `printID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `refundID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `reportID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `shipmentID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tagID` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `templateID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `associatedWithTemplateFromComment` FOREIGN KEY (`template_id`) REFERENCES `templates` (`templateID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `associatedWithUserFromComment` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `prints`
--
ALTER TABLE `prints`
  ADD CONSTRAINT `associatedWithTemplateFromPrint` FOREIGN KEY (`template_id`) REFERENCES `templates` (`templateID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `associatedWithUserFromPrint` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `associatedWithPrintFromRefund` FOREIGN KEY (`print_id`) REFERENCES `prints` (`printID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `associatedWithUserFromRefun` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `associatedWithUseCommentFromReport` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`commentID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `associatedWithUserFromReport` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `associatedWithPrintFromShipment` FOREIGN KEY (`print_id`) REFERENCES `prints` (`printID`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `associatedWithUserFromShipment` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `associatedWithTemplateFromTag` FOREIGN KEY (`template_id`) REFERENCES `templates` (`templateID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `templates`
--
ALTER TABLE `templates`
  ADD CONSTRAINT `associatedWithUserFromTemplate` FOREIGN KEY (`user_id`) REFERENCES `users` (`uID`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
