-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: geek_portal
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `idarticle` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '2021-01-01',
  `title` varchar(45) NOT NULL,
  `text` longtext NOT NULL,
  `links` char(255) DEFAULT NULL,
  `user_id` int NOT NULL,
  `forum_id` int NOT NULL,
  PRIMARY KEY (`idarticle`),
  KEY `article_to_user_idx` (`user_id`),
  KEY `article_to_forum_idx` (`forum_id`),
  CONSTRAINT `article_to_forum` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`idforum`),
  CONSTRAINT `article_to_iduser` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'2021-01-01','whats my name','The long time ago..','@link',1,1),(2,'2021-01-01','functions of characters','As you khow, your app updated. And that mean we fixed bugs and...','@link',2,2),(3,'2021-01-01','How to: Beat Volandemort','Lets start with...','@link',3,3),(4,'2021-01-01','Srcipts \"Checkmate\"','1. Turn on VS studio 2022','@link',4,4),(5,'2021-01-01','Whats going on with robot?','Hello everyone! ','@link',5,5),(6,'2021-01-01','Why finale of the Withcer 3 is suck','Greeting, witcher fans','@link',6,6),(7,'2021-01-01','Gunslinger: messages, animations and voices ','This will be a big instruction how to download all this stuff and save it','@link',7,7),(8,'2021-01-01','Wellcome to our zone','Text','@link',8,8),(9,'2021-01-01','Greeting!','Text','@link',9,9),(10,'2021-01-01','Text','Text','@link',10,10),(11,'2021-01-01','Lifehacks in \"Jojo: Golden Eye\"','Bon Jiorno, my friends!...',NULL,7,9),(12,'2021-01-01','Lifehacks in \"Jojo: Golden Eye\"','Bon Jiorno, my friends!...',NULL,7,9),(13,'2021-01-01','Lifehacks in \"Jojo: Golden Eye\"','Bon Jiorno, my friends!...',NULL,7,9);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` int NOT NULL,
  `rchat_id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `initials` varchar(6) NOT NULL,
  `life_status` tinyint DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_user_id_idx` (`user_id`),
  KEY `character_rchat_id_idx` (`rchat_id`),
  CONSTRAINT `character_rchat_id` FOREIGN KEY (`rchat_id`) REFERENCES `role_chat` (`id`),
  CONSTRAINT `character_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,1,1,'harry potter','h.p.',1,'boy who survived'),(2,2,2,'frodo beggins','f.b.',1,'brougth the ring'),(3,3,2,'Severus','s.s.',0,'teacher of harry potter'),(4,4,2,'MyDude','M.D.',1,'beat enemys'),(5,5,3,'Jotaro Kujo','jojo',1,'STAR PLATINUM! '),(6,6,3,'Gyro Zeppeli','Gy.Ze',0,'fall as a hero'),(7,7,4,'Wolf','WF',1,'Buisnessman from WallStreet'),(8,8,4,'NoName','NN.',0,'test functions of chat'),(9,9,4,'Char1','C1',1,'hello there'),(10,10,4,'Char1','C1',0,'Interesting functional'),(11,1,4,'Char2','C2',1,'text1'),(12,2,4,'Char3','C3',1,'text2'),(13,3,4,'Char4','C4',1,'text3'),(14,4,4,'Char5','C5',1,'text4'),(15,5,2,'Char6','C6',1,'text5'),(16,6,2,'Char7','C7',1,'text6'),(17,7,2,'Char8','C8',1,'text7'),(18,8,1,'Char9','C9',1,'text8'),(19,9,3,'Char10','C10',1,'text9'),(20,10,2,'Char11','C11',1,'text10'),(21,1,2,'Char12','C12',1,'text11');
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `idchat` int NOT NULL,
  `chat_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,'Chat1'),(2,'Mary_and_John'),(3,'Eve'),(4,'Shocase'),(5,'Chat2'),(6,'Just_Chat'),(7,'Garry_Potter(funfic)'),(8,'Dave'),(9,'CoolStuff'),(10,'Hmhmhm');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_members`
--

DROP TABLE IF EXISTS `chat_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_members` (
  `chat_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`chat_id`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `chat_members_chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`idchat`),
  CONSTRAINT `chat_members_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_members`
--

LOCK TABLES `chat_members` WRITE;
/*!40000 ALTER TABLE `chat_members` DISABLE KEYS */;
INSERT INTO `chat_members` VALUES (1,1),(8,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(10,2),(3,3),(5,3),(6,3),(9,3),(1,4),(2,4),(3,4),(4,4),(7,4),(8,4),(9,4),(10,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `chat_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `idevent` int NOT NULL,
  `fandom_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date` date NOT NULL,
  `links` char(255) DEFAULT NULL,
  `text` mediumtext,
  PRIMARY KEY (`idevent`),
  KEY `event_to_fandom_idx` (`fandom_id`),
  KEY `event_to_user_idx` (`user_id`),
  CONSTRAINT `event_to_fandom` FOREIGN KEY (`fandom_id`) REFERENCES `fandom` (`idfandom`),
  CONSTRAINT `event_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,1,1,'2021-01-01','@link','Welcome to the Our Event! '),(2,1,2,'2021-01-01','@link','Hoho! Are you ready for a fight?'),(3,3,3,'2021-01-01',NULL,NULL),(4,4,4,'2021-01-01','@link','Sweet dreams are real!'),(5,5,5,'2021-01-01','@link','Come and get your reward!'),(6,6,6,'2021-01-01','@link','NEW! Announce of PS5 Pro!'),(7,7,7,'2021-01-01','@link',NULL),(8,8,8,'2021-01-01','@link','Welcome to the Our Event!'),(9,9,9,'2021-01-01',NULL,NULL),(10,10,10,'2021-01-01',NULL,NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fandom`
--

DROP TABLE IF EXISTS `fandom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fandom` (
  `idfandom` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idfandom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fandom`
--

LOCK TABLES `fandom` WRITE;
/*!40000 ALTER TABLE `fandom` DISABLE KEYS */;
INSERT INTO `fandom` VALUES (1,'films','The Lord of the Rings'),(2,'films','Harry Potter'),(3,'books','Harry Potter'),(4,'serials','The Queens Gambit'),(5,'serials','Lost in Space'),(6,'videogames','Witcher 3: Wild Hunt'),(7,'books','The Dark Tower'),(8,'comics','Major Grom'),(9,'comics','Steel Ball Run'),(10,'serials','Mandalorian');
/*!40000 ALTER TABLE `fandom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fandom_based_rchats`
--

DROP TABLE IF EXISTS `fandom_based_rchats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fandom_based_rchats` (
  `rchat_id` int NOT NULL,
  `fandom_id` int NOT NULL,
  PRIMARY KEY (`rchat_id`,`fandom_id`),
  KEY `fandom_rchat_to_fandom_idx` (`fandom_id`),
  CONSTRAINT `fandom_rchat_to_fandom` FOREIGN KEY (`fandom_id`) REFERENCES `fandom` (`idfandom`),
  CONSTRAINT `fandom_rchat_to_rchat` FOREIGN KEY (`rchat_id`) REFERENCES `role_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fandom_based_rchats`
--

LOCK TABLES `fandom_based_rchats` WRITE;
/*!40000 ALTER TABLE `fandom_based_rchats` DISABLE KEYS */;
INSERT INTO `fandom_based_rchats` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `fandom_based_rchats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forum` (
  `idforum` int NOT NULL,
  `section` varchar(45) NOT NULL,
  `forum_name` varchar(45) NOT NULL,
  `fandom_id` int NOT NULL,
  PRIMARY KEY (`idforum`),
  KEY `forum_to_fandom_idx` (`fandom_id`),
  CONSTRAINT `forum_to_fandom` FOREIGN KEY (`fandom_id`) REFERENCES `fandom` (`idfandom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (1,'FAQ','Complex Questions of my Universe',1),(2,'Help ','Tech Upd: Main ',2),(3,'Guides','How to: Beat the boss',3),(4,'Help','How to: Add a script to your character',4),(5,'Discuss','New sesson',5),(6,'Discuss','Final of the product',6),(7,'FAQ','How to: Add your plugins with this function',7),(8,'Help','How to: Watch and play in role chat',8),(9,'Guides','Find every secrets',9),(10,'Guides','What you need to khow before reading',10),(11,'Guides','Jojo: Golden Eye',9);
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_of_event`
--

DROP TABLE IF EXISTS `members_of_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_of_event` (
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`event_id`),
  KEY `members_of_event_to_event_idx` (`event_id`),
  CONSTRAINT `members_of_event_to_event` FOREIGN KEY (`event_id`) REFERENCES `event` (`idevent`),
  CONSTRAINT `members_of_event_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_of_event`
--

LOCK TABLES `members_of_event` WRITE;
/*!40000 ALTER TABLE `members_of_event` DISABLE KEYS */;
INSERT INTO `members_of_event` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `members_of_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_of_role_game_event`
--

DROP TABLE IF EXISTS `members_of_role_game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_of_role_game_event` (
  `user_id` int NOT NULL,
  `role_game_event_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_game_event_id`),
  KEY `event_id_members_of_rge_idx` (`role_game_event_id`),
  CONSTRAINT `event_id_members_of_rge` FOREIGN KEY (`role_game_event_id`) REFERENCES `role_game_event` (`idrole_game_event`),
  CONSTRAINT `user_id_members_of_rge` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_of_role_game_event`
--

LOCK TABLES `members_of_role_game_event` WRITE;
/*!40000 ALTER TABLE `members_of_role_game_event` DISABLE KEYS */;
INSERT INTO `members_of_role_game_event` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `members_of_role_game_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `idmessage` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `chat_id` int NOT NULL,
  `date` datetime(1) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`idmessage`),
  KEY `user_id_idx` (`user_id`),
  KEY `chat_id_idx` (`chat_id`),
  CONSTRAINT `chat_id` FOREIGN KEY (`chat_id`) REFERENCES `chat` (`idchat`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,1,'2001-02-20 21:00:00.0','Hello'),(2,2,2,'2002-01-20 21:00:00.0','Hi! How are you?'),(3,3,3,'2001-06-20 21:00:00.0','HEllo'),(4,4,4,'2001-01-20 21:00:00.0','What\'s up?'),(5,5,5,'2001-11-20 21:00:00.0','Need2go'),(6,6,6,'2007-01-20 21:00:00.0','W8'),(7,7,7,'2001-01-10 21:00:00.0','Hmhmhm'),(8,8,8,'2001-01-20 21:00:00.0','Where are you?'),(9,9,9,'2001-01-21 21:00:00.0','Will come soon'),(10,10,10,'2005-01-20 21:00:00.0','Sup'),(11,6,9,'2021-05-18 22:13:14.0','Timur is here'),(12,1,1,'2021-05-19 08:38:14.0','boy who survived'),(13,2,2,'2021-05-19 08:38:14.0','brougth the ring'),(14,2,3,'2021-05-19 08:38:14.0','teacher of harry potter'),(15,2,4,'2021-05-19 08:38:14.0','beat enemys'),(16,3,5,'2021-05-19 08:38:14.0','STAR PLATINUM! '),(17,3,6,'2021-05-19 08:38:14.0','fall as a hero'),(18,4,7,'2021-05-19 08:38:14.0','Buisnessman from WallStreet'),(19,4,8,'2021-05-19 08:38:14.0','test functions of chat'),(20,4,9,'2021-05-19 08:38:14.0','hello there'),(21,4,10,'2021-05-19 08:38:14.0','Interesting functional'),(22,4,1,'2021-05-19 08:38:14.0','text1'),(23,4,2,'2021-05-19 08:38:14.0','text2'),(24,4,3,'2021-05-19 08:38:14.0','text3'),(25,4,4,'2021-05-19 08:38:14.0','text4'),(26,2,5,'2021-05-19 08:38:14.0','text5'),(27,2,6,'2021-05-19 08:38:14.0','text6'),(28,2,7,'2021-05-19 08:38:14.0','text7'),(29,1,8,'2021-05-19 08:38:14.0','text8'),(30,3,9,'2021-05-19 08:38:14.0','text9'),(31,2,10,'2021-05-19 08:38:14.0','text10'),(32,2,1,'2021-05-19 08:38:14.0','text11');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin` (
  `idplugin` int NOT NULL AUTO_INCREMENT,
  `Description` text,
  PRIMARY KEY (`idplugin`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
INSERT INTO `plugin` VALUES (1,'Simple tag to how HP of your char'),(2,'Fight script with which your battles will be more effective'),(3,'Skills and more skills! Magic scripts with which your battles will be MORE EFFECTIVE! '),(4,'Chatting with animation'),(5,'If you want to kill your char in important and dramatic momet in your story you can use this command'),(6,'Everybody love animated characters! Hell yeah! '),(7,'Char will earn exp by using printed messages'),(8,'Character print random number from 1 to 4'),(9,'Testing time'),(10,'Random number from 1 to 12'),(11,'Char.Status.HP'),(12,'Char.DealDamage.ToCharacter'),(13,'Character.ActivateSkill'),(14,'Character.PrintMessage'),(15,'Character.Status.Dead'),(16,'Chat.ShowTime.Animation'),(17,'Chat.Messages.Find(UserMsg)'),(18,'Character.PrintMsg(gamecube)'),(19,'Chat.Showtime.PrintMsg'),(20,'User.PrintMsg(gamecube)');
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_chat`
--

DROP TABLE IF EXISTS `role_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_chat` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_role_chat` FOREIGN KEY (`id`) REFERENCES `chat` (`idchat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_chat`
--

LOCK TABLES `role_chat` WRITE;
/*!40000 ALTER TABLE `role_chat` DISABLE KEYS */;
INSERT INTO `role_chat` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `role_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_game_event`
--

DROP TABLE IF EXISTS `role_game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_game_event` (
  `idrole_game_event` int NOT NULL,
  `date` date NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT 'Role game event!',
  `description` varchar(1024) NOT NULL,
  PRIMARY KEY (`idrole_game_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_game_event`
--

LOCK TABLES `role_game_event` WRITE;
/*!40000 ALTER TABLE `role_game_event` DISABLE KEYS */;
INSERT INTO `role_game_event` VALUES (1,'2021-01-01','GameEvent','And we started!'),(2,'2021-01-01','GameEvards','And we started!'),(3,'2021-01-01','ANOOUNCE OF JOJO: PART6','And we started!'),(4,'2021-01-01','GameChose','And we started!'),(5,'2021-01-01','Bizzare battle here','And we started!'),(6,'2021-01-01','Something like that','And we started!'),(7,'2021-01-01','Role Game Event! ','And we started!'),(8,'2021-01-01','Dead Space','And we started!'),(9,'2021-01-01','Role Game Event!','And we started!'),(10,'2021-01-01','Jojo\'s Bizzare Adventure: Part 7','And we started!');
/*!40000 ALTER TABLE `role_game_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_message`
--

DROP TABLE IF EXISTS `role_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rchat_id` int NOT NULL,
  `character_id` int NOT NULL,
  `date` datetime(1) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rmessage_rchat_id_idx` (`rchat_id`),
  KEY `rmessage_character_id_idx` (`character_id`),
  CONSTRAINT `rmessage_character_id` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `rmessage_rchat_id` FOREIGN KEY (`rchat_id`) REFERENCES `role_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_message`
--

LOCK TABLES `role_message` WRITE;
/*!40000 ALTER TABLE `role_message` DISABLE KEYS */;
INSERT INTO `role_message` VALUES (1,1,1,'2021-01-01 00:00:00.0','Behold the new character! '),(2,2,2,'2021-01-01 00:00:00.0','Behold the new character! '),(3,3,3,'2021-01-01 00:00:00.0','Behold the new character! '),(4,4,4,'2021-01-01 00:00:00.0','Behold the new character! '),(5,5,5,'2021-01-01 00:00:00.0','Behold the new character! '),(6,6,6,'2021-01-01 00:00:00.0','Behold the new character! '),(7,7,7,'2021-01-01 00:00:00.0','Behold the new character! '),(8,8,8,'2021-01-01 00:00:00.0','Behold the new character! '),(9,9,9,'2021-01-01 00:00:00.0','Behold the new character! '),(10,10,10,'2021-01-01 00:00:00.0','Behold the new character! ');
/*!40000 ALTER TABLE `role_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commands` text,
  `gamecube` text,
  `scripts` text NOT NULL,
  `plugin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tool_to_plugin_idx` (`plugin_id`),
  CONSTRAINT `fk_tool_to_plugin` FOREIGN KEY (`plugin_id`) REFERENCES `plugin` (`idplugin`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'showHP','nocube','Char.Status.HP',1),(2,'beat','1-12','Char.DealDamage.ToCharacter',2),(3,'useStand','1-6','Character.ActivateSkill',3),(4,'talk','nocube','Character.PrintMessage',4),(5,'kill','nocube','Character.Status.Dead',5),(6,'animate','nocube','Chat.ShowTime.Animation',6),(7,'farming','1-10','Chat.Messages.Find(UserMsg)',7),(8,'test','1-4','Character.PrintMsg(gamecube)',8),(9,'command','nocube','Chat.Showtime.PrintMsg',9),(10,'command','1-12','User.PrintMsg(gamecube)',10);
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'cooldude@mail.com','!1!2!3!4!5!!','James','M'),(2,'gamer_228@mail.com','9!8!2!__!','Jane','F'),(3,'jhin@gmail.com','9101#$1%','Adam','M'),(4,'Kyle_El@gmail.com','13578$^','Kyle','M'),(5,'Silverhandpower@yandex.ru','746874618764816476','Jonny Silverhand','M'),(6,'Smash3r@mail.ru','f8wyyuf8w7fg','Adam Smasher','M'),(7,'Chill_and_beauty@gmail.com','7h7rin7few7cg7','Liz','F'),(8,'Just_a_girl@yandex.ru','7fh8fhe93hfy291yf','Samantha','F'),(9,'someone@gmail.com','11d1d1f1','Alex','F'),(10,'noone@mail.com','21rf2eg2u4656k','Alex','M');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `using_tool`
--

DROP TABLE IF EXISTS `using_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `using_tool` (
  `rchat_id` int NOT NULL,
  `plugin_id` int NOT NULL,
  PRIMARY KEY (`rchat_id`,`plugin_id`),
  KEY `fk_plugin_idx` (`plugin_id`),
  CONSTRAINT `fk_plugin` FOREIGN KEY (`plugin_id`) REFERENCES `plugin` (`idplugin`),
  CONSTRAINT `fk_rchat` FOREIGN KEY (`rchat_id`) REFERENCES `role_chat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `using_tool`
--

LOCK TABLES `using_tool` WRITE;
/*!40000 ALTER TABLE `using_tool` DISABLE KEYS */;
INSERT INTO `using_tool` VALUES (1,1),(2,2),(3,3),(4,4),(4,5),(3,6),(2,7),(2,8),(2,9),(3,10);
/*!40000 ALTER TABLE `using_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'geek_portal'
--

--
-- Dumping routines for database 'geek_portal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-20 22:32:57
