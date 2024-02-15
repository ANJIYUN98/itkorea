-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lmsdb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `tbl_book`
--

create database lmsdb;
use lmsdb;
DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_book` (
  `b_id` int NOT NULL,
  `b_name` varchar(45) DEFAULT NULL,
  `b_page` varchar(45) DEFAULT NULL,
  `b_author` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_classroom`
--

DROP TABLE IF EXISTS `tbl_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_classroom` (
  `class_no` int NOT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`class_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_classroom`
--

LOCK TABLES `tbl_classroom` WRITE;
/*!40000 ALTER TABLE `tbl_classroom` DISABLE KEYS */;
INSERT INTO `tbl_classroom` VALUES (201,10),(202,15),(203,20),(301,10),(302,15),(303,15);
/*!40000 ALTER TABLE `tbl_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_current_lecture`
--

DROP TABLE IF EXISTS `tbl_current_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_current_lecture` (
  `no` int NOT NULL AUTO_INCREMENT,
  `lec_duration` varchar(100) NOT NULL,
  `lec_time` varchar(100) NOT NULL,
  `class_no` int NOT NULL,
  `t_id` int NOT NULL,
  `lec_code` int NOT NULL,
  PRIMARY KEY (`no`,`lec_time`,`class_no`,`t_id`,`lec_code`,`lec_duration`),
  KEY `fk_tbl_lecture_has_tbl_teacher_tbl_teacher1_idx` (`t_id`),
  KEY `fk_tbl_lecture_has_tbl_teacher_tbl_lecture1_idx` (`lec_code`),
  KEY `fk_tbl_currentLecture_tbl_classRoom1_idx` (`class_no`),
  KEY `fk_tbl_registration_tbl_idx` (`lec_duration`),
  CONSTRAINT `fk_tbl_currentLecture_tbl_classRoom1` FOREIGN KEY (`class_no`) REFERENCES `tbl_classroom` (`class_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_lecture_has_tbl_teacher_tbl_lecture1` FOREIGN KEY (`lec_code`) REFERENCES `tbl_lecture` (`lec_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_lecture_has_tbl_teacher_tbl_teacher1` FOREIGN KEY (`t_id`) REFERENCES `tbl_teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_current_lecture`
--

LOCK TABLES `tbl_current_lecture` WRITE;
/*!40000 ALTER TABLE `tbl_current_lecture` DISABLE KEYS */;
INSERT INTO `tbl_current_lecture` VALUES (13,'2023-05-22 - 2023-06-21','09:00 - 12:00',201,1,1001),(14,'2023-05-22 - 2023-06-21','13:00 - 15:00',202,2,1002),(15,'2023-05-22 - 2023-06-21','15:00 - 17:00',203,3,1003),(16,'2023-05-23 - 2023-06-22','09:00 - 12:00',301,4,1004),(17,'2023-05-23 - 2023-06-22','13:00 - 15:00',302,5,1005),(18,'2023-05-23 - 2023-06-22','15:00 - 17:00',303,6,1006);
/*!40000 ALTER TABLE `tbl_current_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_errlog`
--

DROP TABLE IF EXISTS `tbl_errlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_errlog` (
  `no` int NOT NULL AUTO_INCREMENT,
  `error_code` int DEFAULT NULL,
  `error_date` datetime DEFAULT NULL,
  `error_msg` text,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_errlog`
--

LOCK TABLES `tbl_errlog` WRITE;
/*!40000 ALTER TABLE `tbl_errlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_errlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_lecture`
--

DROP TABLE IF EXISTS `tbl_lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_lecture` (
  `lec_code` int NOT NULL,
  `lec_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lec_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_lecture`
--

LOCK TABLES `tbl_lecture` WRITE;
/*!40000 ALTER TABLE `tbl_lecture` DISABLE KEYS */;
INSERT INTO `tbl_lecture` VALUES (1001,'프로그래밍 기초'),(1002,'자료구조'),(1003,'알고리즘'),(1004,'데이터베이스'),(1005,'웹 개발'),(1006,'네트워크'),(1007,'운영체제'),(1008,'소프트웨어 공학'),(1009,'인공지능'),(1100,'빅데이터 분석');
/*!40000 ALTER TABLE `tbl_lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_registration`
--

DROP TABLE IF EXISTS `tbl_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_registration` (
  `s_id` varchar(45) NOT NULL,
  `lec_code` int NOT NULL,
  `lec_duration` varchar(100) NOT NULL,
  PRIMARY KEY (`s_id`,`lec_code`,`lec_duration`),
  KEY `fk_tbl_student_has_tbl_lecture_tbl_lecture1_idx` (`lec_code`),
  KEY `fk_tbl_student_has_tbl_lecture_tbl_student_idx` (`s_id`),
  KEY `fk_tbl_registration_tbl_current_lecture1_idx` (`lec_duration`),
  CONSTRAINT `fk_tbl_registration_tbl_current_lecture1` FOREIGN KEY (`lec_duration`) REFERENCES `tbl_current_lecture` (`lec_duration`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_student_has_tbl_lecture_tbl_lecture1` FOREIGN KEY (`lec_code`) REFERENCES `tbl_lecture` (`lec_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_student_has_tbl_lecture_tbl_student` FOREIGN KEY (`s_id`) REFERENCES `tbl_student` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_registration`
--

LOCK TABLES `tbl_registration` WRITE;
/*!40000 ALTER TABLE `tbl_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student`
--

DROP TABLE IF EXISTS `tbl_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student` (
  `s_id` varchar(45) NOT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  `s_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student`
--

LOCK TABLES `tbl_student` WRITE;
/*!40000 ALTER TABLE `tbl_student` DISABLE KEYS */;
INSERT INTO `tbl_student` VALUES ('20190001','김철수','010-1234-5678'),('20190002','이영희','010-2345-6789'),('20190003','박민지','010-3456-7890'),('20190004','정기호','010-4567-8901'),('20190005','홍길동','010-5678-9012'),('20190006','이지은','010-6789-0123'),('20190007','김태호','010-7890-1234'),('20190008','송미영','010-8901-2345'),('20190009','박준혁','010-9012-3456'),('20190010','최지원','010-0123-4567');
/*!40000 ALTER TABLE `tbl_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_student_bak`
--

DROP TABLE IF EXISTS `tbl_student_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_student_bak` (
  `s_id` varchar(45) NOT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  `s_phone` varchar(45) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_student_bak`
--

LOCK TABLES `tbl_student_bak` WRITE;
/*!40000 ALTER TABLE `tbl_student_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_student_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teacher`
--

DROP TABLE IF EXISTS `tbl_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_teacher` (
  `t_id` int NOT NULL,
  `t_name` varchar(45) DEFAULT NULL,
  `t_phone` varchar(45) DEFAULT NULL,
  `t_addr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teacher`
--

LOCK TABLES `tbl_teacher` WRITE;
/*!40000 ALTER TABLE `tbl_teacher` DISABLE KEYS */;
INSERT INTO `tbl_teacher` VALUES (1,'김상진','010-1234-5678','서울특별시 강남구'),(2,'이미경','010-2345-6789','서울특별시 서초구'),(3,'박철민','010-3456-7890','서울특별시 송파구'),(4,'정지영','010-4567-8901','서울특별시 강서구'),(5,'이재명','010-6789-0123','서울특별시 강동구'),(6,'송길준','010-8901-2345','서울특별시 성북구');
/*!40000 ALTER TABLE `tbl_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_teacher_bak`
--

DROP TABLE IF EXISTS `tbl_teacher_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_teacher_bak` (
  `t_id` int NOT NULL,
  `t_name` varchar(45) DEFAULT NULL,
  `t_phone` varchar(45) DEFAULT NULL,
  `t_addr` varchar(45) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_teacher_bak`
--

LOCK TABLES `tbl_teacher_bak` WRITE;
/*!40000 ALTER TABLE `tbl_teacher_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_teacher_bak` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-22 23:37:09
