
DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;

LOCK TABLES `admin` WRITE;

INSERT INTO `admin` VALUES (1,'hamza','123',NULL);

UNLOCK TABLES;



DROP TABLE IF EXISTS `assign_course`;

CREATE TABLE `assign_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `session` varchar(45) NOT NULL,
  `program` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

LOCK TABLES `assign_course` WRITE;

INSERT INTO `assign_course` VALUES (7,'Sir Imran','image Processing','2016-20','BSIT'),(8,'Sir Imran','Database system','2018-22','BSCS'),(9,'Sir Basit','image Processing','2018-22','MCS'),(10,'Sir Basit','DLD','2017-21','MCS'),(11,'Sir Imran','Database system','2017-21','BSCS'),(12,'Sir Imran','machine learning','2017-21','MCS'),(13,'Sir Imran','DLD','2016-20','MCS'),(14,'aa','DLD','2019-23','MCS');

UNLOCK TABLES;


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
) ENGINE=InnoDB;




LOCK TABLES `result` WRITE;

INSERT INTO `result` VALUES (47,'1','h','jkj','Subject','70%',2.2,2.1,'300','500','pass','A','MCS','2016-20','Sir Imran'),(48,'21','Hamza Rajpoot','Raja Zahid','machine learning','70%',2.2,2.1,'300','500','pass','A','','','Sir Imran');

UNLOCK TABLES;

--


DROP TABLE IF EXISTS `session`;

CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;


LOCK TABLES `session` WRITE;

INSERT INTO `session` VALUES (1,'2017-21'),(2,'2018-22'),(3,'2016-20'),(4,'2019-23');

UNLOCK TABLES;

DROP TABLE IF EXISTS `student`;

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
) ENGINE=InnoDB;

LOCK TABLES `student` WRITE;

INSERT INTO `student` VALUES (1,'kinza Yousaf','2017-21','BSCS','female','','62','yousaf Mashi'),(2,'Hamza Rajpoot','2017-21','BSCS','male','','21','Raja Zahid'),(3,'Abdul Rahman','2017-21','BSCS','male','evening','1','Asif Hussain'),(4,'Kainat','2017-21','BSCS','female','evening','61','Aman Ullah'),(5,'hamza','2017-21','MCS','male','morning','1','Raja Zahid'),(6,'h','2016-20','MCS','male','morning','1','jkj');

UNLOCK TABLES;



DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `Qulification` varchar(45) NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB ;


LOCK TABLES `teacher` WRITE;

INSERT INTO `teacher` VALUES (1,'Sir Basit','basit','123','phd','2021-09-30 01:13:22'),(2,'Sir Junaid','junaid','1212','master','2021-09-30 01:13:22'),(3,'Sir Imran','imran','1234','master','2021-09-30 01:13:22'),(8,'aa','aa','123','akjfdskl','2021-10-04 13:19:28');

UNLOCK TABLES;
