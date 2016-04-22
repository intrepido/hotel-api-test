-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: luxuryhotelexperts
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `picture_categories`
--

DROP TABLE IF EXISTS `picture_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture_categories` (
  `id` int(11) DEFAULT NULL,
  `picture_category_code` int(11) DEFAULT NULL,
  `picture_category_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture_categories`
--

LOCK TABLES `picture_categories` WRITE;
/*!40000 ALTER TABLE `picture_categories` DISABLE KEYS */;
INSERT INTO `picture_categories` VALUES (1,1,'Exterior view'),(2,2,'Lobby view'),(3,3,'Pool view'),(4,4,'Restaurant'),(5,5,'Health club'),(6,6,'Guest room'),(7,7,'Suite'),(8,8,'Meeting room'),(9,9,'Ballroom '),(10,10,'Golf course'),(11,11,'Beach'),(12,12,'Spa'),(13,13,'Bar/Lounge'),(14,14,'Recreational facility'),(15,15,'Logo'),(16,16,'Basics'),(17,17,'Map'),(18,18,'Promotional'),(19,19,'Hot news'),(20,20,'Miscellaneous'),(21,21,'Guest room amenity'),(22,22,'Property amenity'),(23,23,'Business center');
/*!40000 ALTER TABLE `picture_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:24:11
