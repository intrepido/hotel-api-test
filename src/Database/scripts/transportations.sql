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
-- Table structure for table `transportations`
--

DROP TABLE IF EXISTS `transportations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transportation_code` int(11) NOT NULL,
  `transportation_name` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transportation_code_UNIQUE` (`transportation_code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportations`
--

LOCK TABLES `transportations` WRITE;
/*!40000 ALTER TABLE `transportations` DISABLE KEYS */;
INSERT INTO `transportations` VALUES (1,1,'Bicycle'),(2,2,'Boat'),(3,3,'Bus'),(4,4,'Cable car'),(5,5,'Car'),(6,6,'Carriage'),(7,7,'Courtesy car'),(8,8,'Helicopter'),(9,9,'Limousine'),(10,10,'Metro'),(11,11,'Monorail'),(12,12,'Motorbike'),(13,13,'Pack animal'),(14,14,'Plane'),(15,15,'Rental car'),(16,16,'Rickshaw'),(17,17,'Shuttle'),(18,18,'Subway'),(19,19,'Sedan chair'),(20,20,'Taxi'),(21,21,'Train'),(22,22,'Trolley'),(23,23,'Tube'),(24,24,'Walk'),(25,25,'Water taxi'),(26,26,'Other or alternate'),(27,27,'Car/rush hour'),(28,28,'Taxi/rush hour'),(29,29,'No transportation'),(30,30,'Express train'),(31,31,'Public'),(32,32,'Alternate'),(33,33,'Ferry');
/*!40000 ALTER TABLE `transportations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-18 15:03:18
