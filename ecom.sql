-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(25) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4001,'Electronics'),(4002,'Clothing'),(4003,'Furniture'),(4004,'Books'),(4005,'Toys'),(4006,'Electronics'),(4007,'Beauty'),(4008,'Sports'),(4009,'Clothing'),(4010,'Electronics'),(4011,'Books'),(4012,'Toys'),(4013,'Furniture'),(4014,'Beauty'),(4015,'Clothing'),(4016,'Sports'),(4017,'Electronics'),(4018,'Furniture'),(4019,'Books'),(4020,'Clothing'),(4021,'Beauty'),(4022,'Electronics'),(4023,'Sports'),(4024,'Books'),(4025,'Furniture'),(4026,'Clothing'),(4027,'Electronics'),(4028,'Toys'),(4029,'Sports'),(4030,'Beauty'),(4031,'Furniture'),(4032,'Books'),(4033,'Electronics'),(4034,'Clothing'),(4035,'Toys'),(4036,'Beauty'),(4037,'Sports'),(4038,'Books'),(4039,'Electronics'),(4040,'Furniture'),(4041,'Clothing'),(4042,'Beauty'),(4043,'Sports'),(4044,'Electronics'),(4045,'Toys'),(4046,'Furniture'),(4047,'Clothing'),(4048,'Electronics'),(4049,'Books'),(4050,'Sports');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL,
  `cname` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_no` bigint DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Aarav Mehta','aarav.mehta@gmail.com',9876543210,'Mumbai'),(2,'Riya Sharma','riya.sharma@gmail.com',9123456789,'Delhi'),(3,'Vivaan Singh','vivaan.singh@gmail.com',9988776655,'Bangalore'),(4,'Anaya Gupta','anaya.gupta@gmail.com',9012345678,'Mumbai'),(5,'Aditya Verma','aditya.verma@gmail.com',9876501234,'Chennai'),(6,'Ishaan Nair','ishaan.nair@gmail.com',9123409876,'Kolkata'),(7,'Diya Kapoor','diya.kapoor@gmail.com',9900112233,'Delhi'),(8,'Kabir Joshi','kabir.joshi@gmail.com',9988001122,'Bangalore'),(9,'Myra Rao','myra.rao@gmail.com',9876712345,'Chennai'),(10,'Arjun Bhatia','arjun.bhatia@gmail.com',9123498765,'Mumbai'),(11,'Saanvi Desai','saanvi.desai@gmail.com',9900990011,'Kolkata'),(12,'Reyansh Menon','reyansh.menon@gmail.com',9988770011,'Delhi'),(13,'Aadhya Chawla','aadhya.chawla@gmail.com',9876509876,'Bangalore'),(14,'Customer14','customer14@example.com',9123459000,'Mumbai'),(15,'Navya Iyer','navya.iyer@gmail.com',9900113344,'Chennai'),(16,'Advait Khan','advait.khan@gmail.com',9988112233,'Delhi'),(17,'Sara Thomas','sara.thomas@gmail.com',9876765432,'Kolkata'),(18,'Rudra Fernandes','rudra.fernandes@gmail.com',9123401234,'Bangalore'),(19,'Meera Shetty','meera.shetty@gmail.com',9900223344,'Mumbai'),(20,'Aryan Dsouza','aryan.dsouza@gmail.com',9988332211,'Chennai'),(21,'Tanvi Patil','tanvi.patil@gmail.com',9876504321,'Delhi'),(22,'Shaurya Ghosh','shaurya.ghosh@gmail.com',9123498761,'Bangalore'),(23,'Anvi Mathur','anvi.mathur@gmail.com',9900334455,'Mumbai'),(24,'Parth Kulkarni','parth.kulkarni@gmail.com',9988770099,'Kolkata'),(25,'Kiara Saxena','kiara.saxena@gmail.com',9876501111,'Chennai'),(26,'Yash Agarwal','yash.agarwal@gmail.com',9123412345,'Mumbai'),(27,'Prisha Bansal','prisha.bansal@gmail.com',9900445566,'Delhi'),(28,'Arnav Chopra','arnav.chopra@gmail.com',9988556677,'Bangalore'),(29,'Ira Mahajan','ira.mahajan@gmail.com',9876598765,'Chennai'),(30,'Dev Singhania','dev.singhania@gmail.com',9123487654,'Mumbai'),(31,'Aanya Pillai','aanya.pillai@gmail.com',9900556677,'Kolkata'),(32,'Kian Lobo','kian.lobo@gmail.com',9988113344,'Delhi'),(33,'Rhea Anand','rhea.anand@gmail.com',9876541122,'Bangalore'),(34,'Vihaan Saluja','vihaan.saluja@gmail.com',9123456781,'Mumbai'),(35,'Nisha George','nisha.george@gmail.com',9900667788,'Chennai'),(36,'Kabya Banerjee','kabya.banerjee@gmail.com',9988002233,'Delhi'),(37,'Samarth Roy','samarth.roy@gmail.com',9876778899,'Kolkata'),(38,'Ishita Das','ishita.das@gmail.com',9123490123,'Bangalore'),(39,'Aarohi Jain','aarohi.jain@gmail.com',9900778899,'Mumbai'),(40,'Harsh Vardhan','harsh.vardhan@gmail.com',9988115566,'Chennai'),(41,'Nikita Sethi','nikita.sethi@gmail.com',9876507890,'Delhi'),(42,'Karan Mehra','karan.mehra@gmail.com',9123450999,'Bangalore'),(43,'Shreya Rathi','shreya.rathi@gmail.com',9900889900,'Mumbai'),(44,'Rajeev Malhotra','rajeev.malhotra@gmail.com',9988223344,'Kolkata'),(45,'Customer45','customer45@example.com',9876549876,'Chennai'),(46,'Tanishq Sharma','tanishq.sharma@gmail.com',9123467890,'Mumbai'),(47,'Aishwarya Nanda','aishwarya.nanda@gmail.com',9900991122,'Delhi'),(48,'Madhav Joshi','madhav.joshi@gmail.com',9988334455,'Bangalore'),(49,'Bhavya Oberoi','bhavya.oberoi@gmail.com',9876512345,'Chennai'),(50,'Simran Kaur','simran.kaur@gmail.com',9123478901,'Mumbai');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecom_platform`
--

DROP TABLE IF EXISTS `ecom_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ecom_platform` (
  `platform_id` int NOT NULL,
  `platform_name` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  PRIMARY KEY (`platform_id`),
  UNIQUE KEY `website` (`website`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecom_platform`
--

LOCK TABLES `ecom_platform` WRITE;
/*!40000 ALTER TABLE `ecom_platform` DISABLE KEYS */;
INSERT INTO `ecom_platform` VALUES (7001,'Amazon','www.amazon.in'),(7002,'Flipkart','www.flipkart.com'),(7003,'Myntra','www.myntra.com'),(7004,'Snapdeal','www.snapdeal.com'),(7005,'Ajio','www.ajio.com'),(7006,'Tata Cliq','www.tatacliq.com'),(7007,'Nykaa','www.nykaa.com'),(7008,'ShopClues','www.shopclues.com'),(7009,'Reliance Digital','www.reliancedigital.in'),(7010,'BigBasket','www.bigbasket.com');
/*!40000 ALTER TABLE `ecom_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_audit`
--

DROP TABLE IF EXISTS `order_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `action_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_audit`
--

LOCK TABLES `order_audit` WRITE;
/*!40000 ALTER TABLE `order_audit` DISABLE KEYS */;
INSERT INTO `order_audit` VALUES (1,12345,31,'INSERT','2025-11-07 06:38:07'),(2,850,39,'INSERT','2025-11-07 06:56:37');
/*!40000 ALTER TABLE `order_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `cid` int NOT NULL,
  `order_date` datetime NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cid` (`cid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (101,1,'2024-01-01 10:00:00'),(143,10,'2024-01-10 14:30:00'),(156,46,'2024-02-15 18:30:00'),(167,19,'2024-01-19 19:00:00'),(175,28,'2024-01-28 23:30:00'),(192,37,'2024-02-06 14:00:00'),(235,2,'2024-01-02 10:30:00'),(256,11,'2024-01-11 15:00:00'),(267,47,'2024-02-16 19:00:00'),(268,29,'2024-01-29 10:00:00'),(278,38,'2024-02-07 14:30:00'),(294,20,'2024-01-20 19:30:00'),(312,3,'2024-01-03 11:00:00'),(353,21,'2024-01-21 20:00:00'),(378,12,'2024-01-12 15:30:00'),(379,48,'2024-02-17 19:30:00'),(389,39,'2024-02-08 15:00:00'),(399,30,'2024-01-30 10:30:00'),(412,22,'2024-01-22 20:30:00'),(419,13,'2024-01-13 16:00:00'),(478,4,'2024-01-04 11:30:00'),(487,31,'2024-01-31 11:00:00'),(489,49,'2024-02-18 20:00:00'),(490,40,'2024-02-09 15:30:00'),(501,41,'2024-02-10 16:00:00'),(512,32,'2024-02-01 11:30:00'),(521,5,'2024-01-05 12:00:00'),(537,14,'2024-01-14 16:30:00'),(589,23,'2024-01-23 21:00:00'),(590,50,'2024-02-19 20:30:00'),(602,15,'2024-01-15 17:00:00'),(612,42,'2024-02-11 16:30:00'),(623,33,'2024-02-02 12:00:00'),(630,24,'2024-01-24 21:30:00'),(634,6,'2024-01-06 12:30:00'),(701,25,'2024-01-25 22:00:00'),(718,16,'2024-01-16 17:30:00'),(723,43,'2024-02-12 17:00:00'),(734,34,'2024-02-03 12:30:00'),(789,7,'2024-01-07 13:00:00'),(832,26,'2024-01-26 22:30:00'),(834,44,'2024-02-13 17:30:00'),(845,17,'2024-01-17 18:00:00'),(846,35,'2024-02-04 13:00:00'),(850,39,'2025-11-07 12:26:37'),(856,8,'2024-01-08 13:30:00'),(914,27,'2024-01-27 23:00:00'),(920,9,'2024-01-09 14:00:00'),(936,18,'2024-01-18 18:30:00'),(945,45,'2024-02-14 18:00:00'),(956,36,'2024-02-05 13:30:00'),(12345,31,'2025-11-07 12:08:07');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_insert` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO order_audit (order_id, cid, action, action_date)
    VALUES (NEW.order_id, NEW.cid, 'INSERT', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_delete` AFTER DELETE ON `orders` FOR EACH ROW BEGIN
    INSERT INTO order_audit (order_id, cid, action, action_date)
    VALUES (OLD.order_id, OLD.cid, 'DELETE', NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `method` varchar(10) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `payment_chk_1` CHECK ((`amount` > 0)),
  CONSTRAINT `payment_chk_2` CHECK ((`method` in (_cp850'Cash',_cp850'Card',_cp850'UPI')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1001,101,1200.50,'Card'),(1002,235,2500.00,'Cash'),(1003,312,3000.75,'UPI'),(1004,478,4500.00,'Card'),(1005,521,500.00,'Cash'),(1006,634,1800.00,'UPI'),(1007,789,2750.50,'Card'),(1008,856,3200.00,'Cash'),(1009,920,1900.00,'UPI'),(1010,143,2200.00,'Card'),(1011,256,3400.00,'Cash'),(1012,378,5000.00,'Card'),(1013,419,600.00,'UPI'),(1014,537,1400.00,'Cash'),(1015,602,2000.00,'Card'),(1016,718,1700.00,'UPI'),(1017,845,900.00,'Cash'),(1018,936,300.00,'Card'),(1019,167,700.00,'UPI'),(1020,294,3500.00,'Cash'),(1021,353,4500.00,'Card'),(1022,412,1200.00,'UPI'),(1023,589,2300.00,'Cash'),(1024,630,600.00,'Card'),(1025,701,900.00,'UPI'),(1026,832,4000.00,'Cash'),(1027,914,1100.00,'Card'),(1028,175,800.00,'UPI'),(1029,268,700.00,'Cash'),(1030,399,1500.00,'Card'),(1031,487,3200.00,'UPI'),(1032,512,3600.00,'Cash'),(1033,623,900.00,'UPI'),(1034,734,2200.00,'Card'),(1035,846,1000.00,'Cash'),(1036,956,4000.00,'Card'),(1037,192,2800.00,'UPI'),(1038,278,3700.00,'Cash'),(1039,389,2200.00,'Card'),(1040,490,1500.00,'UPI'),(1041,501,900.00,'Cash'),(1042,612,2600.00,'Card'),(1043,723,4200.00,'UPI'),(1044,834,3900.00,'Cash'),(1045,945,1000.00,'Card'),(1046,156,2200.00,'UPI'),(1047,267,3100.00,'Cash'),(1048,379,1500.00,'Card'),(1049,489,2000.00,'UPI'),(1050,590,3000.00,'Cash'),(5435,850,20000.00,'Cash'),(80000,12345,100000.00,'Cash');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_payment_insert` AFTER INSERT ON `payment` FOR EACH ROW BEGIN
    DECLARE max_shipment_id INT;
    SELECT COALESCE(MAX(shipment_id), 2000) + 1 INTO max_shipment_id FROM shipment;
    
    INSERT INTO shipment (shipment_id, order_id, shipment_date)
    VALUES (max_shipment_id, NEW.order_id, DATE_ADD(NOW(), INTERVAL 1 DAY));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` varchar(50) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `product_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5001,'Laptop',45000.00,'Luxury',4001),(5002,'T-Shirt',800.00,'Essential',4002),(5003,'Sofa',15000.00,'Luxury',4003),(5004,'Novel',500.00,'Regular',4004),(5005,'Action Figure',120000.00,'Regular',4005),(5006,'Smartphone',30000.00,'Luxury',4006),(5007,'Lipstick',700.00,'Essential',4007),(5008,'Cricket Bat',2500.00,'Regular',4008),(5009,'Jeans',1500.00,'Essential',4009),(5010,'Tablet',22000.00,'Luxury',4010),(5011,'Comic Book',600.00,'Regular',4011),(5012,'Toy Car',900.00,'Regular',4012),(5013,'Dining Table',12000.00,'Luxury',4013),(5014,'Face Cream',850.00,'Essential',4014),(5015,'Jacket',2500.00,'Essential',4015),(5016,'Football',1100.00,'Regular',4016),(5017,'Smartwatch',7000.00,'Luxury',4017),(5018,'Wardrobe',14000.00,'Luxury',4018),(5019,'Textbook',950.00,'Regular',4019),(5020,'Shirt',1200.00,'Essential',4020),(5021,'Perfume',1800.00,'Luxury',4021),(5022,'Headphones',3500.00,'Luxury',4022),(5023,'Tennis Racket',2000.00,'Regular',4023),(5024,'Cookbook',600.00,'Regular',4024),(5025,'Office Chair',5000.00,'Luxury',4025),(5026,'Kurta',1000.00,'Essential',4026),(5027,'Camera',25000.00,'Luxury',4027),(5028,'Puzzle Game',900.00,'Regular',4028),(5029,'Badminton Racket',1500.00,'Regular',4029),(5030,'Hair Oil',400.00,'Essential',4030),(5031,'Bookshelf',3500.00,'Luxury',4031),(5032,'Magazine',300.00,'Regular',4032),(5033,'Gaming Console',28000.00,'Luxury',4033),(5034,'Sweater',1600.00,'Essential',4034),(5035,'Board Game',950.00,'Regular',4035),(5036,'Nail Polish',300.00,'Essential',4036),(5037,'Basketball',1200.00,'Regular',4037),(5038,'Encyclopedia',2000.00,'Regular',4038),(5039,'Smart TV',35000.00,'Luxury',4039),(5040,'Coffee Table',5500.00,'Luxury',4040),(5041,'Track Pants',1100.00,'Essential',4041),(5042,'Moisturizer',650.00,'Essential',4042),(5043,'Hockey Stick',2200.00,'Regular',4043),(5044,'Bluetooth Speaker',5000.00,'Luxury',4044),(5045,'Doll',700.00,'Regular',4045),(5046,'Bed Frame',10000.00,'Luxury',4046),(5047,'Cap',400.00,'Essential',4047),(5048,'Router',3000.00,'Luxury',4048),(5049,'History Book',650.00,'Regular',4049),(5050,'Yoga Mat',900.00,'Regular',4050);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_product_price_update` BEFORE UPDATE ON `product` FOR EACH ROW BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO product_price_history (product_id, old_price, new_price, changed_date)
        VALUES (OLD.product_id, OLD.price, NEW.price, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_price_history`
--

DROP TABLE IF EXISTS `product_price_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) DEFAULT NULL,
  `changed_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_history`
--

LOCK TABLES `product_price_history` WRITE;
/*!40000 ALTER TABLE `product_price_history` DISABLE KEYS */;
INSERT INTO `product_price_history` VALUES (1,5005,1200.00,1000.00,'2025-11-06 16:11:38'),(2,5005,1000.00,150000.00,'2025-11-07 06:38:53'),(3,5005,150000.00,120000.00,'2025-11-07 06:56:13');
/*!40000 ALTER TABLE `product_price_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment` (
  `shipment_id` int NOT NULL,
  `order_id` int NOT NULL,
  `shipment_date` datetime NOT NULL,
  PRIMARY KEY (`shipment_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (2001,101,'2024-01-02 10:00:00'),(2002,235,'2024-01-03 10:30:00'),(2003,312,'2024-01-04 11:00:00'),(2004,478,'2024-01-05 11:30:00'),(2005,521,'2024-01-06 12:00:00'),(2006,634,'2024-01-07 12:30:00'),(2007,789,'2024-01-08 13:00:00'),(2008,856,'2024-01-09 13:30:00'),(2009,920,'2024-01-10 14:00:00'),(2010,143,'2024-01-11 14:30:00'),(2011,256,'2024-01-12 15:00:00'),(2012,378,'2024-01-13 15:30:00'),(2013,419,'2024-01-14 16:00:00'),(2014,537,'2024-01-15 16:30:00'),(2015,602,'2024-01-16 17:00:00'),(2016,718,'2024-01-17 17:30:00'),(2017,845,'2024-01-18 18:00:00'),(2018,936,'2024-01-19 18:30:00'),(2019,167,'2024-01-20 19:00:00'),(2020,294,'2024-01-21 19:30:00'),(2021,353,'2024-01-22 20:00:00'),(2022,412,'2024-01-23 20:30:00'),(2023,589,'2024-01-24 21:00:00'),(2024,630,'2024-01-25 21:30:00'),(2025,701,'2024-01-26 22:00:00'),(2026,832,'2024-01-27 22:30:00'),(2027,914,'2024-01-28 23:00:00'),(2028,175,'2024-01-29 23:30:00'),(2029,268,'2024-01-30 10:00:00'),(2030,399,'2024-01-31 10:30:00'),(2031,487,'2024-02-01 11:00:00'),(2032,512,'2024-02-02 11:30:00'),(2033,623,'2024-02-03 12:00:00'),(2034,734,'2024-02-04 12:30:00'),(2035,846,'2024-02-05 13:00:00'),(2036,956,'2024-02-06 13:30:00'),(2037,192,'2024-02-07 14:00:00'),(2038,278,'2024-02-08 14:30:00'),(2039,389,'2024-02-09 15:00:00'),(2040,490,'2024-02-10 15:30:00'),(2041,501,'2024-02-11 16:00:00'),(2042,612,'2024-02-12 16:30:00'),(2043,723,'2024-02-13 17:00:00'),(2044,834,'2024-02-14 17:30:00'),(2045,945,'2024-02-15 18:00:00'),(2046,156,'2024-02-16 18:30:00'),(2047,267,'2024-02-17 19:00:00'),(2048,379,'2024-02-18 19:30:00'),(2049,489,'2024-02-19 20:00:00'),(2050,590,'2024-02-20 20:30:00'),(2051,12345,'2025-11-08 12:08:07'),(2052,850,'2025-11-08 12:26:37');
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(25) NOT NULL,
  `location` varchar(25) NOT NULL,
  `phone` bigint NOT NULL,
  `supply_category` varchar(50) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (6001,'Amit Sharma','Mumbai',9876543210,'Electronics'),(6002,'Priya Mehta','Delhi',9898765432,'Clothing'),(6003,'Rajesh Kumar','Bangalore',9812345678,'Furniture'),(6004,'Neha Gupta','Chennai',9823456789,'Books'),(6005,'Sanjay Patel','Kolkata',9834567890,'Toys'),(6006,'Anita Rao','Pune',9845678901,'Electronics'),(6007,'Vikram Singh','Hyderabad',9856789012,'Beauty'),(6008,'Kavita Jain','Ahmedabad',9867890123,'Furniture'),(6009,'Arjun Nair','Jaipur',9878901234,'Clothing'),(6010,'Meera Joshi','Lucknow',9889012345,'Books'),(6011,'Ravi Iyer','Mumbai',9811122233,'Electronics'),(6012,'Sneha Kapoor','Delhi',9822233344,'Toys'),(6013,'Karan Verma','Bangalore',9833344455,'Beauty'),(6014,'Pooja Chawla','Chennai',9844455566,'Furniture'),(6015,'Aditya Malhotra','Kolkata',9855566677,'Clothing'),(6016,'Shreya Bansal','Pune',9866677788,'Books'),(6017,'Manish Aggarwal','Hyderabad',9877788899,'Electronics'),(6018,'Divya Sethi','Ahmedabad',9888899900,'Toys'),(6019,'Nikhil Yadav','Jaipur',9812233445,'Beauty'),(6020,'Ritu Tiwari','Lucknow',9823344556,'Clothing'),(6021,'Suresh Das','Mumbai',9834455667,'Furniture'),(6022,'Alok Sen','Delhi',9845566778,'Electronics'),(6023,'Pankaj Dubey','Bangalore',9856677889,'Books'),(6024,'Deepa Thakur','Chennai',9867788990,'Toys'),(6025,'Sunil Reddy','Kolkata',9878899001,'Furniture'),(6026,'Anjali Mishra','Pune',9889900112,'Clothing'),(6027,'Harish Nanda','Hyderabad',9810011223,'Electronics'),(6028,'Sonia Ahuja','Ahmedabad',9821122334,'Beauty'),(6029,'Tarun Khanna','Jaipur',9832233445,'Books'),(6030,'Bhavna Arora','Lucknow',9843344556,'Furniture'),(6031,'Rohit Chopra','Mumbai',9854455667,'Clothing'),(6032,'Geeta Saxena','Delhi',9865566778,'Toys'),(6033,'Varun Joshi','Bangalore',9876677889,'Electronics'),(6034,'Monica Bhatia','Chennai',9887788990,'Books'),(6035,'Siddharth Kapoor','Kolkata',9818899001,'Sports'),(6036,'Isha Roy','Pune',9829900112,'Clothing'),(6037,'Ashok Menon','Hyderabad',9830011223,'Toys'),(6038,'Kirti Sharma','Ahmedabad',9841122334,'Books'),(6039,'Lokesh Tripathi','Jaipur',9852233445,'Electronics'),(6040,'Rashmi Vohra','Lucknow',9863344556,'Sports'),(6041,'Vivek Awasthi','Mumbai',9874455667,'Clothing'),(6042,'Naina Gill','Delhi',9885566778,'Toys'),(6043,'Parth Mahajan','Bangalore',9816677889,'Books'),(6044,'Anuradha Sinha','Chennai',9827788990,'Electronics'),(6045,'Yashwant Pawar','Kolkata',9838899001,'Sports'),(6046,'Rakhi Desai','Pune',9849900112,'Toys'),(6047,'Ajay Kulkarni','Hyderabad',9850011223,'Clothing'),(6048,'Tina D?Souza','Ahmedabad',9861122334,'Books'),(6049,'Keshav Saxena','Jaipur',9872233445,'Toys'),(6050,'Rohini Mathew','Lucknow',9883344556,'Electronics');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-30 10:35:07
