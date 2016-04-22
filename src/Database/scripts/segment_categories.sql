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
-- Table structure for table `segment_categories`
--

DROP TABLE IF EXISTS `segment_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segment_categories` (
  `id` int(11) DEFAULT NULL,
  `segment_category_code` int(11) DEFAULT NULL,
  `segment_category_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segment_categories`
--

LOCK TABLES `segment_categories` WRITE;
/*!40000 ALTER TABLE `segment_categories` DISABLE KEYS */;
INSERT INTO `segment_categories` VALUES (1,1,'All suite'),(2,2,'Budget'),(3,3,'Corporate business transient'),(4,4,'Deluxe'),(5,5,'Economy'),(6,6,'Extended stay'),(7,7,'First class'),(8,8,'Luxury'),(9,9,'Meeting/Convention'),(10,10,'Moderate'),(11,11,'Residential apartment'),(12,12,'Resort'),(13,13,'Tourist'),(14,14,'Upscale'),(15,15,'Efficiency'),(16,16,'Standard'),(17,17,'Midscale'),(18,18,'Moderate 2'),(19,19,'Quality'),(20,20,'Quality 2'),(21,21,'Unknown'),(22,22,'Midscale without F&B'),(23,23,'Upper upscale');
/*!40000 ALTER TABLE `segment_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:26:06
