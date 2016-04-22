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
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` int(11) DEFAULT NULL,
  `payment_code` int(11) DEFAULT NULL,
  `payment_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES (1,1,'Cash'),(2,2,'Direct bill'),(3,3,'Voucher'),(4,4,'Pre-pay'),(5,5,'Credit card'),(6,6,'Debit card'),(7,7,'Check'),(8,8,'Deposit'),(9,9,'Business account'),(10,10,'Central bill'),(11,11,'Coupon'),(12,12,'Business check'),(13,13,'Personal check'),(14,14,'Money order'),(15,15,'Redemption'),(16,16,'Barter'),(17,17,'Miscellaneous charge order'),(18,18,'Travel agency name/address'),(19,19,'Travel agency IATA number'),(20,20,'Certified check'),(21,21,'Club membership ID'),(22,22,'Frequent guest number'),(23,23,'Frequent traveler number'),(24,24,'Guest name/address'),(25,25,'Special industry program'),(26,26,'Tour order'),(27,27,'Traveler\'s check'),(28,28,'Wire payment'),(29,29,'Company name/address'),(30,30,'Corporate ID/CD number'),(31,31,'Guarantee'),(32,32,'Other information'),(33,33,'Override guarantee information'),(34,34,'Corporate'),(35,35,'Airline payment card'),(36,36,'Air travel card'),(37,37,'Miscellaneous'),(38,38,'None'),(39,39,'Ticket'),(40,40,'Payment manager'),(41,41,'Payment service');
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30 15:07:52
