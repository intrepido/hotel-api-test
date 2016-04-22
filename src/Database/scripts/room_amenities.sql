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
-- Table structure for table `room_amenities`
--

DROP TABLE IF EXISTS `room_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_amenities` (
  `id` int(11) DEFAULT NULL,
  `room_amenity_code` int(11) DEFAULT NULL,
  `room_amenity_name` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_amenities`
--

LOCK TABLES `room_amenities` WRITE;
/*!40000 ALTER TABLE `room_amenities` DISABLE KEYS */;
INSERT INTO `room_amenities` VALUES (1,1,'Adjoining rooms'),(2,2,'Air conditioning'),(3,3,'Alarm clock'),(4,4,'All news channel'),(5,5,'AM/FM radio'),(6,6,'Baby listening device'),(7,7,'Balcony/Lanai/Terrace'),(8,8,'Barbeque grills'),(9,9,'Bath tub with spray jets'),(10,10,'Bathrobe'),(11,11,'Bathroom amenities'),(12,12,'Bathroom telephone'),(13,13,'Bathtub'),(14,14,'Bathtub only'),(15,15,'Bathtub/shower combination'),(16,16,'Bidet'),(17,17,'Bottled water'),(18,18,'Cable/Satellite television'),(19,19,'Coffee/Tea maker'),(20,20,'Television'),(21,21,'Computer'),(22,22,'Connecting rooms'),(23,23,'Converters/ Voltage adaptors'),(24,24,'Copier'),(25,25,'Cordless phone'),(26,26,'Cribs'),(27,27,'Data port'),(28,28,'Desk'),(29,29,'Desk with lamp'),(30,30,'Dining guide'),(31,31,'Direct dial phone number'),(32,32,'Dishwasher'),(33,33,'Double beds'),(34,34,'Dual voltage outlet'),(35,35,'Electrical current voltage'),(36,36,'Ergonomic chair'),(37,37,'Extended phone cord'),(38,38,'Fax machine'),(39,39,'Fire alarm'),(40,40,'Fire alarm with light'),(41,41,'Fireplace'),(42,42,'Free toll free calls'),(43,43,'Free calls'),(44,44,'Free credit card access calls'),(45,45,'Free local calls'),(46,46,'Free movies/video'),(47,47,'Full kitchen'),(48,48,'Grab bars in bathroom'),(49,49,'Grecian tub'),(50,50,'Hairdryer'),(51,51,'High speed internet connection'),(52,52,'Interactive web TV'),(53,53,'International direct dialing'),(54,54,'Internet access'),(55,55,'Iron'),(56,56,'Ironing board'),(57,57,'Whirpool'),(58,58,'King bed'),(59,59,'Kitchen'),(60,60,'Kitchen supplies'),(61,61,'Kitchenette'),(62,62,'Knock light'),(63,63,'Laptop'),(64,64,'Large desk'),(65,65,'Large work area'),(66,66,'Laundry basket/clothes hamper'),(67,67,'Loft'),(68,68,'Microwave'),(69,69,'Minibar'),(70,70,'Modem'),(71,71,'Modem jack'),(72,72,'Multi-line phone'),(73,73,'Newspaper'),(74,74,'Non-smoking'),(75,75,'Notepads'),(76,76,'Office supplies'),(77,77,'Oven'),(78,78,'Pay per view movies on TV'),(79,79,'Pens'),(80,80,'Phone in bathroom'),(81,81,'Plates and bowls'),(82,82,'Pots and pans'),(83,83,'Prayer mats'),(84,84,'Printer'),(85,85,'Private bathroom'),(86,86,'Queen bed'),(87,87,'Recliner'),(88,88,'Refrigerator'),(89,89,'Refrigerator with ice maker'),(90,90,'Remote control television'),(91,91,'Rollaway bed'),(92,92,'Safe'),(93,93,'Scanner'),(94,94,'Separate closet'),(95,95,'Separate modem line available'),(96,96,'Shoe polisher'),(97,97,'Shower only'),(98,98,'Silverware/utensils'),(99,99,'Sitting area'),(100,100,'Smoke detectors'),(101,101,'Smoking'),(102,102,'Sofa bed'),(103,103,'Speaker phone'),(104,104,'Stereo'),(105,105,'Stove'),(106,106,'Tape recorder'),(107,107,'Telephone'),(108,108,'Telephone for hearing impaired'),(109,109,'Telephones with message light'),(110,110,'Toaster oven'),(111,111,'Trouser/Pant press'),(112,112,'Turn down service'),(113,113,'Twin bed'),(114,114,'Vaulted ceilings'),(115,115,'VCR movies'),(116,116,'VCR player'),(117,117,'Video games'),(118,118,'Voice mail'),(119,119,'Wake-up calls'),(120,120,'Water closet'),(121,121,'Water purification system'),(122,122,'Wet bar'),(123,123,'Wireless internet connection'),(124,124,'Wireless keyboard'),(125,125,'Adaptor available for telephone PC use'),(126,126,'Air conditioning individually controlled in room'),(127,127,'Bathtub &whirlpool separate'),(128,128,'Telephone with data ports'),(129,129,'CD  player'),(130,130,'Complimentary local calls time limit'),(131,131,'Extra person charge for rollaway use'),(132,132,'Down/feather pillows'),(133,133,'Desk with electrical outlet'),(134,134,'ESPN available'),(135,135,'Foam pillows'),(136,136,'HBO available'),(137,137,'High ceilings'),(138,138,'Marble bathroom'),(139,139,'List of movie channels available'),(140,140,'Pets allowed'),(141,141,'Oversized bathtub'),(142,142,'Shower'),(143,143,'Sink in-room'),(144,144,'Soundproofed room'),(145,145,'Storage space'),(146,146,'Tables and chairs'),(147,147,'Two-line phone'),(148,148,'Walk-in closet'),(149,149,'Washer/dryer'),(150,150,'Weight scale'),(151,151,'Welcome gift'),(152,152,'Spare electrical outlet available at desk'),(153,153,'Non-refundable charge for pets'),(154,154,'Refundable deposit for pets'),(155,155,'Separate tub and shower'),(156,156,'Entrance type to guest room'),(157,157,'Ceiling fan'),(158,158,'CNN available'),(159,159,'Electrical adaptors available'),(160,160,'Buffet breakfast'),(161,161,'Accessible room'),(162,162,'Closets in room'),(163,163,'DVD player'),(164,164,'Mini-refrigerator'),(165,165,'Separate line billing for multi-line phone'),(166,166,'Self-controlled heating/cooling system'),(167,167,'Toaster'),(168,168,'Analog data port'),(169,169,'Collect calls'),(170,170,'International calls'),(171,171,'Carrier access'),(172,172,'Interstate calls'),(173,173,'Intrastate calls'),(174,174,'Local calls'),(175,175,'Long distance calls'),(176,176,'Operator-assisted calls'),(177,177,'Credit card access calls'),(178,178,'Calling card calls'),(179,179,'Toll free calls'),(180,180,'Universal AC/DC adaptors'),(181,181,'Bathtub seat'),(182,182,'Canopy/poster bed'),(183,183,'Cups/glassware'),(184,184,'Entertainment center'),(185,185,'Family/oversized room'),(186,186,'Hypoallergenic bed'),(187,187,'Hypoallergenic pillows'),(188,188,'Lamp'),(189,189,'Meal included - breakfast'),(190,190,'Meal included - continental breakfast'),(191,191,'Meal included - dinner'),(192,192,'Meal included - lunch'),(193,193,'Shared bathroom'),(194,194,'Telephone TDD/Textphone'),(195,195,'Water bed'),(196,196,'Extra adult charge'),(197,197,'Extra child charge'),(198,198,'Extra child charge for rollaway use'),(199,199,'Meal included:  full American breakfast'),(200,200,'Futon'),(201,201,'Murphy bed'),(202,202,'Tatami mats'),(203,203,'Single bed'),(204,204,'Annex room'),(205,205,'Free newspaper'),(206,206,'Honeymoon suites'),(207,207,'Complimentary high speed internet in room'),(208,208,'Housekeeping service'),(209,209,'PC hook-up in room'),(210,210,'Satellite television'),(211,211,'VIP rooms'),(212,212,'Cell phone recharger'),(213,213,'DVR player'),(214,214,'iPod docking station'),(215,215,'Media center'),(216,216,'Plug & play panel'),(217,217,'Satellite radio'),(218,218,'Video on demand'),(219,219,'Exterior corridors'),(220,220,'Gulf view'),(221,221,'Accessible room'),(222,222,'Interior corridors'),(223,223,'Mountain view'),(224,224,'Ocean view'),(225,225,'High speed internet access fee'),(226,226,'High speed wireless'),(227,227,'Premium movie channels'),(228,228,'Slippers'),(229,229,'First nighters\' kit'),(230,230,'Desk chair'),(231,231,'Pillow top mattress'),(232,232,'Feather bed'),(233,233,'Duvet'),(234,234,'Luxury linen'),(235,235,'International channels'),(236,236,'Pantry'),(237,237,'Dish-cleaning supplies'),(238,238,'Double vanity'),(239,239,'Lighted makeup mirror'),(240,240,'Upgraded bathroom amenities'),(241,241,'VCR player available at front desk'),(242,242,'Instant hot water'),(243,243,'Outdoor space'),(244,244,'Hinoki tub'),(245,245,'Private pool'),(246,246,'High Definition (HD) Flat Panel Television'),(247,247,'Room windows open'),(248,248,'Bedding type unspecified'),(249,249,'Full bed'),(250,250,'Round bed'),(251,251,'TV'),(252,252,'Child rollaway'),(253,253,'DVD player available at front desk');
/*!40000 ALTER TABLE `room_amenities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-28 10:25:23
