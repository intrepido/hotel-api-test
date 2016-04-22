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
-- Table structure for table `recreation_services`
--

DROP TABLE IF EXISTS `recreation_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recreation_services` (
  `id` int(11) DEFAULT NULL,
  `recreation_service_code` int(11) DEFAULT NULL,
  `recreation_service_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recreation_services`
--

LOCK TABLES `recreation_services` WRITE;
/*!40000 ALTER TABLE `recreation_services` DISABLE KEYS */;
INSERT INTO `recreation_services` VALUES (1,1,'Archery '),(2,2,'Badminton court'),(3,3,'Baseball diamond'),(4,4,'Basketball court'),(5,5,'Beach'),(6,6,'Bike trail'),(7,7,'Boating'),(8,8,'Bocce court'),(9,9,'Bowling alley'),(10,10,'Children\'s program, onsite'),(12,12,'Cricket pitch'),(13,13,'Cross country skiing'),(14,14,'Dart board'),(18,18,'Downhill skiing'),(19,19,'Equipment available in health club'),(20,20,'Fishing'),(21,21,'Fitness center off-site'),(23,23,'Fitness center on-site'),(25,25,'Fly fishing'),(26,26,'Football field'),(27,27,'Golf'),(34,34,'Golf location (onsite/nearby)'),(35,35,'Fitness center'),(36,36,'Health club'),(60,60,'Hiking trail'),(61,61,'Horseback riding'),(62,62,'Indoor tennis courts'),(63,63,'Jet-ski'),(64,64,'Jogging trail'),(65,65,'Kayaking'),(66,66,'Lake'),(67,67,'Miniature golf'),(68,68,'Mountain biking trail'),(70,70,'Ocean'),(71,71,'Outdoor tennis courts'),(73,73,'Parasailing'),(74,74,'Playground'),(75,75,'Pool'),(76,76,'Putt putt golf'),(77,77,'Racquetball court'),(78,78,'River'),(79,79,'River rafting'),(80,80,'Sailing'),(81,81,'Sauna'),(82,82,'Scuba diving'),(83,83,'Shopping'),(84,84,'Skating rink'),(85,85,'Skeet shooting'),(86,86,'Snorkeling'),(87,87,'Snow boarding'),(88,88,'Snow skiing'),(89,89,'Soccer field'),(90,90,'Solarium'),(91,91,'Spa facility'),(92,92,'Squash court'),(93,93,'Steam bath'),(94,94,'Tennis court'),(96,96,'Tubing'),(97,97,'Velodrome'),(98,98,'Volleyball'),(99,99,'Water-skiing'),(100,100,'Whirlpool'),(101,101,'Windsurfing'),(102,102,'Driving range'),(103,103,'Camping'),(104,104,'Hot tub'),(105,105,'Hunting'),(106,106,'Indoor/outdoor connecting pool'),(107,107,'Jacuzzi'),(108,108,'Mountain climbing'),(109,109,'Nature preserve trail'),(110,110,'Water activities'),(111,111,'Billiards'),(112,112,'Rock climbing'),(113,113,'Safari'),(114,114,'Sports court '),(115,115,'Sun tanning bed'),(116,116,'Surfing'),(117,117,'Table tennis'),(118,118,'Wine tasting'),(119,119,'Winter sports'),(120,120,'Snow mobiling'),(121,121,'Teen programs'),(122,122,'Indoor pool'),(123,123,'Outdoor pool'),(124,124,'Children\'s program, offsite'),(125,125,'Children\'s program'),(126,126,'Animal watching'),(127,127,'Bird watching'),(128,128,'Boxing'),(129,129,'Children\'s pool'),(130,130,'Dancing'),(131,131,'Dog racing'),(132,132,'Fine dining'),(133,133,'Gambling'),(134,134,'Garden'),(135,135,'Helicopter/airplane sightseeing'),(136,136,'Horse racing'),(137,137,'Ice skating'),(138,138,'Karaoke'),(139,139,'Museum/gallery'),(140,140,'Nightclub'),(141,141,'Polo'),(142,142,'Sightseeing tours'),(143,143,'Sports events'),(144,144,'Skydiving'),(145,145,'Sunbathing'),(146,146,'Theatre'),(147,147,'Weightlifting'),(148,148,'Wrestling'),(149,149,'Canoeing'),(150,150,'Upscale shopping'),(151,151,'Outlet shopping'),(152,152,'Antique shopping'),(153,153,'Cardiovascular exercise'),(154,154,'Bocce court'),(155,155,'Direct access to a beach'),(156,156,'Ski in/out facilities'),(157,157,'Tennis professional'),(158,158,'Extensive health club'),(159,159,'Limited health club'),(160,160,'Diving'),(161,161,'Walking track'),(162,162,'Bike rental'),(163,163,'Paddle court'),(164,164,'Boat tours'),(165,165,'Kids golf academy'),(166,166,'Kids beach club'),(167,167,'Kids equestrian club'),(168,168,'Massage services');
/*!40000 ALTER TABLE `recreation_services` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:24:47
