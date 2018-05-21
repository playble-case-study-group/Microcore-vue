
-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: VueSim
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `day` int(11) NOT NULL DEFAULT '1',
  `complete` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `tasks_id_uindex` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Task 1','This is the first task',1,1),(2,'Task 2','This is the second task',1,0),(3,'Task 3','This is the third task',1,0),(4,'Task 1','Day 2 Task 1',2,1),(5,'Task 2','Day 2 Task 2',2,1),(6,'Task 1 ','Day 3 Task 1',3,1),(7,'Task 2','Day 3 Task 2',1,0);
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (9,1,'Civil War','# Civil War<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,NULL),(10,2,'Guerra Civil','# Guerra Civil<hr>\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.\n## Madrid 13\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Edificio 1\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,'2018-05-15 19:16:08'),(11,1,'Test English','# Test English<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,NULL),(12,2,'Test Spanish','# Test Spanish<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid 2\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building 2\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.\n\ntest test test test',NULL,'2018-05-16 20:01:39');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_type`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_types` (
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
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` VALUES (1,'Email','CALL retrieve_email_assignments(?,?,?)','[\"user_id\", \"day\", \"body\"]'),(2,'Gallery','CALL retrieve_gallery_assignments(?)',NULL),(3,'Video Call','CALL retrieve_video_assignments(?,?,?,?)',NULL);
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels` (
  `channel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'Channel 1','884bfc04fd474126993d40f682471515',NULL,NULL),(2,'Channel 2','c31305b92c7443f1908e821264a193ae',NULL,NULL);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_email`
--

DROP TABLE IF EXISTS `character_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character_emails` (
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
-- Dumping data for table `character_emails`
--

LOCK TABLES `character_emails` WRITE;
/*!40000 ALTER TABLE `character_emails` DISABLE KEYS */;
INSERT INTO `character_emails` VALUES (1,'Day 1 Character 1','This email is from the first character on the first day',1,1,0,0,0,'2018-03-14 17:23:26',NULL),(2,'Day 1 Character 2','This email is from the second character on the first day',1,2,0,0,0,'2018-03-14 17:23:26',NULL),(3,'Day 1 Character 3','This email is from the third character on the first day',1,3,0,0,0,'2018-03-14 17:23:26',NULL),(4,'Day 2 Character 1','This email is from the first character on the second day',2,1,0,0,0,'2018-03-14 17:23:26',NULL),(5,'Day 2 Character 2','This email is from the second character on the second day',2,2,0,0,0,'2018-03-14 17:23:26',NULL),(6,'Day 2 Character 3','This email is from the third character on the second day',2,3,0,0,0,'2018-03-14 17:23:26',NULL);
/*!40000 ALTER TABLE `character_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `character_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_small` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_large` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Ernando Suarez','Head Curator','img/characters/ernando-small.png','img/characters/ernando-large.png',NULL,NULL,),(2,'Ana Alba','Marketing','img/characters/ana-small.png','img/characters/ana-large.png',NULL,NULL,),(3,'Phillip Iniesta','Technical','img/characters/phillip-small.png','img/characters/phillip-large.png',NULL,NULL,),(4,'Maria Pique','Educator','img/characters/maria-small.png','img/characters/maria-large.png',NULL,NULL,);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `chat_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `character_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `day` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,1,2,'',1,'Hello!','2018-03-03 01:52:54',NULL,0),(2,1,2,'',1,'what day is it?','2018-03-03 01:53:02',NULL,0),(3,1,2,'Sarah Olsen',1,'It is day 1','2018-03-03 01:53:02',NULL,1),(4,1,2,'',1,'does this work?','2018-03-03 01:53:07',NULL,0),(5,1,2,'Sarah Olsen',1,'This totally works 1','2018-03-03 01:53:07',NULL,1),(6,1,2,'Geoff Wright',1,'This totally works 3','2018-03-03 01:53:07',NULL,1),(7,1,1,'',1,'Does this work?','2018-03-07 05:07:09',NULL,0),(8,1,1,'',1,'Hello!','2018-03-07 05:07:13',NULL,0),(9,1,1,'Some Person',1,'Welcome to channel 1','2018-03-07 05:07:14',NULL,1),(10,1,1,'',1,'does this work?','2018-04-03 21:25:46',NULL,0),(11,1,1,'',1,'hello','2018-04-03 21:25:58',NULL,0),(12,1,1,'Some Person',1,'Welcome to channel 1','2018-04-03 21:25:58',NULL,1),(13,1,2,'',1,'does this work?','2018-04-03 21:26:08',NULL,0),(14,1,2,'Sarah Olsen',1,'This totally works 1','2018-04-03 21:26:08',NULL,1),(15,1,2,'Geoff Wright',1,'This totally works 3','2018-04-03 21:26:08',NULL,1),(16,1,2,'',1,'what day is it?','2018-04-03 21:26:16',NULL,0),(17,1,2,'Sarah Olsen',1,'It is day 1','2018-04-03 21:26:16',NULL,1);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
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
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Test Class 1','test_class_1','2018-03-23 16:45:54',NULL),(2,'Test Class 2','test_class_2','2018-03-23 16:45:54',NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
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
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dash_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `day_video` text,
  `news_headline` text,
  `news_snippet` text,
  `stock_value` double DEFAULT NULL,
  `stock_percentage` int(11) DEFAULT NULL,
  `message_count` int(11) DEFAULT '0',
  `email_count` int(11) DEFAULT '0',
  `stock_status` text,
  PRIMARY KEY (`dash_id`),
  UNIQUE KEY `dashboard_dash_id_uindex` (`dash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard`
--

LOCK TABLES `dashboard` WRITE;
/*!40000 ALTER TABLE `dashboard` DISABLE KEYS */;
INSERT INTO `dashboard` VALUES (10,1,'/video/fun.mp4','Microcore on Top','New life saving drug to hit the market soon!',2.5,5,2,1,'up'),(11,2,'/video/me.mp4','Microcore has Micro-meltdown','Pig explodes on lab grounds. ',3.12,12,3,2,'down'),(12,3,'/video/test.mp4','What will happen to Microcore?','After the pig mess, what is next?',1.2,2,1,3,'up');
/*!40000 ALTER TABLE `dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifacts`
--

DROP TABLE IF EXISTS `artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifacts` (
  `artifact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`artifact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
INSERT INTO `artifacts` VALUES (1,'Gallery 1 Title','This is the description','/images/gallery/gallery01.png','2018-04-03 19:33:58',NULL),(2,'Gallery 2 Title','This is the description','/images/gallery/gallery02.png','2018-04-03 19:33:58',NULL),(3,'Gallery 3 Title','This is the description','/images/gallery/gallery03.png','2018-04-03 19:33:58',NULL),(4,'Gallery 4 Title','This is the description','/images/gallery/gallery04.png','2018-04-03 19:33:58',NULL),(5,'Gallery 5 Title','This is the description','/images/gallery/gallery05.png','2018-04-03 19:33:58',NULL),(6,'Gallery 6 Title','This is the description','/images/gallery/gallery06.png','2018-04-03 19:33:58',NULL),(7,'Gallery 7 Title','This is the description','/images/gallery/gallery07.png','2018-04-03 19:33:58',NULL),(8,'Gallery 8 Title','This is the description','/images/gallery/gallery08.png','2018-04-03 19:33:58',NULL),(9,'Gallery 9 Title','This is the description','/images/gallery/gallery09.png','2018-04-03 19:33:58',NULL),(10,'Gallery 10 Title','This is the description','/images/gallery/gallery10.png','2018-04-03 19:33:58',NULL);

/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'test group 1','2018-03-23 18:19:01',NULL),(2,'Dan Group','2018-04-05 18:20:52',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
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
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

-- LOCK TABLES `notes` WRITE;
-- /*!40000 ALTER TABLE `notes` DISABLE KEYS */;
-- INSERT INTO `notes` VALUES (2,'1974-12-29 15:00:18','2018-04-04 00:30:59','Unde vero eveniet et ut. Est voluptatibus ipsum quos sed in.',2),(12,'1994-04-29 01:03:15','2018-04-04 00:30:59','Quasi earum dolores exercitationem qui. Quos aut illo omnis illum dolor impedit eos.',7),(14,'1987-09-05 09:11:12','2018-04-04 00:30:59','Quam ea sit totam. Animi nobis provident tenetur.',4),(20,'1997-07-09 03:22:04','2018-04-04 00:30:59','Autem tempora ab atque non atque quis. Eaque beatae mollitia aut.',5),(29,'1981-09-07 21:14:01','2018-04-04 00:30:59','Ratione eius est et reprehenderit qui aliquam et. Autem rerum in repudiandae a sint repellat unde.',7),(36,'1980-05-28 02:32:09','2018-04-04 00:30:59','Cumque et vel labore. Et nobis est voluptatem.',4),(44,'1989-08-22 19:37:04','2018-04-04 00:30:59','Dolor laudantium vel vero odio est voluptas sed sequi. Sit voluptas quia et esse laborum.',7),(45,'1993-12-29 08:06:53','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test wut?\n\nwut wut?',1),(47,'1982-01-03 15:37:29','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test wut?\n\nwut wut?',1),(48,'1993-02-17 04:08:54','2018-04-04 00:30:59','Eaque minima blanditiis quod amet harum nemo. Et eum voluptatem minima maiores.',5),(54,'1975-01-04 03:52:12','2018-04-04 00:30:59','Quod eum eum velit. Facere facilis quas sint repellendus optio.',4),(57,'2005-12-06 07:27:38','2018-04-04 00:30:59','Sit similique omnis officiis ipsa nulla. Temporibus minima commodi rerum ea et odio.',2),(58,'1996-04-24 09:34:09','2018-04-04 00:30:59','Et non sunt unde. Quo modi et voluptatem.',9),(65,'1992-10-05 00:28:46','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test wut?\n\nwut wut?',1),(68,'1979-04-29 19:16:58','2018-04-04 00:30:59','Quis in sed ipsam nostrum enim. Modi consequatur aperiam qui corrupti quia.',4),(73,'1974-07-10 02:19:37','2018-04-04 00:30:59','Quos repudiandae molestiae aut ut tenetur enim nisi. Recusandae ipsam ut dolorem aut.',8),(74,'1971-11-10 20:15:15','2018-04-04 00:30:59','Aut tempore nulla deleniti nemo aperiam sit et. Et dolorem repudiandae unde.',3),(87,'2011-10-12 15:29:28','2018-04-04 00:30:59','Maxime et vel id aut. Quo dicta incidunt quia nisi vel.',5),(91,'1985-04-22 11:31:04','2018-04-04 00:30:59','Veniam adipisci omnis qui rerum. Cumque iure rem et sequi.',9),(95,'2000-06-19 07:52:11','2018-04-04 00:30:59','Autem dolorem quod quibusdam minus quia. At repellat ut temporibus sed praesentium omnis.',7);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
-- UNLOCK TABLES;

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
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `call_id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `record_after` tinyint(1) DEFAULT '0',
  `recording_duration` int(11) DEFAULT '0',
  `next_question` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,86,'Soluta qui ut sapiente.',17,731,'2015-03-06 20:06:40','2018-04-04 00:30:59',1,120,NULL),(5,26,'Provident aut non amet.',37,964,'2005-05-14 21:10:47','2018-04-04 00:30:59',0,0,NULL),(7,81,'Iste in ab neque magnam.',58,207,'2007-01-04 09:03:22','2018-04-04 00:30:59',1,90,NULL),(9,60,'Quis aut ea facilis.',65,373,'2003-11-26 05:27:29','2018-04-04 00:30:59',0,0,NULL),(17,51,'Odit modi at quo.',35,890,'1974-06-23 09:02:26','2018-04-04 00:30:59',0,0,NULL),(27,34,'Sed rerum aut et.',21,575,'1993-03-08 10:46:51','2018-04-04 00:30:59',0,0,NULL),(39,32,'Autem esse iste aut.',47,696,'2005-08-16 01:54:51','2018-04-04 00:30:59',1,60,NULL),(46,86,'Est quo a non possimus.',97,949,'2001-05-04 19:46:24','2018-04-04 00:30:59',0,0,NULL),(55,51,'Eum est est vel.',20,377,'1975-09-19 08:16:04','2018-04-04 00:30:59',1,30,NULL),(59,41,'Quia quod facere eum at.',62,323,'1999-11-19 15:31:16','2018-04-04 00:30:59',0,0,NULL),(61,8,'Et unde et et.',63,420,'2008-01-15 04:50:23','2018-04-04 00:30:59',0,0,NULL),(62,60,'Id nihil repellat non.',75,719,'2003-01-21 20:06:01','2018-04-04 00:30:59',0,0,NULL),(69,26,'Eos libero velit veniam.',88,611,'1981-12-26 07:08:57','2018-04-04 00:30:59',1,0,NULL),(71,49,'Et est ea atque qui.',82,411,'1995-11-11 09:34:33','2018-04-04 00:30:59',0,0,NULL),(80,8,'Qui ut voluptatibus sed.',62,976,'2001-11-03 06:59:57','2018-04-04 00:30:59',1,90,NULL),(89,64,'Eos qui neque quia.',93,440,'2005-09-23 09:57:02','2018-04-04 00:30:59',1,120,NULL),(90,81,'Vel et asperiores enim.',44,990,'1974-01-22 21:12:23','2018-04-04 00:30:59',0,0,NULL),(94,28,'Impedit sed sint magnam.',76,372,'1997-03-05 14:10:39','2018-04-04 00:30:59',0,0,NULL),(97,19,'Sunt et vel vel autem.',45,908,'1976-06-11 20:13:37','2018-04-04 00:30:59',0,0,NULL),(98,41,'Nisi sed in non.',0,5,'2005-08-03 05:27:59','2018-04-04 00:30:59',1,10,99),(99,41,NULL,6,10,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
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
-- Table structure for table `student_emails`
--

DROP TABLE IF EXISTS `student_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_emails` (
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
-- Dumping data for table `student_emails`
--

LOCK TABLES `student_emails` WRITE;
/*!40000 ALTER TABLE `student_emails` DISABLE KEYS */;
INSERT INTO `student_emails` VALUES (1,1,1,'Subject','Body','1',NULL,NULL,2,1),(2,1,1,'Subject 2','Body 2','2',NULL,NULL,1,1);
/*!40000 ALTER TABLE `student_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_artifacts`
--

DROP TABLE IF EXISTS `student_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_artifacts` (
  `student_artifact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Id of user who edited the item.',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL,
  PRIMARY KEY (`student_artifact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_artifacts`
--

LOCK TABLES `student_artifacts` WRITE;
/*!40000 ALTER TABLE `student_artifacts` DISABLE KEYS */;
INSERT INTO `student_artifacts` VALUES (1,1,'Gallery 1 Title That has changed','This is a description that','/images/gallery/gallery01.png',1,2,1,1),(3,4,'Gallery 4 Title','This is the description this has changed','/images/gallery/gallery04.png',8,0,1,1),(4,1,'Gallery 1 Title not in a group','This is the description changed','/images/gallery/gallery01.png',8,0,1,1),(5,2,'Gallery 2 Title','This is the description here','/images/gallery/gallery02.png',8,0,1,1),(6,2,'Gallery 2 Title','This is the description','/images/gallery/gallery02.png',8,1,1,1),(7,1,'Gallery 1 Title','This is the description','/images/gallery/gallery01.png',8,1,1,1),(8,7,'Gallery 7 Title','This is the description','/images/gallery/gallery07.png',8,1,1,1);
/*!40000 ALTER TABLE `student_artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_gallery_has_tag`
--

DROP TABLE IF EXISTS `student_gallery_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_artifact_has_tag` (
  `student_artifact_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gallery_has_tag`
--

LOCK TABLES `student_artifact_has_tag` WRITE;
/*!40000 ALTER TABLE `student_artifact_has_tag` DISABLE KEYS */;
INSERT INTO `student_artifact_has_tag` VALUES (1,1),(1,2),(5,1),(4,1),(6,1),(7,1),(8,1);
/*!40000 ALTER TABLE `student_artifact_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_tasks`
--

DROP TABLE IF EXISTS `student_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_tasks` (
  `task_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_tasks`
--

LOCK TABLES `student_tasks` WRITE;
/*!40000 ALTER TABLE `student_tasks` DISABLE KEYS */;
INSERT INTO `student_tasks` VALUES (1,1,1,'2018-03-19 17:25:22','2018-05-03 18:46:28'),(2,1,1,'2018-03-19 17:25:25','2018-05-03 00:06:09'),(3,1,1,'2018-03-19 17:25:29','2018-05-03 00:06:09'),(7,1,1,'2018-03-27 15:10:05','2018-05-03 00:06:10'),(1,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:18'),(2,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:19'),(3,8,1,'2018-03-27 17:03:39','2018-03-28 19:31:19'),(7,8,1,'2018-03-27 17:03:40','2018-03-28 19:39:32'),(4,8,1,'2018-03-28 19:31:23','2018-05-03 15:57:41'),(5,8,0,'2018-03-28 19:31:30','2018-05-15 17:56:49');
/*!40000 ALTER TABLE `student_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_video_submissions`
--

DROP TABLE IF EXISTS `student_video_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_video_submissions` (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_url` varchar(255) DEFAULT NULL,
  `submission_day` int(11) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `question_id` int(11) DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  UNIQUE KEY `student_video_submissions_submission_id_uindex` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_video_submissions`
--

LOCK TABLES `student_video_submissions` WRITE;
/*!40000 ALTER TABLE `student_video_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_video_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Tag 1'),(2,'Tag 2'),(3,'Tag 3'),(4,'Tag 4');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_class`
--

DROP TABLE IF EXISTS `user_has_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_class` (
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_class`
--

LOCK TABLES `user_has_class` WRITE;
/*!40000 ALTER TABLE `user_has_class` DISABLE KEYS */;
INSERT INTO `user_has_class` VALUES (1,1,NULL,NULL);
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
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_day` int(11) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  `assigned` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dan','de6eling@gmail.com','$2y$10$K.a/gbbcosHWKgwBqEiZSuabVZNxzjTRVlSnx0ezB/F3wf5MzaA6O',1,'NULj7M0YCjPiPybZq5zDTyOmzJENt5NOp2HWTf0gVeTNKUZtKR8mRKhle2rG','2018-01-11 01:04:23','2018-01-11 01:04:23',0,0),(7,'student','student@test.com','$2y$10$GnPD5u8IaWqMolFyGRKhGuqefI61DjjoKtAepXd.ITdTGLm/PORo6',1,'i19DOXxXKiC2zWBP2KVEBLTYm9VBAYv2F5idlRZzdIXfZZ8EevKyz1j39tc2','2018-03-23 22:58:02','2018-03-23 22:58:02',0,0),(8,'instructor','instructor@test.com','$2y$10$V3Dh8ybhaR5tMeCSG8F3j.Ls95/Lj3zKZmfKBWUVudaItddmUfGry',2,'5RiKEcFI8cxhK0X5k8K5syPWS2sbsoOXcLHU1atsIpfMefAU8n3OgoJFUV1E','2018-03-23 23:21:19','2018-03-23 23:21:19',1,1),(9,'student 2','student2@test.com','$2y$10$IuqZiBOBIl10i7gT.26iUOmVRcLbA9k2LZVmvhaqishbPXSwsZRhO',1,'wjlZyXBw3w6u20M0eZK8mkO7phBy7cgp38eQGss6LiZHtVMrRdL9U2rO1KFG','2018-03-24 04:24:58','2018-03-24 04:24:58',0,0),(10,'student 3','student3@test.com','$2y$10$ok5g3RV67tAaFfiegaz1POnTrrG2Y2dgrfaRVzKoMjGFvSAqsmG9i',1,'1fJUErLGhnaUH8KEsgKDwL0bhvx9yH7QAIzN2RaXfAHp7xEdhODYBa3RQXbC','2018-03-24 04:28:29','2018-03-24 04:28:29',0,0),(11,'anna','annacguthrie5@gmail.com','$2y$10$a974OGMituSDLhWMd6dPvu3.h0.jOczVvc2D2ofOlmk/Qi4IUEiQ2',1,NULL,'2018-05-04 23:26:26','2018-05-04 23:26:26',1,0),(12,'Matalyn T',2,'matalyn2@byu.edu','$2y$10$WZ726cA2USHejRMk2qj54e3QGri7get48esWgLhm9HjG6MRsECPhW','q5S7U8WZSGezoDejDC1cnyaPH8QztCNixvTrYejrsL68Dv3TkunNL1Juz6cA','2018-04-04 00:31:27','2018-04-04 00:31:27',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videos` (
  `video_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `character_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (18,2,2,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(22,1,3,'/video/test.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(28,4,3,'/video/test.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(32,3,1,'/video/junk.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(41,1,2,'/video/me.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(64,4,1,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(79,3,2,'/video/you.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(81,2,3,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(82,2,1,'/video/you.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59');
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki`
--

DROP TABLE IF EXISTS `wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki` (
  `wiki_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_1_ar` int(11) NOT NULL,
  `lang_2_ar` int(11) NOT NULL,
  PRIMARY KEY (`wiki_id`)
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
    SELECT s.day, s.subject, s.body, s.created_at, c.name AS c_name, u.name AS u_name FROM student_emails AS s
      INNER JOIN users AS u ON s.user_id = u.user_id
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
    SELECT * FROM student_artifacts
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

-- Dump completed on 2018-05-17 11:11:35

