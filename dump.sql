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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
INSERT INTO `artifacts` VALUES (1,'Ex quam sed sit cumque.','Iure id iusto odit ut.','https://lorempixel.com/640/480/?54709','2018-03-13 22:11:26','2018-03-13 22:11:26'),(2,'Enim quia inventore.','Fugiat nihil impedit nisi unde asperiores.','https://lorempixel.com/640/480/?57310','2018-03-13 22:11:26','2018-03-13 22:11:26'),(3,'Porro placeat ut quia expedita veniam.','Consequatur saepe eius odit.','https://lorempixel.com/640/480/?36680','2018-03-13 22:11:26','2018-03-13 22:11:26'),(4,'Aut magni rerum quia quo occaecati.','Ipsa illo in magnam sequi voluptas.','https://lorempixel.com/640/480/?95165','2018-03-13 22:11:26','2018-03-13 22:11:26'),(5,'Modi consequatur deleniti tempore.','Saepe dolorum sed voluptates voluptas.','https://lorempixel.com/640/480/?69030','2018-03-13 22:11:26','2018-03-13 22:11:26'),(6,'A rerum magni repellendus fugiat.','A soluta et eaque atque velit est.','https://lorempixel.com/640/480/?85900','2018-03-13 22:11:26','2018-03-13 22:11:26'),(7,'Error beatae consequuntur minima.','Omnis ea excepturi unde non et asperiores.','https://lorempixel.com/640/480/?79242','2018-03-13 22:11:26','2018-03-13 22:11:26'),(8,'Quasi deserunt culpa voluptas mollitia.','Aut sit et dicta impedit provident iure.','https://lorempixel.com/640/480/?12919','2018-03-13 22:11:26','2018-03-13 22:11:26'),(9,'Et reiciendis tenetur deleniti.','Ad reiciendis nemo sit in.','https://lorempixel.com/640/480/?14849','2018-03-13 22:11:26','2018-03-13 22:11:26'),(10,'Non omnis voluptatibus.','Enim eos et dolor aut velit.','https://lorempixel.com/640/480/?30480','2018-03-13 22:11:26','2018-03-13 22:11:26'),(11,'Et temporibus nam quia dolores ut.','Vitae voluptatem rem hic beatae rerum.','https://lorempixel.com/640/480/?76455','2018-03-13 22:11:26','2018-03-13 22:11:26'),(12,'Eaque odit perspiciatis voluptate.','Est ad veniam facilis nostrum voluptate ea.','https://lorempixel.com/640/480/?51289','2018-03-13 22:11:26','2018-03-13 22:11:26'),(13,'Est non eligendi vel vel.','Vero voluptatibus ab accusamus aut.','https://lorempixel.com/640/480/?85278','2018-03-13 22:11:26','2018-03-13 22:11:26'),(14,'Delectus eaque numquam maxime.','Ipsam accusantium aut beatae.','https://lorempixel.com/640/480/?19517','2018-03-13 22:11:26','2018-03-13 22:11:26'),(15,'Tempora accusamus fuga.','Animi quisquam voluptas voluptatem minima.','https://lorempixel.com/640/480/?69096','2018-03-13 22:11:26','2018-03-13 22:11:26'),(16,'Quae laboriosam aliquam occaecati natus.','Nam dolorem est qui voluptas laudantium.','https://lorempixel.com/640/480/?47898','2018-03-13 22:11:26','2018-03-13 22:11:26'),(17,'Ipsam quidem maxime temporibus voluptatum qui.','Quasi atque molestiae a vero commodi dolores.','https://lorempixel.com/640/480/?46520','2018-03-13 22:11:26','2018-03-13 22:11:26'),(18,'Id laboriosam non qui quo.','Dolorem tempore eligendi perspiciatis atque.','https://lorempixel.com/640/480/?85617','2018-03-13 22:11:26','2018-03-13 22:11:26'),(19,'Architecto adipisci dolor unde aut et.','Voluptates ratione quis consectetur et est sed.','https://lorempixel.com/640/480/?67824','2018-03-13 22:11:26','2018-03-13 22:11:26'),(20,'Et ducimus occaecati aliquam.','Dolor et error corrupti.','https://lorempixel.com/640/480/?35552','2018-03-13 22:11:26','2018-03-13 22:11:26'),(21,'Est ea quis ex.','Et ut molestias autem ut omnis.','https://lorempixel.com/640/480/?43810','2018-03-13 22:13:46','2018-03-13 22:13:46'),(22,'Voluptatem iure eaque.','Voluptatem ut minus dicta odio rerum.','https://lorempixel.com/640/480/?99034','2018-03-13 22:13:46','2018-03-13 22:13:46'),(23,'Quia dolor rem at.','Ut est nam enim voluptates enim sed autem.','https://lorempixel.com/640/480/?72806','2018-03-13 22:13:46','2018-03-13 22:13:46'),(24,'Voluptas placeat consequuntur.','Ullam at voluptates illum beatae sunt sequi.','https://lorempixel.com/640/480/?60177','2018-03-13 22:13:46','2018-03-13 22:13:46'),(25,'Eum blanditiis vel sed libero.','Voluptatem aut rerum ut libero repudiandae saepe.','https://lorempixel.com/640/480/?70015','2018-03-13 22:13:46','2018-03-13 22:13:46'),(26,'Praesentium pariatur repellat aspernatur.','In amet sed vel nisi incidunt laudantium autem.','https://lorempixel.com/640/480/?13451','2018-03-13 22:13:46','2018-03-13 22:13:46'),(27,'Ea ut minus et et.','Quo et eos tempora totam modi libero ea esse.','https://lorempixel.com/640/480/?83407','2018-03-13 22:13:46','2018-03-13 22:13:46'),(28,'Quibusdam sapiente omnis necessitatibus pariatur.','Quo sequi labore autem.','https://lorempixel.com/640/480/?52977','2018-03-13 22:13:46','2018-03-13 22:13:46'),(29,'Perspiciatis molestias unde expedita ut.','Aspernatur et veritatis eaque omnis ad est.','https://lorempixel.com/640/480/?48703','2018-03-13 22:13:46','2018-03-13 22:13:46'),(30,'Quaerat et non veritatis.','Natus beatae adipisci ratione alias accusamus.','https://lorempixel.com/640/480/?45827','2018-03-13 22:13:46','2018-03-13 22:13:46'),(31,'Quidem quia iste.','Assumenda modi voluptate voluptate commodi.','https://lorempixel.com/640/480/?60278','2018-03-13 22:13:46','2018-03-13 22:13:46'),(32,'Cupiditate est ut nemo quas.','Accusantium ullam maxime delectus quia harum.','https://lorempixel.com/640/480/?87191','2018-03-13 22:13:46','2018-03-13 22:13:46'),(33,'Accusantium alias hic.','Et alias tenetur culpa doloremque a.','https://lorempixel.com/640/480/?10436','2018-03-13 22:13:46','2018-03-13 22:13:46'),(34,'Veniam repellat facilis eum.','Quo qui hic odio.','https://lorempixel.com/640/480/?12455','2018-03-13 22:13:46','2018-03-13 22:13:46'),(35,'Molestias commodi et molestias numquam sit.','Consequatur ut voluptas ex velit et et quam.','https://lorempixel.com/640/480/?82360','2018-03-13 22:13:46','2018-03-13 22:13:46'),(36,'Molestiae quo quo est.','Autem pariatur amet sapiente iste.','https://lorempixel.com/640/480/?36978','2018-03-13 22:13:46','2018-03-13 22:13:46'),(37,'Fugit quia nisi voluptas.','Iste facere ex repellendus nam perferendis et.','https://lorempixel.com/640/480/?60357','2018-03-13 22:13:46','2018-03-13 22:13:46'),(38,'Molestiae doloremque ad.','Quia vero voluptatem est quam hic at atque.','https://lorempixel.com/640/480/?31843','2018-03-13 22:13:46','2018-03-13 22:13:46'),(39,'Ab odit porro aut.','Unde ut vitae iusto ab. Velit quasi et sit ut.','https://lorempixel.com/640/480/?16926','2018-03-13 22:13:46','2018-03-13 22:13:46'),(40,'Officiis ad non rem facilis velit.','Omnis eius in eos ut eum sed.','https://lorempixel.com/640/480/?11012','2018-03-13 22:13:46','2018-03-13 22:13:46');
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call`
--

LOCK TABLES `call` WRITE;
/*!40000 ALTER TABLE `call` DISABLE KEYS */;
INSERT INTO `call` VALUES (4,3,2,'/video/junk.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(5,1,4,'/video/me.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(21,2,3,'/video/fun.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(27,1,2,'/video/fun.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(36,3,4,'/video/me.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(38,2,1,'/video/you.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(47,2,4,'/video/junk.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(88,1,1,'/video/fun.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46'),(98,1,3,'/video/test.mp4','2018-03-13 22:13:46','2018-03-13 22:13:46');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_email`
--

LOCK TABLES `character_email` WRITE;
/*!40000 ALTER TABLE `character_email` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_23_193209_createSimulationTable',2),(4,'2018_01_30_205641_CreateEmailTable',3),(5,'2018_01_31_211121_create_artifacts_table',4),(6,'2018_02_16_161514_create_languages_table',4),(7,'2018_02_16_165458_create_wiki_table',5),(8,'2018_02_16_165730_create_article_table',6),(9,'2018_02_23_163617_create_chat_table',7),(10,'2018_02_23_221031_create_channel_table',8),(11,'2018_02_26_173005_create_notes_table',9),(12,'2018_02_26_173654_create_characters_table',10),(13,'2018_02_26_175241_create_video_table',11),(14,'2018_03_08_231840_update_video_table',12),(15,'2018_03_09_153947_create_call_table',13),(16,'2018_03_09_154209_create_question_table',13),(17,'2018_03_14_165128_create_character_email_table',14),(18,'2018_03_14_165143_create_student_email_table',14),(19,'2018_03_14_171240_add_character_email_id_column_to_student_email_table',14),(20,'2018_03_16_193814_add_character_img_to_character_table',14);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (6,'2006-10-06 09:04:09','2018-03-13 22:13:46','Quam provident vero id voluptatem. Aut et ipsam unde ut illo. Non sint quaerat cum commodi in.',5),(9,'2008-06-20 07:29:26','2018-03-13 22:13:46','Aliquam neque aliquam esse doloribus non neque. Deleniti sunt aut repellat eius amet alias illo. tst est test will this stick? teste',2),(11,'1980-06-19 02:04:13','2018-03-13 22:13:46','Repudiandae sunt sint possimus omnis est. Nisi rerum nam accusamus. Et eveniet nihil laborum culpa.',5),(14,'1992-03-29 17:22:26','2018-03-13 22:13:46','Repellendus quos cupiditate deserunt eum possimus. Cum tempore quibusdam blanditiis et vel.',9),(16,'1984-06-26 01:54:12','2018-03-13 22:13:46','Sed sit quo rem. Quos ea earum facere occaecati ullam.',4),(19,'1972-11-20 15:29:18','2018-03-13 22:13:46','Non nam laudantium aliquid maiores quia ex. Velit est corporis vitae.',7),(23,'1980-02-29 03:47:15','2018-03-13 22:13:46','Sit sunt nulla beatae sit. Rem minima unde temporibus enim voluptate. Impedit ex cumque aut sed.',3),(30,'2004-06-25 03:23:57','2018-03-13 22:13:46','Minus et deserunt et in deleniti nulla. Consequuntur quidem iusto itaque esse voluptatum voluptas.',5),(32,'1985-11-30 03:53:59','2018-03-13 22:13:46','Occaecati commodi debitis quam qui sint. Non aut non praesentium quidem itaque debitis labore.',9),(33,'2007-12-14 06:44:35','2018-03-13 22:13:46','Sint quas qui explicabo eius reprehenderit sed nihil. Provident maxime sint consequuntur quo.',9),(50,'1999-10-06 07:56:08','2018-03-13 22:13:46','Autem non minus doloremque. Autem ratione quisquam sapiente quis nam eaque. Iure qui et molestias.',4),(55,'2002-09-28 08:00:41','2018-03-13 22:13:46','Quia enim et eum eum. Ad quo doloremque ipsam qui provident. Est molestiae et voluptate qui.',5),(60,'1982-01-26 20:30:34','2018-03-13 22:13:46','Accusantium quia eius qui sequi qui. Labore fugit illo voluptatem quia minus ex impedit.',7),(73,'2016-05-20 05:13:14','2018-03-13 22:13:46','Sit qui qui et rerum. Porro rem dolore tempora quae eaque aperiam.',8),(75,'1996-05-03 14:04:46','2018-03-13 22:13:46','Incidunt dolores et officia. Corrupti sint porro culpa. Ut dolores id ut veritatis.',4),(79,'2016-05-09 17:58:17','2018-03-13 22:13:46','Eveniet aperiam odio quo est laboriosam animi ea possimus. Quas voluptas minus voluptate et neque.',3),(93,'1999-12-25 22:33:46','2018-03-13 22:13:46','Provident sunt consequatur quae molestiae voluptatem. Quibusdam fugit neque sed.',5),(94,'1976-11-26 14:27:31','2018-03-13 22:13:46','Aspernatur magnam eos iusto voluptatem rerum. Nesciunt animi expedita illum ut omnis.',3),(99,'1996-02-25 02:58:07','2018-03-13 22:13:46','Est qui et non. Rem et totam voluptatibus cupiditate. Nihil aspernatur ratione et placeat.',6);
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
INSERT INTO `question` VALUES (1,4,'Day 1, call 1, question 1',20,30,'2018-03-09 23:11:50',NULL),(2,4,'Day 1, call 1, question 2',35,50,'2018-03-09 23:11:50',NULL),(3,5,'Day 1, call 1, question 3',55,80,'2018-03-09 23:11:50',NULL),(4,5,'Day 1, call 2, question 1',20,30,'2018-03-09 23:11:50',NULL),(5,5,'Day 1, call 2, question 2',60,80,'2018-03-09 23:11:50',NULL),(6,21,'Day 2, call 1, question 1',10,30,'2018-03-09 23:11:50',NULL),(7,27,'Day 2, call 1, question 2',45,70,'2018-03-09 23:11:50',NULL),(8,88,'Day 2, call 2, question 1',10,40,'2018-03-09 23:11:50',NULL),(9,38,'Day 2, call 2, question 2',41,50,'2018-03-09 23:11:50',NULL);
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
  PRIMARY KEY (`student_email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_email`
--

LOCK TABLES `student_email` WRITE;
/*!40000 ALTER TABLE `student_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_email` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dan','de6eling@gmail.com','$2y$10$K.a/gbbcosHWKgwBqEiZSuabVZNxzjTRVlSnx0ezB/F3wf5MzaA6O',1,'T2ZfpjCm132B6wZL0G96LQ1iPQblpdlarkYjNdjkDXJkqzQ7ECKBkfYGKI2U','2018-01-11 01:04:23','2018-01-11 01:04:23'),(2,'Matalyn T','matalyn2@byu.edu','$2y$10$1aHdSOfpmkxuq3lqe57Kv.wsVxXiOxU724iqgjWEOjh44FMW1/UN2',3,NULL,'2018-03-12 23:15:48','2018-03-12 23:15:48');
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
  `call_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (4,1,2,'/video/fun.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(8,2,1,'/video/you.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(13,2,2,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(14,3,1,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(15,3,3,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(18,2,3,'/video/you.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(20,1,3,'/video/fun.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(23,4,1,'/video/test.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14'),(39,4,2,'/video/me.mp4','2018-03-09 15:06:14','2018-03-09 15:06:14');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_submissions`
--

DROP TABLE IF EXISTS `video_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_submissions` (
  `submission_id` int(11) NOT NULL AUTO_INCREMENT,
  `video` varchar(255) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `character_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`submission_id`),
  UNIQUE KEY `video_submissions_submission_id_uindex` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_submissions`
--

LOCK TABLES `video_submissions` WRITE;
/*!40000 ALTER TABLE `video_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_submissions` ENABLE KEYS */;
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

-- Dump completed on 2018-04-03  9:28:39
