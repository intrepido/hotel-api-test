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
-- Table structure for table `meals_plan`
--

DROP TABLE IF EXISTS `meals_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meals_plan` (
  `id` int(11) DEFAULT NULL,
  `meal_plan_code` int(11) DEFAULT NULL,
  `meal_plan_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meals_plan`
--

LOCK TABLES `meals_plan` WRITE;
/*!40000 ALTER TABLE `meals_plan` DISABLE KEYS */;
INSERT INTO `meals_plan` VALUES (1,1,'All inclusive'),(2,2,'American/full board'),(3,3,'Bed & breakfast'),(4,4,'Buffet breakfast'),(5,5,'Caribbean breakfast'),(6,6,'Continental breakfast'),(7,7,'English breakfast'),(8,8,'European plan'),(9,9,'Family plan'),(10,10,'Full board'),(11,11,'Full breakfast'),(12,12,'Half board/modified American plan'),(13,13,'As brochured'),(14,14,'Room only/European plan'),(15,15,'Self catering'),(16,16,'Bermuda'),(17,17,'Dinner bed and breakfast plan'),(18,18,'Family American'),(19,19,'Breakfast'),(20,20,'Modified'),(21,21,'Lunch'),(22,22,'Dinner'),(23,23,'Breakfast & lunch');
/*!40000 ALTER TABLE `meals_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-06 15:06:22
