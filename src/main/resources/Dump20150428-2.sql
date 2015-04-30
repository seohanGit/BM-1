-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: webdb
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `listnum` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`listnum`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookCode` varchar(40) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `genre` varchar(45) DEFAULT '미분류',
  `publisher` varchar(45) DEFAULT NULL,
  `borrowcheck` varchar(4) DEFAULT '0',
  `grade` int(11) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `imageurl` varchar(150) DEFAULT NULL,
  `isbn` char(14) DEFAULT NULL,
  `priceSales` int(10) DEFAULT NULL,
  `summary` varchar(2000) DEFAULT NULL,
  `reservecheck` varchar(4) DEFAULT '0',
  `buydate` date DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `seq` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bookCode`),
  UNIQUE KEY `order_UNIQUE` (`seq`),
  KEY `borrow_FK_idx` (`borrowcheck`),
  KEY `list_idx` (`bookCode`,`borrowcheck`,`isbn`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `bookCode` varchar(40) NOT NULL,
  `borrowdate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL,
  `borrowcheck` varchar(4) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  KEY `bookCode_idx` (`bookCode`),
  KEY `status_idx` (`borrowcheck`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID_borrow` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bookCode_borrow` FOREIGN KEY (`bookCode`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulletinboard`
--

DROP TABLE IF EXISTS `bulletinboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletinboard` (
  `boardnum` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `registerdate` timestamp NULL DEFAULT NULL,
  `modifidate` timestamp NULL DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`boardnum`),
  KEY `ID_idx` (`id`),
  CONSTRAINT `ID_board` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `cell` varchar(45) NOT NULL,
  `home` varchar(45) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  `permission` varchar(10) NOT NULL DEFAULT '0',
  `team` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `boardnum` int(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `registerdate` date DEFAULT NULL,
  `important` int(11) DEFAULT '0',
  PRIMARY KEY (`boardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recommended`
--

DROP TABLE IF EXISTS `recommended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommended` (
  `recommnum` int(11) NOT NULL,
  `booknum` varchar(40) DEFAULT NULL,
  `boardnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`recommnum`),
  KEY `booknum_idx` (`booknum`),
  KEY `boardnum_idx` (`boardnum`),
  CONSTRAINT `boardnum` FOREIGN KEY (`boardnum`) REFERENCES `bulletinboard` (`boardnum`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `booknum` FOREIGN KEY (`booknum`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--

-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `id` varchar(45) DEFAULT NULL,
  `requestdate` date DEFAULT NULL,
  `bookCode` varchar(45) NOT NULL,
  `bookname` varchar(45) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `publisher` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `imageurl` varchar(300) DEFAULT NULL,
  `isbn` char(14) DEFAULT NULL,
  `priceSales` int(10) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `class` varchar(45) DEFAULT NULL,
  `summary` varchar(1000) DEFAULT NULL,
  `requestCode` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`requestCode`),
  KEY `ID_res_idx` (`id`),
  CONSTRAINT `ID(FK)` FOREIGN KEY (`id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservation`
--


DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `id` varchar(40) DEFAULT NULL,
  `bookCode` varchar(45) DEFAULT NULL,
  `reserveDate` date DEFAULT NULL,
  `reservecheck` varchar(4) DEFAULT NULL,
  KEY `bookCode_res` (`bookCode`),
  KEY `ID_res` (`id`) COMMENT '	',
  CONSTRAINT `bookCode_res` FOREIGN KEY (`bookCode`) REFERENCES `book` (`bookCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-28 10:18:50
