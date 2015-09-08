-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: library_system
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `book_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_status` tinyint(1) DEFAULT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`borrow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue`
--

DROP TABLE IF EXISTS `issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date_of_issue` date NOT NULL,
  `date_of_return` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue`
--

LOCK TABLES `issue` WRITE;
/*!40000 ALTER TABLE `issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `edition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `void` tinyint(1) NOT NULL DEFAULT '0',
  `void_reason` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Java',1,'Kaphukusi','BaoBab Health',2015,'2nd','First ever Java book written by a Malawian.','SN913476ER67',0,'','2015-08-31 07:30:05','2015-09-08 06:59:12','Rejected'),(2,'Ubuntu Tutorial',2,'Kajane','BaoBab Health',2015,'1st','Certificate unverified.','SN567809',1,'','2015-08-31 07:32:46','2015-08-31 07:32:46',''),(3,'Tech Crunch',3,'The Tech Company','Technology Publication',2015,'Winter Edition','All about Technology this winter.','S/N567884',0,NULL,'2015-08-31 07:48:16','2015-09-03 21:34:43','Approved'),(4,'Ruby',1,'Jacob','Pragmatic',2015,'2nd','Ruby for people','ISBN 321',0,NULL,'2015-08-31 07:55:08','2015-09-08 07:01:15','Rejected'),(5,'Windows 10 Installer',2,'Bill Gates','Microsoft',2015,'Consumer','For all latest Windows Apps','SN098903edRF56',0,NULL,'2015-08-31 07:56:04','2015-09-08 06:56:37','Rejected'),(6,'Ruby Videos',2,'TreeServers','TS inc',2015,'1st','50+ Videos tutorials to help master ruby.','SN67Y09',0,NULL,'2015-09-01 12:32:12','2015-09-07 14:00:09','Approved'),(7,'Fedora',2,'Red Hat Inc','Red Hat Enterprises',2015,'LTE edition','For long term support','REDH4T763390',0,NULL,'2015-09-02 11:39:46','2015-09-07 07:06:36','Approved'),(8,'New CD',2,'Annonymous','CD Publications',2015,'First','To test a CD','S/N456E4R',0,NULL,'2015-09-04 06:54:12','2015-09-08 06:56:39','Rejected'),(9,'Poetry Mag',3,'Mitu Nine','The Poets Bestfriend',2015,'1st','The Magazine cornering all poems on poetic justice 2015','SN78E56RT',0,NULL,'2015-09-07 07:02:03','2015-09-08 06:56:40','Rejected');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_category`
--

DROP TABLE IF EXISTS `item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_category` (
  `item_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cat_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`item_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_category`
--

LOCK TABLES `item_category` WRITE;
/*!40000 ALTER TABLE `item_category` DISABLE KEYS */;
INSERT INTO `item_category` VALUES (1,'Books','List of Books',NULL,NULL),(2,'CDs/DVDs','List of all Discs',NULL,NULL),(3,'Journals/Magazines','List of all Papers',NULL,NULL),(4,'Laptops','A list of all available laptops','2015-09-03 10:32:55','2015-09-03 10:32:55'),(5,'Printers','All printers','2015-09-07 14:37:14','2015-09-07 14:37:14');
/*!40000 ALTER TABLE `item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150826100141'),('20150826100205'),('20150826100316'),('20150828074944'),('20150901140937'),('20150903133458'),('20150903133459'),('20150907124116'),('20150907125613');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` text COLLATE utf8_unicode_ci NOT NULL,
  `user_role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `salt` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Administrator','Administrator','$2a$10$hW2axDp0OvdwSoZ7fU.wD.Z.7GivR8d/iCFKnSuWtJ8gK8z.Q89n.','Administrator','2015-09-04 13:37:45','2015-09-04 13:37:45','$2a$10$hW2axDp0OvdwSoZ7fU.wD.'),(2,'hope','Hope','Kaphukusi','hope','staff','2015-08-31 08:57:23','2015-08-31 08:57:23',''),(3,'','','','','staff','2015-09-02 09:38:59','2015-09-02 09:38:59',''),(4,'','','','','staff','2015-09-02 09:39:00','2015-09-02 09:39:00',''),(5,'jmziya','Jacob','Mziya','$2a$10$rS1qFFQchjnYUs8DDrVKp.wOdEJ7qoA0sLjOsRIe/ANvHqbqPIzna','Administrator','2015-09-04 12:28:31','2015-09-04 12:28:31','$2a$10$rS1qFFQchjnYUs8DDrVKp.'),(6,'staff','User','Staff','$2a$10$pp.y7pRHKDUZ99n3Rr0cp.pjVPXAwyphf..oCDOJGdY0iGcgDAaRC','staff','2015-09-04 13:47:23','2015-09-04 13:47:23','$2a$10$pp.y7pRHKDUZ99n3Rr0cp.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08  9:55:14
