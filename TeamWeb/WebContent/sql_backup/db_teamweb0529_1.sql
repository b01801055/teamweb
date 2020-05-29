CREATE DATABASE  IF NOT EXISTS `teamweb2020` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teamweb2020`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: teamweb2020
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (20,'小花狗','109java01@gmail.com','Aa123',9,'Null');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `orderList_id` int NOT NULL COMMENT '訂單流水編號',
  `mem_id` int NOT NULL COMMENT '會員id',
  `orderList_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '訂單日期',
  `orderList_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `orderList_mphone` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手機號碼',
  `orderList_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `orderList_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '郵件信箱',
  PRIMARY KEY (`orderList_id`),
  KEY `mem_id_idx` (`mem_id`),
  CONSTRAINT `mem_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='訂單資料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (1,20,'2020-05-29 00:24:25','小胖','0923456789','天涯海角','dove@bird.com'),(2,20,'2020-05-29 00:25:01','小胖','0923456789','天涯海角','dove@bird.com'),(3,20,'2020-05-29 00:29:58','小胖','0923456789','天涯海角','dove@bird.com'),(4,20,'2020-05-29 04:46:42','小胖','0923456789','天涯海角','dove@bird.com');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlistdetail`
--

DROP TABLE IF EXISTS `orderlistdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlistdetail` (
  `orderList_id` int NOT NULL COMMENT '訂單流水編號',
  `prod_id` int NOT NULL COMMENT '商品ID',
  `quantity` int NOT NULL DEFAULT '1' COMMENT '購買數量',
  PRIMARY KEY (`orderList_id`,`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='訂單明細';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlistdetail`
--

LOCK TABLES `orderlistdetail` WRITE;
/*!40000 ALTER TABLE `orderlistdetail` DISABLE KEYS */;
INSERT INTO `orderlistdetail` VALUES (1,17,1),(1,18,1),(1,19,1),(2,13,1),(2,14,1),(2,15,1),(2,16,1),(3,16,14),(3,17,5),(4,15,1),(4,17,1);
/*!40000 ALTER TABLE `orderlistdetail` ENABLE KEYS */;
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
  `prod_view` int unsigned NOT NULL COMMENT '商品上架1上架0下架',
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'小白',200,'好用',100,'E:109JAVA01servleteclipseworkspace	eamweb',0),(2,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(3,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(4,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(5,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(6,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(7,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(8,'小白',50,'好用',100,'C:MyGitHub	eamwebTeamWeb',0),(9,'小白',50,'好用',100,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',0),(10,'小雞',500,'難吃',1000,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',0),(11,'廢柴',50,'好用',100,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',0),(12,'黑色毛衣',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',100,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',0),(13,'橘色毛大衣',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',99,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(14,'紫色毛大衣',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',99,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(15,'白色聖誕老人大衣',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',98,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(16,'大紅聖誕老人大衣',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',85,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(17,'粉紅格子洋裝',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',92,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(18,'格子洋裝',50,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',94,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(19,'海藍長裙',100,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',86,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1),(20,'粉紫長裙',1000,'這是敘述，講這個裙子多漂亮！多舒服！布料多好！講述設計者的靈感來源、設計理念以及吹無與倫比毛求疵的匠人精神。一切都是為了讓人穿起來有著什麼樣舒適的觸覺體驗，給別人看起來有什麼樣的心理感受以及視覺暗示。',0,'E:109JAVA01servleteclipseworkspace	eamwebTeamWeb',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewcount`
--

DROP TABLE IF EXISTS `viewcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewcount` (
  `view_id` int NOT NULL,
  `view_time` datetime DEFAULT NULL,
  `view_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewcount`
--

LOCK TABLES `viewcount` WRITE;
/*!40000 ALTER TABLE `viewcount` DISABLE KEYS */;
INSERT INTO `viewcount` VALUES (12,'2020-05-07 10:17:09','0:0:0:0:0:0:0:1'),(12,'2020-05-07 10:19:18','0:0:0:0:0:0:0:1'),(12,'2020-05-07 16:55:17','0:0:0:0:0:0:0:1'),(12,'2020-05-07 16:55:36','0:0:0:0:0:0:0:1'),(12,'2020-05-11 16:10:13','0:0:0:0:0:0:0:1'),(12,'2020-05-12 12:41:53','0:0:0:0:0:0:0:1'),(12,'2020-05-12 15:23:07','0:0:0:0:0:0:0:1'),(12,'2020-05-18 14:36:56','0:0:0:0:0:0:0:1'),(12,'2020-05-18 14:39:11','0:0:0:0:0:0:0:1'),(12,'2020-05-18 15:00:19','0:0:0:0:0:0:0:1'),(12,'2020-05-18 15:02:56','0:0:0:0:0:0:0:1'),(12,'2020-05-19 12:45:21','0:0:0:0:0:0:0:1'),(19,'2020-05-19 12:46:06','0:0:0:0:0:0:0:1'),(19,'2020-05-19 12:52:46','0:0:0:0:0:0:0:1'),(19,'2020-05-20 14:29:24','0:0:0:0:0:0:0:1'),(19,'2020-05-20 15:22:15','0:0:0:0:0:0:0:1'),(19,'2020-05-20 15:22:37','0:0:0:0:0:0:0:1'),(19,'2020-05-20 17:08:40','0:0:0:0:0:0:0:1'),(19,'2020-05-20 17:09:39','0:0:0:0:0:0:0:1'),(19,'2020-05-20 17:09:51','0:0:0:0:0:0:0:1'),(12,'2020-05-20 17:09:59','0:0:0:0:0:0:0:1'),(12,'2020-05-20 17:10:07','0:0:0:0:0:0:0:1'),(12,'2020-05-20 17:10:23','0:0:0:0:0:0:0:1'),(12,'2020-05-20 17:10:30','0:0:0:0:0:0:0:1'),(12,'2020-05-20 17:12:39','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:15:33','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:15:42','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:15:53','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:27:42','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:27:43','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:34:29','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:35:16','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:35:19','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:35:25','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:35:33','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:56:19','0:0:0:0:0:0:0:1'),(19,'2020-05-25 09:58:39','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:00:29','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:00:34','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:02:44','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:09:49','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:11:36','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:11:47','0:0:0:0:0:0:0:1'),(19,'2020-05-25 10:11:58','0:0:0:0:0:0:0:1'),(19,'2020-05-25 11:46:57','0:0:0:0:0:0:0:1'),(19,'2020-05-25 11:53:44','0:0:0:0:0:0:0:1'),(19,'2020-05-25 11:54:01','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:04:26','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:04:46','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:04:53','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:05:13','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:29:40','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:29:50','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:29:52','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:30:31','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:30:36','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:30:56','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:01','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:08','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:17','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:42','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:43','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:45','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:45','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:45','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:45','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:32:46','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:40','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:42','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:43','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:52','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:53','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:34:54','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:35:39','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:36:01','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:36:37','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:36:39','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:36:42','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:36:45','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:39:47','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:39:53','0:0:0:0:0:0:0:1'),(19,'2020-05-25 12:40:26','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:04:58','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:06:08','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:10:23','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:12:21','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:12:52','0:0:0:0:0:0:0:1'),(19,'2020-05-25 13:14:57','0:0:0:0:0:0:0:1'),(19,'2020-05-27 10:27:35','0:0:0:0:0:0:0:1'),(19,'2020-05-27 11:55:25','0:0:0:0:0:0:0:1'),(19,'2020-05-27 15:40:37','0:0:0:0:0:0:0:1'),(19,'2020-05-27 17:34:49','0:0:0:0:0:0:0:1'),(19,'2020-05-27 17:53:43','0:0:0:0:0:0:0:1'),(19,'2020-05-28 08:18:29','0:0:0:0:0:0:0:1'),(19,'2020-05-28 08:18:43','0:0:0:0:0:0:0:1'),(20,'2020-05-28 11:46:20','0:0:0:0:0:0:0:1'),(20,'2020-05-28 12:42:31','0:0:0:0:0:0:0:1'),(20,'2020-05-28 13:01:53','0:0:0:0:0:0:0:1'),(20,'2020-05-28 14:24:08','0:0:0:0:0:0:0:1'),(20,'2020-05-28 14:24:15','0:0:0:0:0:0:0:1'),(20,'2020-05-28 14:24:35','0:0:0:0:0:0:0:1'),(20,'2020-05-28 14:26:22','0:0:0:0:0:0:0:1'),(20,'2020-05-28 14:49:23','0:0:0:0:0:0:0:1'),(20,'2020-05-28 15:36:47','0:0:0:0:0:0:0:1'),(20,'2020-05-28 16:05:04','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:25:49','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:31:12','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:34:06','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:34:33','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:37:01','0:0:0:0:0:0:0:1'),(20,'2020-05-28 17:41:30','0:0:0:0:0:0:0:1'),(20,'2020-05-29 08:24:25','0:0:0:0:0:0:0:1'),(20,'2020-05-29 12:46:42','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `viewcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'teamweb2020'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-29 12:54:02
