
-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: vuesim_v2
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (9,1,'Civil War','# Guerra Civil<hr>\nNunc at nisi non tortor molestie fermentum ut in est. Nunc elit velit, euismod vehicula mi at, iaculis rutrum velit. Donec sagittis, urna ac blandit tempor, orci turpis gravida dolor, ac sagittis augue sapien et erat. Maecenas maximus sem eget pellentesque auctor. Nulla sed nisi et sem porta sodales id ac ante. Praesent pharetra quam in lacus gravida efficitur. Donec elementum augue sit amet nisl interdum, at finibus ante finibus. Suspendisse fringilla volutpat ultrices.\n## Madrid\n<img src=\"http://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/201412-a-decoder-madrid.jpg?itok=5QYmpQgP\" style=\"max-width:100%\" alt=\"Madrid\">\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris mi quam, sodales eu tempus ac, aliquam in odio. Etiam tincidunt pellentesque libero, eu gravida urna porttitor vitae. Vivamus tristique pellentesque dui sed posuere. Phasellus lectus augue, condimentum ut libero nec, egestas fermentum dolor. Praesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus. Pellentesque nec velit tincidunt, congue eros sed, bibendum turpis. Etiam fermentum, lectus in gravida congue, leo lorem congue erat, sit amet fringilla dolor enim sit amet augue. Donec vestibulum blandit augue, quis pretium arcu sollicitudin at. Donec velit erat, interdum semper nunc sed, efficitur interdum erat. Integer non nulla ac urna ullamcorper consequat ac eu tortor.\n### Building\nPraesent euismod dui lorem, vel bibendum mauris varius ut. Pellentesque vehicula ut urna sit amet ultricies. Donec tristique volutpat sagittis. Aenean efficitur iaculis diam a posuere. Proin placerat bibendum convallis. Pellentesque a ante quis dui elementum vehicula. Phasellus hendrerit consequat laoreet. Etiam vel tortor auctor, gravida augue fermentum, maximus mi.\n## Barcelona\n<img src=\"http://www.castlexperience.com/wp-content/uploads/2017/03/barcelona1.jpg\" style=\"max-width:100%\" alt=\"Barcelona\">\nPraesent finibus tellus eget ultricies facilisis. Pellentesque et commodo ipsum, eu feugiat neque. Praesent volutpat sollicitudin lorem. Nam maximus mollis massa, ut aliquam ante aliquam ut. Integer nec nunc ante. Vivamus dignissim diam in finibus facilisis. Nulla elit urna, accumsan eu urna rhoncus, dignissim blandit purus.',NULL,'2018-05-23 16:06:29'),(13,NULL,'¿Cómo empezó la Guerra Civil Española?','<img src=\"/images/gallery/Artifact_41.png\" style=\"max-width:100%\" alt=\"Madrid\">\n<br>\nEl mismo año 1936 se celebraron elecciones generales en España, exactamente el 16 de febrero de 1936. A estas elecciones se presentaron muchos partidos políticos tanto de izquierdas como de derechas. El Frente Popular, la coalición de izquierdas que englobaba tanto al Partido Socialista Obrero Español como al Partido Comunista, Izquierda Republicana y otros tantos, consiguió la mayoría absoluta. Pero, ¿cómo comenzó exactamente la Guerra Civil Española?\n\nTras la victoria del bando de izquierda continuaron una serie de acciones terroristas que pretendían movilizar a la masa contra el gobierno, en el caso de los atentados de los falangistas y grupos de derecha, y para responder a los primeros en el caso de los grupos de izquierdas. Solo en el mes de febrero ya se contabilizaban por centenares los fallecidos en este tipo de acciones contra la situación política, social y económica del país.\n\nEn los meses sucesivos el panorama social y militar de España fue, de todo, menos tranquilo. Varios altos mandos militares planearon durante meses una posible sublevación frente al gobierno republicano que se haría efectiva el 17 de julio de 1936 y los días sucesivos. Pero, ¿qué hizo que los militares se alzaran justo ese día?\n\nEl 16 de abril de 1936 uno de los hombres de José Castillo, un instructor de las milicias de la juventud socialista, asesinó a Andrés Sáenz de Heredia, primo del mismísimo José Antonio Primo de Rivera. Como represalia el 12 de julio fue asesinado el propio José Castillo. Este hecho desencadenó la venganza de la izquierda que terminó con la vida del diputado de Renovación Española, José Calvo Sotelo, al mismo día siguiente. Este asesinato del líder de la derecha terminó por decantar la balanza de los indecisos al golpe de estado (entre los que, según Paul Preston, se encontraba el propio Franco) a llevar a cabo una acción que conllevaría un conflicto bélico en nuestro país.\n\nAsí comenzaría la Guerra Civil Española que duraría hasta el 1 de abril de 1939 con la victoria del bando nacional con el general Francisco Franco a la cabeza. Él mismo tomaría las riendas de España bajo un régimen dictatorial hasta su muerte el 20 de noviembre de 1975.',NULL,'2018-05-23 20:24:19'),(15,NULL,'Guerra Civil Española​','## Video\n<a href=\"http://www.youtube.com/watch?feature=player_embedded&v=FnaNdxVPhrk\n\" target=\"_blank\"><img src=\"http://img.youtube.com/vi/FnaNdxVPhrk/0.jpg\" \nalt=\"/images/gallery/Atifact_32.jpg\"  border=\"10\" /></a>',NULL,'2018-05-23 20:25:12');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifacts`
--

LOCK TABLES `artifacts` WRITE;
/*!40000 ALTER TABLE `artifacts` DISABLE KEYS */;
INSERT INTO `artifacts` VALUES (11,'Recuerdos de Pandora: Mujer dispuesta a luchar (Barcelona 1936)',' A woman holding a rifle standing on a cannon at the beginning of the war','/images/gallery/Artifact_1.jpg','2018-05-22 18:06:05',NULL),(12,'Fiat C.R. 32 del XVI Gruppo Autonomo \"Cucaracha\" scortano un Savoia-Marchetti S.M.81 in una missione di bombardamento.','Airplanes dropping bombs during the Spanish Civil War','/images/gallery/Artifact_2.jpg','2018-05-22 18:08:01',NULL),(13,'Republican Tank','Photo taken during the Battle of Teruel','/images/gallery/Artifact_3.jpg','2018-05-22 18:08:52',NULL),(14,'Photo of a plane flown in the SCW',' ','/images/gallery/Artifact_4.jpg','2018-05-22 18:10:19',NULL),(15,'Another plane flown in the SCW',' ','/images/gallery/Artifact_5.jpg','2018-05-22 18:12:07',NULL),(16,'Fighting During the Siege of the Alcázar in Toledo',' ','/images/gallery/Artifact_6.jpg','2018-05-22 18:12:32',NULL),(17,'Spanish Civil War - Czechoslovak Gottwald artillery batteries',' ','/images/gallery/Artifact_7.jpg','2018-05-22 18:13:12',NULL),(18,'Refugiados en Francia','Residents of the War Resisters\' Home, hosted by professor Jose Brocca\n','/images/gallery/Artifact_8.jpg','2018-05-22 18:17:29',NULL),(19,'Ayuda suiza a los ninos de espana ','Transport of refugee Children','/images/gallery/Artifact_9.jpg','2018-05-22 18:17:32',NULL),(20,'Ninos de la guerra civil','Children evacuating Spain, giving the republican salute','/images/gallery/Artifact_10.png','2018-05-22 18:17:33',NULL),(21,'Los Internacionales','Internationalist Propaganda - Foreign aid for the Republic \n','/images/gallery/Artifact_11.jpg','2018-05-22 18:17:34',NULL),(22,'Voluntarios de Polonia','Polish volunteers aid in the fight for the second Spanish republic ','/images/gallery/Artifact_12.jpg','2018-05-22 18:17:34',NULL),(23,'Bundesarchiv Bild','Two women eating in the street','/images/gallery/Artifact_13.jpg','2018-05-22 18:21:56',NULL),(24,'La Sonriente Partisana Comunista Milja Marín\n','Smiling Woman','/images/gallery/Artifact_14.jpg','2018-05-22 18:21:58',NULL),(25,'La Familia','3 small children posed for a picture','/images/gallery/Artifact_15.jpg','2018-05-22 18:21:59',NULL),(26,'Spanish War Children','Children standing together making a sign','/images/gallery/Artifact_10.png','2018-05-22 18:22:00',NULL),(27,'Spanish Civil War Mass Grave','Bones found together in a mass grave\n','/images/gallery/Artifact_17.jpg','2018-05-22 18:22:01',NULL),(28,'Surrender of Red Soldier','Soldiers with their hands raised in surrender','/images/gallery/Artifact_18.jpg','2018-05-22 18:22:01',NULL),(29,'Mujer Despuesta a Luchar','Woman with a gun raised in the air\n','/images/gallery/Artifact_1.jpg','2018-05-22 18:22:04',NULL),(30,'Norman Bethune checkers','Men Playing Checkers','/images/gallery/Artifact_19.jpg','2018-05-22 18:28:10',NULL),(31,'Soldiers with Dog','Attribution','/images/gallery/Artifact_20.jpg','2018-05-22 18:28:12',NULL),(32,'Republican sailors playing musical instruments','This is a fun picture with music.','/images/gallery/Artifact_21.jpg','2018-05-22 18:28:14',NULL),(33,'Spanish War Children','Hopeful optimistic children.\n','/images/gallery/Artifact_10.png','2018-05-22 18:28:18',NULL),(34,'Las tristezas de la guerra - ¡Adiós, hijo mío!, de Narcís Martí Cabot','Painting of a father saying goodbye to his son. Shows the hope of coming back to family.','/images/gallery/Artifact_23.jpg','2018-05-22 18:28:17',NULL),(35,'Iglesia de Belén - Destruido en 1936 durante la Guerra Civil de España','Interior of this Church was destroyed during the Spanish Civil War.','/images/gallery/Artifact_24.jpg','2018-05-22 18:28:16',NULL),(36,'Bombing of Guernica Ruins','Impactful image','/images/gallery/Artifact_25.jpg','2018-05-22 18:28:15',NULL),(37,'Mural del Gernika','Mural based on Picasso\'s painting \"Guernica\" that is located in Guernica, Spain','/images/gallery/Artifact_26.jpg','2018-05-22 18:36:14',NULL),(38,'Obra de arte relacionada con la Guerra Civil.JPG','Modern art related to the Spanish Civil War\n','/images/gallery/Artifact_27.jpg','2018-05-22 18:36:17',NULL),(39,'Jardines del Ferial, estela en recuerdo a los caídos en el bombardeo (obra de Jesus Aldama)','Sculpture dedicated to those killed in the bombing of Guernica in Spain.','/images/gallery/Artifact_28.jpg','2018-05-22 18:36:19',NULL),(40,'Medalla de la Guerra Civil de España','Medal given as a result of winning the Spanish Civil War','/images/gallery/Artifact_29.jpg','2018-05-22 18:36:19',NULL),(41,'Australianos en la Guerra Civil de España','Memorial erected in memory to the Australians who fought in the Spanish Civil war.\n','/images/gallery/Artifact_30.jpg','2018-05-22 18:36:21',NULL),(42,'Monumento a las mules de montaña usadas en la Guerra Civil de España','Memorial erected to honor the role that mules played in supplying nationalist groups during the Spanish Civil War.','/images/gallery/Artifact_31.jpg','2018-05-22 18:36:20',NULL),(43,'Estatua al Obispo Diego Ventaja Milan, Almeria, España','Statue of Bishop Diego Ventaja who was killed by marxists during the Spanish Civil War.\n','/images/gallery/Artifact_32.jpg','2018-05-22 18:36:18',NULL),(44,'Spanish War Children','Children evacuating Spain, giving the Republican salute','/images/gallery/Artifact_10.png','2018-05-22 19:03:27',NULL),(45,'Spanish Civil War - Mass grave - Estépar, Burgos.jpg','A mass grave in Burgos, Spain from the Spanish Civil War','/images/gallery/Artifact_17.jpg','2018-05-22 19:03:31',NULL),(46,'Puente, Ronda, España','A bridge from which Republicans were allegedly thrown from by the nationalists.\n','/images/gallery/Artifact_35.jpg','2018-05-22 19:03:32',NULL),(47,'Franco and Hitler Meet at Hendaye','1940 Hitler and Franco in front of soldiers at a train station\n','/images/gallery/Artifact_36.jpg','2018-05-22 19:03:29',NULL),(48,'Evacuation Truck','1937 an evacuation truck from the Swiss to help Spain','/images/gallery/Artifact_37.jpg','2018-05-22 19:03:34',NULL),(49,'War Refugees','January 1937, people walking in the street with animals and wagons\n','/images/gallery/Artifact_38.jpg','2018-05-22 19:03:34',NULL),(50,'Spain Final-guerra-civil','A photograph of a signed letter from Franco declaring the end of the war in Spanish\n','/images/gallery/Artifact_39.jpg','2018-05-22 19:03:33',NULL),(51,'Instruccions a seguir en cas de bombardeig. Consells de Sanitat de Guerra publicats per la Generalitat de Catalunya','An illustrated flyer in Catalan that provides instructions for how to stay safe during a bombing raid\n','/images/gallery/Artifact_40.jpg','2018-05-22 19:03:31',NULL),(52,'Map','Map of the distribution of forces in the Spanish Civil War','/images/gallery/Artifact_41.png','2018-05-22 19:03:35',NULL),(53,'Batalla de Brunete revisada','Map of the Batalla de Brunete\n','/images/gallery/Artifact_42.png','2018-05-22 19:03:29',NULL),(54,'La brigade international durante la Guerra Civil de España, Diciembre 1936 - Enero 1937','Picture of a group of fighters from the international brigade. They are raising their hands in the communist salute.\n','/images/gallery/Artifact_43.jpg','2018-05-22 19:15:42',NULL),(55,'Monumento a los soldados de Hungría en la brigada internacional','Memorial erected to Hungarians who fought in the Spanish Civil War in the International Brigades','/images/gallery/Artifact_44.jpg','2018-05-22 19:15:47',NULL),(56,'International Brigade - tank','Battle of Belchite in 1937','/images/gallery/Artifact_45.jpg','2018-05-22 19:15:45',NULL),(57,'Finnish Volunteer in International Brigade','1937 man named Paavel Pajunen from Finland','/images/gallery/Artifact_46.jpg','2018-05-22 19:15:49',NULL),(58,'Presidente Manuel Azana','Second prime minister to the Second Republic of Spain, later the last president of the Republic\n','/images/gallery/Artifact_47.jpeg','2018-05-22 19:15:47',NULL),(59,'Surrender of Red Soldiers, Somosierra, Madrid',' ','/images/gallery/Artifact_18.jpg','2018-05-22 19:15:45',NULL),(60,'Francisco Franco',' ','/images/gallery/Artifact_49.jpg','2018-05-22 19:15:50',NULL),(61,'Republican Troops on the Aragon Front',' ','/images/gallery/Artifact_50.jpg','2018-05-22 19:15:52',NULL),(62,'Niños en la Guerra Civil de España','Children being evacuated during the Spanish Civil War','/images/gallery/Artifact_10.png','2018-05-22 19:15:46',NULL),(63,'Norman Bethune. El juego de damas, 1937','Dr. Bethune, a Canadian surgeon who served on the frontline of the Spanish Civil War working working for Republican government.','/images/gallery/Artifact_19.jpg','2018-05-22 19:15:51',NULL),(64,'Francoist Troop Demonstration','Crowds and public demonstration in Salamanca\n','/images/gallery/Artifact_53.jpg','2018-05-22 19:15:51',NULL),(65,'Franco ha muerto','Newspaper title for the day he died','/images/gallery/Artifact_54.png','2018-05-22 19:15:44',NULL),(66,'Soldiers in Battle at Madrid','September 1936 - Soldiers marching','/images/gallery/Artifact_55.jpeg','2018-05-22 19:15:54',NULL),(67,'Republican Soldiers','Republican Soldiers walking in the streets of Teruel from December 1937','/images/gallery/Artifact_56.jpg','2018-05-22 19:15:55',NULL),(69,'Republican Soldiers Playing Music','Soldiers are singing and playing instruments aboard a ship in 1937','/images/gallery/Artifact_21.jpg','2018-05-22 19:15:57',NULL),(70,'¡No pasarán! Madrid','A banner in a street in Madrid declaring opposition to facism.','/images/gallery/Artifact_57.jpg','2018-05-22 19:39:42',NULL),(71,'Franco Propaganda','Propaganda for El Generalismo\n','/images/gallery/Artifact_58.jpg','2018-05-22 19:39:44',NULL),(72,'Fascism propaganda','Propaganda for Fascism\n','/images/gallery/Artifact_59.jpg','2018-05-22 19:39:46',NULL),(73,'Youth united for Spain Propaganda','Youth in the war\n','/images/gallery/Artifact_60.jpg','2018-05-22 19:39:45',NULL),(74,'Libertad propaganda ','Iberian federation of libertarian youth \n','/images/gallery/Artifact_11.jpg','2018-05-22 19:39:45',NULL),(75,'8 de noviembre 1936','Propaganda for siege of Madrid \n','/images/gallery/Artifact_62.jpg','2018-05-22 19:39:43',NULL),(76,'Los Internacionales','International volunteers\n','/images/gallery/Artifact_63.jpg','2018-05-22 19:39:47',NULL),(77,'El socialismo es la liberación','strong image of how socialists perceived their lives during the time.','/images/gallery/Artifact_56.jpg','2018-05-22 19:39:48',NULL),(78,'Woman with a rifle near a canon',' ','/images/gallery/Artifact_1.jpg','2018-05-22 19:59:46',NULL),(79,'Recuerdos de Pandora: Mujer dispuesta a luchar (Barcelona 1936)','A woman holding a rifle standing on a cannon at the beginning of the war\n','/images/gallery/Artifact_1.jpg','2018-05-22 19:59:49',NULL),(80,'Women Pleading with Rebels','Women pleading for the lives of prisoners of rebels in Seville\n','/images/gallery/Artifact_67.jpg','2018-05-22 19:59:45',NULL),(81,'Mujeres Soldados','Women in uniform and with rifles\n','/images/gallery/Artifact_68.jpg','2018-05-22 19:59:48',NULL),(82,'Woman soldier overlooking Barcelona','Marina Ginesta, a 17-year-old communist militant, overlooking Barcelona during the Spanish Civil War, 1936\n','/images/gallery/Artifact_69.jpg','2018-05-22 19:59:47',NULL),(83,'Women fighting during the Siege of the Alcazar','Women in combat','/images/gallery/Artifact_64.jpg','2018-05-22 20:04:16',NULL),(84,'Children Playing on the Street','Despite being on a destroyed street with bullet-hole ridden buildings, the children are smiling.\n','/images/gallery/Artifact_70.jpg','2018-05-22 20:09:32',NULL),(85,'Nationalist and Loyalist troops','I like the idea of both hope and despair in this picture because it depends on the perspective of what troops you were supporting.\n','/images/gallery/Artifact_71.jpg','2018-05-22 20:09:33',NULL),(86,'Marina Ginesta','Girl with a gun and wry smile','/images/gallery/Artifact_69.jpg','2018-05-22 20:09:34',NULL),(87,'Unidad y victoria','This is more just hope','/images/gallery/Artifact_74.jpg','2018-05-22 20:09:36',NULL),(88,'Belchite','This is more focused on despair and loss\n','/images/gallery/Artifact_75.jpg','2018-05-22 20:09:35',NULL),(89,'Memorial a los voluntarios de Galés en la Guerra Civil de España','This memorial is found in Alexandra Gardens in Cardiff, United Kingdom\n','/images/gallery/Artifact_76.jpg','2018-05-22 20:32:55',NULL),(90,' Memorial a la Brigada Internacional que vinieron desde Hammersmith y Fulham Inglaterra','Placed in Fulham, United Kingdom to commemorate those who went to fight against Facism in Spain.','/images/gallery/Artifact_77.jpg','2018-05-22 20:32:57',NULL),(91,' Monumento a las brigade internacionals en Londres','Monument constructed in London to honor all those who left the UK to go fight in the Spanish Civil War\n','/images/gallery/Artifact_78.jpg','2018-05-22 20:32:58',NULL),(92,'“Reading International Brigade Memorial” – Monumento','A monument that currently is found in Forbury Gardens in Reading, UK','/images/gallery/Artifact_79.jpg','2018-05-22 20:32:57',NULL),(93,'Homenaje Brigadas Internacionales – Glasgow, Escocia','Monument erected to pay tribute to fighters from Glasgow, Scotland','/images/gallery/Artifact_80.jpg','2018-05-22 20:32:59',NULL),(94,' Monumento a los soldados de Hungría en la brigade internacional','Memorial erected to Hungarians who fought in the Spanish Civil War in the International Brigades. Found in Memorial Park in Budapest, Hungary.','/images/gallery/Artifact_81.jpg','2018-05-22 20:32:59',NULL),(95,' Monumento a la Brigada Internacional. Ubicado en la Universidad de Washinton, EEUU','This monument honors the American young men who went and fought in the Spanish Civil War. Their brigade was named the Abraham Lincoln Brigade and about 3,000 served, half of them buried on Spanish soil.','/images/gallery/Artifact_82.jpg','2018-05-22 20:33:01',NULL),(96,'Australianos en la Guerra Civil de España','Memorial erected in memory to the Australians who fought in the Spanish Civil War. Found in Canberra, Australia.\n','/images/gallery/Artifact_30.jpg','2018-05-22 20:34:02',NULL),(97,' Monumento a las brigada internacional – Madrid','Located 25 kilometers southeast of Madrid. Erected to commerate the battle of Jarama in 1937\n','/images/gallery/Artifact_84.jpg','2018-05-22 20:36:13',NULL),(98,'Monumento cerca a Madrid a Charlie Donnelly de la Brigada Internacional','Monument constructed to the Irish Poet Charlie Donnelly who died in the battle of Jarama in 1937. It is located at Rivas de Vaciamadrid, 20 kilometers southeast of Madrid\n','/images/gallery/Artifact_85.jpg','2018-05-22 20:36:14',NULL),(99,' En camino a ayudar a la frontera','1936 people are in a truck on their way to the warfront, they are not dressed like soldiers, rather they look like civilians with guns.\n','/images/gallery/Artifact_86.jpg','2018-05-22 20:41:51',NULL),(100,' Grupo de Italianos','1937 group of Italian men and women stand with their flag in uniforms','/images/gallery/Artifact_87.jpg','2018-05-22 20:41:53',NULL),(101,'Personas normales','1936 people are smiling standing next to a car, they are from Norway and part of an International Brigade.','/images/gallery/Artifact_88.jpg','2018-05-22 20:41:54',NULL),(102,'Grupo internacional','Men from a different country are talking and preparing for battle.\n\n','/images/gallery/Artifact_89.jpg','2018-05-22 20:41:53',NULL),(103,'Voluntarios de países distintos','Writer Ernest Hemingway volunteered in the Spanish Civil War. He is pictured with two other soldiers from different countries.','/images/gallery/Artifact_90.jpg','2018-05-22 20:41:56',NULL),(104,'Voluntarios de Inglaterra','1936 men from England are saluting towards the camera.\n','/images/gallery/Artifact_91.jpg','2018-05-22 20:41:52',NULL),(105,'Un grupo militar de Yugoslavia','1938 Fighters from Yugoslavia pose for picture\n','/images/gallery/Artifact_92.jpg','2018-05-22 20:41:56',NULL),(106,'Grupo de eslovenos','1937 group from Slovenia posing for a picture with smiles\n','/images/gallery/Artifact_93.jpg','2018-05-22 20:41:57',NULL),(107,'Finnish Volunteer in International Brigade','1937 man named Paavel Pajunen from Finland','/images/gallery/Artifact_94.jpg','2018-05-22 20:41:55',NULL);
/*!40000 ALTER TABLE `artifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
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
-- Table structure for table `character_emails`
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
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`character_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Susana Gomez','Head Curator','img/characters/ernando-small.png','img/characters/ernando-large.png',NULL,NULL,'sgomez@museodevalle.es'),(2,'Beatriz Rodríguez','Exhibit Designer','img/characters/beatrix-small.jpeg','img/characters/beatrix-large.jpeg',NULL,NULL,'beatierod@museodevalle.es'),(3,'Francisco López','Museum Technician','img/characters/Fransico-small.jpg','img/characters/Fransico-large.jpg',NULL,NULL,'flopez@museodevalle.es'),(4,'Carmen González','Donor','img/characters/maria-small.png','img/characters/maria-large.png',NULL,NULL,'carmengonzalez@gmail.es'),(5,'Jose Manuel Sánchez','Historian','img/characters/jose-small.jpg','img/characters/jose-large.jpg',NULL,NULL,'joseymariasanchez@yahoo.es'),(6,'Luis Abeyta','Librarian','img/characters/luis-small.jpg','img/characters/luis-large.jpg',NULL,NULL,'luisabeyta@madbiblioteca.es');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (99,'This is a cool note;jlskdf\n\nsdfjlk',13,1,'2018-05-22 16:49:47','2018-05-24 20:07:30');
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
INSERT INTO `questions` VALUES (3,41,'Soluta qui ut sapiente.',17,731,'2015-03-06 20:06:40','2018-04-04 00:30:59',1,120,NULL),(5,26,'Provident aut non amet.',37,964,'2005-05-14 21:10:47','2018-04-04 00:30:59',0,0,NULL),(7,81,'Iste in ab neque magnam.',58,207,'2007-01-04 09:03:22','2018-04-04 00:30:59',1,90,NULL),(9,60,'Quis aut ea facilis.',65,373,'2003-11-26 05:27:29','2018-04-04 00:30:59',0,0,NULL),(17,51,'Odit modi at quo.',35,890,'1974-06-23 09:02:26','2018-04-04 00:30:59',0,0,NULL),(27,41,'Sed rerum aut et.',21,575,'1993-03-08 10:46:51','2018-04-04 00:30:59',0,0,NULL),(39,32,'Autem esse iste aut.',47,696,'2005-08-16 01:54:51','2018-04-04 00:30:59',1,60,NULL),(46,86,'Est quo a non possimus.',97,949,'2001-05-04 19:46:24','2018-04-04 00:30:59',0,0,NULL),(55,51,'Eum est est vel.',20,377,'1975-09-19 08:16:04','2018-04-04 00:30:59',1,30,NULL),(59,41,'Quia quod facere eum at.',62,323,'1999-11-19 15:31:16','2018-04-04 00:30:59',0,0,NULL),(61,8,'Et unde et et.',63,420,'2008-01-15 04:50:23','2018-04-04 00:30:59',0,0,NULL),(62,60,'Id nihil repellat non.',75,719,'2003-01-21 20:06:01','2018-04-04 00:30:59',0,0,NULL),(69,26,'Eos libero velit veniam.',88,611,'1981-12-26 07:08:57','2018-04-04 00:30:59',1,0,NULL),(71,49,'Et est ea atque qui.',82,411,'1995-11-11 09:34:33','2018-04-04 00:30:59',0,0,NULL),(80,8,'Qui ut voluptatibus sed.',62,976,'2001-11-03 06:59:57','2018-04-04 00:30:59',1,90,NULL),(89,64,'Eos qui neque quia.',93,440,'2005-09-23 09:57:02','2018-04-04 00:30:59',1,120,NULL),(90,81,'Vel et asperiores enim.',44,990,'1974-01-22 21:12:23','2018-04-04 00:30:59',0,0,NULL),(94,28,'Impedit sed sint magnam.',76,372,'1997-03-05 14:10:39','2018-04-04 00:30:59',0,0,NULL),(97,41,'Sunt et vel vel autem.',45,908,'1976-06-11 20:13:37','2018-04-04 00:30:59',0,0,NULL),(98,41,'Nisi sed in non.',0,5,'2005-08-03 05:27:59','2018-04-04 00:30:59',1,10,99),(99,41,NULL,6,10,NULL,NULL,0,0,NULL);
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
-- Table structure for table `student_artifact_has_tag`
--

DROP TABLE IF EXISTS `student_artifact_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_artifact_has_tag` (
  `student_artifact_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_artifact_has_tag`
--

LOCK TABLES `student_artifact_has_tag` WRITE;
/*!40000 ALTER TABLE `student_artifact_has_tag` DISABLE KEYS */;
INSERT INTO `student_artifact_has_tag` VALUES (1,1),(1,2),(5,1),(4,1),(6,1),(7,1),(8,1),(9,1);
/*!40000 ALTER TABLE `student_artifact_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_artifacts`
--

DROP TABLE IF EXISTS `student_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_artifacts` (
  `student_artifact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artifact_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Id of user who edited the item.',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `day` int(11) NOT NULL,
  PRIMARY KEY (`student_artifact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
  `character_email_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `email_attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`student_email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_emails`
--

LOCK TABLES `student_emails` WRITE;
/*!40000 ALTER TABLE `student_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_read_emails`
--

DROP TABLE IF EXISTS `student_read_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_read_emails` (
  `character_email_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_read_emails`
--

LOCK TABLES `student_read_emails` WRITE;
/*!40000 ALTER TABLE `student_read_emails` DISABLE KEYS */;
INSERT INTO `student_read_emails` VALUES (3,1,13,'2018-05-30 17:37:07');
/*!40000 ALTER TABLE `student_read_emails` ENABLE KEYS */;
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
INSERT INTO `student_tasks` VALUES (1,1,1,'2018-03-19 17:25:22','2018-05-21 20:58:13'),(2,1,1,'2018-03-19 17:25:25','2018-05-03 00:06:09'),(3,1,1,'2018-03-19 17:25:29','2018-05-03 00:06:09'),(7,1,1,'2018-03-27 15:10:05','2018-05-03 00:06:10'),(1,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:18'),(2,8,1,'2018-03-27 17:03:38','2018-03-28 19:31:19'),(3,8,1,'2018-03-27 17:03:39','2018-03-28 19:31:19'),(7,8,1,'2018-03-27 17:03:40','2018-03-28 19:39:32'),(4,8,1,'2018-03-28 19:31:23','2018-05-03 15:57:41'),(5,8,0,'2018-03-28 19:31:30','2018-05-15 17:56:49'),(4,13,0,'2018-05-22 16:59:20','2018-05-29 20:28:11'),(5,13,0,'2018-05-22 16:59:21','2018-05-29 19:38:55'),(6,13,0,'2018-05-29 19:34:49','2018-05-29 19:34:52');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Art'),(2,'War Paraphernalia'),(3,'Gallery'),(4,'Children'),(5,'Homelife'),(6,'Photographs'),(7,'Women'),(8,'Favorites');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Introduce Yourself to the Team','This is the first task',1,1),(2,'Gather Information','Gather background information on the Spanish Civil War in preparation for a meeting with the Educational Specialist from Spain’s Ministry of Education and the Prado Museum’s Educational Director.',1,0),(4,'Interview a Potential Donor','Call a Carmen about her potential donations to the museum.',2,1),(5,'Respond to the Head Curator','Respond to the Head Curators email about you meeting with the donor.',2,1),(6,'Find Gallery Theme','Day 3 Task 1',2,1),(7,'Send email with Audience Anaysis','Write email describing the audience for your exhibition. What do you know about the audience? What does the audience know and what don\'t they know about the Spanish Civil war? What will your team contribute?  ',1,0),(8,'Interview a Retired Historian','Interview the Librarian about your discovered resources.',3,0),(9,'Interview the Librarian','Try to get additional information from the Librarian about the artifacts you\'ve found.',3,0),(10,'Curate your Gallery Exhibition','Make Gallery selections for the Exhibition in preperation for display.',3,0),(11,'Call Donor about Artifact','Call donor about additional artifacts.',4,0),(12,'Write Artifact Descriptions','Work on the introduction to your exhibition, and prepare a one page explaination about the Spanish Civil War.',4,0),(13,'Update the Head Curator','Update the Head Curator about your Exhibition, and learn best practices for descriptive texts.',4,0),(14,'Organize your Exhibition','Finalize your Exhibition.',5,0);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_asked_questions`
--

DROP TABLE IF EXISTS `user_asked_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_asked_questions` (
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_asked_questions`
--

LOCK TABLES `user_asked_questions` WRITE;
/*!40000 ALTER TABLE `user_asked_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_asked_questions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dan','de6eling@gmail.com','$2y$10$K.a/gbbcosHWKgwBqEiZSuabVZNxzjTRVlSnx0ezB/F3wf5MzaA6O',1,'tBT8Yl6wVsz9p68dzKnhnL9hBDw4tn1wMtIsmzLizAhqjwibGtbbbGnMySKs','2018-01-11 01:04:23','2018-01-11 01:04:23',0,0),(7,'student','student@test.com','$2y$10$GnPD5u8IaWqMolFyGRKhGuqefI61DjjoKtAepXd.ITdTGLm/PORo6',1,'i19DOXxXKiC2zWBP2KVEBLTYm9VBAYv2F5idlRZzdIXfZZ8EevKyz1j39tc2','2018-03-23 22:58:02','2018-03-23 22:58:02',0,0),(8,'instructor','instructor@test.com','$2y$10$V3Dh8ybhaR5tMeCSG8F3j.Ls95/Lj3zKZmfKBWUVudaItddmUfGry',2,'5RiKEcFI8cxhK0X5k8K5syPWS2sbsoOXcLHU1atsIpfMefAU8n3OgoJFUV1E','2018-03-23 23:21:19','2018-03-23 23:21:19',1,1),(9,'student 2','student2@test.com','$2y$10$IuqZiBOBIl10i7gT.26iUOmVRcLbA9k2LZVmvhaqishbPXSwsZRhO',1,'wjlZyXBw3w6u20M0eZK8mkO7phBy7cgp38eQGss6LiZHtVMrRdL9U2rO1KFG','2018-03-24 04:24:58','2018-03-24 04:24:58',0,0),(10,'student 3','student3@test.com','$2y$10$ok5g3RV67tAaFfiegaz1POnTrrG2Y2dgrfaRVzKoMjGFvSAqsmG9i',1,'1fJUErLGhnaUH8KEsgKDwL0bhvx9yH7QAIzN2RaXfAHp7xEdhODYBa3RQXbC','2018-03-24 04:28:29','2018-03-24 04:28:29',0,0),(11,'anna','annacguthrie5@gmail.com','$2y$10$a974OGMituSDLhWMd6dPvu3.h0.jOczVvc2D2ofOlmk/Qi4IUEiQ2',1,NULL,'2018-05-04 23:26:26','2018-05-04 23:26:26',1,0),(12,'Matalyn T','2','matalyn2@byu.edu',0,'q5S7U8WZSGezoDejDC1cnyaPH8QztCNixvTrYejrsL68Dv3TkunNL1Juz6cA','2018-04-04 00:31:27','2018-04-04 00:31:27',1,0),(13,'Matalyn T','matalyn2@byu.edu','$2y$10$pjsIynPsFIzTwS9srTBpCugYms8X2YjzGys04MZSrOSu1cXkNrbCi',2,NULL,'2018-05-22 03:23:58','2018-05-22 03:23:58',1,0);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


-- Dump completed on 2018-05-30 11:43:36

