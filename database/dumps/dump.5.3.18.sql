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
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (9,1,'Civil War','# Civil War<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,NULL),(10,2,'Guerra Civil','# Guerra Civil<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid 13\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Edificio 1\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,'2018-05-02 15:42:25'),(11,1,'Test English','# Test English<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,NULL),(12,2,'Test Spanish','# Test Spanish<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid 2\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building 2\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.',NULL,NULL);
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
INSERT INTO `artifacts` VALUES (1,'Sint at qui.','Natus impedit voluptate est harum minima.','https://lorempixel.com/640/480/?86019','2018-04-04 00:30:59','2018-04-04 00:30:59'),(2,'Sit dolores odio tenetur nihil.','Cupiditate ea quia occaecati alias non quia.','https://lorempixel.com/640/480/?93504','2018-04-04 00:30:59','2018-04-04 00:30:59'),(3,'Optio aliquid delectus voluptas.','Ut et magnam recusandae consequatur laborum.','https://lorempixel.com/640/480/?62136','2018-04-04 00:30:59','2018-04-04 00:30:59'),(4,'Libero dignissimos doloremque veritatis atque.','Ut quia eligendi vel voluptates et hic.','https://lorempixel.com/640/480/?47748','2018-04-04 00:30:59','2018-04-04 00:30:59'),(5,'Ut rerum vero numquam consequatur.','Quia necessitatibus inventore quos fugiat.','https://lorempixel.com/640/480/?38420','2018-04-04 00:30:59','2018-04-04 00:30:59'),(6,'Nihil occaecati voluptate optio ut quia.','Quos repudiandae et sit quam.','https://lorempixel.com/640/480/?13389','2018-04-04 00:30:59','2018-04-04 00:30:59'),(7,'A minima soluta animi illum.','Nisi totam laborum nemo tempore porro.','https://lorempixel.com/640/480/?21971','2018-04-04 00:30:59','2018-04-04 00:30:59'),(8,'Ut est repellendus qui sunt doloremque.','Nihil aspernatur sint non.','https://lorempixel.com/640/480/?41889','2018-04-04 00:30:59','2018-04-04 00:30:59'),(9,'Veritatis recusandae consectetur dolores quos.','Cumque velit necessitatibus sapiente velit ut.','https://lorempixel.com/640/480/?79410','2018-04-04 00:30:59','2018-04-04 00:30:59'),(10,'Pariatur et tempore rerum qui error.','Cumque ad numquam nihil et deleniti ratione.','https://lorempixel.com/640/480/?33134','2018-04-04 00:30:59','2018-04-04 00:30:59'),(11,'Nemo nihil quisquam consequuntur.','Cupiditate mollitia iste porro ab.','https://lorempixel.com/640/480/?80851','2018-04-04 00:30:59','2018-04-04 00:30:59'),(12,'Ratione optio delectus itaque eligendi tempora.','Error illum voluptatibus necessitatibus.','https://lorempixel.com/640/480/?36919','2018-04-04 00:30:59','2018-04-04 00:30:59'),(13,'Et laborum est.','Amet facilis nisi eaque aut.','https://lorempixel.com/640/480/?99516','2018-04-04 00:30:59','2018-04-04 00:30:59'),(14,'Est odit sint.','Inventore sunt amet rerum ea facere.','https://lorempixel.com/640/480/?31693','2018-04-04 00:30:59','2018-04-04 00:30:59'),(15,'Et magnam optio.','Deleniti modi autem nam minus perferendis qui.','https://lorempixel.com/640/480/?68035','2018-04-04 00:30:59','2018-04-04 00:30:59'),(16,'Soluta ex enim delectus qui.','Voluptas sed sit magnam et ipsa non eos.','https://lorempixel.com/640/480/?38639','2018-04-04 00:30:59','2018-04-04 00:30:59'),(17,'Itaque ut officia nisi sit.','Voluptatem laboriosam autem est dignissimos.','https://lorempixel.com/640/480/?75707','2018-04-04 00:30:59','2018-04-04 00:30:59'),(18,'Cupiditate sit ut quaerat corrupti.','Sit dolorem nisi et neque deserunt nihil.','https://lorempixel.com/640/480/?97152','2018-04-04 00:30:59','2018-04-04 00:30:59'),(19,'Quaerat ducimus accusantium quia ut.','Similique molestiae et et minus omnis et sint.','https://lorempixel.com/640/480/?28579','2018-04-04 00:30:59','2018-04-04 00:30:59'),(20,'Molestiae eum tempore et.','Amet expedita et qui sit vero debitis.','https://lorempixel.com/640/480/?46878','2018-04-04 00:30:59','2018-04-04 00:30:59'),(21,'Dignissimos quia voluptatem et nihil.','Sapiente repudiandae voluptatibus et autem.','https://lorempixel.com/640/480/?96936','2018-04-24 23:28:28','2018-04-24 23:28:28'),(22,'Ut facere consequatur.','Aut earum occaecati eligendi asperiores vel.','https://lorempixel.com/640/480/?54976','2018-04-24 23:28:28','2018-04-24 23:28:28'),(23,'Earum autem voluptatem esse quibusdam eveniet.','Aut ex quis consequuntur dicta eius cupiditate.','https://lorempixel.com/640/480/?73690','2018-04-24 23:28:28','2018-04-24 23:28:28'),(24,'Omnis ullam omnis.','Autem quo maxime laborum laboriosam voluptatem.','https://lorempixel.com/640/480/?24307','2018-04-24 23:28:28','2018-04-24 23:28:28'),(25,'Odio quae commodi.','Fuga facilis dignissimos ad.','https://lorempixel.com/640/480/?90990','2018-04-24 23:28:28','2018-04-24 23:28:28'),(26,'Est quis vel explicabo.','Quia dolor mollitia saepe repellat est nihil.','https://lorempixel.com/640/480/?96137','2018-04-24 23:28:28','2018-04-24 23:28:28'),(27,'Sunt nostrum eum ducimus tenetur.','Laudantium possimus deserunt est.','https://lorempixel.com/640/480/?80881','2018-04-24 23:28:28','2018-04-24 23:28:28'),(28,'Aliquid itaque totam assumenda.','Ut aut tenetur a quasi.','https://lorempixel.com/640/480/?93076','2018-04-24 23:28:28','2018-04-24 23:28:28'),(29,'Omnis corrupti harum ullam ab.','Iure qui voluptas facilis ut.','https://lorempixel.com/640/480/?44257','2018-04-24 23:28:28','2018-04-24 23:28:28'),(30,'Veniam temporibus doloremque sapiente minus.','Est autem fugiat aspernatur.','https://lorempixel.com/640/480/?73369','2018-04-24 23:28:28','2018-04-24 23:28:28'),(31,'Iste ut voluptas ut eum.','Est adipisci aspernatur rem.','https://lorempixel.com/640/480/?21062','2018-04-24 23:28:28','2018-04-24 23:28:28'),(32,'Eius voluptatem sed omnis.','Ut dolores a placeat id quidem dolorem.','https://lorempixel.com/640/480/?60742','2018-04-24 23:28:28','2018-04-24 23:28:28'),(33,'Consequatur et est consequatur.','Molestias laudantium in non.','https://lorempixel.com/640/480/?85608','2018-04-24 23:28:28','2018-04-24 23:28:28'),(34,'Omnis fugit excepturi ut molestiae.','Ducimus velit delectus et neque deserunt nemo.','https://lorempixel.com/640/480/?97777','2018-04-24 23:28:28','2018-04-24 23:28:28'),(35,'A vel excepturi.','Ut commodi ut quia voluptatem tempore quis.','https://lorempixel.com/640/480/?18570','2018-04-24 23:28:28','2018-04-24 23:28:28'),(36,'Minima pariatur qui.','Sapiente et perspiciatis qui ea id.','https://lorempixel.com/640/480/?16732','2018-04-24 23:28:28','2018-04-24 23:28:28'),(37,'Atque reprehenderit ullam est expedita et.','Sit minus eos quia ad vitae.','https://lorempixel.com/640/480/?94430','2018-04-24 23:28:28','2018-04-24 23:28:28'),(38,'Praesentium molestiae neque consequatur.','Nesciunt eos quis quia et et natus molestiae.','https://lorempixel.com/640/480/?26786','2018-04-24 23:28:28','2018-04-24 23:28:28'),(39,'Laudantium omnis ab aliquid.','Iusto modi dolorem aliquam.','https://lorempixel.com/640/480/?16183','2018-04-24 23:28:28','2018-04-24 23:28:28'),(40,'Error quisquam adipisci.','Porro et odit consequatur accusamus ut sunt.','https://lorempixel.com/640/480/?74685','2018-04-24 23:28:28','2018-04-24 23:28:28');
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
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
INSERT INTO `character_email` VALUES (1,'Day 1 Character 1','This email is from the first character on the first day',1,1,0,0,0,'2018-04-24 17:28:17',NULL),(2,'Day 1 Character 2','This email is from the second character on the first day',1,2,0,0,0,'2018-04-24 17:28:17',NULL),(3,'Day 1 Character 3','This email is from the third character on the first day',1,3,0,0,0,'2018-04-24 17:28:17',NULL),(4,'Day 2 Character 1','This email is from the first character on the second day',2,1,0,0,0,'2018-04-24 17:28:17',NULL),(5,'Day 2 Character 2','This email is from the second character on the second day',2,2,0,0,0,'2018-04-24 17:28:17',NULL),(6,'Day 2 Character 3','This email is from the third character on the second day',2,3,0,0,0,'2018-04-24 17:28:17',NULL);
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
  `channel_id` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `character_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
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
INSERT INTO `class` VALUES (1,'Test Class 1','test_class_1','2018-04-24 17:25:54',NULL),(2,'Test Class 2','test_class_2','2018-04-24 17:25:54',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
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
INSERT INTO `gallery` VALUES (1,'Gallery 1 Title','This is the description','/images/gallery/gallery01.png','2018-05-03 19:22:42',NULL),(2,'Gallery 2 Title','This is the description','/images/gallery/gallery02.png','2018-05-03 19:22:42',NULL),(3,'Gallery 3 Title','This is the description','/images/gallery/gallery03.png','2018-05-03 19:22:42',NULL),(4,'Gallery 4 Title','This is the description','/images/gallery/gallery04.png','2018-05-03 19:22:42',NULL),(5,'Gallery 5 Title','This is the description','/images/gallery/gallery05.png','2018-05-03 19:22:42',NULL),(6,'Gallery 6 Title','This is the description','/images/gallery/gallery06.png','2018-05-03 19:22:42',NULL),(7,'Gallery 7 Title','This is the description','/images/gallery/gallery07.png','2018-05-03 19:22:42',NULL),(8,'Gallery 8 Title','This is the description','/images/gallery/gallery08.png','2018-05-03 19:22:42',NULL),(9,'Gallery 9 Title','This is the description','/images/gallery/gallery09.png','2018-05-03 19:22:42',NULL),(10,'Gallery 10 Title','This is the description','/images/gallery/gallery10.png','2018-05-03 19:22:42',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_23_193209_createSimulationTable',1),(4,'2018_01_30_205641_CreateEmailTable',1),(5,'2018_01_31_211121_create_artifacts_table',1),(6,'2018_02_16_161514_create_languages_table',1),(7,'2018_02_16_165458_create_wiki_table',1),(8,'2018_02_16_165730_create_article_table',1),(9,'2018_02_23_163617_create_chat_table',1),(10,'2018_02_23_221031_create_channel_table',1),(11,'2018_02_26_173654_create_characters_table',1),(12,'2018_03_14_165128_create_character_email_table',1),(13,'2018_03_14_165143_create_student_email_table',1),(14,'2018_03_14_171240_add_character_email_id_column_to_student_email_table',1),(15,'2018_03_16_193814_add_character_img_to_character_table',1),(16,'2018_03_19_164845_create_student_task_table',1),(17,'2018_03_23_142605_create_group_table',1),(18,'2018_03_23_142635_create_user_has_group_table',1),(19,'2018_03_23_142838_create_class_table',1),(20,'2018_03_23_142902_create_user_has_class_table',1),(21,'2018_03_23_143340_create_class_has_group_table',1),(22,'2018_03_23_144144_create_instructor_has_class_table',1),(23,'2018_03_23_144552_add_role_column_to_users_table',1),(24,'2018_04_03_163459_gallery__master',1),(25,'2018_04_03_173712_video_call_master',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `notes_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`notes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (2,'1974-12-29 15:00:18','2018-04-04 00:30:59','Unde vero eveniet et ut. Est voluptatibus ipsum quos sed in.',2),(12,'1994-04-29 01:03:15','2018-04-04 00:30:59','Quasi earum dolores exercitationem qui. Quos aut illo omnis illum dolor impedit eos.',7),(14,'1987-09-05 09:11:12','2018-04-04 00:30:59','Quam ea sit totam. Animi nobis provident tenetur.',4),(20,'1997-07-09 03:22:04','2018-04-04 00:30:59','Autem tempora ab atque non atque quis. Eaque beatae mollitia aut.',5),(29,'1981-09-07 21:14:01','2018-04-04 00:30:59','Ratione eius est et reprehenderit qui aliquam et. Autem rerum in repudiandae a sint repellat unde.',7),(36,'1980-05-28 02:32:09','2018-04-04 00:30:59','Cumque et vel labore. Et nobis est voluptatem.',4),(44,'1989-08-22 19:37:04','2018-04-04 00:30:59','Dolor laudantium vel vero odio est voluptas sed sequi. Sit voluptas quia et esse laborum.',7),(45,'1993-12-29 08:06:53','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test',1),(47,'1982-01-03 15:37:29','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test',1),(48,'1993-02-17 04:08:54','2018-04-04 00:30:59','Eaque minima blanditiis quod amet harum nemo. Et eum voluptatem minima maiores.',5),(54,'1975-01-04 03:52:12','2018-04-04 00:30:59','Quod eum eum velit. Facere facilis quas sint repellendus optio.',4),(57,'2005-12-06 07:27:38','2018-04-04 00:30:59','Sit similique omnis officiis ipsa nulla. Temporibus minima commodi rerum ea et odio.',2),(58,'1996-04-24 09:34:09','2018-04-04 00:30:59','Et non sunt unde. Quo modi et voluptatem.',9),(65,'1992-10-05 00:28:46','2018-04-04 00:30:59','Aut eius neque aut nobis. Asperiores error incidunt quo cum ut odit. Qui nam nisi expedita odit. test test',1),(68,'1979-04-29 19:16:58','2018-04-04 00:30:59','Quis in sed ipsam nostrum enim. Modi consequatur aperiam qui corrupti quia.',4),(73,'1974-07-10 02:19:37','2018-04-04 00:30:59','Quos repudiandae molestiae aut ut tenetur enim nisi. Recusandae ipsam ut dolorem aut.',8),(74,'1971-11-10 20:15:15','2018-04-04 00:30:59','Aut tempore nulla deleniti nemo aperiam sit et. Et dolorem repudiandae unde.',3),(87,'2011-10-12 15:29:28','2018-04-04 00:30:59','Maxime et vel id aut. Quo dicta incidunt quia nisi vel.',5),(91,'1985-04-22 11:31:04','2018-04-04 00:30:59','Veniam adipisci omnis qui rerum. Cumque iure rem et sequi.',9),(95,'2000-06-19 07:52:11','2018-04-04 00:30:59','Autem dolorem quod quibusdam minus quia. At repellat ut temporibus sed praesentium omnis.',7);
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
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (3,86,'Soluta qui ut sapiente.',17,731,'2015-03-06 20:06:40','2018-04-04 00:30:59',1,120,NULL),(5,26,'Provident aut non amet.',37,964,'2005-05-14 21:10:47','2018-04-04 00:30:59',0,0,NULL),(7,81,'Iste in ab neque magnam.',58,207,'2007-01-04 09:03:22','2018-04-04 00:30:59',1,90,NULL),(9,60,'Quis aut ea facilis.',65,373,'2003-11-26 05:27:29','2018-04-04 00:30:59',0,0,NULL),(17,51,'Odit modi at quo.',35,890,'1974-06-23 09:02:26','2018-04-04 00:30:59',0,0,NULL),(27,34,'Sed rerum aut et.',21,575,'1993-03-08 10:46:51','2018-04-04 00:30:59',0,0,NULL),(39,32,'Autem esse iste aut.',47,696,'2005-08-16 01:54:51','2018-04-04 00:30:59',1,60,NULL),(46,86,'Est quo a non possimus.',97,949,'2001-05-04 19:46:24','2018-04-04 00:30:59',0,0,NULL),(55,51,'Eum est est vel.',20,377,'1975-09-19 08:16:04','2018-04-04 00:30:59',1,30,NULL),(59,41,'Quia quod facere eum at.',62,323,'1999-11-19 15:31:16','2018-04-04 00:30:59',0,0,NULL),(61,8,'Et unde et et.',63,420,'2008-01-15 04:50:23','2018-04-04 00:30:59',0,0,NULL),(62,60,'Id nihil repellat non.',75,719,'2003-01-21 20:06:01','2018-04-04 00:30:59',0,0,NULL),(69,26,'Eos libero velit veniam.',88,611,'1981-12-26 07:08:57','2018-04-04 00:30:59',1,0,NULL),(71,49,'Et est ea atque qui.',82,411,'1995-11-11 09:34:33','2018-04-04 00:30:59',0,0,NULL),(80,8,'Qui ut voluptatibus sed.',62,976,'2001-11-03 06:59:57','2018-04-04 00:30:59',1,90,NULL),(89,64,'Eos qui neque quia.',93,440,'2005-09-23 09:57:02','2018-04-04 00:30:59',1,120,NULL),(90,81,'Vel et asperiores enim.',44,990,'1974-01-22 21:12:23','2018-04-04 00:30:59',0,0,NULL),(94,28,'Impedit sed sint magnam.',76,372,'1997-03-05 14:10:39','2018-04-04 00:30:59',0,0,NULL),(97,19,'Sunt et vel vel autem.',45,908,'1976-06-11 20:13:37','2018-04-04 00:30:59',0,0,NULL),(98,41,'Nisi sed in non.',0,5,'2005-08-03 05:27:59','2018-04-04 00:30:59',1,10,99),(99,41,NULL,6,10,NULL,NULL,0,0,NULL);
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
INSERT INTO `simulation` VALUES (3,'2018-01-24 02:36:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_email`
--

LOCK TABLES `student_email` WRITE;
/*!40000 ALTER TABLE `student_email` DISABLE KEYS */;
INSERT INTO `student_email` VALUES (1,1,1,'Test','Blah','2','2018-04-04 15:24:12',NULL,0),(2,1,1,'test','test','3','2018-04-18 18:12:31',NULL,0),(3,1,2,'estes','test','4','2018-04-24 22:22:05',NULL,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_gallery`
--

LOCK TABLES `student_gallery` WRITE;
/*!40000 ALTER TABLE `student_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_gallery` ENABLE KEYS */;
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
  `complete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_task`
--

LOCK TABLES `student_task` WRITE;
/*!40000 ALTER TABLE `student_task` DISABLE KEYS */;
INSERT INTO `student_task` VALUES (6,1,0,'2018-04-19 19:49:55','2018-04-27 16:06:50'),(1,1,1,'2018-04-23 21:08:29','2018-05-01 22:28:23'),(2,1,1,'2018-04-23 21:08:29','2018-05-01 22:28:22'),(4,1,1,'2018-04-24 16:29:29','2018-05-02 22:25:58'),(5,1,1,'2018-04-24 16:29:30','2018-05-02 22:25:59'),(3,1,1,'2018-04-27 17:01:39','2018-05-01 22:28:22'),(7,1,0,'2018-04-27 17:01:39','2018-05-02 16:08:45');
/*!40000 ALTER TABLE `student_task` ENABLE KEYS */;
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
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`submission_id`),
  UNIQUE KEY `student_video_submissions_submission_id_uindex` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_video_submissions`
--

LOCK TABLES `student_video_submissions` WRITE;
/*!40000 ALTER TABLE `student_video_submissions` DISABLE KEYS */;
INSERT INTO `student_video_submissions` VALUES (106,'/public/storage/video-ZeDa.webm',2,1,1,'2018-05-03 23:53:25',98),(107,'/public/storage/video-vkHJ.webm',2,1,1,'2018-05-03 23:55:10',98),(108,'/public/storage/video-eLlR.webm',2,1,1,'2018-05-03 23:56:22',98);
/*!40000 ALTER TABLE `student_video_submissions` ENABLE KEYS */;
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
INSERT INTO `user_has_group` VALUES (1,1),(2,1),(3,1);
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
  `current_day` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Matalyn T',1,'matalyn2@byu.edu','$2y$10$WZ726cA2USHejRMk2qj54e3QGri7get48esWgLhm9HjG6MRsECPhW','RSXu4YNIOZEW8YHSEZHD2TrO0KJOnZ7nCv4KkYBSszvh7sIsaitQzr9lMxBm','2018-04-04 00:31:27','2018-04-04 00:31:27',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
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
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (18,2,2,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(22,1,3,'/video/test.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(28,4,3,'/video/test.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(32,3,1,'/video/junk.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(41,1,2,'/video/me.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(64,4,1,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(79,3,2,'/video/you.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(81,2,3,'/video/fun.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59'),(82,2,1,'/video/you.mp4','2018-04-04 00:30:59','2018-04-04 00:30:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki`
--

LOCK TABLES `wiki` WRITE;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` VALUES (5,9,10),(6,11,12);
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

-- Dump completed on 2018-05-03 13:30:41
