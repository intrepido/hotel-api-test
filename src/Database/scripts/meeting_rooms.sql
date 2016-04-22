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
-- Table structure for table `meeting_rooms`
--

DROP TABLE IF EXISTS `meeting_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_rooms` (
  `id` int(11) DEFAULT NULL,
  `meeting_room_code` int(11) DEFAULT NULL,
  `meeting_room_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_rooms`
--

LOCK TABLES `meeting_rooms` WRITE;
/*!40000 ALTER TABLE `meeting_rooms` DISABLE KEYS */;
INSERT INTO `meeting_rooms` VALUES (1,1,'AV Equip'),(2,2,'AV Technician'),(3,3,'Blackboards'),(4,4,'Bulletin boards'),(5,5,'Carpenter'),(6,6,'Catered breakfast'),(7,7,'Catered dinner'),(8,8,'Catered lunch'),(9,9,'Copier'),(10,10,'Decorator'),(11,11,'Direction signs'),(12,12,'Disc players'),(13,13,'Easels or tablets'),(14,14,'Electrician'),(15,15,'First Aid'),(16,16,'Flip chart and markers'),(17,17,'High speed internet access'),(18,18,'Installed stage'),(19,19,'ISDN_Line'),(20,20,'Laborers'),(21,21,'LCD_Panel'),(22,22,'LCD projector'),(23,23,'Locksmith'),(24,24,'Messenger service'),(25,25,'Microphone'),(26,26,'Musicians/Entertainers'),(27,27,'Name cards/holders'),(28,28,'Notary Public'),(29,29,'Overhead'),(30,30,'PA_System'),(31,31,'Pens/Pencils/Pads'),(32,32,'Photographer'),(33,33,'Podium'),(34,34,'Polling devices'),(35,35,'Portable stage'),(36,36,'Printing services'),(37,37,'Projector'),(38,38,'Projector and screen'),(39,39,'Rear screen'),(40,40,'Registration services'),(41,41,'Security guards'),(42,42,'Separate entrance'),(43,43,'Separate registration area'),(44,44,'Spotlights'),(45,45,'Stack chairs'),(46,46,'Stenographer'),(47,47,'Tables available'),(48,48,'Tours'),(49,49,'TV'),(50,50,'TV production service provider'),(51,51,'VCR rental'),(52,52,'Video camera'),(53,53,'Video conferencing'),(54,54,'Video conferencing service provider'),(55,55,'Walkie talkies - radio'),(56,56,'Walkie talkies - radio service provider'),(57,57,'Wall charts'),(58,58,'Whiteboards'),(59,59,'Dedicated exhibit space'),(60,60,'Av supply fee'),(61,61,'PC fee'),(62,62,'Guest PC fee'),(63,63,'Guest PC lead time'),(64,64,'Help desk phone number'),(65,65,'High speed internet lead time'),(66,66,'High speed internet provider'),(67,67,'High speed internet provider name'),(68,68,'Beer bottle fee'),(69,69,'Wine bottle fee'),(70,70,'Call brand cocktail average fee'),(71,71,'Coffee soda average fee'),(72,72,'Per person coffee break fee'),(73,73,'Continental breakfast fee'),(74,74,'Full breakfast fee'),(75,75,'Lunch deli buffet fee'),(76,76,'Premium cocktails fee'),(77,77,'Largest room'),(78,78,'Max seating capacity'),(79,79,'Number breakout rooms'),(80,80,'Meeting package attendee range'),(81,81,'Meeting package fee'),(82,82,'Meeting package inclusions'),(83,83,'Meeting package name'),(84,84,'Meeting room contact'),(85,85,'Meeting room names'),(86,86,'Meeting room rental packages'),(87,87,'Meeting room fee'),(88,88,'Meeting support service codes'),(89,89,'Three package minimum'),(90,90,'Meeting floors'),(91,91,'Number of meeting rooms'),(92,92,'Other equipment and facilities'),(93,93,'Screen fee'),(94,94,'Second largest room'),(95,95,'Suggestions and info'),(96,96,'Teleconference service provider'),(97,97,'Portable wall rooms'),(98,98,'Non portable wall rooms'),(99,99,'Total meeting space'),(100,100,'Number of floors containing meeting space'),(101,101,'Overhead projector rental charge per day'),(102,102,'Projector screen rental charge per day'),(103,103,'Catering'),(104,104,'Number of meeting service personnel on site'),(105,105,'Host social function'),(106,106,'Lobby bulletin board'),(107,107,'35mm projector'),(108,108,'PA system installed'),(109,109,'PA system portable'),(110,110,'Access to meeting areas'),(111,111,'Exhibition space on property'),(112,112,'Certified wedding planner'),(113,113,'Event lighting services'),(114,114,'Event planning services'),(115,115,'Onsite convention services'),(116,116,'Equipment rental'),(117,117,'Exhibit services'),(118,118,'Heating/cooling controls'),(119,119,'Lectern'),(120,120,'T1 lines'),(121,121,'Teleconferencing'),(122,122,'Platform'),(123,123,'Voltage available'),(124,124,'Analog internet connectivity'),(125,125,'Wireless internet connectivity'),(126,126,'Natural daylight'),(127,127,'Group meeting discounts/packages available'),(128,128,'Meeting support services'),(129,129,'Audio recording'),(130,130,'Background music'),(131,131,'Closed circuit video'),(132,132,'Video recording'),(133,133,'Dry erase board with eraser and markers'),(134,134,'DVD player'),(135,135,'Laser pointer'),(136,136,'Monitor cart'),(137,137,'Powered speaker'),(138,138,'Projection stand'),(139,139,'Screen'),(140,140,'VHS player'),(141,141,'Group meeting discounts'),(142,142,'Meeting packages available'),(143,143,'Meeting planner'),(144,144,'In-house AV department'),(145,145,'Outside vendor for AV equipment'),(146,146,'Personal AV equipment permitted'),(147,147,'Lighting controls'),(148,148,'Wireless microphones'),(149,149,'Monitors'),(150,150,'Backstage projector'),(151,151,'Chandelier'),(152,152,'Perimeter seating'),(153,153,'Talk show'),(154,154,'Head table'),(155,155,'Rear screen projection'),(156,156,'Riser'),(157,157,'Dance floor'),(158,158,'Data projector'),(159,159,'Laptop computer'),(160,160,'Easel '),(161,161,'35mm projector with remote'),(162,162,'Blackboard with eraser & chalk'),(163,163,'Lectern (standing)'),(164,164,'Lectern (table)'),(165,165,'Microphone - wired lavaliere'),(166,166,'Microphone - wired lectern'),(167,167,'Microphone - wired standing'),(168,168,'Microphone - wired table'),(169,169,'Microphone - wireless lavaliere'),(170,170,'Microphone - wireless lectern'),(171,171,'Microphone - wireless standing'),(172,172,'Microphone - wireless table'),(173,173,'Overhead projector'),(174,174,'Personal computer - desktop'),(175,175,'Personal computer - laptop'),(176,176,'Personal computer - Mac'),(177,177,'Video monitor'),(178,178,'LCD TV'),(179,179,'Plasma TV'),(180,180,'Outdoor function space'),(181,181,'Fixed stage'),(182,182,'Banquet service'),(183,183,'Total exhibit space'),(184,184,'Technical support'),(185,185,'Meeting room direct bill'),(186,186,'Meeting room direct bill min'),(187,187,'Meeting room direct bill max'),(188,188,'Funds held on credit card'),(189,189,'Max amount group charge on credit card'),(190,190,'Minimum seating'),(191,191,'Semi-private space'),(192,192,'Wedding location'),(193,193,'Simultaneous translation'),(194,194,'ADSL'),(195,195,'Independent temperature control'),(196,196,'Broadcasting room'),(197,197,'Frame relay'),(198,198,'Furniture rental'),(199,199,'Linen rental'),(200,200,'Gala dinner'),(201,201,'Hostesses'),(202,202,'Multipoint satellite conferencing'),(203,203,'Portable transformers available'),(204,204,'Secretarial services'),(205,205,'Sound equipment'),(206,206,'Flower arrangements'),(207,207,'Telephone');
/*!40000 ALTER TABLE `meeting_rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:23:34
