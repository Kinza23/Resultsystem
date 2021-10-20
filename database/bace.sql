-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'kinza','123',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_course`
--

DROP TABLE IF EXISTS `assign_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `session` varchar(45) NOT NULL,
  `program` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_course`
--

LOCK TABLES `assign_course` WRITE;
/*!40000 ALTER TABLE `assign_course` DISABLE KEYS */;
INSERT INTO `assign_course` VALUES (12,'Sir Imran','machine learning','2017-21','MCS'),(19,'Sir Basit','machine learning','2017-21','BSCS'),(21,'imran ali','Database system','2017-21','bscs'),(22,'Sir Junaid','Database system','2071-21','BSIT');
/*!40000 ALTER TABLE `assign_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Database system'),(2,'machine learning');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program` (
  `id` int NOT NULL,
  `program` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,'BSCS'),(2,'BSIT'),(3,'MCS');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roll_number` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `father_name` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `percentage` varchar(45) DEFAULT NULL,
  `gpa` float DEFAULT NULL,
  `cgpa` float DEFAULT NULL,
  `obtain_marks` varchar(45) DEFAULT NULL,
  `total_marks` varchar(45) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `program` varchar(45) DEFAULT NULL,
  `sesion` varchar(45) DEFAULT NULL,
  `teacher_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (51,'1','abduk rehman','asif hassain','database','76',3.2,NULL,'70','100','pass','B+','BSCS','2017-21','imran ali'),(52,'2','Raja Hamza','raja zahid','database','88',4,NULL,'88','100','pass','A+','bscs','2017-21','imran ali'),(53,'3','Kainat manahil','amaan ullah','database','72',3.4,NULL,'72','100','pass','B+','bscs','2017-21','imran ali'),(54,'4','subaina ilyas','muhammad ilyas','database','61',2.1,NULL,'61','100','pass','C','bscs','2017-21','imran ali'),(55,'5','kinza','yousaf','database','73',3.4,NULL,'74','100','pass','B+','bscs','2017-21','imran ali'),(56,'1','Abduk rehman','Asif hassain','machine learning','50%',2.5,3.99,'800','1000','promote','A','BSCS','2017-21','Sir Basit'),(57,'2','Raja Hamza','Raja Zahid','machine learning','60%',3.5,3.99,'234','1000','promote','B','BSCS','2017-21','Sir Basit'),(58,'3','Kainat Manahil','Amaan ullah','machine learning','70%',3.67,3.87,'450','1000','promote','b+','BSCS','2017-21','Sir Basit'),(59,'3','hamzza','zx','machine learning','40%',1.5,1,'1000','1000','pass','d','BSCS','2017-21','Sir Basit'),(60,'4','Subaina ilyas','Muhammad ilyas','machine learning','65%',2.76,3,'500','1000','promote','B','BSCS','2017-21','Sir Basit'),(61,'5kinn','kinza','Yousaf','machine learning','60%',2.55,2.6,'450','1000','promote','C','BSCS','2017-21','Sir Basit');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (7,'2071-21'),(8,'2019-21'),(9,'2017-21');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `session` varchar(45) NOT NULL,
  `program` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `shift` varchar(45) NOT NULL,
  `roll_number` varchar(45) NOT NULL,
  `father_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Abduk rehman','2017-21','BSCS','male','morning','1','Asif hassain'),(2,'Raja Hamza','2017-21','BSCS','male','evening','2','Raja Zahid'),(3,'Kainat Manahil','2017-21','BSCS','female','evening','3','Amaan ullah'),(4,'Subaina ilyas','2017-21','BSCS','female','evening','4','Muhammad ilyas'),(5,'kinza','2017-21','BSCS','female','evening','5kinn','Yousaf'),(6,'Mahrukh','2017-21','BSIT','female','evening','11','ibrahim'),(7,'Najeeb ullah','2017-21','BSIT','male','evening','12','Qudrat ullah'),(8,'Wali','2017-21','BSIT','male','evening','13','Muhammad'),(9,'saima','2071-21','BSIT','male','evening','14','Niaz'),(10,'Fayaz','2017-21','BSIT','male','evening','15','Ahmed'),(11,'Najama','2019-21','MCS','female','evening','20','Shams ul haq'),(12,'Adeel','2019-21','MCS','male','evening','21','Tariq'),(13,'Junaid','2019-21','MCS','male','evening','23','Carlis'),(14,'Aimal','2019-21','MCS','male','evening','24','Raiz'),(15,'Umer','2019-21','MCS','male','evening','25','Naik nazar'),(16,'hamzza','2017-21','BSCS','male','evening','3','zx');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `Qulification` varchar(45) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'Sir Basit','basit','123','phd','2021-09-30 01:13:22'),(2,'Sir Junaid','junaid','1212','master','2021-09-30 01:13:22'),(10,'Imran','Ali','1234','P.HD','2021-10-07 15:20:47');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-14 21:08:35
