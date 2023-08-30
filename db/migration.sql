-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2023 at 12:58 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `referencePoint` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attributevalue`
--

CREATE TABLE `attributevalue` (
  `ID` int(11) NOT NULL,
  `attributeID` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `ID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `nameUz` varchar(255) DEFAULT NULL,
  `nameRu` varchar(255) DEFAULT NULL,
  `parentCategoryID` int(11) DEFAULT NULL,
  `vievCount` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `desUz` varchar(255) DEFAULT NULL,
  `desRu` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--


-- --------------------------------------------------------

--
-- Table structure for table `category_attribute`
--

CREATE TABLE `category_attribute` (
  `category_ID` int(11) NOT NULL,
  `attribute_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `category_ID` int(11) NOT NULL,
  `product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `ID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ID` int(11) NOT NULL,
  `productID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `addressID` int(11) DEFAULT NULL,
  `deliveryTime` varchar(255) DEFAULT '1day',
  `orderStatus` varchar(255) DEFAULT 'pending',
  `deliveryPrice` int(11) DEFAULT '15000',
  `orderCount` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `nameUz` varchar(255) DEFAULT NULL,
  `nameRu` varchar(255) DEFAULT NULL,
  `images` text,
  `categoryID` int(11) DEFAULT NULL,
  `descShortUz` varchar(255) DEFAULT NULL,
  `descShortRu` varchar(255) DEFAULT NULL,
  `descRu` text,
  `descUz` text,
  `isPopular` tinyint(1) DEFAULT '0',
  `vievCount` int(11) DEFAULT '0',
  `price` int(11) DEFAULT '0',
  `cartCount` int(11) DEFAULT '0',
  `favoriteCount` int(11) DEFAULT '0',
  `orderCount` int(11) DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_ID` int(11) NOT NULL,
  `attribute_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `comment` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `hashedPassword` varchar(255) DEFAULT NULL,
  `hashedRefreshtoken` varchar(255) DEFAULT NULL,
  `createdAt` varchar(255) DEFAULT 'now()',
  `updatedAt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `name`, `phone`, `otp`, `image`, `hashedPassword`, `hashedRefreshtoken`, `createdAt`, `updatedAt`) VALUES
(7, 'eeeee', '23455432', NULL, NULL, '$2b$10$.CNSR9AJlfKN0FvCfkNyl.mdeWXnc5zE93xhPm6CWtrDub4Cd958S', '$2b$10$vdQ63FkFJKvi5oLTf4OIQOof0Fw0xPUrNTKO9jI64zzf/DlgI0h.y', 'now()', NULL),
(8, '123456789', '123456789', NULL, NULL, '$2b$10$3NG9Q0XAB6p1K75flN3/n.fa0pOtPL4XkZufSVHrvUpo7xdgch4Si', '$2b$10$g39nDLT89YKKV/R2nbdMw.0OA1H7ioNEsfao.fckpzHyohUw5ddNO', 'now()', NULL),
(9, NULL, '112323333', NULL, NULL, '$2b$10$By1wlYsYjwCRzPpJ9LFKRuo.7znTgp0R0bgab8lerC/M6e54AZRDu', NULL, 'now()', NULL),
(10, NULL, '11232333', NULL, NULL, '$2b$10$0a0Y.5F2jDyutvwfklogsO7Y0T9SUaJArGCkw8TM3s1/MIKBg9elK', '$2b$10$2VgqpC6Wv25OwQp.1qveOuzgtLhVC3y0Njg32pzuHdSp7gkchK83a', 'now()', NULL),
(11, 'siuhiu', '123456782', NULL, NULL, '$2b$10$WzLlywxdcpIP4LLCIQW/DuQ2jdK4Fqa90NNC69QZ2.7gUndvFiYpC', '$2b$10$SLuysixvjaB.Jl0vItUSj.v.BmF2xJQ6GQWEfq82UuuquEdh5r4S.', 'now()', NULL),
(16, 'siuhiu', '12345682', NULL, NULL, '$2b$10$p21XY6DCjgVxAHUoy6koqecXOhB7.vpqceb0ZYvrljkpVBLMUiMzO', NULL, 'now()', NULL),
(17, 'siuhiu', '1234582', NULL, NULL, '$2b$10$VxPcUjHq0PMFn5E2qnxbL.UA7AozWP1mHoqmJqvjV4McKDqBzcgIG', NULL, 'now()', NULL),
(18, 'siuhiu', '134582', NULL, NULL, '$2b$10$o0yBc/bgvHUlQxBhDZKV7O5WRK1jzCGNloMYXZlURl7EjsVUQ0Wmm', NULL, 'now()', NULL),
(19, 'siuhiu', '13458', NULL, NULL, '$2b$10$Dco3LSQZx9KOiHVkVNAUP.joSMIZeuOo4pQ3T2q6btVVLeC9CYb9a', NULL, 'now()', NULL),
(20, 'siuhiu', '1458', NULL, NULL, '$2b$10$xF8sZH0Eu6rslI0vZccenu0YotkkMf4/H7Nlw4sRWOKdFchlFs.7.', NULL, 'now()', NULL),
(21, 'siuhu', '148', NULL, NULL, '$2b$10$GaLe16XKgjRiKDknKzViHeAVu3YE3B.iuZDJEfuaVIfh9hsbpDB0K', NULL, 'now()', NULL),
(22, 'siuhu', '18', NULL, NULL, '$2b$10$xryV9y.qKJpCdQLecBA9duA80b8D0o7XVm/uEWH63APDXep8ZXqNS', NULL, 'now()', NULL),
(23, 'aaqs', '128672', NULL, NULL, '$2b$10$QS.eBwjOC6X.zuCJhqptP.Map5zpAxfpsFhREAiBDejqp8USMBxKC', NULL, 'now()', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attributevalue`
--
ALTER TABLE `attributevalue`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `attributeID` (`attributeID`);

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `parentCategoryID` (`parentCategoryID`);

--
-- Indexes for table `category_attribute`
--
ALTER TABLE `category_attribute`
  ADD PRIMARY KEY (`category_ID`,`attribute_ID`),
  ADD KEY `attribute_ID` (`attribute_ID`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`category_ID`,`product_ID`),
  ADD KEY `product_ID` (`product_ID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`product_ID`,`attribute_ID`),
  ADD KEY `attribute_ID` (`attribute_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributevalue`
--
ALTER TABLE `attributevalue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `attributevalue`
--
ALTER TABLE `attributevalue`
  ADD CONSTRAINT `attributevalue_ibfk_1` FOREIGN KEY (`attributeID`) REFERENCES `attribute` (`ID`);

--
-- Constraints for table `basket`
--
ALTER TABLE `basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parentCategoryID`) REFERENCES `category` (`ID`);

--
-- Constraints for table `category_attribute`
--
ALTER TABLE `category_attribute`
  ADD CONSTRAINT `category_attribute_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `category_attribute_ibfk_2` FOREIGN KEY (`attribute_ID`) REFERENCES `attribute` (`ID`);

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`category_ID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`addressID`) REFERENCES `address` (`ID`);

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`attribute_ID`) REFERENCES `attribute` (`ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
