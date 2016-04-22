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
-- Table structure for table `location_categories`
--

DROP TABLE IF EXISTS `location_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_categories` (
  `id` int(11) DEFAULT NULL,
  `location_category_code` int(11) DEFAULT NULL,
  `location_category_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_categories`
--

LOCK TABLES `location_categories` WRITE;
/*!40000 ALTER TABLE `location_categories` DISABLE KEYS */;
INSERT INTO `location_categories` VALUES (1,1,'Airport'),(2,2,'Beach'),(3,3,'City'),(4,4,'Downtown'),(5,5,'East'),(6,6,'Expressway'),(7,7,'Lake'),(8,8,'Mountain'),(9,9,'North'),(10,10,'Resort'),(11,11,'Rural'),(12,12,'South'),(13,13,'Suburban'),(14,14,'West'),(15,15,'Beachfront'),(16,16,'Oceanfront'),(17,17,'Gulf'),(18,18,'Business district'),(19,19,'Entertainment district'),(20,20,'Financial district'),(21,21,'Shopping district'),(22,22,'Theatre district'),(23,23,'Countryside'),(24,24,'Bay'),(25,25,'Marina'),(26,26,'Park'),(27,27,'River'),(28,28,'Tourist site'),(29,29,'North suburb'),(30,30,'South suburb'),(31,31,'East suburb'),(32,32,'West suburb'),(33,33,'Waterfront'),(34,34,'Ski resort');
/*!40000 ALTER TABLE `location_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-31 10:45:31
