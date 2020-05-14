CREATE DATABASE  IF NOT EXISTS `teamweb2020` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teamweb2020`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: teamweb2020
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `mb`
--

DROP TABLE IF EXISTS `mb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mb` (
  `mb` int NOT NULL AUTO_INCREMENT,
  `mb_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mb_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `mb_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mb`
--

LOCK TABLES `mb` WRITE;
/*!40000 ALTER TABLE `mb` DISABLE KEYS */;
/*!40000 ALTER TABLE `mb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `mem_id` int NOT NULL AUTO_INCREMENT,
  `mem_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mem_mail` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mem_pwd` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mem_level` int NOT NULL DEFAULT '1' COMMENT '1:申請未確認\n2:已認證會員\n9:管理者',
  `mem_chkcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Null',
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'ooooo','ts004@gmail.com','tS1234',2,'Null'),(2,'hyjjjyjty','ts005@gmail.com','tS1234',2,'Null'),(18,'jgjygjgyjyg','lab3300552@gmail.com','tS1234',9,'698330');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `prod_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '商品名稱',
  `prod_price` int unsigned NOT NULL COMMENT '商品定價',
  `prod_introduction` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '商品介紹',
  `prod_size_stock` int unsigned NOT NULL COMMENT '商品庫存',
  `prod_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewcount`
--

DROP TABLE IF EXISTS `viewcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewcount` (
  `view_id` int NOT NULL AUTO_INCREMENT,
  `view_time` datetime DEFAULT NULL,
  `view_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`view_id`)
) ENGINE=MyISAM AUTO_INCREMENT=555 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewcount`
--

LOCK TABLES `viewcount` WRITE;
/*!40000 ALTER TABLE `viewcount` DISABLE KEYS */;
INSERT INTO `viewcount` VALUES (438,'2015-01-28 19:35:23','127.0.0.1'),(439,'2015-01-28 19:35:26','127.0.0.1'),(440,'2015-01-28 19:35:26','127.0.0.1'),(441,'2015-01-28 19:35:26','127.0.0.1'),(442,'2015-01-28 19:35:26','127.0.0.1'),(443,'2015-01-28 19:35:26','127.0.0.1'),(444,'2015-01-28 19:36:04','127.0.0.1'),(445,'2015-01-28 19:36:05','127.0.0.1'),(446,'2015-01-28 19:36:05','127.0.0.1'),(447,'2015-01-28 19:36:05','127.0.0.1'),(448,'2015-01-28 19:36:05','127.0.0.1'),(449,'2015-01-28 19:36:05','127.0.0.1'),(450,'2015-01-28 19:36:05','127.0.0.1'),(451,'2015-01-28 19:36:06','127.0.0.1'),(452,'2015-01-28 19:36:06','127.0.0.1'),(453,'2015-01-28 19:36:06','127.0.0.1'),(454,'2015-01-28 19:41:40','127.0.0.1'),(455,'2015-01-25 19:56:51','127.0.0.1'),(456,'2014-12-25 20:01:25','127.0.0.1'),(457,'2014-12-25 20:01:26','127.0.0.1'),(458,'2014-12-25 20:01:26','127.0.0.1'),(459,'2014-12-25 20:01:29','127.0.0.1'),(460,'2014-10-25 20:01:38','127.0.0.1'),(461,'2018-01-28 21:46:05','127.0.0.1'),(462,'2018-11-01 15:23:05','127.0.0.1'),(463,'2018-11-14 19:20:15','127.0.0.1'),(464,'2018-11-14 21:10:08','::1'),(465,'2018-11-14 21:11:10','::1'),(466,'2018-11-14 21:11:10','::1'),(467,'2018-11-14 21:11:10','::1'),(468,'2018-11-14 21:11:10','::1'),(469,'2018-11-14 21:11:11','::1'),(470,'2018-11-14 21:11:11','::1'),(471,'2018-11-14 21:11:11','::1'),(472,'2018-11-14 21:11:11','::1'),(473,'2018-11-14 21:11:11','::1'),(474,'2018-11-14 21:11:11','::1'),(475,'2018-11-14 21:11:12','::1'),(476,'2018-11-14 21:11:12','::1'),(477,'2018-11-14 21:11:12','::1'),(478,'2018-11-14 21:11:12','::1'),(479,'2018-11-14 21:11:12','::1'),(480,'2018-11-14 21:11:12','::1'),(481,'2018-11-14 21:11:12','::1'),(482,'2018-11-14 21:11:13','::1'),(483,'2018-11-14 21:11:13','::1'),(484,'2018-11-14 21:11:13','::1'),(485,'2018-11-14 21:11:13','::1'),(486,'2018-11-14 21:11:13','::1'),(487,'2018-11-14 21:11:13','::1'),(488,'2018-11-14 21:11:13','::1'),(489,'2018-11-14 21:11:14','::1'),(490,'2018-11-14 21:11:14','::1'),(491,'2018-11-14 21:11:14','::1'),(492,'2018-11-14 21:11:14','::1'),(493,'2018-11-14 21:11:14','::1'),(494,'2018-11-14 21:11:14','::1'),(495,'2018-11-14 21:11:14','::1'),(496,'2018-11-14 21:11:14','::1'),(497,'2018-11-14 21:11:15','::1'),(498,'2018-11-14 21:11:15','::1'),(499,'2018-11-14 21:11:15','::1'),(500,'2018-11-14 21:11:15','::1'),(501,'2018-11-14 21:11:15','::1'),(502,'2018-11-14 21:11:15','::1'),(503,'2018-11-14 21:11:15','::1'),(504,'2018-11-14 21:11:16','::1'),(505,'2018-11-14 21:11:16','::1'),(506,'2018-11-14 21:11:16','::1'),(507,'2018-11-14 21:11:16','::1'),(508,'2018-11-14 21:11:16','::1'),(509,'2018-11-14 21:11:16','::1'),(510,'2018-11-14 21:11:16','::1'),(511,'2018-11-14 21:12:14','::1'),(512,'2018-11-14 21:12:14','::1'),(513,'2018-11-14 21:12:14','::1'),(514,'2018-11-14 21:12:14','::1'),(515,'2018-11-14 21:12:14','::1'),(516,'2018-11-14 21:12:14','::1'),(517,'2018-11-14 21:12:15','::1'),(518,'2018-11-14 21:12:15','::1'),(519,'2018-11-14 21:12:15','::1'),(520,'2018-11-14 21:12:15','::1'),(521,'2018-11-14 21:12:16','::1'),(522,'2018-11-14 21:12:16','::1'),(523,'2018-11-14 21:12:16','::1'),(524,'2018-11-14 21:12:16','::1'),(525,'2018-11-14 21:20:07','::1'),(526,'2018-11-14 21:20:45','::1'),(527,'2018-11-14 21:21:10','::1'),(528,'2018-11-16 16:57:45','::1'),(529,'2018-11-19 19:00:17','::1'),(530,'2018-11-27 02:14:33','::1'),(531,'2018-11-27 21:52:18','::1'),(532,'2018-11-29 18:32:05','::1'),(533,'2018-12-03 18:50:35','::1'),(534,'2018-12-05 18:45:47','::1'),(535,'2018-12-07 18:49:37','::1'),(536,'2018-12-07 18:56:29','::1'),(537,'2018-12-07 18:56:59','::1'),(538,'2018-12-07 18:58:59','::1'),(539,'2018-12-09 23:48:10','::1'),(540,'2018-12-10 23:43:39','::1'),(541,'2018-12-14 15:42:36','::1'),(542,'2018-12-20 20:25:47','::1'),(543,'2018-12-21 23:38:13','::1'),(544,'2018-12-25 15:39:18','::1'),(545,'2019-02-13 03:14:34','::1'),(546,'2019-03-21 15:43:09','::1'),(547,'2019-03-28 13:40:02','::1'),(548,'2019-04-09 08:10:32','::1'),(549,'2019-04-10 06:03:13','::1'),(550,'2019-05-09 04:08:47','::1'),(551,'2019-05-09 04:09:06','::1'),(552,'2019-05-09 04:09:29','::1'),(553,'2019-05-09 04:14:53','::1'),(554,'2019-05-09 04:15:11','::1'),(18,'2020-05-07 10:24:35','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `viewcount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14 11:11:31
