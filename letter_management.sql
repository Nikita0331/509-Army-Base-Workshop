-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: letter_management
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,2,4),(54,2,12),(55,2,16),(56,2,50),(57,2,51),(58,2,52);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add crontab',7,'add_crontabschedule'),(26,'Can change crontab',7,'change_crontabschedule'),(27,'Can delete crontab',7,'delete_crontabschedule'),(28,'Can view crontab',7,'view_crontabschedule'),(29,'Can add interval',8,'add_intervalschedule'),(30,'Can change interval',8,'change_intervalschedule'),(31,'Can delete interval',8,'delete_intervalschedule'),(32,'Can view interval',8,'view_intervalschedule'),(33,'Can add periodic task',9,'add_periodictask'),(34,'Can change periodic task',9,'change_periodictask'),(35,'Can delete periodic task',9,'delete_periodictask'),(36,'Can view periodic task',9,'view_periodictask'),(37,'Can add periodic tasks',10,'add_periodictasks'),(38,'Can change periodic tasks',10,'change_periodictasks'),(39,'Can delete periodic tasks',10,'delete_periodictasks'),(40,'Can view periodic tasks',10,'view_periodictasks'),(41,'Can add solar event',11,'add_solarschedule'),(42,'Can change solar event',11,'change_solarschedule'),(43,'Can delete solar event',11,'delete_solarschedule'),(44,'Can view solar event',11,'view_solarschedule'),(45,'Can add clocked',12,'add_clockedschedule'),(46,'Can change clocked',12,'change_clockedschedule'),(47,'Can delete clocked',12,'delete_clockedschedule'),(48,'Can view clocked',12,'view_clockedschedule'),(49,'Can add letter',13,'add_letter'),(50,'Can change letter',13,'change_letter'),(51,'Can delete letter',13,'delete_letter'),(52,'Can view letter',13,'view_letter'),(53,'Can add user',14,'add_customuser'),(54,'Can change user',14,'change_customuser'),(55,'Can delete user',14,'delete_customuser'),(56,'Can view user',14,'view_customuser'),(57,'Can add letter',15,'add_letter'),(58,'Can change letter',15,'change_letter'),(59,'Can delete letter',15,'delete_letter'),(60,'Can view letter',15,'view_letter'),(61,'Can add view user',16,'add_viewuser'),(62,'Can change view user',16,'change_viewuser'),(63,'Can delete view user',16,'delete_viewuser'),(64,'Can view view user',16,'view_viewuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$H07Kj6BOdVj4RecqWHVpZ6$9ZqT4BMgo8/TUuTwUYMKFqNPRHtEsdsHa4eYKnc6h2M=','2023-08-03 17:11:25.452876',1,'admin','','','',1,1,'2023-07-14 04:31:49.000000'),(4,'pbkdf2_sha256$600000$Cd6ZwNecgCPDBFJVstHyuT$bVKoDCfcOWgLpMeV/a0dg06Fr9sdWSm92EG3rcDUSBY=','2023-08-02 08:59:49.603454',0,'user@.com','','','',1,1,'2023-08-01 06:33:26.000000'),(5,'pbkdf2_sha256$600000$a9qrbZJMdBP1wxI3t4pFgY$LUjA5EgOcTqS3PJyPBCyJEopeRuKPSuu6FVJnc2S5gM=',NULL,0,'nikita123','','','',0,1,'2023-08-02 06:14:57.920051'),(7,'pbkdf2_sha256$600000$DUOiIwK8LoWkT8cTyEMilg$ICGjfsjHapJ+/n27VVaGF+ePe2SYMyv6edVa4KoltME=',NULL,0,'admin1','','','',0,1,'2023-08-02 06:22:20.743441'),(11,'','2023-08-03 17:14:18.164890',0,'mco','','','',0,1,'2023-08-03 12:08:45.232637');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,4,2),(3,5,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-07-17 08:21:17.043558','2','admin1@gmail.com',1,'[{\"added\": {}}]',4,1),(2,'2023-07-17 08:40:35.565722','2','admin1@gmail.com',3,'',4,1),(3,'2023-07-17 08:41:46.780048','3','nikita@gmail.com',1,'[{\"added\": {}}]',4,1),(4,'2023-07-23 07:54:42.852994','0','Letter object (0)',1,'[{\"added\": {}}]',13,1),(5,'2023-07-24 07:52:42.842332','124','Letter object (124)',3,'',13,1),(6,'2023-07-24 07:52:54.392882','122','Letter object (122)',3,'',13,1),(7,'2023-07-25 06:57:06.083186','123','Letter object (123)',2,'[]',13,1),(8,'2023-07-27 19:05:44.171738','7','Letter object (7)',3,'',13,1),(9,'2023-07-27 19:06:38.939643','8','Letter object (8)',3,'',13,1),(10,'2023-07-27 19:11:45.637815','9','Letter object (9)',3,'',13,1),(11,'2023-07-27 19:25:11.405290','8','Letter object (8)',2,'[{\"changed\": {\"fields\": [\"Srno\"]}}]',13,1),(12,'2023-07-29 10:59:18.611826','1','Letter object (1)',2,'[{\"changed\": {\"fields\": [\"Reply date\"]}}]',13,1),(13,'2023-07-29 11:01:16.133477','1','Letter object (1)',2,'[{\"changed\": {\"fields\": [\"Receiving date\"]}}]',13,1),(14,'2023-08-01 05:59:40.546037','3','nikita@gmail.com',3,'',4,1),(15,'2023-08-01 06:29:07.786817','1','admin',1,'[{\"added\": {}}]',3,1),(16,'2023-08-01 06:29:44.790088','1','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(17,'2023-08-01 06:31:56.328181','2','user',1,'[{\"added\": {}}]',3,1),(18,'2023-08-01 06:33:26.648498','4','user@.com',1,'[{\"added\": {}}]',4,1),(19,'2023-08-01 06:34:06.765476','4','user@.com',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(20,'2023-08-01 06:35:11.825896','4','user@.com',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(21,'2023-08-02 06:30:15.200698','8','admin_1@',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(22,'2023-08-02 06:30:45.302322','8','admin_1@',2,'[]',4,1),(23,'2023-08-02 06:34:07.597388','8','admin_1@',3,'',4,1),(24,'2023-08-02 06:42:10.665318','9','admin_1@',3,'',4,1),(25,'2023-08-02 06:44:44.353470','10','admin_1@',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_clockedschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clocked_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_clockedschedule`
--

LOCK TABLES `django_celery_beat_clockedschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_clockedschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

LOCK TABLES `django_celery_beat_crontabschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_crontabschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `every` int NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_intervalschedule`
--

LOCK TABLES `django_celery_beat_intervalschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_intervalschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int DEFAULT NULL,
  `interval_id` int DEFAULT NULL,
  `solar_id` int DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int unsigned DEFAULT NULL,
  `headers` longtext NOT NULL DEFAULT (_utf8mb3'{}'),
  `clocked_id` int DEFAULT NULL,
  `expire_seconds` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`),
  CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`),
  CONSTRAINT `django_celery_beat_periodictask_chk_1` CHECK ((`total_run_count` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_2` CHECK ((`priority` >= 0)),
  CONSTRAINT `django_celery_beat_periodictask_chk_3` CHECK ((`expire_seconds` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

LOCK TABLES `django_celery_beat_periodictask` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

LOCK TABLES `django_celery_beat_periodictasks` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_periodictasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_celery_beat_solarschedule`
--

LOCK TABLES `django_celery_beat_solarschedule` WRITE;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_celery_beat_solarschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'django_celery_beat','clockedschedule'),(7,'django_celery_beat','crontabschedule'),(8,'django_celery_beat','intervalschedule'),(9,'django_celery_beat','periodictask'),(10,'django_celery_beat','periodictasks'),(11,'django_celery_beat','solarschedule'),(15,'LM','letter'),(16,'LM','viewuser'),(14,'LMS','customuser'),(13,'LMS','letter'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-07-14 04:27:32.797483'),(2,'auth','0001_initial','2023-07-14 04:27:33.422912'),(3,'admin','0001_initial','2023-07-14 04:27:33.607242'),(4,'admin','0002_logentry_remove_auto_add','2023-07-14 04:27:33.622964'),(5,'admin','0003_logentry_add_action_flag_choices','2023-07-14 04:27:33.638968'),(6,'contenttypes','0002_remove_content_type_name','2023-07-14 04:27:33.750995'),(7,'auth','0002_alter_permission_name_max_length','2023-07-14 04:27:33.815027'),(8,'auth','0003_alter_user_email_max_length','2023-07-14 04:27:33.855021'),(9,'auth','0004_alter_user_username_opts','2023-07-14 04:27:33.871276'),(10,'auth','0005_alter_user_last_login_null','2023-07-14 04:27:33.935044'),(11,'auth','0006_require_contenttypes_0002','2023-07-14 04:27:33.943058'),(12,'auth','0007_alter_validators_add_error_messages','2023-07-14 04:27:33.959297'),(13,'auth','0008_alter_user_username_max_length','2023-07-14 04:27:34.031068'),(14,'auth','0009_alter_user_last_name_max_length','2023-07-14 04:27:34.119090'),(15,'auth','0010_alter_group_name_max_length','2023-07-14 04:27:34.151097'),(16,'auth','0011_update_proxy_permissions','2023-07-14 04:27:34.175107'),(17,'auth','0012_alter_user_first_name_max_length','2023-07-14 04:27:34.247124'),(18,'sessions','0001_initial','2023-07-14 04:27:34.295134'),(19,'django_celery_beat','0001_initial','2023-07-16 06:28:03.874861'),(20,'django_celery_beat','0002_auto_20161118_0346','2023-07-16 06:28:03.985464'),(21,'django_celery_beat','0003_auto_20161209_0049','2023-07-16 06:28:04.045232'),(22,'django_celery_beat','0004_auto_20170221_0000','2023-07-16 06:28:04.058384'),(23,'django_celery_beat','0005_add_solarschedule_events_choices','2023-07-16 06:28:04.073388'),(24,'django_celery_beat','0006_auto_20180322_0932','2023-07-16 06:28:04.214536'),(25,'django_celery_beat','0007_auto_20180521_0826','2023-07-16 06:28:04.322998'),(26,'django_celery_beat','0008_auto_20180914_1922','2023-07-16 06:28:04.356001'),(27,'django_celery_beat','0006_auto_20180210_1226','2023-07-16 06:28:04.386003'),(28,'django_celery_beat','0006_periodictask_priority','2023-07-16 06:28:04.467841'),(29,'django_celery_beat','0009_periodictask_headers','2023-07-16 06:28:04.546168'),(30,'django_celery_beat','0010_auto_20190429_0326','2023-07-16 06:28:04.720130'),(31,'django_celery_beat','0011_auto_20190508_0153','2023-07-16 06:28:04.905044'),(32,'django_celery_beat','0012_periodictask_expire_seconds','2023-07-16 06:28:05.019073'),(33,'django_celery_beat','0013_auto_20200609_0727','2023-07-16 06:28:05.036063'),(34,'django_celery_beat','0014_remove_clockedschedule_enabled','2023-07-16 06:28:05.068782'),(35,'django_celery_beat','0015_edit_solarschedule_events_choices','2023-07-16 06:28:05.078778'),(36,'django_celery_beat','0016_alter_crontabschedule_timezone','2023-07-16 06:28:05.094185'),(37,'django_celery_beat','0017_alter_crontabschedule_month_of_year','2023-07-16 06:28:05.105432'),(38,'django_celery_beat','0018_improve_crontab_helptext','2023-07-16 06:28:05.117432'),(39,'LMS','0001_initial','2023-07-23 07:28:35.462952'),(40,'LMS','0002_alter_letter_options','2023-07-23 15:07:49.676650'),(41,'LMS','0003_alter_letter_options','2023-07-23 15:19:29.352235'),(42,'LMS','0004_customuser','2023-08-01 09:23:13.530367'),(43,'LMS','0005_delete_customuser','2023-08-01 10:26:37.047326'),(44,'LMS','0006_customuser','2023-08-01 10:43:55.795793'),(45,'LMS','0007_delete_customuser','2023-08-01 10:43:55.888142'),(46,'LMS','0008_customuser','2023-08-02 01:56:22.951738'),(47,'LMS','0005_alter_customuser_groups_and_more','2023-08-02 06:41:52.982200'),(48,'LM','0001_initial','2023-08-03 12:07:34.928515'),(49,'LM','0002_viewuser','2023-08-03 12:07:34.936515');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1vq9zhq61egoh4vy9dz1t5gnxcs3g6t3','.eJxVjDEOwjAMRe-SGUV2EprAyM4ZKseOSQG1UtNOiLtDpQ6w_vfef5me1qX2aytzP4g5GzSH3y0TP8q4AbnTeJssT-MyD9luit1ps9dJyvOyu38HlVr91oqA4DlFDqQpR1XAIDH7hLEoQ8ckoJQgBX9CcV5UvWJyXQB35M68P-i8N8U:1qLFiF:sFJJG-zMp2EuoB7ULZk3U7vxejxs1c49Mnwq3SMn2Ys','2023-07-31 04:19:55.095280'),('1w8c7rsv4iv70o0p520xrlesfeoyiwtm','.eJxVjDEOwjAMRe-SGUV2EprAyM4ZKseOSQG1UtNOiLtDpQ6w_vfef5me1qX2aytzP4g5GzSH3y0TP8q4AbnTeJssT-MyD9luit1ps9dJyvOyu38HlVr91oqA4DlFDqQpR1XAIDH7hLEoQ8ckoJQgBX9CcV5UvWJyXQB35M68P-i8N8U:1qKv8E:H-XFm6goFcX3DMvHyqY_KQVoEJILtbEQZE60p-U08is','2023-07-30 06:21:22.257769'),('4qpgagtk4c06xvh44q3kfft9q47nu99b','e30:1qKEgM:mPb9N2sbRPaTofYw-6RDoGPKMSVJw9DbqdogJmO_pq8','2023-07-28 09:01:46.071984'),('62waqj0y07fp8lu247128i67a5y2szjk','e30:1qKEjh:fDE8xICpW6mf4FBBXhBLIDbjdJONhVCsPV8LHhCtw40','2023-07-28 09:05:13.767774'),('841ttwb8wt7xtwd5e5l8qhrjsyevxmof','.eJxVjMsOwiAQRf-FtSEwvMSl-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcuRtrklNM5F1OUQAJw4AGTkgTak3VohDBniQWIdDReU5YWrSgyacHeH9lFN5A:1qNc3i:hc4cukxndGq3QTNNw5E7h-8sYcgpB-BHyDoctOZqYlU','2023-08-06 16:35:50.356149'),('bcl8ulltw25lh4fw8qri40v7c7uk8iyj','.eJxVjDEOwjAMRe-SGUV2EprAyM4ZKseOSQG1UtNOiLtDpQ6w_vfef5me1qX2aytzP4g5GzSH3y0TP8q4AbnTeJssT-MyD9luit1ps9dJyvOyu38HlVr91oqA4DlFDqQpR1XAIDH7hLEoQ8ckoJQgBX9CcV5UvWJyXQB35M68P-i8N8U:1qLJRr:EUcotqNYMlJx6H7i5qIdyKnNLYubKibaLykhWM1qr3I','2023-07-31 08:19:15.207419'),('d05oa6g9nyfrmmuz8eqi9skt9thl9r0c','e30:1qKWu7:kGxC2ymVvlWrveUNpdzYS2RtGpBlvWe7-33RLYFGdo0','2023-07-29 04:29:11.497118'),('d204v50bwuowq6ywl2xjcm79ewwtrast','.eJxVjDEOwjAMRe-SGUV2EprAyM4ZKseOSQG1UtNOiLtDpQ6w_vfef5me1qX2aytzP4g5GzSH3y0TP8q4AbnTeJssT-MyD9luit1ps9dJyvOyu38HlVr91oqA4DlFDqQpR1XAIDH7hLEoQ8ckoJQgBX9CcV5UvWJyXQB35M68P-i8N8U:1qLJcK:qO-BAc_12xV6W91L_1g8SifS9z6qBFRo6TijUgpdNCE','2023-07-31 08:30:04.158643'),('f1qmx23sx39ldgalagsflpfjkahn5hpe','e30:1qKEAK:LIXc4ybcrtjjyL9jQ2EvWkSSmtnRp4M3AEn11Xc0thk','2023-07-28 08:28:40.296765'),('gjh4nm2qdiklho2pnzy0c71byuwnbulc','e30:1qKWjm:t-rFDGkB_vK1rcnY4NOEHHdME2KmUUCcQl_8Sr5sZ1c','2023-07-29 04:18:30.550012'),('gpujdl9afo56lrp11lr2g3jvlmvran7o','.eJxVjDsOwyAQBe9CHSHzNaRM7zOgXViCkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYE7syxS6_G0J8Uj1AekC9Nx5bXZcZ-aHwk3Y-tUSv2-n-HRToZa-zhzFGMJaSi4MH77TBQaMkZSBaJWQWuANtBKpRWHKOjDYkCVVGqdjnC_R7N_8:1qM2nd:touIfrdjJlWfq-myXHUT55_eKDcyM3XGsAOkKP67lIw','2023-08-02 08:44:45.957861'),('h197o0t934kn1zbpjnsdk8jlknbrqehr','e30:1qKEBE:OGg9Qyv9T0LkDeaJe99ov3GFu9I3Ypu40Q_DkwvgUlI','2023-07-28 08:29:36.700540'),('h4zfbannzdnojv3ro11t8c9b06wxkamd','e30:1qKECn:ZwXCv6cKOxekLustfS3hxTR5mnAIfnMLrI9blI0oD6k','2023-07-28 08:31:13.584190'),('hapuolst55id6wx6xzkrv8hasjzr7pcg','.eJxVjDEOwjAMRe-SGUV2EprAyM4ZKseOSQG1UtNOiLtDpQ6w_vfef5me1qX2aytzP4g5GzSH3y0TP8q4AbnTeJssT-MyD9luit1ps9dJyvOyu38HlVr91oqA4DlFDqQpR1XAIDH7hLEoQ8ckoJQgBX9CcV5UvWJyXQB35M68P-i8N8U:1qKZ35:zYtVTzy4mQi2Kz_sAbhQWykIVHGYTu6-O--H3TEyjL0','2023-07-29 06:46:35.019127'),('iikpedsv6dx9egpuwvoz500mhy9pc86j','e30:1qKDz5:ViiM0_ZpvSD2j8Yny0U1zsyDhUzuGWsUlSqNl9SNcXw','2023-07-28 08:17:03.090297'),('itn1h4sea2kbww19cybxwe6ic7jmchri','e30:1qKEtm:iA7S6N4m5rLdxfH7dzJlD4walmsiroe0X6xndj0QTWw','2023-07-28 09:15:38.565794'),('jyq8pouluj0uhm5jhgmae3tsnq8ff080','e30:1qKCKo:m8dygF_lDFyP86blcF_Iz9AMDmMgA40KzoOdDkEJ_Co','2023-07-28 06:31:22.236836'),('kx69t4v3jzhx4e3hiaombym1mkoi3boe','e30:1qKWX9:JVbjZgtD5eBEAFvKYCKtSKPH996WOcEWXVkLA1qBsZ4','2023-07-29 04:05:27.745947'),('njd0rdgwt75ab7055spydkbb9iusojoo','.eJxVjDsOwyAQBe9CHSHzNaRM7zOgXViCkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYE7syxS6_G0J8Uj1AekC9Nx5bXZcZ-aHwk3Y-tUSv2-n-HRToZa-zhzFGMJaSi4MH77TBQaMkZSBaJWQWuANtBKpRWHKOjDYkCVVGqdjnC_R7N_8:1qMRus:KMWUHDVU9tcZAJ5aqswonXUXXWl2uaEPRxJPKUy37Hg','2023-08-03 11:33:54.400000'),('odpjepqatmk7kmds9qjbs5lmd9nur4qc','e30:1qKE75:5rs4QB4WFJJ96NSnqjd2P6D37VAnnmBI9JXkhJ1RXMU','2023-07-28 08:25:19.923615'),('ptvkq0wjbynqq0zmag7tlo4n9b43j22s','.eJxVjDsOwyAQBe9CHSHzNaRM7zOgXViCkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYE7syxS6_G0J8Uj1AekC9Nx5bXZcZ-aHwk3Y-tUSv2-n-HRToZa-zhzFGMJaSi4MH77TBQaMkZSBaJWQWuANtBKpRWHKOjDYkCVVGqdjnC_R7N_8:1qLPHg:ufBw4X47rskl9Jmf5ZlsUyooyOINRK5FZQ4vERDE1Eg','2023-07-31 14:33:08.998179'),('q83g1kf40k98zifaa4irxth5exgmkaaw','.eJxVjMsOwiAQRf-FtSEwvMSl-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcuRtrklNM5F1OUQAJw4AGTkgTak3VohDBniQWIdDReU5YWrSgyacHeH9lFN5A:1qNma6:4gUJYylxzWhLociaceWyWn4oL-BmjAvp5AcL9rg6t3s','2023-08-07 03:49:58.460206'),('qcxrvuf7pmmpem5eq17rrgjijt73zvn0','e30:1qKWYE:JJZOPxLkKxJRv6i6Tf0Y2tkaWquH4g-H2ywWe9vmU0k','2023-07-29 04:06:34.718877'),('rqi6c2osinayla2tgombbrgzxk04cvcg','.eJxVjMsOwiAQRf-FtSEwvMSl-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcuRtrklNM5F1OUQAJw4AGTkgTak3VohDBniQWIdDReU5YWrSgyacHeH9lFN5A:1qP514:MPK8JWgFqSjTBuupZ5_3bjL8V0c8gkX3iXE5GxO66fg','2023-08-10 17:43:10.672832'),('sw18ppgptkras584nrs9ahliue5te7sx','e30:1qKWmh:1MOt_Yj1IN0eEX2qqaxDCFl3oVQX_4FIksfVk5cIGGo','2023-07-29 04:21:31.047216'),('vfczs1tl61r5e4zclgpzqsn12tiz17xq','e30:1qKNdF:aBH9UcsYHM_nQuKeb9KNdjfX-LmFJm-zA31eztjpJRM','2023-07-28 18:35:09.239441'),('vgzyk0x1agapbj2i8gkm8rt62f9ubux5','.eJxVjMsOwiAQRf-FtSEwvMSl-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcuRtrklNM5F1OUQAJw4AGTkgTak3VohDBniQWIdDReU5YWrSgyacHeH9lFN5A:1qQOK3:RuVd0GT9tixpavie77PeRZnJbjauwbwQwHf0OhmuGkk','2023-08-14 08:32:11.603832'),('xoxc13r4pb79cnvlag9nohvgdcde3orc','.eJxVjDsOwyAQBe9CHSHzNaRM7zOgXViCkwgkY1dR7h5bcpG0b2bemwXY1hK2TkuYE7syxS6_G0J8Uj1AekC9Nx5bXZcZ-aHwk3Y-tUSv2-n-HRToZa-zhzFGMJaSi4MH77TBQaMkZSBaJWQWuANtBKpRWHKOjDYkCVVGqdjnC_R7N_8:1qLMki:a10fbAU-Dr0QMnrJm_wpK8I5D4F1hQWpud70t1rZjZo','2023-07-31 11:50:56.030974'),('y4pm49ffeet2d81ctpu6wzyq24plal2y','.eJxVjMsOwiAQRf-FtSEwvMSl-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZKffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcuRtrklNM5F1OUQAJw4AGTkgTak3VohDBniQWIdDReU5YWrSgyacHeH9lFN5A:1qOsRx:Hi4PjCED9gFusmWF66koWBE49qn_hobrC6cvM0gntyA','2023-08-10 04:18:05.935009'),('yf7smlgblo9v9ir0mbgvgrt567l7ynpw','e30:1qKE49:ErxGcimj1_Y401zXbMoJWkjr6oyEP9FKNSLR0QbaUjE','2023-07-28 08:22:17.177135'),('yzscnepkb323wubwpmvutyast3hr9738','.eJxVjLEOAiEQRP-F2lxYYCHaqa1-A1lgCRdzd4lAZfx3MblCy5k3b17CU2_F98pPPydxEgDi8FsGig9ev-R2n_ZQp2uvbVvOY3XZ-Z9UqJZhKO0oomUGpY1ldBoSsTPWZsUYs5QqJAC0CYLJmPUoAXM6StJBQhynfZ3beFriJt4ftSs3SA:1qRbty:IottxmpdOMho473LcG4mnabk2hTX7uDGImiMvrZW-0Q','2023-08-17 17:14:18.164890');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `letter`
--

DROP TABLE IF EXISTS `letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `letter` (
  `Letter_no` varchar(255) DEFAULT NULL,
  `Signing_date` date NOT NULL,
  `Receiving_date` date DEFAULT NULL,
  `Received_from` varchar(255) DEFAULT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Unit_Assigned_to` varchar(255) DEFAULT NULL,
  `Letter_assigned_to` varchar(255) DEFAULT NULL,
  `MDs_remark` text,
  `Gms_remark` text,
  `Deputy_GMs_remark` text,
  `Fms_remark` text,
  `Reply_date` date DEFAULT NULL,
  `Reply_reference` varchar(255) DEFAULT NULL,
  `srno` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`srno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `letter`
--

LOCK TABLES `letter` WRITE;
/*!40000 ALTER TABLE `letter` DISABLE KEYS */;
INSERT INTO `letter` VALUES ('12','2023-07-09','2023-07-15','11','11','Progress','11','11','11','11','11','2023-11-24','11',35),('332@A','2023-07-20','2023-07-21','ee','ee','Stats','ee','ee','ee','ee','ee','2023-03-31','ee',36),('33a','2023-07-07','2023-07-07','dd','dd','fcrc','dd','dddd','dd','dd','dd','2023-07-12','dd',37),('1234','2022-04-02','2022-05-02','plg','designing','MCO','TL','nice','very nice','very very nice','nicest','2023-01-01','nnjcn',40);
/*!40000 ALTER TABLE `letter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_user`
--

DROP TABLE IF EXISTS `view_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_user` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_user`
--

LOCK TABLES `view_user` WRITE;
/*!40000 ALTER TABLE `view_user` DISABLE KEYS */;
INSERT INTO `view_user` VALUES ('824db0706fa04e5db970b51809b8ca77','mco','mco123','mco','active');
/*!40000 ALTER TABLE `view_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 15:17:32
