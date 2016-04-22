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
-- Table structure for table `additional_details`
--

DROP TABLE IF EXISTS `additional_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_details` (
  `id` int(11) DEFAULT NULL,
  `additional_detail_code` int(11) DEFAULT NULL,
  `additional_detail_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_details`
--

LOCK TABLES `additional_details` WRITE;
/*!40000 ALTER TABLE `additional_details` DISABLE KEYS */;
INSERT INTO `additional_details` VALUES (1,1,'Rate description'),(2,2,'Property description'),(3,3,'Property location'),(4,4,'Room information'),(5,5,'Guarantee information'),(6,6,'Deposit information'),(7,7,'Cancellation information'),(8,8,'Check in check out information'),(9,9,'Extra charge information'),(10,10,'Tax information'),(11,11,'Service charge information'),(12,12,'Package information'),(13,13,'Commission information'),(14,14,'Miscellaneous information'),(15,15,'Promotional information'),(16,16,'Inclusion information'),(17,17,'Amenity information'),(18,18,'Late arrival information'),(19,19,'Late departure information'),(20,20,'Advanced booking information'),(21,21,'Extra person information'),(22,22,'Areas served'),(23,23,'Onsite facilities information'),(24,24,'Offsite facilities information'),(25,25,'Onsite services information'),(26,26,'Offsite services information'),(27,27,'Extended stay information'),(28,28,'Corporate booking information'),(29,29,'Booking guidelines'),(30,30,'Government booking policy'),(31,31,'Group booking information'),(32,32,'Rate disclaimer information'),(33,33,'Visa/travel requirement information'),(34,34,'Security information'),(35,35,'Onsite recreational activities information'),(36,36,'Offsite recreational activities information'),(37,37,'General meeting planning information'),(38,38,'Group meeting planning information'),(39,39,'Contract/negotiated booking information'),(40,40,'Travel industry booking information'),(41,41,'Meeting room description'),(42,42,'Pet policy description'),(43,43,'Meal plan description'),(44,44,'Family plan description'),(45,45,'Children information'),(46,46,'Early checkout description'),(47,47,'Special offers description'),(48,48,'Catering description'),(49,49,'Room decor description'),(50,50,'Oversold policy description'),(51,51,'Last room availability description'),(52,52,'Room type upgrade description'),(53,53,'Driving directions'),(54,54,'Driving directions from the north'),(55,55,'Driving directions from the south'),(56,56,'Driving directions from the east'),(57,57,'Driving directions from the west'),(58,58,'Surcharge information'),(59,59,'Minimum stay information'),(60,60,'Maximum stay information'),(61,61,'Check-in policy'),(62,62,'Check-out policy'),(63,63,'Express check-in policy'),(64,64,'Express check-out policy'),(65,65,'Facility restrictions'),(66,66,'Customs information for material'),(67,67,'Seasons'),(68,68,'Food and beverage minimums for groups'),(69,69,'Deposit policy for master account'),(70,70,'Deposit policy for reservations'),(71,71,'Restaurant services'),(72,72,'Special events'),(73,73,'Cuisine description');
/*!40000 ALTER TABLE `additional_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:19:58
