-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: localhost    Database: intercity
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `agent_id` int NOT NULL,
  `ticket_id` varchar(20) NOT NULL,
  PRIMARY KEY (`agent_id`,`ticket_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `travel_agent` (`agent_id`),
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2101,'tk101'),(2105,'tk102'),(2103,'tk103'),(2101,'tk104'),(2101,'tk201'),(2104,'tk202'),(2101,'tk203'),(2102,'tk301'),(2104,'tk302'),(2105,'tk303');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bought_by`
--

DROP TABLE IF EXISTS `bought_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bought_by` (
  `ticket_id` varchar(20) NOT NULL,
  `pg_id` varchar(20) NOT NULL,
  `ticket_date` date DEFAULT NULL,
  PRIMARY KEY (`ticket_id`,`pg_id`),
  KEY `pg_id` (`pg_id`),
  CONSTRAINT `bought_by_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`),
  CONSTRAINT `bought_by_ibfk_2` FOREIGN KEY (`pg_id`) REFERENCES `passenger` (`pg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bought_by`
--

LOCK TABLES `bought_by` WRITE;
/*!40000 ALTER TABLE `bought_by` DISABLE KEYS */;
INSERT INTO `bought_by` VALUES ('tk101','pg103','2023-08-01'),('tk102','pg102','2023-09-20'),('tk103','pg101','2023-08-10'),('tk104','pg104','2023-05-20'),('tk201','pg203','2023-10-06'),('tk202','pg202','2023-10-08'),('tk203','pg201','2023-02-23'),('tk204','pg204','2023-05-19'),('tk301','pg301','2023-08-02'),('tk302','pg302','2023-09-27'),('tk303','pg303','2023-08-07');
/*!40000 ALTER TABLE `bought_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `coach_id` varchar(20) NOT NULL,
  `mileage` int DEFAULT NULL,
  `last_maintenance_date` date DEFAULT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES ('c101',1500,'2023-05-17'),('c102',2563,'2023-08-06'),('c103',4576,'2023-03-12'),('c104',3050,'2023-01-18'),('c105',4300,'2023-03-04'),('c106',3700,'2023-06-13');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_seat`
--

DROP TABLE IF EXISTS `coach_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_seat` (
  `coach_id` varchar(20) NOT NULL,
  `seat_no` int NOT NULL,
  PRIMARY KEY (`coach_id`,`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_seat`
--

LOCK TABLES `coach_seat` WRITE;
/*!40000 ALTER TABLE `coach_seat` DISABLE KEYS */;
INSERT INTO `coach_seat` VALUES ('c101',1),('c101',2),('c102',1),('c102',2),('c103',1),('c103',2);
/*!40000 ALTER TABLE `coach_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `of_a_train`
--

DROP TABLE IF EXISTS `of_a_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `of_a_train` (
  `train_id` varchar(20) DEFAULT NULL,
  `coach_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `of_a_train`
--

LOCK TABLES `of_a_train` WRITE;
/*!40000 ALTER TABLE `of_a_train` DISABLE KEYS */;
INSERT INTO `of_a_train` VALUES ('tn101','c101'),('tn101','c105'),('tn102','c102'),('tn102','c104'),('tn103','c102'),('tn103','c104'),('tn104','c104'),('tn104','c105'),('tn105','c103'),('tn105','c105'),('tn106','c103'),('tn106','c104');
/*!40000 ALTER TABLE `of_a_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `pg_id` varchar(20) NOT NULL,
  `pg_name` varchar(30) DEFAULT NULL,
  `pg_dob` date DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`pg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES ('pg101','Ajay','2018-10-03',NULL),('pg102','Arun','2010-07-15',NULL),('pg103','Sonu','2017-01-09',NULL),('pg104','Sohan','2016-08-03',NULL),('pg105','Aarya','2016-09-03',NULL),('pg201','Varun','1999-05-25',NULL),('pg202','Ranjay','1999-03-09',NULL),('pg203','Monu','1996-01-03',NULL),('pg204','Surya','2007-01-04',NULL),('pg301','Rahul','1970-03-15',NULL),('pg302','Rohan','1991-01-09',NULL),('pg303','Mohan','1973-08-03',NULL);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `r_id` varchar(20) NOT NULL,
  `r_name` varchar(40) DEFAULT NULL,
  `r_distance` int DEFAULT NULL,
  `r_time` time DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES ('rt101','Mumbai Central - Gandhinagar',548,'05:40:00'),('rt102','New Delhi - Himachal',412,'06:10:00'),('rt103','Secunderabad - Vishakhapatnam',500,'08:30:00'),('rt104','Mumbai - Sainagar Shirdi',248,'05:20:00'),('rt105','Mumbai - Solapur',400,'06:35:00'),('rt106','Bhopal - Delhi',700,'07:35:00'),('rt107','Lonavala - Ajmer',1062,'10:45:00'),('rt108','Dharwad -Bengaluru',432,'05:00:00'),('rt109','Bhopal - Indore',246,'03:00:00'),('rt110','Mumbai - Goa',588,'06:00:00'),('rt111','Gandhinagar - Mumbai Central',548,'06:00:00'),('rt112','Himanchal - New Delhi',412,'06:20:00'),('rt113','Vishakhapatnam - Secunderabad',500,'08:50:00'),('rt114','Sainagar Shirdi - Mumbai',248,'05:20:00'),('rt115','Solapur - Mumbai',400,'06:50:00'),('rt116','Delhi - Bhopal',700,'07:50:00'),('rt117','Ajmer - Lonavala',1062,'11:00:00'),('rt118','Bengaluru - Dharwad',432,'05:20:00'),('rt119','Indore - Bhopal',246,'03:20:00'),('rt120','Goa - Mumbai',588,'06:20:00');
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_weeks`
--

DROP TABLE IF EXISTS `route_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route_weeks` (
  `r_id` varchar(20) NOT NULL,
  `day_id` int NOT NULL,
  PRIMARY KEY (`r_id`,`day_id`),
  KEY `day_id` (`day_id`),
  CONSTRAINT `route_weeks_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `route` (`r_id`),
  CONSTRAINT `route_weeks_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `week_days` (`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_weeks`
--

LOCK TABLES `route_weeks` WRITE;
/*!40000 ALTER TABLE `route_weeks` DISABLE KEYS */;
INSERT INTO `route_weeks` VALUES ('rt101',2),('rt101',3),('rt101',4),('rt101',5),('rt101',6),('rt101',7);
/*!40000 ALTER TABLE `route_weeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_on`
--

DROP TABLE IF EXISTS `scheduled_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_on` (
  `train_id` varchar(20) NOT NULL,
  `r_id` varchar(20) NOT NULL,
  `schedule_date` date DEFAULT NULL,
  `schedule_time` time DEFAULT NULL,
  PRIMARY KEY (`train_id`,`r_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `scheduled_on_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `scheduled_on_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `route` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_on`
--

LOCK TABLES `scheduled_on` WRITE;
/*!40000 ALTER TABLE `scheduled_on` DISABLE KEYS */;
INSERT INTO `scheduled_on` VALUES ('tn101','rt102','2023-10-10','06:00:00'),('tn102','rt117','2023-08-25','01:00:00'),('tn103','rt120','2023-10-10','13:00:00'),('tn104','rt104','2023-05-25','06:30:00'),('tn105','rt105','2023-08-30','09:00:00'),('tn106','rt120','2023-09-29','04:30:00');
/*!40000 ALTER TABLE `scheduled_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seat_no` int NOT NULL,
  PRIMARY KEY (`seat_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_caterer`
--

DROP TABLE IF EXISTS `staff_caterer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_caterer` (
  `caterer_id` varchar(20) NOT NULL,
  `st_name` varchar(30) DEFAULT NULL,
  `st_contact` bigint DEFAULT NULL,
  `st_address` text,
  PRIMARY KEY (`caterer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_caterer`
--

LOCK TABLES `staff_caterer` WRITE;
/*!40000 ALTER TABLE `staff_caterer` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_caterer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_cleaner`
--

DROP TABLE IF EXISTS `staff_cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_cleaner` (
  `cleaner_id` varchar(20) NOT NULL,
  `st_name` varchar(30) DEFAULT NULL,
  `st_contact` bigint DEFAULT NULL,
  `st_address` text,
  PRIMARY KEY (`cleaner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_cleaner`
--

LOCK TABLES `staff_cleaner` WRITE;
/*!40000 ALTER TABLE `staff_cleaner` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_driver`
--

DROP TABLE IF EXISTS `staff_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_driver` (
  `driver_id` varchar(20) NOT NULL,
  `st_name` varchar(30) DEFAULT NULL,
  `st_contact` bigint DEFAULT NULL,
  `st_address` text,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_driver`
--

LOCK TABLES `staff_driver` WRITE;
/*!40000 ALTER TABLE `staff_driver` DISABLE KEYS */;
INSERT INTO `staff_driver` VALUES ('dr101','Mahesh',6363783734,'Mumbai CSMT'),('dr102','Rajesh',6865677349,'Pune'),('dr103','Ramesh',9865677349,'Ballia'),('dr104','Kamesh',9860077349,'Buxar'),('dr105','Kamalesh',8860077349,'Rasra'),('dr106','Mritunjay',6560077349,'Varansi'),('dr107','Anup',6560088349,'Bhadohi'),('dr108','Nikhil',6980088349,'Gazipur'),('dr109','Jaishankar',9980088349,'Mirzapur'),('dr110','Babaloo',9980000349,'Gorakhpur'),('dr111','Manoj',9980111349,'Chhapra'),('dr112','Sonu',8880111349,'Kalyan');
/*!40000 ALTER TABLE `staff_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffed_by`
--

DROP TABLE IF EXISTS `staffed_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffed_by` (
  `train_id` varchar(20) DEFAULT NULL,
  `driver_id` varchar(20) DEFAULT NULL,
  `co_driver_id` varchar(20) DEFAULT NULL,
  KEY `train_id` (`train_id`),
  KEY `driver_id` (`driver_id`),
  KEY `co_driver_id` (`co_driver_id`),
  CONSTRAINT `staffed_by_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `staffed_by_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `staff_driver` (`driver_id`),
  CONSTRAINT `staffed_by_ibfk_3` FOREIGN KEY (`co_driver_id`) REFERENCES `staff_driver` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffed_by`
--

LOCK TABLES `staffed_by` WRITE;
/*!40000 ALTER TABLE `staffed_by` DISABLE KEYS */;
INSERT INTO `staffed_by` VALUES ('tn105','dr101','dr102'),('tn106','dr101','dr109'),('tn106','dr108','dr109'),('tn105','dr111',NULL),('tn101','dr109','dr101'),('tn101','dr105','dr112'),('tn104','dr103','dr109'),('tn104','dr101',NULL),('tn103','dr107','dr110'),('tn104','dr104','dr111'),('tn101','dr101',NULL),('tn105','dr109','dr105'),('tn102','dr102','dr103'),('tn102','dr107','dr109');
/*!40000 ALTER TABLE `staffed_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` varchar(20) NOT NULL,
  `station_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES ('st101','Mumbai CSMT'),('st102','Surat'),('st103','Gandhinagar'),('st104','Srinagar'),('st105','Shirdi'),('st106','shivpur'),('st107','Solapur'),('st108','panji'),('st109','goa'),('st201','New Delhi'),('st202','Lucknow'),('st203','Himachal'),('st204','Bilaspur'),('st205','Bhopal'),('st206','Bajrangi'),('st207','Indore'),('st301','Secunderabad'),('st302','Vamsi'),('st303','Vishakhapatnam'),('st401','Lonavala'),('st402','Aclooz'),('st403','Ajmer'),('st501','Dharwad'),('st502','Dharmesh'),('st503','Bengaluru');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_ticket`
--

DROP TABLE IF EXISTS `sub_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_ticket` (
  `sub_id` int NOT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  `ticket_price` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_ticket`
--

LOCK TABLES `sub_ticket` WRITE;
/*!40000 ALTER TABLE `sub_ticket` DISABLE KEYS */;
INSERT INTO `sub_ticket` VALUES (1,'Child',750),(2,'Adult',1000),(3,'Senior',900);
/*!40000 ALTER TABLE `sub_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` varchar(20) NOT NULL,
  `ticket_type` int DEFAULT NULL,
  `ticket_status` enum('Waiting','Confirmed','Not Confirmed','Cancelled') NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `ticket_type` (`ticket_type`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ticket_type`) REFERENCES `sub_ticket` (`sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('tk101',1,'Confirmed'),('tk102',1,'Confirmed'),('tk103',1,'Not Confirmed'),('tk104',1,'Confirmed'),('tk201',2,'Waiting'),('tk202',2,'Waiting'),('tk203',2,'Confirmed'),('tk204',2,'Not Confirmed'),('tk301',3,'Cancelled'),('tk302',3,'Confirmed'),('tk303',3,'Not Confirmed'),('tk304',3,'Confirmed');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_for`
--

DROP TABLE IF EXISTS `ticket_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_for` (
  `train_id` varchar(20) NOT NULL,
  `ticket_id` varchar(20) NOT NULL,
  PRIMARY KEY (`train_id`,`ticket_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `ticket_for_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `ticket_for_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_for`
--

LOCK TABLES `ticket_for` WRITE;
/*!40000 ALTER TABLE `ticket_for` DISABLE KEYS */;
INSERT INTO `ticket_for` VALUES ('tn105','tk101'),('tn106','tk102'),('tn102','tk103'),('tn104','tk104'),('tn101','tk201'),('tn101','tk202'),('tn103','tk203'),('tn104','tk204'),('tn102','tk301'),('tn106','tk302'),('tn105','tk303'),('tn106','tk304');
/*!40000 ALTER TABLE `ticket_for` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `train_id` varchar(20) NOT NULL,
  `train_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES ('tn101','Deccan Queen'),('tn102','Deccan Herald'),('tn103','Rajdhani Express'),('tn104','Mumbai Local'),('tn105','Mumbai Galore'),('tn106','Galaxy Express');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_on`
--

DROP TABLE IF EXISTS `train_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_on` (
  `train_id` varchar(20) NOT NULL,
  `station_id` varchar(20) NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  PRIMARY KEY (`train_id`,`station_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `train_on_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `train` (`train_id`),
  CONSTRAINT `train_on_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_on`
--

LOCK TABLES `train_on` WRITE;
/*!40000 ALTER TABLE `train_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_agent`
--

DROP TABLE IF EXISTS `travel_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_agent` (
  `agent_id` int NOT NULL,
  `agent_name` varchar(30) DEFAULT NULL,
  `agent_phone` bigint DEFAULT NULL,
  `month` date DEFAULT NULL,
  `commission` int DEFAULT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_agent`
--

LOCK TABLES `travel_agent` WRITE;
/*!40000 ALTER TABLE `travel_agent` DISABLE KEYS */;
INSERT INTO `travel_agent` VALUES (2101,'Vijay',9878677690,'2023-10-01',30000),(2102,'Badal',9778677690,'2023-07-01',30400),(2103,'Lalu',8778677690,'2023-08-01',39400),(2104,'Manish',6778677690,'2023-09-01',39490),(2105,'Chhotu',8878677690,'2023-01-01',31190),(2106,'Aanand',8118677690,'2023-02-01',31770),(2107,'Dheeraj',8110007690,'2023-03-01',32270),(2108,'Sanjay',8110001190,'2023-04-01',32222),(2109,'Sujit',8545391190,'2023-05-01',13322),(2110,'Brijesh',6545391190,'2023-06-01',33322);
/*!40000 ALTER TABLE `travel_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `week_days`
--

DROP TABLE IF EXISTS `week_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `week_days` (
  `day_id` int NOT NULL,
  `day` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `week_days`
--

LOCK TABLES `week_days` WRITE;
/*!40000 ALTER TABLE `week_days` DISABLE KEYS */;
INSERT INTO `week_days` VALUES (1,'Sunday'),(2,'Monday'),(3,'Tuesday'),(4,'Wednesday'),(5,'Thursday'),(6,'Friday'),(7,'Saturday');
/*!40000 ALTER TABLE `week_days` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-16  1:16:01
