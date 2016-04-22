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
-- Table structure for table `disability_features`
--

DROP TABLE IF EXISTS `disability_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disability_features` (
  `id` int(11) DEFAULT NULL,
  `disability_feature_code` int(11) DEFAULT NULL,
  `disability_feature_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disability_features`
--

LOCK TABLES `disability_features` WRITE;
/*!40000 ALTER TABLE `disability_features` DISABLE KEYS */;
INSERT INTO `disability_features` VALUES (1,1,'Americans with Disabilities Act (ADA) compliance'),(2,2,'Audible emergency alarm for sight impaired guest'),(3,3,'Bathroom vanity in guest rooms for wheelchair user\'s height'),(4,4,'Bed types of wheelchair accessible rooms'),(5,5,'Closet rods in guest rooms for disabled person height'),(6,6,'Complies with Local/State/Federal laws for disabled'),(7,7,'Describe in detail how your kitchen is accessible. Include special appliances, lowered cabinets, where dishes are kept, are upper cabinets usable.'),(8,8,'Does hotel have accessible parking?'),(9,9,'Door width in inches'),(10,10,'Elevators have Braille Instructions'),(11,11,'Emergency exit signs in Braille'),(12,12,'Emergency info in Braille'),(13,13,'Flashing door knocker available '),(14,14,'Impairment aids available'),(15,15,'Light switches in guest rooms for wheelchair user\'s height'),(16,16,'List available room types for disabled persons- 8 fields'),(17,17,'Height of deadbolt in guest room (in feet)'),(18,18,'Height of deadbolt in guest room (in Inches)'),(19,19,'Number of each room type equipped for disabled persons- 8 fields'),(20,20,'Number of roll-in showers available '),(21,21,'Number of accessible rooms with standard tub'),(22,22,'Number of rooms with Braille'),(23,23,'Number of rooms with wheelchair accessible showers'),(24,24,'Number of wheelchair accessible rooms'),(25,25,'Other services for persons with disabilities'),(26,26,'Height of peephole in guest room (in feet)'),(27,27,'Height of peephole in guest room (in inches)'),(28,28,'Public areas wheelchair accessible'),(29,29,'Service animals allowed on property for people with disabilities'),(30,30,'Height of thermostat in guest room (in feet)'),(31,31,'Height of thermostat in guest room (in inches)'),(32,32,'Toilet seat in guest rooms for disabled person'),(33,33,'Viabrating alarm available'),(34,34,'Visual emergency alarm for hearing impaired guest'),(35,35,'What room types have wheel-in showers? (free form stringbox)'),(36,36,'Wheelchairs available'),(37,37,'Which floors have accessible rooms'),(38,38,'Grab bars in bathroom'),(39,39,'Telephone for hearing impaired'),(40,40,'Height of light switches in guest rooms (feet)'),(41,41,'Height of light switches in guest rooms (inches)'),(42,42,'Wheelchair accessible elevators'),(43,43,'Hearing impaired services'),(44,44,'Bathtub seat'),(45,45,'Closed caption TV'),(46,46,'Safety bars in shower'),(47,47,'Television amplifier'),(48,48,'Walk-in shower'),(49,49,'Ramp access'),(50,50,'Accessible parking'),(51,51,'Accessible van parking'),(52,52,'Raised toilet seat with grab bars'),(53,53,'Bathroom doors open outwards'),(54,54,'Accommodations have bath in bedroom'),(55,55,'Elevator access to all levels'),(56,56,'Elevator near accessible rooms'),(57,57,'Emergency cord/button system in bathroom'),(58,58,'Emergency cord/button system in bedroom'),(59,59,'Emergency instructions in pictorial form'),(60,60,'Emergeny procedures for people with disabilites'),(61,61,'Facilities for people with vision impairment only'),(62,62,'Facilities for people with hearing impairment only'),(63,63,'Feather free bedding/pillows available'),(64,64,'Flat terrain between parking and entrance'),(65,65,'Hearing induction loop system installed'),(66,66,'Restaurant/bar menus available in Braille'),(67,67,'Restaurant/bar menus available in 14pt print'),(68,68,'Roll-in shower area with bathroom seat'),(69,69,'Service dogs allowed'),(70,70,'Staff proficient in sign language'),(71,71,'Staff trained in service to disabled guests'),(72,72,'Steps/staircases have handrails'),(73,73,'Steps/staircases have color markings'),(74,74,'Subtitles/closed captions available on TV'),(75,75,'Tactile/14pt print signage throughout hotel'),(76,76,'Vibrating pillows available'),(77,77,'Height of bathroom basin'),(78,78,'Height of bathroom toilet seat'),(79,79,'Height of controls at highest operable part for bath'),(80,80,'Height of controls at highest operable part for roll-in shower'),(81,81,'Height from ground of guest bed including mattress'),(82,82,'Height from ground of elevator external buttons'),(83,83,'Height from ground of elevator internal buttons'),(84,84,'Height from ground to light switches in bathroom'),(85,85,'Height of non-slip handrails adjacent to bathroom toilet'),(86,86,'Height of non-slip handrails adjacent to bath'),(87,87,'Height of non-slip handrails in shower area'),(88,88,'Width/diameter of clear floor space in front of bath'),(89,89,'Length/depth of clear floor space in front of bath'),(90,90,'Width/diameter of clear floor space in front of guest bathroom toilet'),(91,91,'Length/depth of clear floor space in front of guest bathroom toilet'),(92,92,'Width/diameter of clear floor space at main hotel entrance'),(93,93,'Width/diameter of clear floor space at main restaurant entrance'),(94,94,'Width/diameter of elevator clear door opening space'),(95,95,'Width/diameter of maincorridors'),(96,96,'Width/diameter of wheelchair turning space in bathroom'),(97,97,'Width/diameter of wheelchair turning space in bedroom'),(98,98,'Width/diameter of wheelchair turning space in lobby/reception area'),(99,99,'Width/diameter of clear opening space at bathroom door'),(100,100,'Width/diameter of clear opening space at bedroom door'),(101,101,'Height from ground of elevator internal handrails'),(102,102,'Accessible baths'),(103,103,'Braille/large print literature'),(104,104,'Adapted room doors'),(105,105,'Bedroom wheelchair access'),(106,106,'Special needs menus'),(107,107,'Wide entrance'),(108,108,'Wide corridors'),(109,109,'Wide restaurant entrance'),(110,110,'Roll-in shower available'),(111,111,'Lever handles on guest room doors'),(112,112,'Lowered night guards on guest room doors'),(113,113,'Lowered electrical outlets'),(114,114,'Bathtub grab bars'),(115,115,'Adjustable height hand-held shower wand'),(116,116,'TTY/TTD compatible'),(117,117,'Bathroom doors in inches'),(118,118,'Wheelchair, passenger has own chair, trains'),(119,119,'Wheelchair, passenger has own chair, buses'),(120,120,'Wheelchair, passenger requires station wheelchair'),(121,121,'Wheelchair lift required'),(122,122,'Lower level seating required'),(123,123,'Passenger has oxygen equipment'),(124,124,'Passenger has meet and assist requirement'),(125,125,'Height from ground to light switches in guest room'),(126,126,'Height from ground to peephole in guest room door'),(127,127,'Height from ground of deadbolt in guest room '),(128,128,'Height from ground of thermostat in guest room'),(129,129,'Hotel entrance is accessible'),(130,130,'Route from accessible public entrance to registration area is accessible'),(131,131,'Guest rooms and access routes are accessible'),(132,132,'Route from accessible public entrance to restaurant is accessible'),(133,133,'Route from accessible public entrance to meeting room/ballroom area is accessible'),(134,134,'Route from accessible public entrance to exercise facility is accessible'),(135,135,'Route from accessible public entrance to pool is accessible'),(136,136,'Route from accessible public entrance to business center is accessible'),(137,137,'Route from accessible public entrance to spa is accessible'),(138,138,'Accessible rooms'),(139,139,'Registration desk is wheelchair accessible'),(140,140,'Concierge desk is wheelchair accessible'),(141,141,'Hotel restaurant is wheelchair accessible'),(142,142,'Exercise facility is wheelchair accessible');
/*!40000 ALTER TABLE `disability_features` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:21:15
