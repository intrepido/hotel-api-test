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
-- Table structure for table `room_views`
--

DROP TABLE IF EXISTS `room_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_views` (
  `id` int(11) DEFAULT NULL,
  `room_view_code` int(11) DEFAULT NULL,
  `room_view_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_views`
--

LOCK TABLES `room_views` WRITE;
/*!40000 ALTER TABLE `room_views` DISABLE KEYS */;
INSERT INTO `room_views` VALUES (1,1,'Airport view'),(2,2,'Bay view'),(3,3,'City view'),(4,4,'Courtyard view'),(5,5,'Golf view'),(6,6,'Harbor view'),(7,7,'Intercoastal view'),(8,8,'Lake view'),(9,9,'Marina view'),(10,10,'Mountain view'),(11,11,'Ocean view'),(12,12,'Pool view'),(13,13,'River view'),(14,14,'Water view'),(15,15,'Beach view'),(16,16,'Garden view'),(17,17,'Park view'),(18,18,'Forest view'),(19,19,'Rain forest view'),(20,20,'Various views'),(21,21,'Limited view'),(22,22,'Slope view'),(23,23,'Strip view'),(24,24,'Countryside view'),(25,25,'Sea view');
/*!40000 ALTER TABLE `room_views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-11 16:28:43
