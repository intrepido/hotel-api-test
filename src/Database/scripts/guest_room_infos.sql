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
-- Table structure for table `guest_room_infos`
--

DROP TABLE IF EXISTS `guest_room_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guest_room_infos` (
  `id` int(11) DEFAULT NULL,
  `guest_room_info_code` int(11) DEFAULT NULL,
  `guest_room_info_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_room_infos`
--

LOCK TABLES `guest_room_infos` WRITE;
/*!40000 ALTER TABLE `guest_room_infos` DISABLE KEYS */;
INSERT INTO `guest_room_infos` VALUES (1,1,'Accessible rooms'),(2,2,'Nonsmoking rooms'),(3,3,'Suites'),(4,4,'Bungalows and villas'),(5,5,'Floors'),(6,6,'Executive floor'),(7,7,'Rooms that work'),(8,8,'Available rooms'),(9,9,'Available suites'),(10,10,'Double bedrooms'),(11,11,'King bedrooms'),(12,12,'Total rooms'),(13,13,'Apartments'),(14,14,'Queen bedrooms'),(15,15,'Penthouses'),(16,16,'Studios'),(17,17,'First floor rooms'),(18,18,'Smoking rooms'),(19,19,'Twin bedrooms'),(20,20,'Drive up rooms'),(21,21,'Rooms with internet access'),(22,22,'Freestanding units'),(23,23,'Air conditioned guest rooms'),(24,24,'Concierge levels'),(25,25,'Condos'),(26,26,'Club levels'),(27,27,'Total available rooms and suites'),(28,28,'Total rooms and suites'),(29,29,'Employees on property'),(30,30,'Employees working for property'),(31,31,'Separate floors for women'),(32,32,'Buildings'),(33,33,'Accommodations with balcony'),(34,34,'Adjoining rooms or suites'),(35,35,'Connecting rooms or suites'),(36,36,'Family/oversized accommodations'),(37,37,'Single-bedded accommodations'),(38,38,'Cabin'),(39,39,'Cottage'),(40,40,'Loft'),(41,41,'Parlour'),(42,42,'Room'),(43,43,'Lanai'),(44,44,'Bungalow'),(45,45,'Villa'),(46,46,'Efficiency'),(47,47,'All rooms non-smoking'),(48,48,'Double double bedrooms'),(49,49,'King king bedrooms'),(50,50,'Queen queen bedrooms'),(51,51,'Twin twin bedrooms'),(52,52,'Apartment for 1'),(53,53,'Apartment for 2'),(54,54,'Apartment for 3'),(55,55,'Apartment for 4'),(56,56,'Apartment for 6'),(57,57,'1 room cabin'),(58,58,'1 bedroom cabin'),(59,59,'2 bedroom cabin'),(60,60,'Junior suite'),(61,61,'Jacuzzi suite'),(62,62,'Run of the house'),(63,63,'Large suite'),(64,64,'1 bedroom '),(65,65,'2 bedroom '),(66,66,'3 bedroom '),(67,67,'Villa for 1'),(68,68,'Villa for 2'),(69,69,'Villa for 3'),(70,70,'Villa for 6'),(71,71,'Villa for 8'),(72,72,'Pullout'),(73,73,'Business plan'),(74,74,'Business class'),(75,75,'Classic'),(76,76,'Comfort'),(77,77,'Deluxe'),(78,78,'Deluxe suite'),(79,79,'Economy'),(80,80,'Luxury'),(81,81,'Premier'),(82,82,'Standard'),(83,83,'Superior');
/*!40000 ALTER TABLE `guest_room_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:22:08
