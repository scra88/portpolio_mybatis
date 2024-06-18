CREATE DATABASE  IF NOT EXISTS `spring` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spring`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `contents` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'옛날군만두','맛있는 옛날군만두 입니다.','1718694299169.PNG',1500),(2,'짜장면','맛있는 짜장면','1718694458635.jpg',5900);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyitem`
--

DROP TABLE IF EXISTS `buyitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buyitem` (
  `itemid` int NOT NULL,
  `buyername` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyitem`
--

LOCK TABLES `buyitem` WRITE;
/*!40000 ALTER TABLE `buyitem` DISABLE KEYS */;
INSERT INTO `buyitem` VALUES (2,'wjdgus',5900,'1718694458635.jpg'),(1,'user1',1500,'1718694299169.PNG');
/*!40000 ALTER TABLE `buyitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `money` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (20,'dallem','{bcrypt}$2a$10$lHFZp.XtCVnyfXKsnZ6HmutSiJ9VSBEk14RY18uKqeGwV5yPqSkZe','admin',8617),(21,'user1','{bcrypt}$2a$10$7MvW8IVI4bVLNUGGne/41uZQHgS3SNrsEhEL2qifCTGDE7.AitRqq','user',8500),(22,'wjdgus','{bcrypt}$2a$10$cgP/I2C6w8xobgZSTSMyV.z5m5d5sdPmcBd8qFbKGZruq4Y4f/vB2','admin',94100),(23,'user15','{bcrypt}$2a$10$MQE.paumHta6wmfoEZButeHNHS/XWfFanE8NfjkuoozZtBmdhuxmK','user',1000),(24,'user16','{bcrypt}$2a$10$30FOuh8cx1XeTEw3SkQwce13vlnfk2cO16d5oqoEKAez8nK2WEJo.','user',1000),(25,'user19','{bcrypt}$2a$10$A6c6tzY3B0K.gMDQFbGPxu/qfqclNtLp7HBtN4uC9ncbpUB/KhSya','user',1000),(28,'d','{bcrypt}$2a$10$RyZ42t4ZfC2wQzvXBv436OijkgUkZpdOq2ao15gbZ4WSpj.p2P.eq','user',1000),(29,'f','{bcrypt}$2a$10$hwSm0olrGBeJVsTjsCaH7uhIh09tqswQnymgWb1gmnwFSytUeB2C6','user',1000),(30,'sdf','{bcrypt}$2a$10$beQXF19ViEAHLqfGcunPleNHXVz7ITrbXMhzCJ6NZHp9PN0e/UsWO','user',1000),(31,'sadfasdf123','{bcrypt}$2a$10$JXIpyjVdghe5/J1S/wiW1Ooj1sagwt21OvZ44Ay2ep4BnOGk/PWJS','user',1000),(32,'asdf','{bcrypt}$2a$10$edD.oWKyf3d.1es0QNo1leCD.tDhnLOEUgmLZa0qoAhd0.xwNDWtS','user',1000),(33,'wjdgusdldl','{bcrypt}$2a$10$nVW6s9BV24T07LltxTucB.Qt0wG55Fkg1TQdRkc5n3a/YhCbLgpnq','user',1000),(34,'skdls','{bcrypt}$2a$10$H0EvcimYO3ga.8TFcA95Kuf4/Lq6Ny.I.NE8M.2TX/2XQ0bCZC2xy','user',1000),(35,'test01','{bcrypt}$2a$10$WyYNufk6x9fqBmjIoimpfO55CDkSA9AzVaH2NixRcsetmTiBZ7Ute','user',1000),(36,'test02','{bcrypt}$2a$10$LW7WKoJx1iM4XgEn7TPISeYBNJPnL7KlWTwazCqW.jD3GfS4bPWOu','user',1000);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'spring'
--

--
-- Dumping routines for database 'spring'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 16:27:52
