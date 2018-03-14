-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: vuesim_local
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `day` int(11) NOT NULL DEFAULT '1',
  `complete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Tasks_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
INSERT INTO `Tasks` VALUES (1,'Task 1','This is the first task',1,1),(2,'Task 2','This is the second task',1,1),(3,'Task 3','This is the third task',1,0),(4,'Task 1','Day 2 Task 1',2,1),(5,'Task 2','Day 2 Task 2',2,1),(6,'Task 1 ','Day 3 Task 1',3,1),(7,'Task 2','Day 3 Task 2',1,0);
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,'Test English','{\"title\": \"Civil War\", \"content\": \"This is a civil war \", \"subtitles\": [{\"title\": \"Civil War Subtitle 1\", \"content\": \"subtitle 1 contents\", \"subtitles\": []}, {\"title\": \"Civil Ware Subtitle 2\", \"content\": \"subtitle 2 contents\", \"subtitles\": [{\"title\": \"sub-sub-title\", \"content\": \"something\", \"subtitles\": []}]}]}',NULL,NULL),(2,2,'Test Spanish','{\"title\": \"Guerra Civil\", \"content\": \"hola taco burrito\", \"subtitles\": [{\"title\": \"Guerra Civil Subtitle 1\", \"content\": \"subtitle 1 contents\", \"subtitles\": []}, {\"title\": \"Guerra Civil Subtitle 2\", \"content\": \"subtitle 2 contents\", \"subtitles\": [{\"title\": \"sub-sub-title\", \"content\": \"something\", \"subtitles\": []}]}]}',NULL,NULL),(3,1,'Test English','{\"title\": \"Civil War\", \"content\": \"This is a civil war \", \"subtitles\": [{\"title\": \"Civil War Subtitle 1\", \"content\": \"subtitle 1 contents\", \"subtitles\": []}, {\"title\": \"Civil Ware Subtitle 2\", \"content\": \"subtitle 2 contents\", \"subtitles\": [{\"title\": \"sub-sub-title\", \"content\": \"something\", \"subtitles\": []}]}]}',NULL,NULL),(4,2,'Test Spanish','{\"title\": \"Guerra Civil\", \"content\": \"hola taco burrito\", \"subtitles\": [{\"title\": \"Guerra Civil Subtitle 1\", \"content\": \"subtitle 1 contents\", \"subtitles\": []}, {\"title\": \"Guerra Civil Subtitle 2\", \"content\": \"subtitle 2 contents\", \"subtitles\": [{\"title\": \"sub-sub-title\", \"content\": \"something\", \"subtitles\": []}]}]}',NULL,NULL);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifacts`
--

DROP TABLE IF EXISTS `artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call`
--

DROP TABLE IF EXISTS `call`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `call` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL DEFAULT '1',
  `character_id` int(11) NOT NULL,
  `call_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call`
--

LOCK TABLES `call` WRITE;
/*!40000 ALTER TABLE `call` DISABLE KEYS */;
INSERT INTO `call` VALUES (1,1,1,'/calls/call_11.mp4','2018-03-09 23:11:50',NULL),(2,1,2,'/calls/call_12.mp4','2018-03-09 23:11:50',NULL),(3,2,1,'/calls/call_21.mp4','2018-03-09 23:11:50',NULL),(4,2,2,'/calls/call_22.mp4','2018-03-09 23:11:50',NULL);
/*!40000 ALTER TABLE `call` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'Channel 1','884bfc04fd474126993d40f682471515',NULL,NULL),(2,'Channel 2','c31305b92c7443f1908e821264a193ae',NULL,NULL);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (12,'1998-02-05 22:10:45','2018-03-09 22:06:14','Eloisa Harris','Audio and Video Equipment Technician'),(34,'2002-06-10 09:56:50','2018-03-09 22:06:14','Reyna Rutherford III','Travel Clerk'),(45,'1977-03-18 01:41:09','2018-03-09 22:06:14','Sandy Luettgen','Fashion Designer'),(58,'1977-10-20 21:25:28','2018-03-09 22:06:14','Amanda Ullrich II','Military Officer'),(65,'1998-06-13 23:17:27','2018-03-09 22:06:14','Juston Smith PhD','Woodworking Machine Operator'),(74,'1993-04-11 17:01:31','2018-03-09 22:06:14','Maia Torp','Command Control Center Specialist'),(88,'1985-03-07 03:31:40','2018-03-09 22:06:14','Tianna Stiedemann','Aircraft Launch and Recovery Officer'),(89,'1982-04-18 05:15:09','2018-03-09 22:06:14','Lucienne Zboncak','Welfare Eligibility Clerk'),(94,'1978-03-29 16:54:51','2018-03-09 22:06:14','Prof. Watson Nitzsche Sr.','Motion Picture Projectionist');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `character_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,1,2,'',1,'Hello!','2018-03-03 01:52:54',NULL,0),(2,1,2,'',1,'what day is it?','2018-03-03 01:53:02',NULL,0),(3,1,2,'Sarah Olsen',1,'It is day 1','2018-03-03 01:53:02',NULL,1),(4,1,2,'',1,'does this work?','2018-03-03 01:53:07',NULL,0),(5,1,2,'Sarah Olsen',1,'This totally works 1','2018-03-03 01:53:07',NULL,1),(6,1,2,'Geoff Wright',1,'This totally works 3','2018-03-03 01:53:07',NULL,1),(7,1,1,'',1,'Does this work?','2018-03-07 05:07:09',NULL,0),(8,1,1,'',1,'Hello!','2018-03-07 05:07:13',NULL,0),(9,1,1,'Some Person',1,'Welcome to channel 1','2018-03-07 05:07:14',NULL,1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'test','thisisatest','me@me.com','you@you.com',NULL,NULL),(2,'test2','hey','you@you.com','me@me.com',NULL,NULL),(3,'a','n','Dan','Dan',NULL,NULL),(4,'hi','test','Dan','Dan',NULL,NULL),(5,'test','test','Dan','Dan',NULL,NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'english'),(2,'spanish');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_23_193209_createSimulationTable',2),(4,'2018_01_30_205641_CreateEmailTable',3),(5,'2018_01_31_211121_create_artifacts_table',4),(6,'2018_02_16_161514_create_languages_table',4),(7,'2018_02_16_165458_create_wiki_table',5),(8,'2018_02_16_165730_create_article_table',6),(9,'2018_02_23_163617_create_chat_table',7),(10,'2018_02_23_221031_create_channel_table',8),(11,'2018_02_26_173005_create_notes_table',9),(12,'2018_02_26_173654_create_characters_table',10),(13,'2018_02_26_175241_create_video_table',11),(14,'2018_03_08_231840_update_video_table',12),(15,'2018_03_09_153947_create_call_table',13),(16,'2018_03_09_154209_create_question_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (2,'1976-08-30 12:27:57','2018-03-09 22:06:14','Nisi quam itaque a soluta et earum. Odit mollitia quia reprehenderit iure voluptatem architecto.',2,1),(10,'1996-12-13 20:53:28','2018-03-09 22:06:14','Sed est vel perferendis voluptatum praesentium soluta. Ratione et ea tenetur tenetur consequuntur.',4,3),(11,'2006-08-21 19:35:13','2018-03-09 22:06:14','Eos fugiat non corporis error. Similique voluptatem sed illum magnam sint nemo sapiente veritatis.',9,3),(19,'1973-06-29 22:13:33','2018-03-09 22:06:14','Repellat et commodi possimus. Hic commodi adipisci eum.',9,2),(26,'1970-12-16 13:53:47','2018-03-09 22:06:14','Excepturi accusantium maxime mollitia aut blanditiis. Omnis consectetur corporis ut veritatis.',3,1),(28,'1971-10-03 01:10:05','2018-03-09 22:06:14','Deserunt quia enim ab eius dolorum praesentium enim soluta. Minus voluptatem optio nam vel sint ut.',1,1),(33,'1979-05-21 20:32:21','2018-03-09 22:06:14','Est ut ut optio aut. Numquam ut qui voluptatem libero quasi explicabo.',7,2),(43,'2002-11-16 15:12:56','2018-03-09 22:06:14','Ex similique veniam enim esse. Ut et facilis non ut magnam autem occaecati sit.',8,3),(44,'2005-08-08 14:20:19','2018-03-09 22:06:14','Omnis rerum consequatur dolor et et. Nihil provident sunt sunt voluptate.',6,2),(46,'1982-12-13 06:22:10','2018-03-09 22:06:14','Nulla porro facere velit perferendis. Velit est repudiandae nobis eveniet omnis.',7,1),(57,'2006-06-15 09:00:09','2018-03-09 22:06:14','Reiciendis est aliquid repellat. Veritatis aut soluta reiciendis error consequatur.',7,1),(60,'2004-01-14 16:25:31','2018-03-09 22:06:14','Dolores officia id iure praesentium esse maxime. Quo quos expedita omnis sunt adipisci ea amet et.',9,1),(66,'1972-03-09 08:46:56','2018-03-09 22:06:14','Hic ea nesciunt officia ullam. Atque assumenda eius error sed commodi autem aliquid.',1,1),(69,'1972-12-26 06:02:02','2018-03-09 22:06:14','Et blanditiis et unde odio. In dolor consectetur eaque aut. Iure inventore illum hic non ipsum eum.',4,2),(76,'1988-11-24 07:05:45','2018-03-09 22:06:14','Ea ea quasi itaque magni suscipit doloremque. Enim sit reprehenderit aut.',2,2),(78,'1993-12-07 13:44:26','2018-03-09 22:06:14','Est quo mollitia ad officia ratione aliquam esse. Aut vero ut molestiae et.',6,3),(87,'1998-03-14 17:42:31','2018-03-09 22:06:14','Aut beatae omnis fugiat. Veritatis qui aut quia nemo omnis.',1,2),(91,'2007-09-23 01:30:16','2018-03-09 22:06:14','Repellendus est sapiente omnis et voluptas illo. Ipsa omnis officia ratione qui voluptate.',3,1),(92,'2000-10-04 03:47:09','2018-03-09 22:06:14','Autem rem quod blanditiis ratione eos molestiae. Ut repellendus est necessitatibus dolore sed.',4,2),(98,'1991-02-15 15:31:38','2018-03-09 22:06:14','Et in tenetur cumque aut libero vero beatae. Quod totam eum ipsam doloremque animi corporis.',2,1);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `call_id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Day 1, call 1, question 1',20,30,'2018-03-09 23:11:50',NULL),(2,1,'Day 1, call 1, question 2',35,50,'2018-03-09 23:11:50',NULL),(3,1,'Day 1, call 1, question 3',55,80,'2018-03-09 23:11:50',NULL),(4,2,'Day 1, call 2, question 1',20,30,'2018-03-09 23:11:50',NULL),(5,2,'Day 1, call 2, question 2',60,80,'2018-03-09 23:11:50',NULL),(6,3,'Day 2, call 1, question 1',10,30,'2018-03-09 23:11:50',NULL),(7,3,'Day 2, call 1, question 2',45,70,'2018-03-09 23:11:50',NULL),(8,4,'Day 2, call 2, question 1',10,40,'2018-03-09 23:11:50',NULL),(9,4,'Day 2, call 2, question 2',41,50,'2018-03-09 23:11:50',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simulation`
--

DROP TABLE IF EXISTS `simulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simulation` (
  `days` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `simulation_days_index` (`days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simulation`
--

LOCK TABLES `simulation` WRITE;
/*!40000 ALTER TABLE `simulation` DISABLE KEYS */;
INSERT INTO `simulation` VALUES (3,'2018-01-23 19:36:38');
/*!40000 ALTER TABLE `simulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_day` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dan','de6eling@gmail.com','$2y$10$K.a/gbbcosHWKgwBqEiZSuabVZNxzjTRVlSnx0ezB/F3wf5MzaA6O',1,'T2ZfpjCm132B6wZL0G96LQ1iPQblpdlarkYjNdjkDXJkqzQ7ECKBkfYGKI2U','2018-01-11 01:04:23','2018-01-11 01:04:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (4,65,2,'Eum consequatur illo odit et.',10,659,'/video/fun.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(6,94,1,'Praesentium iure asperiores voluptas error autem.',31,494,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(8,65,1,'Qui natus doloribus illum est.',93,642,'/video/you.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(13,45,2,'Voluptas similique id eaque quia.',97,493,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(14,65,1,'Eaque maiores id quis et molestiae.',11,926,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(15,45,3,'Dolores eaque molestias perferendis quisquam.',17,935,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(18,88,3,'Est illo veritatis qui voluptatibus maxime saepe.',13,558,'/video/you.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(20,74,3,'Voluptas nisi rerum numquam aut dolores.',81,978,'/video/fun.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(23,89,1,'Eveniet beatae asperiores illo qui.',93,574,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(39,45,2,'Enim velit quos non nisi sit quia quas qui.',32,152,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(41,65,3,'Placeat qui sunt et et commodi dolor.',92,463,'/video/junk.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(47,34,3,'Et dolor eius et magni.',14,365,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(48,34,3,'Velit perferendis officia cumque quia eum quia.',36,798,'/video/junk.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(62,88,3,'Id iusto quam voluptate ut.',67,435,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(67,89,1,'Est nemo voluptas vel ratione fugiat sequi optio.',81,514,'/video/fun.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(68,89,1,'Recusandae voluptatem et sit voluptatem.',34,913,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(72,88,3,'Nulla omnis possimus aut commodi.',26,131,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(73,34,2,'Et odio dolores eos et quia eos.',37,449,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(82,65,1,'Tempora dolore ipsam recusandae eos distinctio.',79,425,'/video/you.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(93,45,2,'Iure est quod libero commodi.',93,216,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki`
--

DROP TABLE IF EXISTS `wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_1_ar` int(11) NOT NULL,
  `lang_2_ar` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki`
--

LOCK TABLES `wiki` WRITE;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` VALUES (1,1,2),(2,3,4);
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-12 10:20:05
