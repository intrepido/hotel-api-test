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
-- Table structure for table `security_features`
--

DROP TABLE IF EXISTS `security_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_features` (
  `id` int(11) DEFAULT NULL,
  `security_feature_code` int(11) DEFAULT NULL,
  `security_feature_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_features`
--

LOCK TABLES `security_features` WRITE;
/*!40000 ALTER TABLE `security_features` DISABLE KEYS */;
INSERT INTO `security_features` VALUES (1,1,'2nd lock on guest doors'),(2,2,'Address of nearest police station'),(3,3,'Alarms continuously monitored'),(4,4,'Audible alarm smoke detectors in guest rooms'),(5,5,'Auto link to fire station'),(6,6,'Automatic fire doors'),(7,7,'Building meets all current local, state and country building codes'),(8,8,'Complies with Hotel/Motel Safety Act'),(9,9,'Complies with Local/State/Federal fire laws'),(10,10,'Dead bolts on guest room doors'),(11,11,'Distance to nearest police station'),(12,12,'Doctor on call'),(13,13,'Electronic room key'),(14,14,'Elevator auto recall'),(15,15,'Emergency back-up generators'),(16,16,'Emergency evacuation plan'),(17,17,'Emergency exit maps'),(18,18,'Emergency info in room'),(19,19,'Emergency lighting'),(20,20,'Fire detectors in guest rooms'),(21,21,'Fire detectors in hallways'),(22,22,'Fire detectors in public areas'),(23,23,'Fire extinguishers'),(24,24,'Fire resistant guest room doors'),(25,25,'Fire resistant hall room doors'),(26,26,'Frequency of evacuation drills'),(27,27,'Guest room doors self-closing'),(28,28,'Hard wired smoke detectors'),(29,29,'If no 24 hour security, what are the hours?'),(30,30,'Lighted parking area'),(31,31,'Lighted walkways'),(32,32,'Multiple exits on each floor'),(33,33,'Parking area attendants'),(34,34,'Patrolled parking area'),(35,35,'Phone number of nearest police station'),(36,36,'Property has elevators'),(37,37,'Public address system'),(38,38,'Response time (minutes) from fire/police department'),(39,39,'Restricted public access'),(40,40,'Room access through exterior corridor'),(41,41,'Room access through interior corridor'),(42,42,'Room accessible through balcony sliding glass doors'),(43,43,'Room windows open'),(44,44,'Safety chains on guest doors'),(45,45,'Secondary locks on room windows'),(46,46,'Secondary locks on sliding glass doors'),(47,47,'Security 24 hours/day'),(48,48,'Smoke detector in guest rooms'),(49,49,'Smoke detector in hallways'),(50,50,'Smoke detector in public areas'),(51,51,'Some guest rooms have a balcony'),(52,52,'Sprinklers in guest rooms'),(53,53,'Sprinklers in hallways'),(54,54,'Sprinklers in public areas'),(55,55,'Staff trained in CPR'),(56,56,'Staff trained in duplicate key issue'),(57,57,'Staff trained in first aid'),(58,58,'Uniformed security'),(59,59,'Ventilated stair wells'),(60,60,'Video cameras at entrance'),(61,61,'Video cameras in hallways'),(62,62,'Video cameras in public areas'),(63,63,'Viewports in guest room doors'),(64,64,'Visual alarm in guest rooms'),(65,65,'Well lighted exit signs'),(66,66,'Which floors have exterior entrances'),(67,67,'Which floors have interior entrances'),(68,68,'Balcony accessibly by adjoining rooms'),(69,69,'Double glazed windows'),(70,70,'Fire extinguishers in hallways'),(71,71,'Security '),(72,72,'Audible alarms in hallways'),(73,73,'Audible alarms in public areas'),(74,74,'Automated External Defibrillator (AED) on-site'),(75,75,'Basic medical equipment on-site'),(76,76,'Camera monitoring parking area 24 hrs'),(77,77,'Camera recording parking area 24 hrs'),(78,78,'Controlled access to parking'),(79,79,'Exterior doors (except lobby entrance) require key access at night'),(80,80,'Staff Red Cross certified in CPR'),(81,81,'Staff trained in Automated External Defibrillator (AED) usage'),(82,82,'Video surveillance of parking'),(83,83,'Visual alarms in hallways'),(84,84,'Visual alarms in public areas'),(85,85,'Emergency exits on each floor'),(86,86,'Video surveillance recorded 24 hrs a day'),(87,87,'Video surveillance monitored 24 hrs a day'),(88,88,'Carbon monoxide detector'),(89,89,'Fire extinguishers in public areas'),(90,90,'First aid available'),(91,91,'Private security available'),(92,92,'Secured floors'),(93,93,'U.S. Fire Safety compliant'),(94,94,'Evacuation drills'),(95,95,'Hotel has fire safety measures in place but does not meet a national fire safety standard'),(96,96,'FEMA approved'),(97,97,'Hours security'),(98,98,'Emergency svc response time (minutes)'),(99,99,'Security escorts available on request'),(100,100,'Swingbolt lock'),(101,101,'AAA security standards'),(102,102,'Connecting doors have deadbolts'),(103,103,'Emergency call button on phone'),(104,104,'Audible alarms'),(105,105,'A floor only accessible via a guest room key '),(106,106,'Health club facilities (pool/gym) require key access for entrance '),(107,107,'VIP Security');
/*!40000 ALTER TABLE `security_features` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-29 16:14:09
