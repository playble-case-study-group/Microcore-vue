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
INSERT INTO `Tasks` VALUES (1,'Task 1','This is the first task',1,1),(2,'Task 2','This is the second task',1,0),(3,'Task 3','This is the third task',1,0),(4,'Task 1','Day 2 Task 1',2,1),(5,'Task 2','Day 2 Task 2',2,1),(6,'Task 1 ','Day 3 Task 1',3,1),(7,'Task 2','Day 3 Task 2',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
INSERT INTO `artifacts` VALUES (1,'Vero quae et eum laudantium.','Eum est aut ea.','https://lorempixel.com/640/480/?77365','2018-04-03 21:46:25','2018-04-03 21:46:25'),(2,'Nam voluptate aut minima sunt.','Amet iure possimus enim repellendus suscipit.','https://lorempixel.com/640/480/?43606','2018-04-03 21:46:25','2018-04-03 21:46:25'),(3,'Hic sequi facilis.','Id laudantium vero temporibus consequatur.','https://lorempixel.com/640/480/?73301','2018-04-03 21:46:25','2018-04-03 21:46:25'),(4,'Necessitatibus et soluta maxime doloribus.','Eveniet nam voluptatem nobis autem.','https://lorempixel.com/640/480/?70638','2018-04-03 21:46:25','2018-04-03 21:46:25'),(5,'Illo saepe aut velit dolorem.','Doloribus quas voluptatibus maiores et non.','https://lorempixel.com/640/480/?68409','2018-04-03 21:46:25','2018-04-03 21:46:25'),(6,'Mollitia magnam odit.','Pariatur eius eveniet sed et enim molestias.','https://lorempixel.com/640/480/?49462','2018-04-03 21:46:25','2018-04-03 21:46:25'),(7,'Corrupti rerum repellat sunt.','Quae nemo dicta esse omnis aut corporis alias.','https://lorempixel.com/640/480/?31756','2018-04-03 21:46:25','2018-04-03 21:46:25'),(8,'Repudiandae ad recusandae aut sed.','Animi velit fugit est et enim ullam.','https://lorempixel.com/640/480/?72184','2018-04-03 21:46:25','2018-04-03 21:46:25'),(9,'In suscipit minus.','Corporis molestias delectus qui et.','https://lorempixel.com/640/480/?13140','2018-04-03 21:46:25','2018-04-03 21:46:25'),(10,'Repudiandae ea consequatur soluta.','Corporis libero porro dolores veniam praesentium.','https://lorempixel.com/640/480/?27170','2018-04-03 21:46:25','2018-04-03 21:46:25'),(11,'Doloribus sint rerum impedit deleniti eos.','Nemo rem nisi doloremque corrupti.','https://lorempixel.com/640/480/?39652','2018-04-03 21:46:25','2018-04-03 21:46:25'),(12,'Natus repellat dolores.','Quis et voluptas molestias id quisquam.','https://lorempixel.com/640/480/?74675','2018-04-03 21:46:25','2018-04-03 21:46:25'),(13,'Et eos voluptas deleniti autem.','Ipsa quibusdam et aut necessitatibus.','https://lorempixel.com/640/480/?12043','2018-04-03 21:46:25','2018-04-03 21:46:25'),(14,'Deserunt rerum aliquid quibusdam occaecati velit.','Quis est possimus corrupti et magni nostrum.','https://lorempixel.com/640/480/?47059','2018-04-03 21:46:25','2018-04-03 21:46:25'),(15,'Sed atque facere.','Consequatur consequuntur ab omnis reiciendis.','https://lorempixel.com/640/480/?10741','2018-04-03 21:46:25','2018-04-03 21:46:25'),(16,'Explicabo quo sapiente.','Quod omnis et veritatis ut.','https://lorempixel.com/640/480/?31689','2018-04-03 21:46:25','2018-04-03 21:46:25'),(17,'Commodi enim rerum perferendis iste.','Sed eos omnis expedita suscipit.','https://lorempixel.com/640/480/?69515','2018-04-03 21:46:25','2018-04-03 21:46:25'),(18,'Corporis rerum voluptate eius.','Quod doloribus qui id ut libero.','https://lorempixel.com/640/480/?70009','2018-04-03 21:46:25','2018-04-03 21:46:25'),(19,'Non consequatur sit sit.','Occaecati sit veniam voluptate architecto.','https://lorempixel.com/640/480/?81063','2018-04-03 21:46:25','2018-04-03 21:46:25'),(20,'Dolores perferendis sunt.','In sit nesciunt accusantium voluptate in.','https://lorempixel.com/640/480/?80604','2018-04-03 21:46:25','2018-04-03 21:46:25');
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_type`
--

DROP TABLE IF EXISTS `assignment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_type` (
  `assign_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `stored_procedure` varchar(255) DEFAULT NULL,
  `table_columns` json DEFAULT NULL,
  PRIMARY KEY (`assign_type_id`),
  UNIQUE KEY `assignment_type_assign_type_id_uindex` (`assign_type_id`),
  UNIQUE KEY `assignment_type_title_uindex` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_type`
--

LOCK TABLES `assignment_type` WRITE;
/*!40000 ALTER TABLE `assignment_type` DISABLE KEYS */;
INSERT INTO `assignment_type` VALUES (1,'Email','CALL retrieve_email_assignments(?,?,?)','[\"user_id\", \"day\", \"body\"]'),(2,'Gallery','CALL retrieve_gallery_assignments(?)',NULL),(3,'Video Call','CALL retrieve_video_assignments(?,?,?,?)',NULL);
/*!40000 ALTER TABLE `assignment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `assign_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `assign_type_id` int(11) NOT NULL DEFAULT '0',
  `requirements` json DEFAULT NULL COMMENT 'Array\nEmail [character_id, day]\nGallery []\nVideoCall [question_id, day, character_id]',
  PRIMARY KEY (`assign_id`),
  UNIQUE KEY `assignments_assign_id_uindex` (`assign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Handles the assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,'Ana Email Day 1',1,'[2, 1]'),(2,'Eduardo Email Day 1',1,'[1, 1]'),(3,'Phillip Email Day 2',1,'[3, 1]'),(4,'Gallery Assignment',2,'[]'),(5,'Video call day 1',3,'[1, 1, 1]');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
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
-- Table structure for table `character_email`
--

DROP TABLE IF EXISTS `character_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_email` (
  `character_email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `character_id` int(11) NOT NULL COMMENT 'which character sent it',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sends only to specific class',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sends only to specific group',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'sends only to specific user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`character_email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_email`
--

LOCK TABLES `character_email` WRITE;
/*!40000 ALTER TABLE `character_email` DISABLE KEYS */;
INSERT INTO `character_email` VALUES (1,'Day 1 Character 1','This email is from the first character on the first day',1,1,0,0,0,'2018-03-14 17:23:26',NULL),(2,'Day 1 Character 2','This email is from the second character on the first day',1,2,0,0,0,'2018-03-14 17:23:26',NULL),(3,'Day 1 Character 3','This email is from the third character on the first day',1,3,0,0,0,'2018-03-14 17:23:26',NULL),(4,'Day 2 Character 1','This email is from the first character on the second day',2,1,0,0,0,'2018-03-14 17:23:26',NULL),(5,'Day 2 Character 2','This email is from the second character on the second day',2,2,0,0,0,'2018-03-14 17:23:26',NULL),(6,'Day 2 Character 3','This email is from the third character on the second day',2,3,0,0,0,'2018-03-14 17:23:26',NULL);
/*!40000 ALTER TABLE `character_email` ENABLE KEYS */;
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
  `img_small` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_large` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,NULL,NULL,'Ernando Suarez','Head Curator','img/characters/ernando-small.png','img/characters/ernando-large.png'),(2,NULL,NULL,'Ana Alba','Marketing','img/characters/ana-small.png','img/characters/ana-large.png'),(3,NULL,NULL,'Phillip Iniesta','Technical','img/characters/phillip-small.png','img/characters/phillip-large.png'),(4,NULL,NULL,'Maria Pique','Educator','img/characters/maria-small.png','img/characters/maria-large.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,1,2,'',1,'Hello!','2018-03-03 01:52:54',NULL,0),(2,1,2,'',1,'what day is it?','2018-03-03 01:53:02',NULL,0),(3,1,2,'Sarah Olsen',1,'It is day 1','2018-03-03 01:53:02',NULL,1),(4,1,2,'',1,'does this work?','2018-03-03 01:53:07',NULL,0),(5,1,2,'Sarah Olsen',1,'This totally works 1','2018-03-03 01:53:07',NULL,1),(6,1,2,'Geoff Wright',1,'This totally works 3','2018-03-03 01:53:07',NULL,1),(7,1,1,'',1,'Does this work?','2018-03-07 05:07:09',NULL,0),(8,1,1,'',1,'Hello!','2018-03-07 05:07:13',NULL,0),(9,1,1,'Some Person',1,'Welcome to channel 1','2018-03-07 05:07:14',NULL,1),(10,1,1,'',1,'does this work?','2018-04-03 21:25:46',NULL,0),(11,1,1,'',1,'hello','2018-04-03 21:25:58',NULL,0),(12,1,1,'Some Person',1,'Welcome to channel 1','2018-04-03 21:25:58',NULL,1),(13,1,2,'',1,'does this work?','2018-04-03 21:26:08',NULL,0),(14,1,2,'Sarah Olsen',1,'This totally works 1','2018-04-03 21:26:08',NULL,1),(15,1,2,'Geoff Wright',1,'This totally works 3','2018-04-03 21:26:08',NULL,1),(16,1,2,'',1,'what day is it?','2018-04-03 21:26:16',NULL,0),(17,1,2,'Sarah Olsen',1,'It is day 1','2018-04-03 21:26:16',NULL,1);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Test Class 1','test_class_1','2018-03-23 16:45:54',NULL),(2,'Test Class 2','test_class_2','2018-03-23 16:45:54',NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_has_group`
--

DROP TABLE IF EXISTS `class_has_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_has_group` (
  `class_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_has_group`
--

LOCK TABLES `class_has_group` WRITE;
/*!40000 ALTER TABLE `class_has_group` DISABLE KEYS */;
INSERT INTO `class_has_group` VALUES (1,1);
/*!40000 ALTER TABLE `class_has_group` ENABLE KEYS */;
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
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gallery` (
  `gallery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`gallery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (1,'Gallery 1 Title','This is the description','/images/gallery/gallery01.png','2018-04-03 19:33:58',NULL),(2,'Gallery 2 Title','This is the description','/images/gallery/gallery02.png','2018-04-03 19:33:58',NULL),(3,'Gallery 3 Title','This is the description','/images/gallery/gallery03.png','2018-04-03 19:33:58',NULL),(4,'Gallery 4 Title','This is the description','/images/gallery/gallery04.png','2018-04-03 19:33:58',NULL),(5,'Gallery 5 Title','This is the description','/images/gallery/gallery05.png','2018-04-03 19:33:58',NULL),(6,'Gallery 6 Title','This is the description','/images/gallery/gallery06.png','2018-04-03 19:33:58',NULL),(7,'Gallery 7 Title','This is the description','/images/gallery/gallery07.png','2018-04-03 19:33:58',NULL),(8,'Gallery 8 Title','This is the description','/images/gallery/gallery08.png','2018-04-03 19:33:58',NULL),(9,'Gallery 9 Title','This is the description','/images/gallery/gallery09.png','2018-04-03 19:33:58',NULL),(10,'Gallery 10 Title','This is the description','/images/gallery/gallery10.png','2018-04-03 19:33:58',NULL);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'test group 1','2018-03-23 18:19:01',NULL),(2,'Dan Group','2018-04-05 18:20:52',NULL);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_class`
--

DROP TABLE IF EXISTS `instructor_has_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_has_class` (
  `instructor_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_class`
--

LOCK TABLES `instructor_has_class` WRITE;
/*!40000 ALTER TABLE `instructor_has_class` DISABLE KEYS */;
INSERT INTO `instructor_has_class` VALUES (8,1),(8,2);
/*!40000 ALTER TABLE `instructor_has_class` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_23_193209_createSimulationTable',2),(4,'2018_01_30_205641_CreateEmailTable',3),(5,'2018_01_31_211121_create_artifacts_table',4),(6,'2018_02_16_161514_create_languages_table',4),(7,'2018_02_16_165458_create_wiki_table',5),(8,'2018_02_16_165730_create_article_table',6),(9,'2018_02_23_163617_create_chat_table',7),(10,'2018_02_23_221031_create_channel_table',8),(11,'2018_02_26_173005_create_notes_table',9),(12,'2018_02_26_173654_create_characters_table',10),(13,'2018_02_26_175241_create_video_table',11),(14,'2018_03_08_231840_update_video_table',12),(15,'2018_03_09_153947_create_call_table',13),(16,'2018_03_09_154209_create_question_table',13),(17,'2018_03_14_165128_create_character_email_table',14),(18,'2018_03_14_165143_create_student_email_table',14),(19,'2018_03_14_171240_add_character_email_id_column_to_student_email_table',15),(20,'2018_03_16_193814_add_character_img_to_character_table',16),(21,'2018_03_19_164845_create_student_task_table',17),(22,'2018_03_23_142605_create_group_table',18),(23,'2018_03_23_142635_create_user_has_group_table',18),(24,'2018_03_23_142838_create_class_table',18),(25,'2018_03_23_142902_create_user_has_class_table',18),(26,'2018_03_23_143340_create_class_has_group_table',19),(27,'2018_03_23_144144_create_instructor_has_class_table',20),(28,'2018_03_23_144552_add_role_column_to_users_table',21),(32,'2018_04_03_163459_gallery__master',22);
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
-- Table structure for table `student_email`
--

DROP TABLE IF EXISTS `student_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_email` (
  `student_email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT 'which student sent it',
  `day` int(11) NOT NULL DEFAULT '1',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `character_id` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'character to which it was sent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `character_email_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_email`
--

LOCK TABLES `student_email` WRITE;
/*!40000 ALTER TABLE `student_email` DISABLE KEYS */;
INSERT INTO `student_email` VALUES (1,1,1,'Subject','Body','1',NULL,NULL,2,1),(2,1,1,'Subject 2','Body 2','2',NULL,NULL,1,1);
/*!40000 ALTER TABLE `student_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gallery`
--

DROP TABLE IF EXISTS `student_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_gallery` (
  `student_gallery_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Id of user who edited the item.',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`student_gallery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gallery`
--

LOCK TABLES `student_gallery` WRITE;
/*!40000 ALTER TABLE `student_gallery` DISABLE KEYS */;
INSERT INTO `student_gallery` VALUES (1,1,'Gallery 1 Title That has changed','This is a description that','/images/gallery/gallery01.png',1,2,1),(3,4,'Gallery 4 Title','This is the description this has changed','/images/gallery/gallery04.png',8,0,1),(4,1,'Gallery 1 Title not in a group','This is the description changed','/images/gallery/gallery01.png',8,0,1),(5,2,'Gallery 2 Title','This is the description here','/images/gallery/gallery02.png',8,0,1),(6,2,'Gallery 2 Title','This is the description','/images/gallery/gallery02.png',8,1,1),(7,1,'Gallery 1 Title','This is the description','/images/gallery/gallery01.png',8,1,1),(8,7,'Gallery 7 Title','This is the description','/images/gallery/gallery07.png',8,1,1);
/*!40000 ALTER TABLE `student_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gallery_has_tag`
--

DROP TABLE IF EXISTS `student_gallery_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_gallery_has_tag` (
  `student_gallery_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gallery_has_tag`
--

LOCK TABLES `student_gallery_has_tag` WRITE;
/*!40000 ALTER TABLE `student_gallery_has_tag` DISABLE KEYS */;
INSERT INTO `student_gallery_has_tag` VALUES (1,1),(1,2),(5,1),(4,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `student_gallery_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_task`
--

DROP TABLE IF EXISTS `student_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_task` (
  `task_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `complete` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_task`
--

LOCK TABLES `student_task` WRITE;
/*!40000 ALTER TABLE `student_task` DISABLE KEYS */;
INSERT INTO `student_task` VALUES (1,1,1,'2018-03-19 17:25:22','2018-05-03 18:46:28'),(2,1,1,'2018-03-19 17:25:25','2018-05-03 00:06:09'),(3,1,1,'2018-03-19 17:25:29','2018-05-03 00:06:09'),(7,1,1,'2018-03-27 15:10:05','2018-05-03 00:06:10'),(1,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:18'),(2,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:19'),(3,8,1,'2018-03-27 17:03:39','2018-03-28 19:31:19'),(7,8,1,'2018-03-27 17:03:40','2018-03-28 19:39:32'),(4,8,1,'2018-03-28 19:31:23','2018-05-03 15:57:41'),(5,8,0,'2018-03-28 19:31:30','2018-05-15 17:56:49');
/*!40000 ALTER TABLE `student_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Tag 1'),(2,'Tag 2'),(3,'Tag 3'),(4,'Tag 4');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_class`
--

DROP TABLE IF EXISTS `user_has_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_class`
--

LOCK TABLES `user_has_class` WRITE;
/*!40000 ALTER TABLE `user_has_class` DISABLE KEYS */;
INSERT INTO `user_has_class` VALUES (1,NULL,NULL,7,1),(2,NULL,NULL,9,1),(3,NULL,NULL,10,1),(4,NULL,NULL,1,1),(5,NULL,NULL,8,1);
/*!40000 ALTER TABLE `user_has_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_group`
--

DROP TABLE IF EXISTS `user_has_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_group`
--

LOCK TABLES `user_has_group` WRITE;
/*!40000 ALTER TABLE `user_has_group` DISABLE KEYS */;
INSERT INTO `user_has_group` VALUES (1,2),(1,1),(10,1),(8,1);
/*!40000 ALTER TABLE `user_has_group` ENABLE KEYS */;
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
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `assigned` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dan','de6eling@gmail.com','$2y$10$K.a/gbbcosHWKgwBqEiZSuabVZNxzjTRVlSnx0ezB/F3wf5MzaA6O',1,'NULj7M0YCjPiPybZq5zDTyOmzJENt5NOp2HWTf0gVeTNKUZtKR8mRKhle2rG','2018-01-11 01:04:23','2018-01-11 01:04:23',0,0),(7,'student','student@test.com','$2y$10$GnPD5u8IaWqMolFyGRKhGuqefI61DjjoKtAepXd.ITdTGLm/PORo6',1,'i19DOXxXKiC2zWBP2KVEBLTYm9VBAYv2F5idlRZzdIXfZZ8EevKyz1j39tc2','2018-03-23 22:58:02','2018-03-23 22:58:02',0,0),(8,'instructor','instructor@test.com','$2y$10$V3Dh8ybhaR5tMeCSG8F3j.Ls95/Lj3zKZmfKBWUVudaItddmUfGry',2,'5RiKEcFI8cxhK0X5k8K5syPWS2sbsoOXcLHU1atsIpfMefAU8n3OgoJFUV1E','2018-03-23 23:21:19','2018-03-23 23:21:19',1,1),(9,'student 2','student2@test.com','$2y$10$IuqZiBOBIl10i7gT.26iUOmVRcLbA9k2LZVmvhaqishbPXSwsZRhO',1,'wjlZyXBw3w6u20M0eZK8mkO7phBy7cgp38eQGss6LiZHtVMrRdL9U2rO1KFG','2018-03-24 04:24:58','2018-03-24 04:24:58',0,0),(10,'student 3','student3@test.com','$2y$10$ok5g3RV67tAaFfiegaz1POnTrrG2Y2dgrfaRVzKoMjGFvSAqsmG9i',1,'1fJUErLGhnaUH8KEsgKDwL0bhvx9yH7QAIzN2RaXfAHp7xEdhODYBa3RQXbC','2018-03-24 04:28:29','2018-03-24 04:28:29',0,0),(11,'anna','annacguthrie5@gmail.com','$2y$10$a974OGMituSDLhWMd6dPvu3.h0.jOczVvc2D2ofOlmk/Qi4IUEiQ2',1,NULL,'2018-05-04 23:26:26','2018-05-04 23:26:26',1,0);
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

--
-- Dumping routines for database 'vuesim_local'
--
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_email_assignments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`danielebeling`@`localhost` PROCEDURE `retrieve_email_assignments`(IN char_id INT, IN d INT, IN cl_id INT)
BEGIN
    SELECT s.day, s.subject, s.body, s.created_at, c.name AS c_name, u.name AS u_name FROM student_email AS s
      INNER JOIN users AS u ON s.user_id = u.id
      INNER JOIN characters AS c ON s.character_id = c.id
    WHERE s.class_id = cl_id
          and s.day = d
          and s.character_id = char_id;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_gallery_assignments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`danielebeling`@`localhost` PROCEDURE `retrieve_gallery_assignments`(IN class_id_in INT)
BEGIN
    SELECT * FROM student_gallery
    WHERE class_id = class_id_in;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retrieve_video_assignments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`danielebeling`@`localhost` PROCEDURE `retrieve_video_assignments`(IN question_id_in INT, IN day_in INT, IN character_id_in INT, IN class_id_in INT)
BEGIN
    select * from student_video_submissions
    where class_id = class_id_in
          and day = day_in
          and character_id = character_id_in
          and question_id = q_id;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-17 11:18:33
