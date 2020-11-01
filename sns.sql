CREATE DATABASE  IF NOT EXISTS `sns` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `sns`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sns
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdBy` bigint(20) NOT NULL,
  `updatedBy` bigint(20) NOT NULL,
  `title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` tinytext COLLATE utf8mb4_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_slug` (`slug`),
  KEY `idx_group_creator` (`createdBy`),
  KEY `idx_group_modifier` (`updatedBy`),
  CONSTRAINT `fk_group_creator` FOREIGN KEY (`createdBy`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_group_modifier` FOREIGN KEY (`updatedBy`) REFERENCES `user` (`id`)
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
-- Table structure for table `group_follower`
--

DROP TABLE IF EXISTS `group_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_follower` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_member` (`groupId`,`userId`,`type`),
  KEY `idx_gfollower_group` (`groupId`),
  KEY `idx_gfollower_user` (`userId`),
  CONSTRAINT `fk_gfollower_group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_gfollower_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_follower`
--

LOCK TABLES `group_follower` WRITE;
/*!40000 ALTER TABLE `group_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_member`
--

DROP TABLE IF EXISTS `group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `roleId` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_member` (`groupId`,`userId`),
  KEY `idx_member_group` (`groupId`),
  KEY `idx_member_user` (`userId`),
  CONSTRAINT `fk_member_group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_member_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_member`
--

LOCK TABLES `group_member` WRITE;
/*!40000 ALTER TABLE `group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_message`
--

DROP TABLE IF EXISTS `group_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `message` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gmessage_group` (`groupId`),
  KEY `idx_gmessage_user` (`userId`),
  CONSTRAINT `fk_gmessage_group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_gmessage_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_message`
--

LOCK TABLES `group_message` WRITE;
/*!40000 ALTER TABLE `group_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_meta`
--

DROP TABLE IF EXISTS `group_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) NOT NULL,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_meta_group` (`groupId`,`key`),
  KEY `idx_meta_group` (`groupId`),
  CONSTRAINT `fk_meta_group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_meta`
--

LOCK TABLES `group_meta` WRITE;
/*!40000 ALTER TABLE `group_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_post`
--

DROP TABLE IF EXISTS `group_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `group_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `groupId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `message` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gpost_group` (`groupId`),
  KEY `idx_gpost_user` (`userId`),
  CONSTRAINT `fk_gpost_group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_gpost_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_post`
--

LOCK TABLES `group_post` WRITE;
/*!40000 ALTER TABLE `group_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middleName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordHash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registeredAt` datetime NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `intro` tinytext COLLATE utf8mb4_unicode_ci,
  `profile` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`),
  UNIQUE KEY `uq_mobile` (`mobile`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follower`
--

DROP TABLE IF EXISTS `user_follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_follower` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourceId` bigint(20) NOT NULL,
  `targetId` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ufollower` (`sourceId`,`targetId`,`type`),
  KEY `idx_ufollower_source` (`sourceId`),
  KEY `idx_ufollower_target` (`targetId`),
  CONSTRAINT `fk_ufollower_source` FOREIGN KEY (`sourceId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_ufollower_target` FOREIGN KEY (`targetId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follower`
--

LOCK TABLES `user_follower` WRITE;
/*!40000 ALTER TABLE `user_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friend`
--

DROP TABLE IF EXISTS `user_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourceId` bigint(20) NOT NULL,
  `targetId` bigint(20) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`sourceId`,`targetId`),
  KEY `idx_friend_source` (`sourceId`),
  KEY `idx_friend_target` (`targetId`),
  CONSTRAINT `fk_friend_source` FOREIGN KEY (`sourceId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_target` FOREIGN KEY (`targetId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friend`
--

LOCK TABLES `user_friend` WRITE;
/*!40000 ALTER TABLE `user_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sourceId` bigint(20) NOT NULL,
  `targetId` bigint(20) NOT NULL,
  `message` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umessage_source` (`sourceId`),
  KEY `idx_umessage_target` (`targetId`),
  CONSTRAINT `fk_umessage_source` FOREIGN KEY (`sourceId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_umessage_target` FOREIGN KEY (`targetId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `senderId` bigint(20) DEFAULT NULL,
  `message` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_upost_user` (`userId`),
  KEY `idx_upost_sender` (`senderId`),
  CONSTRAINT `fk_upost_sender` FOREIGN KEY (`senderId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_upost_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_post`
--

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-01 20:08:12
