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
-- Table structure for table `business_services`
--

DROP TABLE IF EXISTS `business_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_services` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_code` int(11) NOT NULL,
  `service_name` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_code_UNIQUE` (`service_code`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_services`
--

LOCK TABLES `business_services` WRITE;
/*!40000 ALTER TABLE `business_services` DISABLE KEYS */;
INSERT INTO `business_services` VALUES (1,1,'Computer'),(2,2,'Copier'),(3,3,'Cordless phone'),(4,4,'Data port'),(5,5,'Desk'),(6,6,'Direct dial phone number'),(7,7,'Ergonomic chair'),(8,8,'Extended phone cord'),(9,9,'Fax machine'),(10,10,'Free toll free calls'),(11,11,'Free calls'),(12,12,'Free CC access calls'),(13,13,'Free local calls'),(14,14,'High speed internet connection'),(15,15,'Interactive Web TV'),(16,16,'International direct dialing'),(17,17,'Internet access'),(18,18,'Laptop'),(19,19,'Large desk'),(20,20,'Large work area'),(21,21,'Modem'),(22,22,'Modem jack'),(23,23,'Multi-line phone'),(24,24,'Newspaper'),(25,25,'Notepads'),(26,26,'Office supplies'),(27,27,'Pens'),(28,28,'Printer'),(29,29,'Scanner'),(30,30,'Shoe polisher'),(31,31,'Speaker phone'),(32,32,'Tape recorder'),(33,33,'Telephone'),(34,34,'Voicemail'),(35,35,'Wireless internet connection'),(36,36,'Wireless keyboard'),(37,37,'Audio visual equipment'),(38,38,'Blackboard'),(39,39,'Business center'),(40,40,'Cellular phone rental'),(41,41,'Computer rental'),(42,42,'Executive desk'),(43,43,'Flip charts'),(44,44,'Laptop rental'),(45,45,'LCD/Projector'),(46,46,'Meeting/board rooms'),(47,47,'News stand'),(48,48,'Overhead projector'),(49,49,'Secretarial services'),(50,50,'Whiteboard'),(51,51,'Fax machine can print from laptop'),(52,52,'Incoming fax complimentary'),(53,53,'Free fax receipt page limit'),(54,54,'Fee per additional page of incoming fax'),(55,55,'Fee charged for first page'),(56,56,'ISDN'),(57,57,'Network/internet printing available'),(58,58,'Notary public'),(59,59,'Fee per additional page of outgoing fax'),(60,60,'Outgoing fax complimentary'),(61,61,'Fee charged for first page of outgoing fax'),(62,62,'Overnight delivery/pickup'),(63,63,'Pager rental'),(64,64,'Post/parcel service'),(65,65,'Private offices and business services'),(66,66,'Analog - dialup connectivity'),(67,67,'Wired internet connection'),(68,68,'Kiosk connectivity'),(69,69,'Wireless connectivity'),(70,70,'Mobile/cellular phone available'),(71,71,'Full business center'),(72,72,'On-site business center'),(73,73,'Staffed business center'),(74,74,'In-room internet appliance'),(75,75,'Analog data port'),(76,76,'Calling card calls'),(77,77,'Carrier access'),(78,78,'Interstate calls'),(79,79,'Intrastate calls'),(80,80,'Local calls'),(81,81,'Long distance calls'),(82,82,'Operator-assisted calls'),(83,83,'VCR/DVD machine rental'),(84,84,'Free operator assisted calls'),(85,85,'Free intrastate calls'),(86,86,'Free interstate calls'),(87,87,'Free international calls'),(88,88,'Free carrier access calls'),(89,89,'Business services'),(90,90,'Toll free calls'),(91,91,'Slide projector'),(92,92,'Ethernet RJ-45 jack'),(93,93,'Free fax transmission page limit'),(94,94,'Conference suite'),(95,95,'Convention centre'),(96,96,'Meeting facilities'),(97,97,'E-mail service'),(98,98,'Other data connections'),(99,99,'Hotel folio breakdown available to credit card company'),(100,100,'Individual folios available via e-mail or web'),(101,101,'Local faxes'),(102,102,'Translation services');
/*!40000 ALTER TABLE `business_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-18 15:00:52
