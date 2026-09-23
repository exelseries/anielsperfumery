-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: aniels
-- ------------------------------------------------------
-- Server version	8.4.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int unsigned DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (584,'cart_billing',NULL,NULL,546,NULL,'Oscar','Crane',NULL,'Roy Ewing Inc','In accusamus itaque','Est quia minima qui','Perferendis iste ita','CZ','Sint voluptas mollit','xate@mailinator.com','+1 (836) 326-2846','',0,1,NULL,'2026-09-23 07:32:00','2026-09-23 07:32:00'),(585,'cart_shipping',NULL,NULL,546,NULL,'Oscar','Crane',NULL,'Roy Ewing Inc','In accusamus itaque','Est quia minima qui','Perferendis iste ita','CZ','Sint voluptas mollit','xate@mailinator.com','+1 (836) 326-2846',NULL,0,0,NULL,'2026-09-23 07:32:00','2026-09-23 07:32:00'),(586,'order_shipping',NULL,NULL,NULL,111,'Oscar','Crane',NULL,'Roy Ewing Inc','In accusamus itaque','Est quia minima qui','Perferendis iste ita','CZ','Sint voluptas mollit','xate@mailinator.com','+1 (836) 326-2846',NULL,0,0,NULL,'2026-09-23 07:44:15','2026-09-23 07:44:15'),(587,'order_billing',NULL,NULL,NULL,111,'Oscar','Crane',NULL,'Roy Ewing Inc','In accusamus itaque','Est quia minima qui','Perferendis iste ita','CZ','Sint voluptas mollit','xate@mailinator.com','+1 (836) 326-2846','',0,0,NULL,'2026-09-23 07:44:15','2026-09-23 07:44:15');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_password_resets`
--

LOCK TABLES `admin_password_resets` WRITE;
/*!40000 ALTER TABLE `admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_backup_codes` json DEFAULT NULL,
  `two_factor_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Admin','admin@example.com','$2y$12$Vwp3gOsjI6Dc0J3Mz48DQuSy73ftGcmbk3jwtFECr5XsFa6IUSiKK',NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,'Super Admin','superadmin@aniels.com','$2y$12$k7Io54f8pIjFSuUAVeTgbO5dG9NViiciP23X9kgjO6h0vplci5oMu',NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,'2026-07-23 20:32:44','2026-07-23 20:32:44'),(3,'Dev Admin','devadmin@aniels.com','$2y$12$YTJXfnPAcD2Jbt3IwB.0B.zzkAtDISdtB9.iEYr1txCPDlLrDVU22',NULL,1,1,NULL,NULL,NULL,0,NULL,NULL,'2026-07-23 20:32:44','2026-07-23 20:32:44');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_conversation_messages`
--

DROP TABLE IF EXISTS `agent_conversation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_conversation_messages` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversation_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_calls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tool_results` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_index` (`conversation_id`,`user_id`,`updated_at`),
  KEY `agent_conversation_messages_user_id_index` (`user_id`),
  KEY `agent_conversation_messages_conversation_id_index` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_conversation_messages`
--

LOCK TABLES `agent_conversation_messages` WRITE;
/*!40000 ALTER TABLE `agent_conversation_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_conversation_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_conversations`
--

DROP TABLE IF EXISTS `agent_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent_conversations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_conversations_user_id_updated_at_index` (`user_id`,`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_conversations`
--

LOCK TABLES `agent_conversations` WRITE;
/*!40000 ALTER TABLE `agent_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_families`
--

DROP TABLE IF EXISTS `attribute_families`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_families` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_families`
--

LOCK TABLES `attribute_families` WRITE;
/*!40000 ALTER TABLE `attribute_families` DISABLE KEYS */;
INSERT INTO `attribute_families` VALUES (1,'default','Default',0,1);
/*!40000 ALTER TABLE `attribute_families` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_group_mappings`
--

DROP TABLE IF EXISTS `attribute_group_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int unsigned NOT NULL,
  `attribute_group_id` int unsigned NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_group_mappings`
--

LOCK TABLES `attribute_group_mappings` WRITE;
/*!40000 ALTER TABLE `attribute_group_mappings` DISABLE KEYS */;
INSERT INTO `attribute_group_mappings` VALUES (1,1,1),(2,1,3),(3,1,4),(4,1,5),(5,6,1),(6,6,2),(7,6,3),(8,6,4),(9,2,1),(10,2,2),(11,4,1),(12,4,2),(13,4,3),(14,4,4),(15,4,5),(16,3,1),(17,3,2),(18,3,3),(19,5,1),(20,5,2),(21,5,3),(22,5,4),(23,1,6),(24,1,7),(25,1,8),(26,6,5),(27,1,2),(28,7,1),(29,8,1),(30,8,2),(31,2,50),(32,2,51),(33,2,52),(34,2,53),(35,2,54),(36,2,55),(37,2,56),(38,2,57);
/*!40000 ALTER TABLE `attribute_group_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_groups`
--

DROP TABLE IF EXISTS `attribute_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int NOT NULL DEFAULT '1',
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_groups`
--

LOCK TABLES `attribute_groups` WRITE;
/*!40000 ALTER TABLE `attribute_groups` DISABLE KEYS */;
INSERT INTO `attribute_groups` VALUES (1,'general',1,'General',1,1,0),(2,'description',1,'Description',1,2,0),(3,'meta_description',1,'Meta Description',1,3,0),(4,'price',1,'Price',2,1,0),(5,'shipping',1,'Shipping',2,2,0),(6,'settings',1,'Settings',2,3,0),(7,'inventories',1,'Inventories',2,4,0),(8,'rma',1,'RMA',2,5,0);
/*!40000 ALTER TABLE `attribute_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_option_translations`
--

DROP TABLE IF EXISTS `attribute_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_option_translations`
--

LOCK TABLES `attribute_option_translations` WRITE;
/*!40000 ALTER TABLE `attribute_option_translations` DISABLE KEYS */;
INSERT INTO `attribute_option_translations` VALUES (1,1,'en','Red'),(2,2,'en','Green'),(3,3,'en','Yellow'),(4,4,'en','Black'),(5,5,'en','White'),(6,6,'en','S'),(7,7,'en','M'),(8,8,'en','L'),(9,9,'en','XL'),(10,10,'en','Oud & Spicy'),(11,10,'fr','Oud & Spicy'),(12,10,'es','Oud & Spicy'),(13,10,'de','Oud & Spicy'),(14,10,'ar','Oud & Spicy'),(15,11,'en','Citrus & Aquatic'),(16,11,'fr','Citrus & Aquatic'),(17,11,'es','Citrus & Aquatic'),(18,11,'de','Citrus & Aquatic'),(19,11,'ar','Citrus & Aquatic'),(20,12,'en','Vanilla & Amber'),(21,12,'fr','Vanilla & Amber'),(22,12,'es','Vanilla & Amber'),(23,12,'de','Vanilla & Amber'),(24,12,'ar','Vanilla & Amber'),(25,13,'en','Floral & Musk'),(26,13,'fr','Floral & Musk'),(27,13,'es','Floral & Musk'),(28,13,'de','Floral & Musk'),(29,13,'ar','Floral & Musk'),(30,14,'en','Leather & Woods'),(31,14,'fr','Leather & Woods'),(32,14,'es','Leather & Woods'),(33,14,'de','Leather & Woods'),(34,14,'ar','Leather & Woods'),(35,15,'en','Intimate'),(36,15,'fr','Intimate'),(37,15,'es','Intimate'),(38,15,'de','Intimate'),(39,15,'ar','Intimate'),(40,16,'en','Moderate'),(41,16,'fr','Moderate'),(42,16,'es','Moderate'),(43,16,'de','Moderate'),(44,16,'ar','Moderate'),(45,17,'en','Long Lasting'),(46,17,'fr','Long Lasting'),(47,17,'es','Long Lasting'),(48,17,'de','Long Lasting'),(49,17,'ar','Long Lasting'),(50,18,'en','Eternal'),(51,18,'fr','Eternal'),(52,18,'es','Eternal'),(53,18,'de','Eternal'),(54,18,'ar','Eternal'),(55,19,'en','Intimate'),(56,19,'fr','Intimate'),(57,19,'es','Intimate'),(58,19,'de','Intimate'),(59,19,'ar','Intimate'),(60,20,'en','Moderate'),(61,20,'fr','Moderate'),(62,20,'es','Moderate'),(63,20,'de','Moderate'),(64,20,'ar','Moderate'),(65,21,'en','Strong'),(66,21,'fr','Strong'),(67,21,'es','Strong'),(68,21,'de','Strong'),(69,21,'ar','Strong'),(70,22,'en','Enormous'),(71,22,'fr','Enormous'),(72,22,'es','Enormous'),(73,22,'de','Enormous'),(74,22,'ar','Enormous'),(75,23,'en','Office'),(76,23,'fr','Office'),(77,23,'es','Office'),(78,23,'de','Office'),(79,23,'ar','Office'),(80,24,'en','Date Night'),(81,24,'fr','Date Night'),(82,24,'es','Date Night'),(83,24,'de','Date Night'),(84,24,'ar','Date Night'),(85,25,'en','Wedding'),(86,25,'fr','Wedding'),(87,25,'es','Wedding'),(88,25,'de','Wedding'),(89,25,'ar','Wedding'),(90,26,'en','Everyday'),(91,26,'fr','Everyday'),(92,26,'es','Everyday'),(93,26,'de','Everyday'),(94,26,'ar','Everyday'),(95,27,'en','Party'),(96,27,'fr','Party'),(97,27,'es','Party'),(98,27,'de','Party'),(99,27,'ar','Party'),(100,28,'en','Dry Season'),(101,28,'fr','Dry Season'),(102,28,'es','Dry Season'),(103,28,'de','Dry Season'),(104,28,'ar','Dry Season'),(105,29,'en','Rainy Season'),(106,29,'fr','Rainy Season'),(107,29,'es','Rainy Season'),(108,29,'de','Rainy Season'),(109,29,'ar','Rainy Season'),(110,30,'en','All-Year'),(111,30,'fr','All-Year'),(112,30,'es','All-Year'),(113,30,'de','All-Year'),(114,30,'ar','All-Year');
/*!40000 ALTER TABLE `attribute_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `swatch_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
INSERT INTO `attribute_options` VALUES (1,23,'Red',1,NULL),(2,23,'Green',2,NULL),(3,23,'Yellow',3,NULL),(4,23,'Black',4,NULL),(5,23,'White',5,NULL),(6,24,'S',1,NULL),(7,24,'M',2,NULL),(8,24,'L',3,NULL),(9,24,'XL',4,NULL),(10,34,'Oud & Spicy',1,NULL),(11,34,'Citrus & Aquatic',2,NULL),(12,34,'Vanilla & Amber',3,NULL),(13,34,'Floral & Musk',4,NULL),(14,34,'Leather & Woods',5,NULL),(15,35,'Intimate',1,NULL),(16,35,'Moderate',2,NULL),(17,35,'Long Lasting',3,NULL),(18,35,'Eternal',4,NULL),(19,36,'Intimate',1,NULL),(20,36,'Moderate',2,NULL),(21,36,'Strong',3,NULL),(22,36,'Enormous',4,NULL),(23,37,'Office',1,NULL),(24,37,'Date Night',2,NULL),(25,37,'Wedding',3,NULL),(26,37,'Everyday',4,NULL),(27,37,'Party',5,NULL),(28,38,'Dry Season',1,NULL),(29,38,'Rainy Season',2,NULL),(30,38,'All-Year',3,NULL);
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_translations`
--

DROP TABLE IF EXISTS `attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_translations`
--

LOCK TABLES `attribute_translations` WRITE;
/*!40000 ALTER TABLE `attribute_translations` DISABLE KEYS */;
INSERT INTO `attribute_translations` VALUES (1,1,'en','SKU'),(2,2,'en','Name'),(3,3,'en','URL Key'),(4,4,'en','Tax Category'),(5,5,'en','New'),(6,6,'en','Featured'),(7,7,'en','Visible Individually'),(8,8,'en','Status'),(9,9,'en','Short Description'),(10,10,'en','Description'),(11,11,'en','Price'),(12,12,'en','Cost'),(13,13,'en','Special Price'),(14,14,'en','Special Price From'),(15,15,'en','Special Price To'),(16,16,'en','Meta Title'),(17,17,'en','Meta Keywords'),(18,18,'en','Meta Description'),(19,19,'en','Length'),(20,20,'en','Width'),(21,21,'en','Height'),(22,22,'en','Weight'),(23,23,'en','Color'),(24,24,'en','Size'),(25,25,'en','Brand'),(26,26,'en','Guest Checkout'),(27,27,'en','Product Number'),(28,28,'en','Manage Stock'),(29,29,'en','Allow RMA'),(30,30,'en','RMA Rules'),(31,31,'en','Top Notes'),(32,31,'fr','Top Notes'),(33,31,'es','Top Notes'),(34,31,'de','Top Notes'),(35,31,'ar','Top Notes'),(36,32,'en','Middle Notes'),(37,32,'fr','Middle Notes'),(38,32,'es','Middle Notes'),(39,32,'de','Middle Notes'),(40,32,'ar','Middle Notes'),(41,33,'en','Base Notes'),(42,33,'fr','Base Notes'),(43,33,'es','Base Notes'),(44,33,'de','Base Notes'),(45,33,'ar','Base Notes'),(46,34,'en','Fragrance Family'),(47,34,'fr','Fragrance Family'),(48,34,'es','Fragrance Family'),(49,34,'de','Fragrance Family'),(50,34,'ar','Fragrance Family'),(51,35,'en','Longevity Rating'),(52,35,'fr','Longevity Rating'),(53,35,'es','Longevity Rating'),(54,35,'de','Longevity Rating'),(55,35,'ar','Longevity Rating'),(56,36,'en','Projection Rating'),(57,36,'fr','Projection Rating'),(58,36,'es','Projection Rating'),(59,36,'de','Projection Rating'),(60,36,'ar','Projection Rating'),(61,37,'en','Occasion'),(62,37,'fr','Occasion'),(63,37,'es','Occasion'),(64,37,'de','Occasion'),(65,37,'ar','Occasion'),(66,38,'en','Season'),(67,38,'fr','Season'),(68,38,'es','Season'),(69,38,'de','Season'),(70,38,'ar','Season');
/*!40000 ALTER TABLE `attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attributes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`),
  KEY `attributes_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,'sku','SKU','text',NULL,NULL,NULL,1,1,1,0,0,0,0,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(2,'name','Name','text',NULL,NULL,NULL,3,1,0,0,1,0,0,0,1,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(3,'url_key','URL Key','text',NULL,NULL,NULL,4,1,1,0,0,0,0,0,1,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(4,'tax_category_id','Tax Category','select',NULL,NULL,NULL,5,0,0,0,0,0,0,0,0,1,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(5,'new','New','boolean',NULL,NULL,NULL,6,0,0,0,0,0,0,0,0,0,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(6,'featured','Featured','boolean',NULL,NULL,NULL,7,0,0,0,0,0,0,0,0,0,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(7,'visible_individually','Visible Individually','boolean',NULL,NULL,NULL,9,1,0,0,0,0,0,0,0,0,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(8,'status','Status','boolean',NULL,NULL,NULL,10,1,0,0,0,0,0,0,0,1,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(9,'short_description','Short Description','textarea',NULL,NULL,NULL,11,1,0,0,0,0,0,0,1,0,NULL,1,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(10,'description','Description','textarea',NULL,NULL,NULL,12,1,0,0,1,0,0,0,1,0,NULL,1,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(11,'price','Price','price',NULL,'decimal',NULL,13,1,0,1,1,0,0,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(12,'cost','Cost','price',NULL,'decimal',NULL,14,0,0,0,0,0,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(13,'special_price','Special Price','price',NULL,'decimal',NULL,15,0,0,0,0,0,0,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(14,'special_price_from','Special Price From','date',NULL,NULL,NULL,16,0,0,0,0,0,0,0,0,1,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(15,'special_price_to','Special Price To','date',NULL,NULL,NULL,17,0,0,0,0,0,0,0,0,1,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(16,'meta_title','Meta Title','textarea',NULL,NULL,NULL,18,0,0,0,0,0,0,0,1,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(17,'meta_keywords','Meta Keywords','textarea',NULL,NULL,NULL,20,0,0,0,0,0,0,0,1,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(18,'meta_description','Meta Description','textarea',NULL,NULL,NULL,21,0,0,0,0,0,1,0,1,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(19,'length','Length','text',NULL,'decimal',NULL,22,0,0,0,0,0,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(20,'width','Width','text',NULL,'decimal',NULL,23,0,0,0,0,0,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(21,'height','Height','text',NULL,'decimal',NULL,24,0,0,0,0,0,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(22,'weight','Weight','text',NULL,'decimal',NULL,25,1,0,0,0,0,0,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(23,'color','Color','select',NULL,NULL,NULL,26,0,0,1,0,1,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(24,'size','Size','select',NULL,NULL,NULL,27,0,0,1,0,1,1,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(25,'brand','Brand','select',NULL,NULL,NULL,28,0,0,1,0,0,1,1,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(26,'guest_checkout','Guest Checkout','boolean',NULL,NULL,NULL,8,1,0,0,0,0,0,0,0,0,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(27,'product_number','Product Number','text',NULL,NULL,NULL,2,0,1,0,0,0,0,0,0,0,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(28,'manage_stock','Manage Stock','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,1,1,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(29,'allow_rma','Allow RMA','boolean',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(30,'rma_rule_id','RMA Rules','select',NULL,NULL,NULL,5,0,0,0,0,0,0,0,0,1,NULL,0,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(31,'top_notes','Top Notes','text',NULL,NULL,NULL,50,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(32,'middle_notes','Middle Notes','text',NULL,NULL,NULL,51,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(33,'base_notes','Base Notes','text',NULL,NULL,NULL,52,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(34,'fragrance_family','Fragrance Family','select',NULL,NULL,NULL,53,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(35,'longevity','Longevity Rating','select',NULL,NULL,NULL,54,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(36,'projection','Projection Rating','select',NULL,NULL,NULL,55,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(37,'occasion','Occasion','multiselect',NULL,NULL,NULL,56,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11'),(38,'season','Season','multiselect',NULL,NULL,NULL,57,0,0,1,1,0,1,1,0,0,NULL,0,'2026-07-23 20:33:11','2026-07-23 20:33:11');
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_appointment_slots`
--

DROP TABLE IF EXISTS `booking_product_appointment_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_appointment_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_appointment_slots`
--

LOCK TABLES `booking_product_appointment_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_appointment_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_appointment_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_default_slots`
--

DROP TABLE IF EXISTS `booking_product_default_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_default_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `booking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_default_slots`
--

LOCK TABLES `booking_product_default_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_default_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_default_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_ticket_translations`
--

DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_ticket_translations`
--

LOCK TABLES `booking_product_event_ticket_translations` WRITE;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_ticket_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_event_tickets`
--

DROP TABLE IF EXISTS `booking_product_event_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_event_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_event_tickets`
--

LOCK TABLES `booking_product_event_tickets` WRITE;
/*!40000 ALTER TABLE `booking_product_event_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_event_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_rental_slots`
--

DROP TABLE IF EXISTS `booking_product_rental_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_rental_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `renting_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_rental_slots`
--

LOCK TABLES `booking_product_rental_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_rental_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_rental_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_product_table_slots`
--

DROP TABLE IF EXISTS `booking_product_table_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_product_table_slots` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int unsigned NOT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `allow_slot_overlap` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_product_table_slots`
--

LOCK TABLES `booking_product_table_slots` WRITE;
/*!40000 ALTER TABLE `booking_product_table_slots` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product_table_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_products`
--

DROP TABLE IF EXISTS `booking_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_products`
--

LOCK TABLES `booking_products` WRITE;
/*!40000 ALTER TABLE `booking_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `allow_cancellation` tinyint(1) NOT NULL DEFAULT '1',
  `booking_product_event_ticket_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_item_id_foreign` (`order_item_id`),
  KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (545,NULL,NULL,NULL,NULL,NULL,0,1,1.0000,NULL,'NGN','NGN','NGN','NGN',100.0000,100.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,NULL,1,1,NULL,NULL,1,'2026-09-23 07:05:28','2026-09-23 07:05:28'),(546,'xate@mailinator.com','Oscar','Crane','flatrate_flatrate',NULL,0,1,1.0000,NULL,'NGN','NGN','NGN','NGN',110.0000,110.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,10.0000,10.0000,10.0000,10.0000,100.0000,100.0000,NULL,1,0,NULL,NULL,1,'2026-09-23 07:08:04','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item_inventories`
--

DROP TABLE IF EXISTS `cart_item_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned DEFAULT NULL,
  `cart_item_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item_inventories`
--

LOCK TABLES `cart_item_inventories` WRITE;
/*!40000 ALTER TABLE `cart_item_inventories` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_item_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=992 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (989,1,'ANIELS-3799','simple','Soleil D\'Or Citrus',NULL,0.0000,0.0000,0.0000,100.0000,100.0000,NULL,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,100.0000,100.0000,NULL,NULL,2395,545,NULL,NULL,'{\"cart_id\": 545, \"quantity\": 1, \"product_id\": 2395}','2026-09-23 07:05:28','2026-09-23 07:05:28'),(991,1,'ANIELS-3799','simple','Soleil D\'Or Citrus',NULL,0.0000,0.0000,0.0000,100.0000,100.0000,NULL,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,100.0000,100.0000,NULL,NULL,2395,546,NULL,NULL,'{\"cart_id\": 546, \"quantity\": 1, \"product_id\": 2395}','2026-09-23 07:22:22','2026-09-23 07:22:22');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_payment`
--

DROP TABLE IF EXISTS `cart_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_payment`
--

LOCK TABLES `cart_payment` WRITE;
/*!40000 ALTER TABLE `cart_payment` DISABLE KEYS */;
INSERT INTO `cart_payment` VALUES (113,'squadco','SquadCo Payment',546,'2026-09-23 07:39:54','2026-09-23 07:39:54');
/*!40000 ALTER TABLE `cart_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_channels`
--

DROP TABLE IF EXISTS `cart_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_channels`
--

LOCK TABLES `cart_rule_channels` WRITE;
/*!40000 ALTER TABLE `cart_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupon_usage`
--

DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupon_usage`
--

LOCK TABLES `cart_rule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_coupons`
--

DROP TABLE IF EXISTS `cart_rule_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int unsigned NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_coupons`
--

LOCK TABLES `cart_rule_coupons` WRITE;
/*!40000 ALTER TABLE `cart_rule_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customer_groups`
--

DROP TABLE IF EXISTS `cart_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customer_groups`
--

LOCK TABLES `cart_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `cart_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_customers`
--

DROP TABLE IF EXISTS `cart_rule_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint unsigned NOT NULL DEFAULT '0',
  `customer_id` int unsigned NOT NULL,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_customers`
--

LOCK TABLES `cart_rule_customers` WRITE;
/*!40000 ALTER TABLE `cart_rule_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rule_translations`
--

DROP TABLE IF EXISTS `cart_rule_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rule_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rule_translations`
--

LOCK TABLES `cart_rule_translations` WRITE;
/*!40000 ALTER TABLE `cart_rule_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rule_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_rules`
--

DROP TABLE IF EXISTS `cart_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_rules`
--

LOCK TABLES `cart_rules` WRITE;
/*!40000 ALTER TABLE `cart_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_shipping_rates`
--

DROP TABLE IF EXISTS `cart_shipping_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_shipping_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_shipping_rates`
--

LOCK TABLES `cart_shipping_rates` WRITE;
/*!40000 ALTER TABLE `cart_shipping_rates` DISABLE KEYS */;
INSERT INTO `cart_shipping_rates` VALUES (128,'flatrate','Flat Rate','flatrate_flatrate','Flat Rate','Flat Rate Shipping',10,10,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,10.0000,NULL,1,585,'2026-09-23 07:39:53','2026-09-23 07:39:53',546),(129,'free','Free Shipping','free_free','Free Shipping','Free Shipping',0,0,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,1,585,'2026-09-23 07:39:53','2026-09-23 07:39:53',546);
/*!40000 ALTER TABLE `cart_shipping_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_channels`
--

DROP TABLE IF EXISTS `catalog_rule_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_channels`
--

LOCK TABLES `catalog_rule_channels` WRITE;
/*!40000 ALTER TABLE `catalog_rule_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_customer_groups`
--

DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_customer_groups`
--

LOCK TABLES `catalog_rule_customer_groups` WRITE;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_product_prices`
--

DROP TABLE IF EXISTS `catalog_rule_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1994 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_product_prices`
--

LOCK TABLES `catalog_rule_product_prices` WRITE;
/*!40000 ALTER TABLE `catalog_rule_product_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rule_products`
--

DROP TABLE IF EXISTS `catalog_rule_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rule_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned NOT NULL,
  `catalog_rule_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=669 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rule_products`
--

LOCK TABLES `catalog_rule_products` WRITE;
/*!40000 ALTER TABLE `catalog_rule_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rule_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_rules`
--

DROP TABLE IF EXISTS `catalog_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_rules`
--

LOCK TABLES `catalog_rules` WRITE;
/*!40000 ALTER TABLE `catalog_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int unsigned NOT NULL DEFAULT '0',
  `_rgt` int unsigned NOT NULL DEFAULT '0',
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'products_and_description',1,84,NULL,NULL,NULL,'2026-07-14 19:05:12','2026-07-14 19:05:12'),(37,1,NULL,1,'products_and_description',2,3,1,NULL,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(38,2,NULL,1,'products_and_description',4,5,1,NULL,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(39,3,NULL,1,'products_and_description',6,7,1,NULL,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(40,4,NULL,1,'products_and_description',8,9,1,NULL,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_filterable_attributes`
--

DROP TABLE IF EXISTS `category_filterable_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_filterable_attributes`
--

LOCK TABLES `category_filterable_attributes` WRITE;
/*!40000 ALTER TABLE `category_filterable_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_filterable_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,1,'Root','root','','Root Category Description','','','',NULL,'en'),(37,37,'Extrait de Parfum','extrait-de-parfum','','Highest concentration luxury extraits crafted for long-lasting sillage.','Extrait de Parfum — Aniel\'s Perfumery','Highest concentration luxury extraits crafted for long-lasting sillage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'en'),(38,37,'Extrait de Parfum','extrait-de-parfum','','Highest concentration luxury extraits crafted for long-lasting sillage.','Extrait de Parfum — Aniel\'s Perfumery','Highest concentration luxury extraits crafted for long-lasting sillage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'fr'),(39,37,'Extrait de Parfum','extrait-de-parfum','','Highest concentration luxury extraits crafted for long-lasting sillage.','Extrait de Parfum — Aniel\'s Perfumery','Highest concentration luxury extraits crafted for long-lasting sillage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'es'),(40,37,'Extrait de Parfum','extrait-de-parfum','','Highest concentration luxury extraits crafted for long-lasting sillage.','Extrait de Parfum — Aniel\'s Perfumery','Highest concentration luxury extraits crafted for long-lasting sillage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'de'),(41,37,'Extrait de Parfum','extrait-de-parfum','','Highest concentration luxury extraits crafted for long-lasting sillage.','Extrait de Parfum — Aniel\'s Perfumery','Highest concentration luxury extraits crafted for long-lasting sillage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'ar'),(42,38,'Eau de Parfum','eau-de-parfum','','Sophisticated eau de parfums for daily elegance and signature presence.','Eau de Parfum — Aniel\'s Perfumery','Sophisticated eau de parfums for daily elegance and signature presence.','perfume, fragrance, luxury, oud, Nigeria',NULL,'en'),(43,38,'Eau de Parfum','eau-de-parfum','','Sophisticated eau de parfums for daily elegance and signature presence.','Eau de Parfum — Aniel\'s Perfumery','Sophisticated eau de parfums for daily elegance and signature presence.','perfume, fragrance, luxury, oud, Nigeria',NULL,'fr'),(44,38,'Eau de Parfum','eau-de-parfum','','Sophisticated eau de parfums for daily elegance and signature presence.','Eau de Parfum — Aniel\'s Perfumery','Sophisticated eau de parfums for daily elegance and signature presence.','perfume, fragrance, luxury, oud, Nigeria',NULL,'es'),(45,38,'Eau de Parfum','eau-de-parfum','','Sophisticated eau de parfums for daily elegance and signature presence.','Eau de Parfum — Aniel\'s Perfumery','Sophisticated eau de parfums for daily elegance and signature presence.','perfume, fragrance, luxury, oud, Nigeria',NULL,'de'),(46,38,'Eau de Parfum','eau-de-parfum','','Sophisticated eau de parfums for daily elegance and signature presence.','Eau de Parfum — Aniel\'s Perfumery','Sophisticated eau de parfums for daily elegance and signature presence.','perfume, fragrance, luxury, oud, Nigeria',NULL,'ar'),(47,39,'Private Reserve Oud','private-reserve-oud','','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','Private Reserve Oud — Aniel\'s Perfumery','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','perfume, fragrance, luxury, oud, Nigeria',NULL,'en'),(48,39,'Private Reserve Oud','private-reserve-oud','','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','Private Reserve Oud — Aniel\'s Perfumery','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','perfume, fragrance, luxury, oud, Nigeria',NULL,'fr'),(49,39,'Private Reserve Oud','private-reserve-oud','','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','Private Reserve Oud — Aniel\'s Perfumery','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','perfume, fragrance, luxury, oud, Nigeria',NULL,'es'),(50,39,'Private Reserve Oud','private-reserve-oud','','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','Private Reserve Oud — Aniel\'s Perfumery','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','perfume, fragrance, luxury, oud, Nigeria',NULL,'de'),(51,39,'Private Reserve Oud','private-reserve-oud','','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','Private Reserve Oud — Aniel\'s Perfumery','Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.','perfume, fragrance, luxury, oud, Nigeria',NULL,'ar'),(52,40,'Bespoke Fragrances','bespoke-fragrances','','Masterfully blended artisan creations inspired by royal Nigerian heritage.','Bespoke Fragrances — Aniel\'s Perfumery','Masterfully blended artisan creations inspired by royal Nigerian heritage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'en'),(53,40,'Bespoke Fragrances','bespoke-fragrances','','Masterfully blended artisan creations inspired by royal Nigerian heritage.','Bespoke Fragrances — Aniel\'s Perfumery','Masterfully blended artisan creations inspired by royal Nigerian heritage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'fr'),(54,40,'Bespoke Fragrances','bespoke-fragrances','','Masterfully blended artisan creations inspired by royal Nigerian heritage.','Bespoke Fragrances — Aniel\'s Perfumery','Masterfully blended artisan creations inspired by royal Nigerian heritage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'es'),(55,40,'Bespoke Fragrances','bespoke-fragrances','','Masterfully blended artisan creations inspired by royal Nigerian heritage.','Bespoke Fragrances — Aniel\'s Perfumery','Masterfully blended artisan creations inspired by royal Nigerian heritage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'de'),(56,40,'Bespoke Fragrances','bespoke-fragrances','','Masterfully blended artisan creations inspired by royal Nigerian heritage.','Bespoke Fragrances — Aniel\'s Perfumery','Masterfully blended artisan creations inspired by royal Nigerian heritage.','perfume, fragrance, luxury, oud, Nigeria',NULL,'ar');
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_currencies`
--

DROP TABLE IF EXISTS `channel_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_currencies` (
  `channel_id` int unsigned NOT NULL,
  `currency_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  KEY `channel_currencies_cid_cyid_idx` (`channel_id`,`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_currencies`
--

LOCK TABLES `channel_currencies` WRITE;
/*!40000 ALTER TABLE `channel_currencies` DISABLE KEYS */;
INSERT INTO `channel_currencies` VALUES (1,1);
/*!40000 ALTER TABLE `channel_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_inventory_sources`
--

DROP TABLE IF EXISTS `channel_inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int unsigned NOT NULL,
  `inventory_source_id` int unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_inventory_sources`
--

LOCK TABLES `channel_inventory_sources` WRITE;
/*!40000 ALTER TABLE `channel_inventory_sources` DISABLE KEYS */;
INSERT INTO `channel_inventory_sources` VALUES (1,1);
/*!40000 ALTER TABLE `channel_inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_locales`
--

DROP TABLE IF EXISTS `channel_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_locales` (
  `channel_id` int unsigned NOT NULL,
  `locale_id` int unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  KEY `channel_locales_cid_lid_idx` (`channel_id`,`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_locales`
--

LOCK TABLES `channel_locales` WRITE;
/*!40000 ALTER TABLE `channel_locales` DISABLE KEYS */;
INSERT INTO `channel_locales` VALUES (1,1);
/*!40000 ALTER TABLE `channel_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channel_translations`
--

DROP TABLE IF EXISTS `channel_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channel_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channel_translations`
--

LOCK TABLES `channel_translations` WRITE;
/*!40000 ALTER TABLE `channel_translations` DISABLE KEYS */;
INSERT INTO `channel_translations` VALUES (1,1,'en','Default',NULL,NULL,'{\"meta_title\": \"Demo store\", \"meta_keywords\": \"Demo store meta keyword\", \"meta_description\": \"Demo store meta description\"}',NULL,NULL);
/*!40000 ALTER TABLE `channel_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int unsigned DEFAULT NULL,
  `default_locale_id` int unsigned NOT NULL,
  `base_currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  KEY `channels_hostname_idx` (`hostname`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'default',NULL,'default','http://localhost',NULL,NULL,NULL,0,NULL,1,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_channels`
--

DROP TABLE IF EXISTS `cms_page_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_channels`
--

LOCK TABLES `cms_page_channels` WRITE;
/*!40000 ALTER TABLE `cms_page_channels` DISABLE KEYS */;
INSERT INTO `cms_page_channels` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1);
/*!40000 ALTER TABLE `cms_page_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_page_translations`
--

DROP TABLE IF EXISTS `cms_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_page_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_translations`
--

LOCK TABLES `cms_page_translations` WRITE;
/*!40000 ALTER TABLE `cms_page_translations` DISABLE KEYS */;
INSERT INTO `cms_page_translations` VALUES (1,'About Us','about-us','<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>','about us','','aboutus','en',1),(2,'Return Policy','return-policy','<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>','return policy','','return, policy','en',2),(3,'Refund Policy','refund-policy','<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>','Refund policy','','refund, policy','en',3),(4,'Terms & Conditions','terms-conditions','<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>','Terms & Conditions','','term, conditions','en',4),(5,'Terms of Use','terms-of-use','<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>','Terms of use','','term, use','en',5),(6,'Customer Service','customer-service','<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>','Customer Service','','customer, service','en',6),(7,'What\'s New','whats-new','<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>','What\'s New','','new','en',7),(8,'Payment Policy','payment-policy','<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>','Payment Policy','','payment, policy','en',8),(9,'Shipping Policy','shipping-policy','<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>','Shipping Policy','','shipping, policy','en',9),(10,'Privacy Policy','privacy-policy','<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>','Privacy Policy','','privacy, policy','en',10);
/*!40000 ALTER TABLE `cms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_pages`
--

DROP TABLE IF EXISTS `cms_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_pages`
--

LOCK TABLES `cms_pages` WRITE;
/*!40000 ALTER TABLE `cms_pages` DISABLE KEYS */;
INSERT INTO `cms_pages` VALUES (1,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(3,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(4,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(5,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(6,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(7,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(8,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(9,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(10,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `cms_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_items`
--

DROP TABLE IF EXISTS `compare_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compare_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_items`
--

LOCK TABLES `compare_items` WRITE;
/*!40000 ALTER TABLE `compare_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `compare_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_config`
--

DROP TABLE IF EXISTS `core_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_config`
--

LOCK TABLES `core_config` WRITE;
/*!40000 ALTER TABLE `core_config` DISABLE KEYS */;
INSERT INTO `core_config` VALUES (1,'sales.checkout.shopping_cart.allow_guest_checkout','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,'emails.general.notifications.emails.general.notifications.registration','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(3,'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin','0',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(4,'emails.general.notifications.emails.general.notifications.customer_account_credentials','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(5,'emails.general.notifications.emails.general.notifications.new_order','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(6,'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(7,'emails.general.notifications.emails.general.notifications.new_invoice','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(8,'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin','0',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(9,'emails.general.notifications.emails.general.notifications.new_refund','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(10,'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin','0',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(11,'emails.general.notifications.emails.general.notifications.new_shipment','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(12,'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin','0',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(13,'emails.general.notifications.emails.general.notifications.new_inventory_source','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(14,'emails.general.notifications.emails.general.notifications.cancel_order','1',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(15,'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin','0',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(16,'general.design.categories.category_view','sidebar',NULL,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(17,'customer.settings.social_login.enable_facebook','1','default',NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(18,'customer.settings.social_login.enable_twitter','1','default',NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(19,'customer.settings.social_login.enable_google','1','default',NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(20,'customer.settings.social_login.enable_linkedin','1','default',NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(21,'customer.settings.social_login.enable_github','1','default',NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(345,'sales.payment_methods.stripe.active','0','default',NULL,'2026-09-23 06:52:43','2026-09-23 06:52:43'),(346,'sales.payment_methods.razorpay.active','0','default',NULL,'2026-09-23 06:52:43','2026-09-23 06:52:43'),(347,'sales.payment_methods.payu.active','0','default',NULL,'2026-09-23 06:52:43','2026-09-23 06:52:43'),(348,'sales.payment_methods.phonepe.active','0','default',NULL,'2026-09-23 06:52:43','2026-09-23 06:52:43'),(349,'sales.payment_methods.paypal_smart_button.active','0','default',NULL,'2026-09-23 06:52:43','2026-09-23 06:52:43'),(350,'sales.payment_methods.paypal_standard.active','0','default',NULL,'2026-09-23 06:52:44','2026-09-23 06:52:44'),(351,'sales.payment_methods.cashondelivery.active','0','default',NULL,'2026-09-23 06:52:44','2026-09-23 06:52:44'),(352,'sales.payment_methods.moneytransfer.active','0','default',NULL,'2026-09-23 06:52:44','2026-09-23 06:52:44'),(353,'sales.payment_methods.squadco.active','1','default',NULL,'2026-09-23 06:52:44','2026-09-23 06:52:44'),(354,'sales.payment_methods.squadco.title','SquadCo Payment','default','en','2026-09-23 06:52:44','2026-09-23 06:52:44'),(355,'sales.payment_methods.squadco.description','Pay securely using Card, Bank Transfer, or USSD via SquadCo','default','en','2026-09-23 06:52:44','2026-09-23 06:52:44'),(356,'sales.payment_methods.squadco.public_key','pk_1a4282a2b49c110311f178a1f52b67a8f0e67645',NULL,NULL,'2026-09-23 06:52:45','2026-09-23 06:52:45'),(357,'sales.payment_methods.squadco.secret_key','sk_1a4282a2b49c110376977ab4955e7cacfae1122a',NULL,NULL,'2026-09-23 06:52:45','2026-09-23 06:52:45'),(358,'sales.payment_methods.squadco.sandbox','0',NULL,NULL,'2026-09-23 06:52:45','2026-09-23 06:52:45'),(359,'sales.payment_methods.squadco.sort','1','default',NULL,'2026-09-23 06:52:45','2026-09-23 06:52:45');
/*!40000 ALTER TABLE `core_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan'),(2,'AX','Åland Islands'),(3,'AL','Albania'),(4,'DZ','Algeria'),(5,'AS','American Samoa'),(6,'AD','Andorra'),(7,'AO','Angola'),(8,'AI','Anguilla'),(9,'AQ','Antarctica'),(10,'AG','Antigua & Barbuda'),(11,'AR','Argentina'),(12,'AM','Armenia'),(13,'AW','Aruba'),(14,'AC','Ascension Island'),(15,'AU','Australia'),(16,'AT','Austria'),(17,'AZ','Azerbaijan'),(18,'BS','Bahamas'),(19,'BH','Bahrain'),(20,'BD','Bangladesh'),(21,'BB','Barbados'),(22,'BY','Belarus'),(23,'BE','Belgium'),(24,'BZ','Belize'),(25,'BJ','Benin'),(26,'BM','Bermuda'),(27,'BT','Bhutan'),(28,'BO','Bolivia'),(29,'BA','Bosnia & Herzegovina'),(30,'BW','Botswana'),(31,'BR','Brazil'),(32,'IO','British Indian Ocean Territory'),(33,'VG','British Virgin Islands'),(34,'BN','Brunei'),(35,'BG','Bulgaria'),(36,'BF','Burkina Faso'),(37,'BI','Burundi'),(38,'KH','Cambodia'),(39,'CM','Cameroon'),(40,'CA','Canada'),(41,'IC','Canary Islands'),(42,'CV','Cape Verde'),(43,'BQ','Caribbean Netherlands'),(44,'KY','Cayman Islands'),(45,'CF','Central African Republic'),(46,'EA','Ceuta & Melilla'),(47,'TD','Chad'),(48,'CL','Chile'),(49,'CN','China'),(50,'CX','Christmas Island'),(51,'CC','Cocos (Keeling) Islands'),(52,'CO','Colombia'),(53,'KM','Comoros'),(54,'CG','Congo - Brazzaville'),(55,'CD','Congo - Kinshasa'),(56,'CK','Cook Islands'),(57,'CR','Costa Rica'),(58,'CI','Côte d’Ivoire'),(59,'HR','Croatia'),(60,'CU','Cuba'),(61,'CW','Curaçao'),(62,'CY','Cyprus'),(63,'CZ','Czechia'),(64,'DK','Denmark'),(65,'DG','Diego Garcia'),(66,'DJ','Djibouti'),(67,'DM','Dominica'),(68,'DO','Dominican Republic'),(69,'EC','Ecuador'),(70,'EG','Egypt'),(71,'SV','El Salvador'),(72,'GQ','Equatorial Guinea'),(73,'ER','Eritrea'),(74,'EE','Estonia'),(75,'ET','Ethiopia'),(76,'EZ','Eurozone'),(77,'FK','Falkland Islands'),(78,'FO','Faroe Islands'),(79,'FJ','Fiji'),(80,'FI','Finland'),(81,'FR','France'),(82,'GF','French Guiana'),(83,'PF','French Polynesia'),(84,'TF','French Southern Territories'),(85,'GA','Gabon'),(86,'GM','Gambia'),(87,'GE','Georgia'),(88,'DE','Germany'),(89,'GH','Ghana'),(90,'GI','Gibraltar'),(91,'GR','Greece'),(92,'GL','Greenland'),(93,'GD','Grenada'),(94,'GP','Guadeloupe'),(95,'GU','Guam'),(96,'GT','Guatemala'),(97,'GG','Guernsey'),(98,'GN','Guinea'),(99,'GW','Guinea-Bissau'),(100,'GY','Guyana'),(101,'HT','Haiti'),(102,'HN','Honduras'),(103,'HK','Hong Kong SAR China'),(104,'HU','Hungary'),(105,'IS','Iceland'),(106,'IN','India'),(107,'ID','Indonesia'),(108,'IR','Iran'),(109,'IQ','Iraq'),(110,'IE','Ireland'),(111,'IM','Isle of Man'),(112,'IL','Israel'),(113,'IT','Italy'),(114,'JM','Jamaica'),(115,'JP','Japan'),(116,'JE','Jersey'),(117,'JO','Jordan'),(118,'KZ','Kazakhstan'),(119,'KE','Kenya'),(120,'KI','Kiribati'),(121,'XK','Kosovo'),(122,'KW','Kuwait'),(123,'KG','Kyrgyzstan'),(124,'LA','Laos'),(125,'LV','Latvia'),(126,'LB','Lebanon'),(127,'LS','Lesotho'),(128,'LR','Liberia'),(129,'LY','Libya'),(130,'LI','Liechtenstein'),(131,'LT','Lithuania'),(132,'LU','Luxembourg'),(133,'MO','Macau SAR China'),(134,'MK','Macedonia'),(135,'MG','Madagascar'),(136,'MW','Malawi'),(137,'MY','Malaysia'),(138,'MV','Maldives'),(139,'ML','Mali'),(140,'MT','Malta'),(141,'MH','Marshall Islands'),(142,'MQ','Martinique'),(143,'MR','Mauritania'),(144,'MU','Mauritius'),(145,'YT','Mayotte'),(146,'MX','Mexico'),(147,'FM','Micronesia'),(148,'MD','Moldova'),(149,'MC','Monaco'),(150,'MN','Mongolia'),(151,'ME','Montenegro'),(152,'MS','Montserrat'),(153,'MA','Morocco'),(154,'MZ','Mozambique'),(155,'MM','Myanmar (Burma)'),(156,'NA','Namibia'),(157,'NR','Nauru'),(158,'NP','Nepal'),(159,'NL','Netherlands'),(160,'NC','New Caledonia'),(161,'NZ','New Zealand'),(162,'NI','Nicaragua'),(163,'NE','Niger'),(164,'NG','Nigeria'),(165,'NU','Niue'),(166,'NF','Norfolk Island'),(167,'KP','North Korea'),(168,'MP','Northern Mariana Islands'),(169,'NO','Norway'),(170,'OM','Oman'),(171,'PK','Pakistan'),(172,'PW','Palau'),(173,'PS','Palestinian Territories'),(174,'PA','Panama'),(175,'PG','Papua New Guinea'),(176,'PY','Paraguay'),(177,'PE','Peru'),(178,'PH','Philippines'),(179,'PN','Pitcairn Islands'),(180,'PL','Poland'),(181,'PT','Portugal'),(182,'PR','Puerto Rico'),(183,'QA','Qatar'),(184,'RE','Réunion'),(185,'RO','Romania'),(186,'RU','Russia'),(187,'RW','Rwanda'),(188,'WS','Samoa'),(189,'SM','San Marino'),(190,'ST','São Tomé & Príncipe'),(191,'SA','Saudi Arabia'),(192,'SN','Senegal'),(193,'RS','Serbia'),(194,'SC','Seychelles'),(195,'SL','Sierra Leone'),(196,'SG','Singapore'),(197,'SX','Sint Maarten'),(198,'SK','Slovakia'),(199,'SI','Slovenia'),(200,'SB','Solomon Islands'),(201,'SO','Somalia'),(202,'ZA','South Africa'),(203,'GS','South Georgia & South Sandwich Islands'),(204,'KR','South Korea'),(205,'SS','South Sudan'),(206,'ES','Spain'),(207,'LK','Sri Lanka'),(208,'BL','St. Barthélemy'),(209,'SH','St. Helena'),(210,'KN','St. Kitts & Nevis'),(211,'LC','St. Lucia'),(212,'MF','St. Martin'),(213,'PM','St. Pierre & Miquelon'),(214,'VC','St. Vincent & Grenadines'),(215,'SD','Sudan'),(216,'SR','Suriname'),(217,'SJ','Svalbard & Jan Mayen'),(218,'SZ','Swaziland'),(219,'SE','Sweden'),(220,'CH','Switzerland'),(221,'SY','Syria'),(222,'TW','Taiwan'),(223,'TJ','Tajikistan'),(224,'TZ','Tanzania'),(225,'TH','Thailand'),(226,'TL','Timor-Leste'),(227,'TG','Togo'),(228,'TK','Tokelau'),(229,'TO','Tonga'),(230,'TT','Trinidad & Tobago'),(231,'TA','Tristan da Cunha'),(232,'TN','Tunisia'),(233,'TR','Turkey'),(234,'TM','Turkmenistan'),(235,'TC','Turks & Caicos Islands'),(236,'TV','Tuvalu'),(237,'UM','U.S. Outlying Islands'),(238,'VI','U.S. Virgin Islands'),(239,'UG','Uganda'),(240,'UA','Ukraine'),(241,'AE','United Arab Emirates'),(242,'GB','United Kingdom'),(244,'US','United States'),(245,'UY','Uruguay'),(246,'UZ','Uzbekistan'),(247,'VU','Vanuatu'),(248,'VA','Vatican City'),(249,'VE','Venezuela'),(250,'VN','Vietnam'),(251,'WF','Wallis & Futuna'),(252,'EH','Western Sahara'),(253,'YE','Yemen'),(254,'ZM','Zambia'),(255,'ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_state_translations`
--

DROP TABLE IF EXISTS `country_state_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_state_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_state_translations`
--

LOCK TABLES `country_state_translations` WRITE;
/*!40000 ALTER TABLE `country_state_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_state_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_states`
--

DROP TABLE IF EXISTS `country_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_states` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_states`
--

LOCK TABLES `country_states` WRITE;
/*!40000 ALTER TABLE `country_states` DISABLE KEYS */;
INSERT INTO `country_states` VALUES (1,244,'US','AL','Alabama'),(2,244,'US','AK','Alaska'),(3,244,'US','AS','American Samoa'),(4,244,'US','AZ','Arizona'),(5,244,'US','AR','Arkansas'),(6,244,'US','AE','Armed Forces Africa'),(7,244,'US','AA','Armed Forces Americas'),(8,244,'US','AE','Armed Forces Canada'),(9,244,'US','AE','Armed Forces Europe'),(10,244,'US','AE','Armed Forces Middle East'),(11,244,'US','AP','Armed Forces Pacific'),(12,244,'US','CA','California'),(13,244,'US','CO','Colorado'),(14,244,'US','CT','Connecticut'),(15,244,'US','DE','Delaware'),(16,244,'US','DC','District of Columbia'),(17,244,'US','FM','Federated States Of Micronesia'),(18,244,'US','FL','Florida'),(19,244,'US','GA','Georgia'),(20,244,'US','GU','Guam'),(21,244,'US','HI','Hawaii'),(22,244,'US','ID','Idaho'),(23,244,'US','IL','Illinois'),(24,244,'US','IN','Indiana'),(25,244,'US','IA','Iowa'),(26,244,'US','KS','Kansas'),(27,244,'US','KY','Kentucky'),(28,244,'US','LA','Louisiana'),(29,244,'US','ME','Maine'),(30,244,'US','MH','Marshall Islands'),(31,244,'US','MD','Maryland'),(32,244,'US','MA','Massachusetts'),(33,244,'US','MI','Michigan'),(34,244,'US','MN','Minnesota'),(35,244,'US','MS','Mississippi'),(36,244,'US','MO','Missouri'),(37,244,'US','MT','Montana'),(38,244,'US','NE','Nebraska'),(39,244,'US','NV','Nevada'),(40,244,'US','NH','New Hampshire'),(41,244,'US','NJ','New Jersey'),(42,244,'US','NM','New Mexico'),(43,244,'US','NY','New York'),(44,244,'US','NC','North Carolina'),(45,244,'US','ND','North Dakota'),(46,244,'US','MP','Northern Mariana Islands'),(47,244,'US','OH','Ohio'),(48,244,'US','OK','Oklahoma'),(49,244,'US','OR','Oregon'),(50,244,'US','PW','Palau'),(51,244,'US','PA','Pennsylvania'),(52,244,'US','PR','Puerto Rico'),(53,244,'US','RI','Rhode Island'),(54,244,'US','SC','South Carolina'),(55,244,'US','SD','South Dakota'),(56,244,'US','TN','Tennessee'),(57,244,'US','TX','Texas'),(58,244,'US','UT','Utah'),(59,244,'US','VT','Vermont'),(60,244,'US','VI','Virgin Islands'),(61,244,'US','VA','Virginia'),(62,244,'US','WA','Washington'),(63,244,'US','WV','West Virginia'),(64,244,'US','WI','Wisconsin'),(65,244,'US','WY','Wyoming'),(66,40,'CA','AB','Alberta'),(67,40,'CA','BC','British Columbia'),(68,40,'CA','MB','Manitoba'),(69,40,'CA','NL','Newfoundland and Labrador'),(70,40,'CA','NB','New Brunswick'),(71,40,'CA','NS','Nova Scotia'),(72,40,'CA','NT','Northwest Territories'),(73,40,'CA','NU','Nunavut'),(74,40,'CA','ON','Ontario'),(75,40,'CA','PE','Prince Edward Island'),(76,40,'CA','QC','Quebec'),(77,40,'CA','SK','Saskatchewan'),(78,40,'CA','YT','Yukon Territory'),(79,88,'DE','NDS','Niedersachsen'),(80,88,'DE','BAW','Baden-Württemberg'),(81,88,'DE','BAY','Bayern'),(82,88,'DE','BER','Berlin'),(83,88,'DE','BRG','Brandenburg'),(84,88,'DE','BRE','Bremen'),(85,88,'DE','HAM','Hamburg'),(86,88,'DE','HES','Hessen'),(87,88,'DE','MEC','Mecklenburg-Vorpommern'),(88,88,'DE','NRW','Nordrhein-Westfalen'),(89,88,'DE','RHE','Rheinland-Pfalz'),(90,88,'DE','SAR','Saarland'),(91,88,'DE','SAS','Sachsen'),(92,88,'DE','SAC','Sachsen-Anhalt'),(93,88,'DE','SCN','Schleswig-Holstein'),(94,88,'DE','THE','Thüringen'),(95,16,'AT','WI','Wien'),(96,16,'AT','NO','Niederösterreich'),(97,16,'AT','OO','Oberösterreich'),(98,16,'AT','SB','Salzburg'),(99,16,'AT','KN','Kärnten'),(100,16,'AT','ST','Steiermark'),(101,16,'AT','TI','Tirol'),(102,16,'AT','BL','Burgenland'),(103,16,'AT','VB','Vorarlberg'),(104,220,'CH','AG','Aargau'),(105,220,'CH','AI','Appenzell Innerrhoden'),(106,220,'CH','AR','Appenzell Ausserrhoden'),(107,220,'CH','BE','Bern'),(108,220,'CH','BL','Basel-Landschaft'),(109,220,'CH','BS','Basel-Stadt'),(110,220,'CH','FR','Freiburg'),(111,220,'CH','GE','Genf'),(112,220,'CH','GL','Glarus'),(113,220,'CH','GR','Graubünden'),(114,220,'CH','JU','Jura'),(115,220,'CH','LU','Luzern'),(116,220,'CH','NE','Neuenburg'),(117,220,'CH','NW','Nidwalden'),(118,220,'CH','OW','Obwalden'),(119,220,'CH','SG','St. Gallen'),(120,220,'CH','SH','Schaffhausen'),(121,220,'CH','SO','Solothurn'),(122,220,'CH','SZ','Schwyz'),(123,220,'CH','TG','Thurgau'),(124,220,'CH','TI','Tessin'),(125,220,'CH','UR','Uri'),(126,220,'CH','VD','Waadt'),(127,220,'CH','VS','Wallis'),(128,220,'CH','ZG','Zug'),(129,220,'CH','ZH','Zürich'),(130,206,'ES','A Coruсa','A Coruña'),(131,206,'ES','Alava','Alava'),(132,206,'ES','Albacete','Albacete'),(133,206,'ES','Alicante','Alicante'),(134,206,'ES','Almeria','Almeria'),(135,206,'ES','Asturias','Asturias'),(136,206,'ES','Avila','Avila'),(137,206,'ES','Badajoz','Badajoz'),(138,206,'ES','Baleares','Baleares'),(139,206,'ES','Barcelona','Barcelona'),(140,206,'ES','Burgos','Burgos'),(141,206,'ES','Caceres','Caceres'),(142,206,'ES','Cadiz','Cadiz'),(143,206,'ES','Cantabria','Cantabria'),(144,206,'ES','Castellon','Castellon'),(145,206,'ES','Ceuta','Ceuta'),(146,206,'ES','Ciudad Real','Ciudad Real'),(147,206,'ES','Cordoba','Cordoba'),(148,206,'ES','Cuenca','Cuenca'),(149,206,'ES','Girona','Girona'),(150,206,'ES','Granada','Granada'),(151,206,'ES','Guadalajara','Guadalajara'),(152,206,'ES','Guipuzcoa','Guipuzcoa'),(153,206,'ES','Huelva','Huelva'),(154,206,'ES','Huesca','Huesca'),(155,206,'ES','Jaen','Jaen'),(156,206,'ES','La Rioja','La Rioja'),(157,206,'ES','Las Palmas','Las Palmas'),(158,206,'ES','Leon','Leon'),(159,206,'ES','Lleida','Lleida'),(160,206,'ES','Lugo','Lugo'),(161,206,'ES','Madrid','Madrid'),(162,206,'ES','Malaga','Malaga'),(163,206,'ES','Melilla','Melilla'),(164,206,'ES','Murcia','Murcia'),(165,206,'ES','Navarra','Navarra'),(166,206,'ES','Ourense','Ourense'),(167,206,'ES','Palencia','Palencia'),(168,206,'ES','Pontevedra','Pontevedra'),(169,206,'ES','Salamanca','Salamanca'),(170,206,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,206,'ES','Segovia','Segovia'),(172,206,'ES','Sevilla','Sevilla'),(173,206,'ES','Soria','Soria'),(174,206,'ES','Tarragona','Tarragona'),(175,206,'ES','Teruel','Teruel'),(176,206,'ES','Toledo','Toledo'),(177,206,'ES','Valencia','Valencia'),(178,206,'ES','Valladolid','Valladolid'),(179,206,'ES','Vizcaya','Vizcaya'),(180,206,'ES','Zamora','Zamora'),(181,206,'ES','Zaragoza','Zaragoza'),(182,81,'FR','1','Ain'),(183,81,'FR','2','Aisne'),(184,81,'FR','3','Allier'),(185,81,'FR','4','Alpes-de-Haute-Provence'),(186,81,'FR','5','Hautes-Alpes'),(187,81,'FR','6','Alpes-Maritimes'),(188,81,'FR','7','Ardèche'),(189,81,'FR','8','Ardennes'),(190,81,'FR','9','Ariège'),(191,81,'FR','10','Aube'),(192,81,'FR','11','Aude'),(193,81,'FR','12','Aveyron'),(194,81,'FR','13','Bouches-du-Rhône'),(195,81,'FR','14','Calvados'),(196,81,'FR','15','Cantal'),(197,81,'FR','16','Charente'),(198,81,'FR','17','Charente-Maritime'),(199,81,'FR','18','Cher'),(200,81,'FR','19','Corrèze'),(201,81,'FR','2A','Corse-du-Sud'),(202,81,'FR','2B','Haute-Corse'),(203,81,'FR','21','Côte-d\'Or'),(204,81,'FR','22','Côtes-d\'Armor'),(205,81,'FR','23','Creuse'),(206,81,'FR','24','Dordogne'),(207,81,'FR','25','Doubs'),(208,81,'FR','26','Drôme'),(209,81,'FR','27','Eure'),(210,81,'FR','28','Eure-et-Loir'),(211,81,'FR','29','Finistère'),(212,81,'FR','30','Gard'),(213,81,'FR','31','Haute-Garonne'),(214,81,'FR','32','Gers'),(215,81,'FR','33','Gironde'),(216,81,'FR','34','Hérault'),(217,81,'FR','35','Ille-et-Vilaine'),(218,81,'FR','36','Indre'),(219,81,'FR','37','Indre-et-Loire'),(220,81,'FR','38','Isère'),(221,81,'FR','39','Jura'),(222,81,'FR','40','Landes'),(223,81,'FR','41','Loir-et-Cher'),(224,81,'FR','42','Loire'),(225,81,'FR','43','Haute-Loire'),(226,81,'FR','44','Loire-Atlantique'),(227,81,'FR','45','Loiret'),(228,81,'FR','46','Lot'),(229,81,'FR','47','Lot-et-Garonne'),(230,81,'FR','48','Lozère'),(231,81,'FR','49','Maine-et-Loire'),(232,81,'FR','50','Manche'),(233,81,'FR','51','Marne'),(234,81,'FR','52','Haute-Marne'),(235,81,'FR','53','Mayenne'),(236,81,'FR','54','Meurthe-et-Moselle'),(237,81,'FR','55','Meuse'),(238,81,'FR','56','Morbihan'),(239,81,'FR','57','Moselle'),(240,81,'FR','58','Nièvre'),(241,81,'FR','59','Nord'),(242,81,'FR','60','Oise'),(243,81,'FR','61','Orne'),(244,81,'FR','62','Pas-de-Calais'),(245,81,'FR','63','Puy-de-Dôme'),(246,81,'FR','64','Pyrénées-Atlantiques'),(247,81,'FR','65','Hautes-Pyrénées'),(248,81,'FR','66','Pyrénées-Orientales'),(249,81,'FR','67','Bas-Rhin'),(250,81,'FR','68','Haut-Rhin'),(251,81,'FR','69','Rhône'),(252,81,'FR','70','Haute-Saône'),(253,81,'FR','71','Saône-et-Loire'),(254,81,'FR','72','Sarthe'),(255,81,'FR','73','Savoie'),(256,81,'FR','74','Haute-Savoie'),(257,81,'FR','75','Paris'),(258,81,'FR','76','Seine-Maritime'),(259,81,'FR','77','Seine-et-Marne'),(260,81,'FR','78','Yvelines'),(261,81,'FR','79','Deux-Sèvres'),(262,81,'FR','80','Somme'),(263,81,'FR','81','Tarn'),(264,81,'FR','82','Tarn-et-Garonne'),(265,81,'FR','83','Var'),(266,81,'FR','84','Vaucluse'),(267,81,'FR','85','Vendée'),(268,81,'FR','86','Vienne'),(269,81,'FR','87','Haute-Vienne'),(270,81,'FR','88','Vosges'),(271,81,'FR','89','Yonne'),(272,81,'FR','90','Territoire-de-Belfort'),(273,81,'FR','91','Essonne'),(274,81,'FR','92','Hauts-de-Seine'),(275,81,'FR','93','Seine-Saint-Denis'),(276,81,'FR','94','Val-de-Marne'),(277,81,'FR','95','Val-d\'Oise'),(278,185,'RO','AB','Alba'),(279,185,'RO','AR','Arad'),(280,185,'RO','AG','Argeş'),(281,185,'RO','BC','Bacău'),(282,185,'RO','BH','Bihor'),(283,185,'RO','BN','Bistriţa-Năsăud'),(284,185,'RO','BT','Botoşani'),(285,185,'RO','BV','Braşov'),(286,185,'RO','BR','Brăila'),(287,185,'RO','B','Bucureşti'),(288,185,'RO','BZ','Buzău'),(289,185,'RO','CS','Caraş-Severin'),(290,185,'RO','CL','Călăraşi'),(291,185,'RO','CJ','Cluj'),(292,185,'RO','CT','Constanţa'),(293,185,'RO','CV','Covasna'),(294,185,'RO','DB','Dâmboviţa'),(295,185,'RO','DJ','Dolj'),(296,185,'RO','GL','Galaţi'),(297,185,'RO','GR','Giurgiu'),(298,185,'RO','GJ','Gorj'),(299,185,'RO','HR','Harghita'),(300,185,'RO','HD','Hunedoara'),(301,185,'RO','IL','Ialomiţa'),(302,185,'RO','IS','Iaşi'),(303,185,'RO','IF','Ilfov'),(304,185,'RO','MM','Maramureş'),(305,185,'RO','MH','Mehedinţi'),(306,185,'RO','MS','Mureş'),(307,185,'RO','NT','Neamţ'),(308,185,'RO','OT','Olt'),(309,185,'RO','PH','Prahova'),(310,185,'RO','SM','Satu-Mare'),(311,185,'RO','SJ','Sălaj'),(312,185,'RO','SB','Sibiu'),(313,185,'RO','SV','Suceava'),(314,185,'RO','TR','Teleorman'),(315,185,'RO','TM','Timiş'),(316,185,'RO','TL','Tulcea'),(317,185,'RO','VS','Vaslui'),(318,185,'RO','VL','Vâlcea'),(319,185,'RO','VN','Vrancea'),(320,80,'FI','Lappi','Lappi'),(321,80,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,80,'FI','Kainuu','Kainuu'),(323,80,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,80,'FI','Pohjois-Savo','Pohjois-Savo'),(325,80,'FI','Etelä-Savo','Etelä-Savo'),(326,80,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,80,'FI','Pohjanmaa','Pohjanmaa'),(328,80,'FI','Pirkanmaa','Pirkanmaa'),(329,80,'FI','Satakunta','Satakunta'),(330,80,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,80,'FI','Keski-Suomi','Keski-Suomi'),(332,80,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,80,'FI','Etelä-Karjala','Etelä-Karjala'),(334,80,'FI','Päijät-Häme','Päijät-Häme'),(335,80,'FI','Kanta-Häme','Kanta-Häme'),(336,80,'FI','Uusimaa','Uusimaa'),(337,80,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,80,'FI','Kymenlaakso','Kymenlaakso'),(339,80,'FI','Ahvenanmaa','Ahvenanmaa'),(340,74,'EE','EE-37','Harjumaa'),(341,74,'EE','EE-39','Hiiumaa'),(342,74,'EE','EE-44','Ida-Virumaa'),(343,74,'EE','EE-49','Jõgevamaa'),(344,74,'EE','EE-51','Järvamaa'),(345,74,'EE','EE-57','Läänemaa'),(346,74,'EE','EE-59','Lääne-Virumaa'),(347,74,'EE','EE-65','Põlvamaa'),(348,74,'EE','EE-67','Pärnumaa'),(349,74,'EE','EE-70','Raplamaa'),(350,74,'EE','EE-74','Saaremaa'),(351,74,'EE','EE-78','Tartumaa'),(352,74,'EE','EE-82','Valgamaa'),(353,74,'EE','EE-84','Viljandimaa'),(354,74,'EE','EE-86','Võrumaa'),(355,125,'LV','LV-DGV','Daugavpils'),(356,125,'LV','LV-JEL','Jelgava'),(357,125,'LV','Jēkabpils','Jēkabpils'),(358,125,'LV','LV-JUR','Jūrmala'),(359,125,'LV','LV-LPX','Liepāja'),(360,125,'LV','LV-LE','Liepājas novads'),(361,125,'LV','LV-REZ','Rēzekne'),(362,125,'LV','LV-RIX','Rīga'),(363,125,'LV','LV-RI','Rīgas novads'),(364,125,'LV','Valmiera','Valmiera'),(365,125,'LV','LV-VEN','Ventspils'),(366,125,'LV','Aglonas novads','Aglonas novads'),(367,125,'LV','LV-AI','Aizkraukles novads'),(368,125,'LV','Aizputes novads','Aizputes novads'),(369,125,'LV','Aknīstes novads','Aknīstes novads'),(370,125,'LV','Alojas novads','Alojas novads'),(371,125,'LV','Alsungas novads','Alsungas novads'),(372,125,'LV','LV-AL','Alūksnes novads'),(373,125,'LV','Amatas novads','Amatas novads'),(374,125,'LV','Apes novads','Apes novads'),(375,125,'LV','Auces novads','Auces novads'),(376,125,'LV','Babītes novads','Babītes novads'),(377,125,'LV','Baldones novads','Baldones novads'),(378,125,'LV','Baltinavas novads','Baltinavas novads'),(379,125,'LV','LV-BL','Balvu novads'),(380,125,'LV','LV-BU','Bauskas novads'),(381,125,'LV','Beverīnas novads','Beverīnas novads'),(382,125,'LV','Brocēnu novads','Brocēnu novads'),(383,125,'LV','Burtnieku novads','Burtnieku novads'),(384,125,'LV','Carnikavas novads','Carnikavas novads'),(385,125,'LV','Cesvaines novads','Cesvaines novads'),(386,125,'LV','Ciblas novads','Ciblas novads'),(387,125,'LV','LV-CE','Cēsu novads'),(388,125,'LV','Dagdas novads','Dagdas novads'),(389,125,'LV','LV-DA','Daugavpils novads'),(390,125,'LV','LV-DO','Dobeles novads'),(391,125,'LV','Dundagas novads','Dundagas novads'),(392,125,'LV','Durbes novads','Durbes novads'),(393,125,'LV','Engures novads','Engures novads'),(394,125,'LV','Garkalnes novads','Garkalnes novads'),(395,125,'LV','Grobiņas novads','Grobiņas novads'),(396,125,'LV','LV-GU','Gulbenes novads'),(397,125,'LV','Iecavas novads','Iecavas novads'),(398,125,'LV','Ikšķiles novads','Ikšķiles novads'),(399,125,'LV','Ilūkstes novads','Ilūkstes novads'),(400,125,'LV','Inčukalna novads','Inčukalna novads'),(401,125,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,125,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,125,'LV','Jaunpils novads','Jaunpils novads'),(404,125,'LV','LV-JL','Jelgavas novads'),(405,125,'LV','LV-JK','Jēkabpils novads'),(406,125,'LV','Kandavas novads','Kandavas novads'),(407,125,'LV','Kokneses novads','Kokneses novads'),(408,125,'LV','Krimuldas novads','Krimuldas novads'),(409,125,'LV','Krustpils novads','Krustpils novads'),(410,125,'LV','LV-KR','Krāslavas novads'),(411,125,'LV','LV-KU','Kuldīgas novads'),(412,125,'LV','Kārsavas novads','Kārsavas novads'),(413,125,'LV','Lielvārdes novads','Lielvārdes novads'),(414,125,'LV','LV-LM','Limbažu novads'),(415,125,'LV','Lubānas novads','Lubānas novads'),(416,125,'LV','LV-LU','Ludzas novads'),(417,125,'LV','Līgatnes novads','Līgatnes novads'),(418,125,'LV','Līvānu novads','Līvānu novads'),(419,125,'LV','LV-MA','Madonas novads'),(420,125,'LV','Mazsalacas novads','Mazsalacas novads'),(421,125,'LV','Mālpils novads','Mālpils novads'),(422,125,'LV','Mārupes novads','Mārupes novads'),(423,125,'LV','Naukšēnu novads','Naukšēnu novads'),(424,125,'LV','Neretas novads','Neretas novads'),(425,125,'LV','Nīcas novads','Nīcas novads'),(426,125,'LV','LV-OG','Ogres novads'),(427,125,'LV','Olaines novads','Olaines novads'),(428,125,'LV','Ozolnieku novads','Ozolnieku novads'),(429,125,'LV','LV-PR','Preiļu novads'),(430,125,'LV','Priekules novads','Priekules novads'),(431,125,'LV','Priekuļu novads','Priekuļu novads'),(432,125,'LV','Pārgaujas novads','Pārgaujas novads'),(433,125,'LV','Pāvilostas novads','Pāvilostas novads'),(434,125,'LV','Pļaviņu novads','Pļaviņu novads'),(435,125,'LV','Raunas novads','Raunas novads'),(436,125,'LV','Riebiņu novads','Riebiņu novads'),(437,125,'LV','Rojas novads','Rojas novads'),(438,125,'LV','Ropažu novads','Ropažu novads'),(439,125,'LV','Rucavas novads','Rucavas novads'),(440,125,'LV','Rugāju novads','Rugāju novads'),(441,125,'LV','Rundāles novads','Rundāles novads'),(442,125,'LV','LV-RE','Rēzeknes novads'),(443,125,'LV','Rūjienas novads','Rūjienas novads'),(444,125,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,125,'LV','Salas novads','Salas novads'),(446,125,'LV','Salaspils novads','Salaspils novads'),(447,125,'LV','LV-SA','Saldus novads'),(448,125,'LV','Saulkrastu novads','Saulkrastu novads'),(449,125,'LV','Siguldas novads','Siguldas novads'),(450,125,'LV','Skrundas novads','Skrundas novads'),(451,125,'LV','Skrīveru novads','Skrīveru novads'),(452,125,'LV','Smiltenes novads','Smiltenes novads'),(453,125,'LV','Stopiņu novads','Stopiņu novads'),(454,125,'LV','Strenču novads','Strenču novads'),(455,125,'LV','Sējas novads','Sējas novads'),(456,125,'LV','LV-TA','Talsu novads'),(457,125,'LV','LV-TU','Tukuma novads'),(458,125,'LV','Tērvetes novads','Tērvetes novads'),(459,125,'LV','Vaiņodes novads','Vaiņodes novads'),(460,125,'LV','LV-VK','Valkas novads'),(461,125,'LV','LV-VM','Valmieras novads'),(462,125,'LV','Varakļānu novads','Varakļānu novads'),(463,125,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,125,'LV','Vecumnieku novads','Vecumnieku novads'),(465,125,'LV','LV-VE','Ventspils novads'),(466,125,'LV','Viesītes novads','Viesītes novads'),(467,125,'LV','Viļakas novads','Viļakas novads'),(468,125,'LV','Viļānu novads','Viļānu novads'),(469,125,'LV','Vārkavas novads','Vārkavas novads'),(470,125,'LV','Zilupes novads','Zilupes novads'),(471,125,'LV','Ādažu novads','Ādažu novads'),(472,125,'LV','Ērgļu novads','Ērgļu novads'),(473,125,'LV','Ķeguma novads','Ķeguma novads'),(474,125,'LV','Ķekavas novads','Ķekavas novads'),(475,131,'LT','LT-AL','Alytaus Apskritis'),(476,131,'LT','LT-KU','Kauno Apskritis'),(477,131,'LT','LT-KL','Klaipėdos Apskritis'),(478,131,'LT','LT-MR','Marijampolės Apskritis'),(479,131,'LT','LT-PN','Panevėžio Apskritis'),(480,131,'LT','LT-SA','Šiaulių Apskritis'),(481,131,'LT','LT-TA','Tauragės Apskritis'),(482,131,'LT','LT-TE','Telšių Apskritis'),(483,131,'LT','LT-UT','Utenos Apskritis'),(484,131,'LT','LT-VL','Vilniaus Apskritis'),(485,31,'BR','AC','Acre'),(486,31,'BR','AL','Alagoas'),(487,31,'BR','AP','Amapá'),(488,31,'BR','AM','Amazonas'),(489,31,'BR','BA','Bahia'),(490,31,'BR','CE','Ceará'),(491,31,'BR','ES','Espírito Santo'),(492,31,'BR','GO','Goiás'),(493,31,'BR','MA','Maranhão'),(494,31,'BR','MT','Mato Grosso'),(495,31,'BR','MS','Mato Grosso do Sul'),(496,31,'BR','MG','Minas Gerais'),(497,31,'BR','PA','Pará'),(498,31,'BR','PB','Paraíba'),(499,31,'BR','PR','Paraná'),(500,31,'BR','PE','Pernambuco'),(501,31,'BR','PI','Piauí'),(502,31,'BR','RJ','Rio de Janeiro'),(503,31,'BR','RN','Rio Grande do Norte'),(504,31,'BR','RS','Rio Grande do Sul'),(505,31,'BR','RO','Rondônia'),(506,31,'BR','RR','Roraima'),(507,31,'BR','SC','Santa Catarina'),(508,31,'BR','SP','São Paulo'),(509,31,'BR','SE','Sergipe'),(510,31,'BR','TO','Tocantins'),(511,31,'BR','DF','Distrito Federal'),(512,59,'HR','HR-01','Zagrebačka županija'),(513,59,'HR','HR-02','Krapinsko-zagorska županija'),(514,59,'HR','HR-03','Sisačko-moslavačka županija'),(515,59,'HR','HR-04','Karlovačka županija'),(516,59,'HR','HR-05','Varaždinska županija'),(517,59,'HR','HR-06','Koprivničko-križevačka županija'),(518,59,'HR','HR-07','Bjelovarsko-bilogorska županija'),(519,59,'HR','HR-08','Primorsko-goranska županija'),(520,59,'HR','HR-09','Ličko-senjska županija'),(521,59,'HR','HR-10','Virovitičko-podravska županija'),(522,59,'HR','HR-11','Požeško-slavonska županija'),(523,59,'HR','HR-12','Brodsko-posavska županija'),(524,59,'HR','HR-13','Zadarska županija'),(525,59,'HR','HR-14','Osječko-baranjska županija'),(526,59,'HR','HR-15','Šibensko-kninska županija'),(527,59,'HR','HR-16','Vukovarsko-srijemska županija'),(528,59,'HR','HR-17','Splitsko-dalmatinska županija'),(529,59,'HR','HR-18','Istarska županija'),(530,59,'HR','HR-19','Dubrovačko-neretvanska županija'),(531,59,'HR','HR-20','Međimurska županija'),(532,59,'HR','HR-21','Grad Zagreb'),(533,106,'IN','AN','Andaman and Nicobar Islands'),(534,106,'IN','AP','Andhra Pradesh'),(535,106,'IN','AR','Arunachal Pradesh'),(536,106,'IN','AS','Assam'),(537,106,'IN','BR','Bihar'),(538,106,'IN','CH','Chandigarh'),(539,106,'IN','CT','Chhattisgarh'),(540,106,'IN','DN','Dadra and Nagar Haveli'),(541,106,'IN','DD','Daman and Diu'),(542,106,'IN','DL','Delhi'),(543,106,'IN','GA','Goa'),(544,106,'IN','GJ','Gujarat'),(545,106,'IN','HR','Haryana'),(546,106,'IN','HP','Himachal Pradesh'),(547,106,'IN','JK','Jammu and Kashmir'),(548,106,'IN','JH','Jharkhand'),(549,106,'IN','KA','Karnataka'),(550,106,'IN','KL','Kerala'),(551,106,'IN','LD','Lakshadweep'),(552,106,'IN','MP','Madhya Pradesh'),(553,106,'IN','MH','Maharashtra'),(554,106,'IN','MN','Manipur'),(555,106,'IN','ML','Meghalaya'),(556,106,'IN','MZ','Mizoram'),(557,106,'IN','NL','Nagaland'),(558,106,'IN','OR','Odisha'),(559,106,'IN','PY','Puducherry'),(560,106,'IN','PB','Punjab'),(561,106,'IN','RJ','Rajasthan'),(562,106,'IN','SK','Sikkim'),(563,106,'IN','TN','Tamil Nadu'),(564,106,'IN','TG','Telangana'),(565,106,'IN','TR','Tripura'),(566,106,'IN','UP','Uttar Pradesh'),(567,106,'IN','UT','Uttarakhand'),(568,106,'IN','WB','West Bengal'),(569,176,'PY','PY-16','Alto Paraguay'),(570,176,'PY','PY-10','Alto Paraná'),(571,176,'PY','PY-13','Amambay'),(572,176,'PY','PY-ASU','Asunción'),(573,176,'PY','PY-19','Boquerón'),(574,176,'PY','PY-5','Caaguazú'),(575,176,'PY','PY-6','Caazapá'),(576,176,'PY','PY-14','Canindeyú'),(577,176,'PY','PY-11','Central'),(578,176,'PY','PY-1','Concepción'),(579,176,'PY','PY-3','Cordillera'),(580,176,'PY','PY-4','Guairá'),(581,176,'PY','PY-7','Itapúa'),(582,176,'PY','PY-8','Misiones'),(583,176,'PY','PY-9','Paraguarí'),(584,176,'PY','PY-15','Presidente Hayes'),(585,176,'PY','PY-2','San Pedro'),(586,176,'PY','PY-12','Ñeembucú');
/*!40000 ALTER TABLE `country_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_translations`
--

DROP TABLE IF EXISTS `country_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_translations`
--

LOCK TABLES `country_translations` WRITE;
/*!40000 ALTER TABLE `country_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `country_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'NGN','Nigerian Naira','₦',2,',','.',NULL,NULL,'2026-07-25 13:00:46');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_exchange_rates`
--

DROP TABLE IF EXISTS `currency_exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_exchange_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_exchange_rates`
--

LOCK TABLES `currency_exchange_rates` WRITE;
/*!40000 ALTER TABLE `currency_exchange_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
INSERT INTO `customer_groups` VALUES (1,'guest','Guest',0,NULL,NULL),(2,'general','General',0,NULL,NULL),(3,'wholesale','Wholesale',0,NULL,NULL);
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_notes`
--

DROP TABLE IF EXISTS `customer_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_notes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notes`
--

LOCK TABLES `customer_notes` WRITE;
/*!40000 ALTER TABLE `customer_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_password_resets`
--

DROP TABLE IF EXISTS `customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_password_resets`
--

LOCK TABLES `customer_password_resets` WRITE;
/*!40000 ALTER TABLE `customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_social_accounts`
--

DROP TABLE IF EXISTS `customer_social_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_social_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_social_accounts`
--

LOCK TABLES `customer_social_accounts` WRITE;
/*!40000 ALTER TABLE `customer_social_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_social_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  UNIQUE KEY `customers_email_channel_unique` (`email`,`channel_id`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datagrid_saved_filters`
--

DROP TABLE IF EXISTS `datagrid_saved_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datagrid_saved_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datagrid_saved_filters`
--

LOCK TABLES `datagrid_saved_filters` WRITE;
/*!40000 ALTER TABLE `datagrid_saved_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `datagrid_saved_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `downloadable_link_purchased`
--

DROP TABLE IF EXISTS `downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadable_link_purchased` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `order_item_id` int unsigned NOT NULL,
  `download_canceled` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadable_link_purchased`
--

LOCK TABLES `downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eu_withdrawals`
--

DROP TABLE IF EXISTS `eu_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eu_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int unsigned NOT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason_text` text COLLATE utf8mb4_unicode_ci,
  `received_at` timestamp NOT NULL,
  `confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `final_confirmation_sent_at` timestamp NULL DEFAULT NULL,
  `confirmation_error` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `declined_at` timestamp NULL DEFAULT NULL,
  `declined_reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `declined_by_user_id` int unsigned DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `refunded_by_user_id` int unsigned DEFAULT NULL,
  `refund_note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eu_withdrawals_order_id_unique` (`order_id`),
  UNIQUE KEY `eu_withdrawals_uuid_unique` (`uuid`),
  KEY `eu_withdrawals_customer_id_index` (`customer_id`),
  KEY `eu_withdrawals_channel_id_status_index` (`channel_id`,`status`),
  KEY `eu_withdrawals_received_at_index` (`received_at`),
  KEY `eu_withdrawals_declined_by_user_id_foreign` (`declined_by_user_id`),
  KEY `eu_withdrawals_refunded_by_user_id_foreign` (`refunded_by_user_id`),
  CONSTRAINT `eu_withdrawals_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `eu_withdrawals_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_declined_by_user_id_foreign` FOREIGN KEY (`declined_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL,
  CONSTRAINT `eu_withdrawals_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `eu_withdrawals_refunded_by_user_id_foreign` FOREIGN KEY (`refunded_by_user_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eu_withdrawals`
--

LOCK TABLES `eu_withdrawals` WRITE;
/*!40000 ALTER TABLE `eu_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `eu_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdpr_data_request`
--

DROP TABLE IF EXISTS `gdpr_data_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gdpr_data_request` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gdpr_data_request_customer_id_foreign` (`customer_id`),
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdpr_data_request`
--

LOCK TABLES `gdpr_data_request` WRITE;
/*!40000 ALTER TABLE `gdpr_data_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdpr_data_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_batches`
--

DROP TABLE IF EXISTS `import_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `import_batches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_batches`
--

LOCK TABLES `import_batches` WRITE;
/*!40000 ALTER TABLE `import_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int NOT NULL DEFAULT '0',
  `processed_rows_count` int NOT NULL DEFAULT '0',
  `invalid_rows_count` int NOT NULL DEFAULT '0',
  `errors_count` int NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_sources`
--

DROP TABLE IF EXISTS `inventory_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_sources` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_sources`
--

LOCK TABLES `inventory_sources` WRITE;
/*!40000 ALTER TABLE `inventory_sources` DISABLE KEYS */;
INSERT INTO `inventory_sources` VALUES (1,'default','Default',NULL,'Default','warehouse@example.com','1234567899',NULL,'US','MI','Detroit','12th Street','48127',0,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `inventory_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_items`
--

DROP TABLE IF EXISTS `invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `invoice_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_items`
--

LOCK TABLES `invoice_items` WRITE;
/*!40000 ALTER TABLE `invoice_items` DISABLE KEYS */;
INSERT INTO `invoice_items` VALUES (33,NULL,'Soleil D\'Or Citrus',NULL,'ANIELS-3799',1,100.0000,100.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,100.0000,100.0000,2395,'Webkul\\Product\\Models\\Product',110,36,'{\"locale\": \"en\", \"cart_id\": 546, \"quantity\": 1, \"product_id\": 2395}','2026-09-23 07:44:16','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (36,'1','paid',1,1,'NGN','NGN','NGN',100.0000,100.0000,110.0000,110.0000,10.0000,10.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,10.0000,10.0000,111,NULL,0,NULL,'2026-09-23 07:44:16','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales`
--

DROP TABLE IF EXISTS `locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locales` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales`
--

LOCK TABLES `locales` WRITE;
/*!40000 ALTER TABLE `locales` DISABLE KEYS */;
INSERT INTO `locales` VALUES (1,'en','English','ltr','locales/dQKmuYQZCItvoBoeiCIURqBNrC8nQ9c6X6Iqzn9u.png',NULL,NULL);
/*!40000 ALTER TABLE `locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_campaigns`
--

DROP TABLE IF EXISTS `marketing_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_campaigns` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `marketing_template_id` int unsigned DEFAULT NULL,
  `marketing_event_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_campaigns`
--

LOCK TABLES `marketing_campaigns` WRITE;
/*!40000 ALTER TABLE `marketing_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_events`
--

DROP TABLE IF EXISTS `marketing_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_events`
--

LOCK TABLES `marketing_events` WRITE;
/*!40000 ALTER TABLE `marketing_events` DISABLE KEYS */;
INSERT INTO `marketing_events` VALUES (1,'Birthday','Birthday',NULL,NULL,NULL);
/*!40000 ALTER TABLE `marketing_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_templates`
--

DROP TABLE IF EXISTS `marketing_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marketing_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_templates`
--

LOCK TABLES `marketing_templates` WRITE;
/*!40000 ALTER TABLE `marketing_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketing_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_admin_password_resets_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2018_06_12_111907_create_admins_table',1),(5,'2018_06_13_055341_create_roles_table',1),(6,'2018_07_05_130148_create_attributes_table',1),(7,'2018_07_05_132854_create_attribute_translations_table',1),(8,'2018_07_05_135150_create_attribute_families_table',1),(9,'2018_07_05_135152_create_attribute_groups_table',1),(10,'2018_07_05_140832_create_attribute_options_table',1),(11,'2018_07_05_140856_create_attribute_option_translations_table',1),(12,'2018_07_05_142820_create_categories_table',1),(13,'2018_07_10_055143_create_locales_table',1),(14,'2018_07_20_054426_create_countries_table',1),(15,'2018_07_20_054502_create_currencies_table',1),(16,'2018_07_20_054542_create_currency_exchange_rates_table',1),(17,'2018_07_20_064849_create_channels_table',1),(18,'2018_07_21_142836_create_category_translations_table',1),(19,'2018_07_23_110040_create_inventory_sources_table',1),(20,'2018_07_24_082635_create_customer_groups_table',1),(21,'2018_07_24_082930_create_customers_table',1),(22,'2018_07_27_065727_create_products_table',1),(23,'2018_07_27_070011_create_product_attribute_values_table',1),(24,'2018_07_27_092623_create_product_reviews_table',1),(25,'2018_07_27_113941_create_product_images_table',1),(26,'2018_07_27_113956_create_product_inventories_table',1),(27,'2018_08_30_064755_create_tax_categories_table',1),(28,'2018_08_30_065042_create_tax_rates_table',1),(29,'2018_08_30_065840_create_tax_mappings_table',1),(30,'2018_09_05_150444_create_cart_table',1),(31,'2018_09_05_150915_create_cart_items_table',1),(32,'2018_09_11_064045_customer_password_resets',1),(33,'2018_09_19_093453_create_cart_payment',1),(34,'2018_09_19_093508_create_cart_shipping_rates_table',1),(35,'2018_09_20_060658_create_core_config_table',1),(36,'2018_09_27_113154_create_orders_table',1),(37,'2018_09_27_113207_create_order_items_table',1),(38,'2018_09_27_115022_create_shipments_table',1),(39,'2018_09_27_115029_create_shipment_items_table',1),(40,'2018_09_27_115135_create_invoices_table',1),(41,'2018_09_27_115144_create_invoice_items_table',1),(42,'2018_10_01_095504_create_order_payment_table',1),(43,'2018_10_03_025230_create_wishlist_table',1),(44,'2018_10_12_101803_create_country_translations_table',1),(45,'2018_10_12_101913_create_country_states_table',1),(46,'2018_10_12_101923_create_country_state_translations_table',1),(47,'2018_11_16_173504_create_subscribers_list_table',1),(48,'2018_11_21_144411_create_cart_item_inventories_table',1),(49,'2018_12_06_185202_create_product_flat_table',1),(50,'2018_12_24_123812_create_channel_inventory_sources_table',1),(51,'2018_12_26_165327_create_product_ordered_inventories_table',1),(52,'2019_05_13_024321_create_cart_rules_table',1),(53,'2019_05_13_024322_create_cart_rule_channels_table',1),(54,'2019_05_13_024323_create_cart_rule_customer_groups_table',1),(55,'2019_05_13_024324_create_cart_rule_translations_table',1),(56,'2019_05_13_024325_create_cart_rule_customers_table',1),(57,'2019_05_13_024326_create_cart_rule_coupons_table',1),(58,'2019_05_13_024327_create_cart_rule_coupon_usage_table',1),(59,'2019_06_17_180258_create_product_downloadable_samples_table',1),(60,'2019_06_17_180314_create_product_downloadable_sample_translations_table',1),(61,'2019_06_17_180325_create_product_downloadable_links_table',1),(62,'2019_06_17_180346_create_product_downloadable_link_translations_table',1),(63,'2019_06_21_202249_create_downloadable_link_purchased_table',1),(64,'2019_07_02_180307_create_booking_products_table',1),(65,'2019_07_05_154415_create_booking_product_default_slots_table',1),(66,'2019_07_05_154429_create_booking_product_appointment_slots_table',1),(67,'2019_07_05_154440_create_booking_product_event_tickets_table',1),(68,'2019_07_05_154451_create_booking_product_rental_slots_table',1),(69,'2019_07_05_154502_create_booking_product_table_slots_table',1),(70,'2019_07_30_153530_create_cms_pages_table',1),(71,'2019_07_31_143339_create_category_filterable_attributes_table',1),(72,'2019_08_02_105320_create_product_grouped_products_table',1),(73,'2019_08_20_170510_create_product_bundle_options_table',1),(74,'2019_08_20_170520_create_product_bundle_option_translations_table',1),(75,'2019_08_20_170528_create_product_bundle_option_products_table',1),(76,'2019_09_11_184511_create_refunds_table',1),(77,'2019_09_11_184519_create_refund_items_table',1),(78,'2019_12_03_184613_create_catalog_rules_table',1),(79,'2019_12_03_184651_create_catalog_rule_channels_table',1),(80,'2019_12_03_184732_create_catalog_rule_customer_groups_table',1),(81,'2019_12_06_101110_create_catalog_rule_products_table',1),(82,'2019_12_06_110507_create_catalog_rule_product_prices_table',1),(83,'2019_12_14_000001_create_personal_access_tokens_table',1),(84,'2020_01_14_191854_create_cms_page_translations_table',1),(85,'2020_01_15_130209_create_cms_page_channels_table',1),(86,'2020_02_18_165639_create_bookings_table',1),(87,'2020_02_21_121201_create_booking_product_event_ticket_translations_table',1),(88,'2020_04_16_185147_add_table_addresses',1),(89,'2020_05_06_171638_create_order_comments_table',1),(90,'2020_05_21_171500_create_product_customer_group_prices_table',1),(91,'2020_06_25_162154_create_customer_social_accounts_table',1),(92,'2020_08_07_174804_create_gdpr_data_request_table',1),(93,'2020_11_19_112228_create_product_videos_table',1),(94,'2020_11_26_141455_create_marketing_templates_table',1),(95,'2020_11_26_150534_create_marketing_events_table',1),(96,'2020_11_26_150644_create_marketing_campaigns_table',1),(97,'2020_12_21_000200_create_channel_translations_table',1),(98,'2020_12_27_121950_create_jobs_table',1),(99,'2021_03_11_212124_create_order_transactions_table',1),(100,'2021_04_07_132010_create_product_review_images_table',1),(101,'2021_12_15_104544_notifications',1),(102,'2022_03_15_160510_create_failed_jobs_table',1),(103,'2022_04_01_094622_create_sitemaps_table',1),(104,'2022_10_03_144232_create_product_price_indices_table',1),(105,'2022_10_04_144444_create_job_batches_table',1),(106,'2022_10_08_134150_create_product_inventory_indices_table',1),(107,'2023_05_26_213105_create_wishlist_items_table',1),(108,'2023_05_26_213120_create_compare_items_table',1),(109,'2023_06_27_163529_rename_product_review_images_to_product_review_attachments',1),(110,'2023_07_06_140013_add_logo_path_column_to_locales',1),(111,'2023_07_10_184256_create_theme_customizations_table',1),(112,'2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table',1),(113,'2023_07_20_185324_add_column_column_in_attribute_groups_table',1),(114,'2023_07_25_145943_add_regex_column_in_attributes_table',1),(115,'2023_07_25_165945_drop_notes_column_from_customers_table',1),(116,'2023_07_25_171058_create_customer_notes_table',1),(117,'2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table',1),(118,'2023_09_15_170053_create_theme_customization_translations_table',1),(119,'2023_09_20_102031_add_default_value_column_in_attributes_table',1),(120,'2023_09_20_102635_add_inventories_group_in_attribute_groups_table',1),(121,'2023_09_26_155709_add_columns_to_currencies',1),(122,'2023_10_12_090446_add_tax_category_id_column_in_order_items_table',1),(123,'2023_11_08_054614_add_code_column_in_attribute_groups_table',1),(124,'2023_11_08_140116_create_search_terms_table',1),(125,'2023_11_09_162805_create_url_rewrites_table',1),(126,'2023_11_17_150401_create_search_synonyms_table',1),(127,'2023_12_11_054614_add_channel_id_column_in_product_price_indices_table',1),(128,'2024_01_11_154640_create_imports_table',1),(129,'2024_01_11_154741_create_import_batches_table',1),(130,'2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table',1),(131,'2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table',1),(132,'2024_01_22_170814_add_unique_index_in_mapping_tables',1),(133,'2024_02_26_153000_add_columns_to_addresses_table',1),(134,'2024_03_07_193421_rename_address1_column_in_addresses_table',1),(135,'2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table',1),(136,'2024_04_19_102939_add_incl_tax_columns_in_orders_table',1),(137,'2024_04_19_135405_add_incl_tax_columns_in_cart_items_table',1),(138,'2024_04_19_144641_add_incl_tax_columns_in_order_items_table',1),(139,'2024_04_23_133154_add_incl_tax_columns_in_cart_table',1),(140,'2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table',1),(141,'2024_04_24_102939_add_incl_tax_columns_in_invoices_table',1),(142,'2024_04_24_102939_add_incl_tax_columns_in_refunds_table',1),(143,'2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table',1),(144,'2024_04_24_144641_add_incl_tax_columns_in_refund_items_table',1),(145,'2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table',1),(146,'2024_05_10_152848_create_saved_filters_table',1),(147,'2024_06_03_174128_create_product_channels_table',1),(148,'2024_06_04_130527_add_channel_id_column_in_customers_table',1),(149,'2024_06_04_130600_make_email_unique_per_channel',1),(150,'2024_06_13_184426_add_theme_column_into_theme_customizations_table',1),(151,'2024_07_17_172645_add_additional_column_to_sitemaps_table',1),(152,'2024_10_11_135010_create_product_customizable_options_table',1),(153,'2024_10_11_135110_create_product_customizable_option_translations_table',1),(154,'2024_10_11_135228_create_product_customizable_option_prices_table',1),(155,'2025_05_07_121250_update_total_weight_columns_in_shipments_and_weight_shipment_items_tables',1),(156,'2025_09_05_000100_add_indexes_to_channels_tables',1),(157,'2025_09_05_000200_add_indexes_to_product_relation_tables',1),(158,'2025_09_05_000300_add_indexes_to_product_media_and_attributes',1),(159,'2025_09_05_000400_add_indexes_to_attributes_and_product_types',1),(160,'2025_09_05_000500_add_indexes_to_product_grouped_products_and_product_bundle_option_products',1),(161,'2025_09_05_000500_add_indexes_to_url_rewrites_and_visits',1),(162,'2025_09_11_140301_add_two_factor_to_admins',1),(163,'2025_11_14_173810_create_rma_statuses_table',1),(164,'2025_11_14_173812_create_rma_table',1),(165,'2025_11_14_173906_create_rma_reasons_table',1),(166,'2025_11_14_173959_create_rma_items_table',1),(167,'2025_11_14_174030_create_rma_images_table',1),(168,'2025_11_14_174059_create_rma_messages_table',1),(169,'2025_11_14_174134_create_rma_reason_resolutions_table',1),(170,'2025_11_14_174205_create_rma_rules_table',1),(171,'2025_11_14_174355_create_rma_custom_fields_table',1),(172,'2025_11_14_174426_create_rma_custom_field_options_table',1),(173,'2025_11_14_174509_create_rma_additional_fields_table',1),(174,'2026_02_03_151924_create_sessions_table',1),(175,'2026_02_11_095547_add_rma_return_period_to_order_items_table',1),(176,'2026_03_11_113926_create_agent_conversations_table',1),(177,'2026_04_09_120000_change_tax_category_id_fk_on_cart_items_to_null_on_delete',1),(178,'2026_04_09_120100_change_tax_category_id_fk_on_order_items_to_null_on_delete',1),(179,'2026_04_17_000001_add_booking_product_enhancements',1),(180,'2026_04_17_000002_add_allow_cancellation_snapshot_to_bookings',1),(181,'2026_05_27_114230_create_eu_withdrawals_table',1),(182,'2026_06_24_000000_rename_received_package_rma_status',1),(183,'2026_06_24_000001_rename_neutral_rma_statuses',1),(184,'2026_07_03_170000_create_sitemap_channels_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (39,'order',0,111,'2026-09-23 07:44:15','2026-09-23 07:44:15');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_comments`
--

DROP TABLE IF EXISTS `order_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_comments`
--

LOCK TABLES `order_comments` WRITE;
/*!40000 ALTER TABLE `order_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `tax_category_id` int unsigned DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `rma_return_period` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (110,'ANIELS-3799','simple','Soleil D\'Or Citrus',NULL,0.0000,0.0000,1,0,1,0,0,100.0000,100.0000,100.0000,100.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,100.0000,100.0000,2395,'Webkul\\Product\\Models\\Product',111,NULL,NULL,'{\"locale\": \"en\", \"cart_id\": 546, \"quantity\": 1, \"product_id\": 2395}',NULL,'2026-09-23 07:44:15','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
INSERT INTO `order_payment` VALUES (96,111,'squadco','SquadCo Payment','{\"squadco_ref\": \"SQ_546_1790129396\", \"squadco_status\": \"success\"}','2026-09-23 07:44:15','2026-09-23 07:44:15');
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_transactions`
--

DROP TABLE IF EXISTS `order_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_transactions`
--

LOCK TABLES `order_transactions` WRITE;
/*!40000 ALTER TABLE `order_transactions` DISABLE KEYS */;
INSERT INTO `order_transactions` VALUES (26,'SQ_546_1790129396','success','squadco',110.0000,'squadco','{\"fee\": 1.32, \"meta\": {\"cart_id\": \"546\"}, \"email\": \"xate@mailinator.com\", \"created_at\": \"2026-09-23T04:09:57.9\", \"merchant_name\": \"Aniels Perfumery \", \"merchant_email\": \"anielsperfumery@gmail.com\", \"merchant_amount\": 10868, \"transaction_ref\": \"SQ_546_1790129396\", \"transaction_type\": \"bank\", \"transaction_amount\": 11000, \"transaction_status\": \"success\", \"merchant_business_name\": \"Aniels Perfumery \", \"gateway_transaction_ref\": \"SQ_546_1790129396_2_2_2\", \"transaction_currency_id\": \"NGN\"}',36,111,'2026-09-23 07:44:16','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `order_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int unsigned DEFAULT NULL,
  `channel_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (111,'1','processing','Default',1,'xate@mailinator.com','Oscar','Crane','flatrate_flatrate','Flat Rate - Flat Rate','Flat Rate Shipping',NULL,0,1,1,'NGN','NGN','NGN',110.0000,110.0000,110.0000,110.0000,0.0000,0.0000,100.0000,100.0000,100.0000,100.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,10.0000,10.0000,10.0000,10.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,100.0000,100.0000,10.0000,10.0000,NULL,NULL,1,'Webkul\\Core\\Models\\Channel',546,NULL,'2026-09-23 07:44:15','2026-09-23 07:44:16');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_attribute_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `prod_attr_product_id_idx` (`product_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58355 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
INSERT INTO `product_attribute_values` VALUES (58005,NULL,NULL,'ANIELS-3785',NULL,NULL,NULL,NULL,NULL,NULL,2383,1,NULL),(58006,'en','default','Aniel\'s Royal Oud Extrait',NULL,NULL,NULL,NULL,NULL,NULL,2383,2,NULL),(58007,'en',NULL,'aniels-royal-oud-extrait',NULL,NULL,NULL,NULL,NULL,NULL,2383,3,NULL),(58008,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2383,5,NULL),(58009,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2383,6,NULL),(58010,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2383,7,NULL),(58011,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2383,8,NULL),(58012,'en','default','An opulent fusion of rare Cambodian Oud, warm amber, and golden rose.',NULL,NULL,NULL,NULL,NULL,NULL,2383,9,NULL),(58013,'en','default','<p>An opulent fusion of rare Cambodian Oud, warm amber, and golden rose.</p><p><strong>Top Notes:</strong> Cambodian Oud, Bergamot<br><strong>Heart Notes:</strong> Damask Rose, Amber<br><strong>Base Notes:</strong> Sandalwood, Royal Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2383,10,NULL),(58014,NULL,NULL,NULL,NULL,NULL,185000.0000,NULL,NULL,NULL,2383,11,NULL),(58015,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2383,22,NULL),(58016,NULL,NULL,'Cambodian Oud, Bergamot',NULL,NULL,NULL,NULL,NULL,NULL,2383,31,NULL),(58017,NULL,NULL,'Damask Rose, Amber',NULL,NULL,NULL,NULL,NULL,NULL,2383,32,NULL),(58018,NULL,NULL,'Sandalwood, Royal Musk',NULL,NULL,NULL,NULL,NULL,NULL,2383,33,NULL),(58019,NULL,NULL,'ANIELS-3786',NULL,NULL,NULL,NULL,NULL,NULL,2384,1,NULL),(58020,'en','default','Sovereign Amber & Leather',NULL,NULL,NULL,NULL,NULL,NULL,2384,2,NULL),(58021,'en',NULL,'sovereign-amber-leather',NULL,NULL,NULL,NULL,NULL,NULL,2384,3,NULL),(58022,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2384,5,NULL),(58023,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2384,6,NULL),(58024,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2384,7,NULL),(58025,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2384,8,NULL),(58026,'en','default','A commanding blend of Tuscan leather, spicy cardamom, and rich Baltic amber.',NULL,NULL,NULL,NULL,NULL,NULL,2384,9,NULL),(58027,'en','default','<p>A commanding blend of Tuscan leather, spicy cardamom, and rich Baltic amber.</p><p><strong>Top Notes:</strong> Cardamom, Pink Pepper<br><strong>Heart Notes:</strong> Tuscan Leather, Orris<br><strong>Base Notes:</strong> Amber, Cedarwood</p>',NULL,NULL,NULL,NULL,NULL,NULL,2384,10,NULL),(58028,NULL,NULL,NULL,NULL,NULL,145000.0000,NULL,NULL,NULL,2384,11,NULL),(58029,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2384,22,NULL),(58030,NULL,NULL,'Cardamom, Pink Pepper',NULL,NULL,NULL,NULL,NULL,NULL,2384,31,NULL),(58031,NULL,NULL,'Tuscan Leather, Orris',NULL,NULL,NULL,NULL,NULL,NULL,2384,32,NULL),(58032,NULL,NULL,'Amber, Cedarwood',NULL,NULL,NULL,NULL,NULL,NULL,2384,33,NULL),(58033,NULL,NULL,'ANIELS-3788',NULL,NULL,NULL,NULL,NULL,NULL,2385,1,NULL),(58034,'en','default','Velvet Rose & Smoked Vanilla',NULL,NULL,NULL,NULL,NULL,NULL,2385,2,NULL),(58035,'en',NULL,'velvet-rose-smoked-vanilla',NULL,NULL,NULL,NULL,NULL,NULL,2385,3,NULL),(58036,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2385,5,NULL),(58037,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2385,6,NULL),(58038,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2385,7,NULL),(58039,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2385,8,NULL),(58040,'en','default','Sensual Turkish rose enveloped in Madagascar bourbon vanilla and soft patchouli.',NULL,NULL,NULL,NULL,NULL,NULL,2385,9,NULL),(58041,'en','default','<p>Sensual Turkish rose enveloped in Madagascar bourbon vanilla and soft patchouli.</p><p><strong>Top Notes:</strong> Turkish Rose, Red Saffron<br><strong>Heart Notes:</strong> Bourbon Vanilla, Patchouli<br><strong>Base Notes:</strong> Tonka Bean, Aged Oud</p>',NULL,NULL,NULL,NULL,NULL,NULL,2385,10,NULL),(58042,NULL,NULL,NULL,NULL,NULL,120000.0000,NULL,NULL,NULL,2385,11,NULL),(58043,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2385,22,NULL),(58044,NULL,NULL,'Turkish Rose, Red Saffron',NULL,NULL,NULL,NULL,NULL,NULL,2385,31,NULL),(58045,NULL,NULL,'Bourbon Vanilla, Patchouli',NULL,NULL,NULL,NULL,NULL,NULL,2385,32,NULL),(58046,NULL,NULL,'Tonka Bean, Aged Oud',NULL,NULL,NULL,NULL,NULL,NULL,2385,33,NULL),(58047,NULL,NULL,'ANIELS-3789',NULL,NULL,NULL,NULL,NULL,NULL,2386,1,NULL),(58048,'en','default','Imperial Citrus & Cedar',NULL,NULL,NULL,NULL,NULL,NULL,2386,2,NULL),(58049,'en',NULL,'imperial-citrus-cedar',NULL,NULL,NULL,NULL,NULL,NULL,2386,3,NULL),(58050,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2386,5,NULL),(58051,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2386,6,NULL),(58052,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2386,7,NULL),(58053,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2386,8,NULL),(58054,'en','default','Vibrant Italian bergamot balanced with crisp Atlas cedarwood and fresh vetiver.',NULL,NULL,NULL,NULL,NULL,NULL,2386,9,NULL),(58055,'en','default','<p>Vibrant Italian bergamot balanced with crisp Atlas cedarwood and fresh vetiver.</p><p><strong>Top Notes:</strong> Calabrian Bergamot, Lemon<br><strong>Heart Notes:</strong> Atlas Cedarwood, Vetiver<br><strong>Base Notes:</strong> White Musk, Oakmoss</p>',NULL,NULL,NULL,NULL,NULL,NULL,2386,10,NULL),(58056,NULL,NULL,NULL,NULL,NULL,95000.0000,NULL,NULL,NULL,2386,11,NULL),(58057,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2386,22,NULL),(58058,NULL,NULL,'Calabrian Bergamot, Lemon',NULL,NULL,NULL,NULL,NULL,NULL,2386,31,NULL),(58059,NULL,NULL,'Atlas Cedarwood, Vetiver',NULL,NULL,NULL,NULL,NULL,NULL,2386,32,NULL),(58060,NULL,NULL,'White Musk, Oakmoss',NULL,NULL,NULL,NULL,NULL,NULL,2386,33,NULL),(58061,NULL,NULL,'ANIELS-3790',NULL,NULL,NULL,NULL,NULL,NULL,2387,1,NULL),(58062,'en','default','Nectar de Seduction',NULL,NULL,NULL,NULL,NULL,NULL,2387,2,NULL),(58063,'en',NULL,'nectar-de-seduction',NULL,NULL,NULL,NULL,NULL,NULL,2387,3,NULL),(58064,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2387,5,NULL),(58065,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2387,6,NULL),(58066,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2387,7,NULL),(58067,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2387,8,NULL),(58068,'en','default','An intoxicating bouquet of ripe peach, golden plum, tuberoses, and warm cinnamon.',NULL,NULL,NULL,NULL,NULL,NULL,2387,9,NULL),(58069,'en','default','<p>An intoxicating bouquet of ripe peach, golden plum, tuberoses, and warm cinnamon.</p><p><strong>Top Notes:</strong> Peach, Plum, Cinnamon<br><strong>Heart Notes:</strong> Jasmine, Tuberose<br><strong>Base Notes:</strong> Vanilla, Benzoin</p>',NULL,NULL,NULL,NULL,NULL,NULL,2387,10,NULL),(58070,NULL,NULL,NULL,NULL,NULL,165000.0000,NULL,NULL,NULL,2387,11,NULL),(58071,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2387,22,NULL),(58072,NULL,NULL,'Peach, Plum, Cinnamon',NULL,NULL,NULL,NULL,NULL,NULL,2387,31,NULL),(58073,NULL,NULL,'Jasmine, Tuberose',NULL,NULL,NULL,NULL,NULL,NULL,2387,32,NULL),(58074,NULL,NULL,'Vanilla, Benzoin',NULL,NULL,NULL,NULL,NULL,NULL,2387,33,NULL),(58075,NULL,NULL,'ANIELS-3791',NULL,NULL,NULL,NULL,NULL,NULL,2388,1,NULL),(58076,'en','default','Enugu Midnight Oud',NULL,NULL,NULL,NULL,NULL,NULL,2388,2,NULL),(58077,'en',NULL,'enugu-midnight-oud',NULL,NULL,NULL,NULL,NULL,NULL,2388,3,NULL),(58078,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2388,5,NULL),(58079,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2388,6,NULL),(58080,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2388,7,NULL),(58081,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2388,8,NULL),(58082,'en','default','A mysterious, dark extrait crafted with smoked frankincense, dark rose, and royal agarwood.',NULL,NULL,NULL,NULL,NULL,NULL,2388,9,NULL),(58083,'en','default','<p>A mysterious, dark extrait crafted with smoked frankincense, dark rose, and royal agarwood.</p><p><strong>Top Notes:</strong> Smoked Incense, Saffron<br><strong>Heart Notes:</strong> Aged Agarwood, Taif Rose<br><strong>Base Notes:</strong> Ambergris, Black Leather</p>',NULL,NULL,NULL,NULL,NULL,NULL,2388,10,NULL),(58084,NULL,NULL,NULL,NULL,NULL,220000.0000,NULL,NULL,NULL,2388,11,NULL),(58085,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2388,22,NULL),(58086,NULL,NULL,'Smoked Incense, Saffron',NULL,NULL,NULL,NULL,NULL,NULL,2388,31,NULL),(58087,NULL,NULL,'Aged Agarwood, Taif Rose',NULL,NULL,NULL,NULL,NULL,NULL,2388,32,NULL),(58088,NULL,NULL,'Ambergris, Black Leather',NULL,NULL,NULL,NULL,NULL,NULL,2388,33,NULL),(58089,NULL,NULL,'ANIELS-3792',NULL,NULL,NULL,NULL,NULL,NULL,2389,1,NULL),(58090,'en','default','Golden Sillage Extrait',NULL,NULL,NULL,NULL,NULL,NULL,2389,2,NULL),(58091,'en',NULL,'golden-sillage-extrait',NULL,NULL,NULL,NULL,NULL,NULL,2389,3,NULL),(58092,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2389,5,NULL),(58093,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2389,6,NULL),(58094,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2389,7,NULL),(58095,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2389,8,NULL),(58096,'en','default','Radiant golden nectar featuring wild honey, orange blossom, and cashmere woods.',NULL,NULL,NULL,NULL,NULL,NULL,2389,9,NULL),(58097,'en','default','<p>Radiant golden nectar featuring wild honey, orange blossom, and cashmere woods.</p><p><strong>Top Notes:</strong> Wild Honey, Orange Blossom<br><strong>Heart Notes:</strong> Ylang-Ylang, Frankincense<br><strong>Base Notes:</strong> Cashmere Wood, Bourbon Vanilla</p>',NULL,NULL,NULL,NULL,NULL,NULL,2389,10,NULL),(58098,NULL,NULL,NULL,NULL,NULL,210000.0000,NULL,NULL,NULL,2389,11,NULL),(58099,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2389,22,NULL),(58100,NULL,NULL,'Wild Honey, Orange Blossom',NULL,NULL,NULL,NULL,NULL,NULL,2389,31,NULL),(58101,NULL,NULL,'Ylang-Ylang, Frankincense',NULL,NULL,NULL,NULL,NULL,NULL,2389,32,NULL),(58102,NULL,NULL,'Cashmere Wood, Bourbon Vanilla',NULL,NULL,NULL,NULL,NULL,NULL,2389,33,NULL),(58103,NULL,NULL,'ANIELS-3793',NULL,NULL,NULL,NULL,NULL,NULL,2390,1,NULL),(58104,'en','default','Bespoke Cashmere & Iris',NULL,NULL,NULL,NULL,NULL,NULL,2390,2,NULL),(58105,'en',NULL,'bespoke-cashmere-iris',NULL,NULL,NULL,NULL,NULL,NULL,2390,3,NULL),(58106,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2390,5,NULL),(58107,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2390,6,NULL),(58108,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2390,7,NULL),(58109,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2390,8,NULL),(58110,'en','default','Powdery Italian iris combined with silky cashmere and warm labdanum resin.',NULL,NULL,NULL,NULL,NULL,NULL,2390,9,NULL),(58111,'en','default','<p>Powdery Italian iris combined with silky cashmere and warm labdanum resin.</p><p><strong>Top Notes:</strong> Italian Iris, Violet Leaf<br><strong>Heart Notes:</strong> Cashmeran, Cedar<br><strong>Base Notes:</strong> Musk, Labdanum</p>',NULL,NULL,NULL,NULL,NULL,NULL,2390,10,NULL),(58112,NULL,NULL,NULL,NULL,NULL,135000.0000,NULL,NULL,NULL,2390,11,NULL),(58113,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2390,22,NULL),(58114,NULL,NULL,'Italian Iris, Violet Leaf',NULL,NULL,NULL,NULL,NULL,NULL,2390,31,NULL),(58115,NULL,NULL,'Cashmeran, Cedar',NULL,NULL,NULL,NULL,NULL,NULL,2390,32,NULL),(58116,NULL,NULL,'Musk, Labdanum',NULL,NULL,NULL,NULL,NULL,NULL,2390,33,NULL),(58117,NULL,NULL,'ANIELS-3795',NULL,NULL,NULL,NULL,NULL,NULL,2391,1,NULL),(58118,'en','default','Oud Absolute 1926',NULL,NULL,NULL,NULL,NULL,NULL,2391,2,NULL),(58119,'en',NULL,'oud-absolute-1926',NULL,NULL,NULL,NULL,NULL,NULL,2391,3,NULL),(58120,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2391,5,NULL),(58121,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2391,6,NULL),(58122,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2391,7,NULL),(58123,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2391,8,NULL),(58124,'en','default','The crown jewel of Aniel\'s. Rare Assam oud distillate with red saffron and dark tobacco.',NULL,NULL,NULL,NULL,NULL,NULL,2391,9,NULL),(58125,'en','default','<p>The crown jewel of Aniel\'s. Rare Assam oud distillate with red saffron and dark tobacco.</p><p><strong>Top Notes:</strong> Wild Saffron, Cardamom<br><strong>Heart Notes:</strong> Royal Assam Oud, Myrrh<br><strong>Base Notes:</strong> Pipe Tobacco, Sandalwood</p>',NULL,NULL,NULL,NULL,NULL,NULL,2391,10,NULL),(58126,NULL,NULL,NULL,NULL,NULL,250000.0000,NULL,NULL,NULL,2391,11,NULL),(58127,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2391,22,NULL),(58128,NULL,NULL,'Wild Saffron, Cardamom',NULL,NULL,NULL,NULL,NULL,NULL,2391,31,NULL),(58129,NULL,NULL,'Royal Assam Oud, Myrrh',NULL,NULL,NULL,NULL,NULL,NULL,2391,32,NULL),(58130,NULL,NULL,'Pipe Tobacco, Sandalwood',NULL,NULL,NULL,NULL,NULL,NULL,2391,33,NULL),(58131,NULL,NULL,'ANIELS-3796',NULL,NULL,NULL,NULL,NULL,NULL,2392,1,NULL),(58132,'en','default','Aura of Opulence',NULL,NULL,NULL,NULL,NULL,NULL,2392,2,NULL),(58133,'en',NULL,'aura-of-opulence',NULL,NULL,NULL,NULL,NULL,NULL,2392,3,NULL),(58134,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2392,5,NULL),(58135,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2392,6,NULL),(58136,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2392,7,NULL),(58137,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2392,8,NULL),(58138,'en','default','A sparkling scent opening with pink pepper and mandora, settling into velvet patchouli.',NULL,NULL,NULL,NULL,NULL,NULL,2392,9,NULL),(58139,'en','default','<p>A sparkling scent opening with pink pepper and mandora, settling into velvet patchouli.</p><p><strong>Top Notes:</strong> Mandora, Pink Pepper<br><strong>Heart Notes:</strong> Lilac, Golden Patchouli<br><strong>Base Notes:</strong> Crystal Amber, Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2392,10,NULL),(58140,NULL,NULL,NULL,NULL,NULL,150000.0000,NULL,NULL,NULL,2392,11,NULL),(58141,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2392,22,NULL),(58142,NULL,NULL,'Mandora, Pink Pepper',NULL,NULL,NULL,NULL,NULL,NULL,2392,31,NULL),(58143,NULL,NULL,'Lilac, Golden Patchouli',NULL,NULL,NULL,NULL,NULL,NULL,2392,32,NULL),(58144,NULL,NULL,'Crystal Amber, Musk',NULL,NULL,NULL,NULL,NULL,NULL,2392,33,NULL),(58145,NULL,NULL,'ANIELS-3797',NULL,NULL,NULL,NULL,NULL,NULL,2393,1,NULL),(58146,'en','default','Celeste Floral Elixir',NULL,NULL,NULL,NULL,NULL,NULL,2393,2,NULL),(58147,'en',NULL,'celeste-floral-elixir',NULL,NULL,NULL,NULL,NULL,NULL,2393,3,NULL),(58148,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2393,5,NULL),(58149,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2393,6,NULL),(58150,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2393,7,NULL),(58151,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2393,8,NULL),(58152,'en','default','Bright neroli and white gardenia petals dancing upon a bed of clean musk.',NULL,NULL,NULL,NULL,NULL,NULL,2393,9,NULL),(58153,'en','default','<p>Bright neroli and white gardenia petals dancing upon a bed of clean musk.</p><p><strong>Top Notes:</strong> Neroli, Bergamot<br><strong>Heart Notes:</strong> Jasmine Sambac, Gardenia<br><strong>Base Notes:</strong> Cedarwood, White Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2393,10,NULL),(58154,NULL,NULL,NULL,NULL,NULL,115000.0000,NULL,NULL,NULL,2393,11,NULL),(58155,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2393,22,NULL),(58156,NULL,NULL,'Neroli, Bergamot',NULL,NULL,NULL,NULL,NULL,NULL,2393,31,NULL),(58157,NULL,NULL,'Jasmine Sambac, Gardenia',NULL,NULL,NULL,NULL,NULL,NULL,2393,32,NULL),(58158,NULL,NULL,'Cedarwood, White Musk',NULL,NULL,NULL,NULL,NULL,NULL,2393,33,NULL),(58159,NULL,NULL,'ANIELS-3798',NULL,NULL,NULL,NULL,NULL,NULL,2394,1,NULL),(58160,'en','default','Noir Saphir Intense',NULL,NULL,NULL,NULL,NULL,NULL,2394,2,NULL),(58161,'en',NULL,'noir-saphir-intense',NULL,NULL,NULL,NULL,NULL,NULL,2394,3,NULL),(58162,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2394,5,NULL),(58163,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2394,6,NULL),(58164,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2394,7,NULL),(58165,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2394,8,NULL),(58166,'en','default','Dramatic black currant and smoky birch tar woven with velvet rose petals.',NULL,NULL,NULL,NULL,NULL,NULL,2394,9,NULL),(58167,'en','default','<p>Dramatic black currant and smoky birch tar woven with velvet rose petals.</p><p><strong>Top Notes:</strong> Black Currant, Cypress<br><strong>Heart Notes:</strong> Aged Oud, Dark Rose<br><strong>Base Notes:</strong> Suede, Birch Tar</p>',NULL,NULL,NULL,NULL,NULL,NULL,2394,10,NULL),(58168,NULL,NULL,NULL,NULL,NULL,175000.0000,NULL,NULL,NULL,2394,11,NULL),(58169,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2394,22,NULL),(58170,NULL,NULL,'Black Currant, Cypress',NULL,NULL,NULL,NULL,NULL,NULL,2394,31,NULL),(58171,NULL,NULL,'Aged Oud, Dark Rose',NULL,NULL,NULL,NULL,NULL,NULL,2394,32,NULL),(58172,NULL,NULL,'Suede, Birch Tar',NULL,NULL,NULL,NULL,NULL,NULL,2394,33,NULL),(58173,NULL,NULL,'ANIELS-3799',NULL,NULL,NULL,NULL,NULL,NULL,2395,1,NULL),(58174,'en','default','Soleil D\'Or Citrus',NULL,NULL,NULL,NULL,NULL,NULL,2395,2,NULL),(58175,'en',NULL,'soleil-dor-citrus',NULL,NULL,NULL,NULL,NULL,NULL,2395,3,NULL),(58176,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2395,5,NULL),(58177,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2395,6,NULL),(58178,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2395,7,NULL),(58179,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2395,8,NULL),(58180,'en','default','Sun-kissed blood orange and mandarin paired with aromatic Haitian vetiver.',NULL,NULL,NULL,NULL,NULL,NULL,2395,9,NULL),(58181,'en','default','<p>Sun-kissed blood orange and mandarin paired with aromatic Haitian vetiver.</p><p><strong>Top Notes:</strong> Blood Orange, Mandora<br><strong>Heart Notes:</strong> Orange Blossom, Jasmine<br><strong>Base Notes:</strong> Vetiver, Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2395,10,NULL),(58182,NULL,NULL,NULL,NULL,NULL,100.0000,NULL,NULL,NULL,2395,11,NULL),(58183,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2395,22,NULL),(58184,NULL,NULL,'Blood Orange, Mandora',NULL,NULL,NULL,NULL,NULL,NULL,2395,31,NULL),(58185,NULL,NULL,'Orange Blossom, Jasmine',NULL,NULL,NULL,NULL,NULL,NULL,2395,32,NULL),(58186,NULL,NULL,'Vetiver, Musk',NULL,NULL,NULL,NULL,NULL,NULL,2395,33,NULL),(58187,NULL,NULL,'ANIELS-3800',NULL,NULL,NULL,NULL,NULL,NULL,2396,1,NULL),(58188,'en','default','Majestic Vetiver & Spices',NULL,NULL,NULL,NULL,NULL,NULL,2396,2,NULL),(58189,'en',NULL,'majestic-vetiver-spices',NULL,NULL,NULL,NULL,NULL,NULL,2396,3,NULL),(58190,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2396,5,NULL),(58191,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2396,6,NULL),(58192,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2396,7,NULL),(58193,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2396,8,NULL),(58194,'en','default','Smoky Haitian vetiver combined with freshly cracked nutmeg and warm benzoin.',NULL,NULL,NULL,NULL,NULL,NULL,2396,9,NULL),(58195,'en','default','<p>Smoky Haitian vetiver combined with freshly cracked nutmeg and warm benzoin.</p><p><strong>Top Notes:</strong> Grapefruit, Nutmeg<br><strong>Heart Notes:</strong> Haitian Vetiver, Black Pepper<br><strong>Base Notes:</strong> Benzoin, Atlas Cedar</p>',NULL,NULL,NULL,NULL,NULL,NULL,2396,10,NULL),(58196,NULL,NULL,NULL,NULL,NULL,130000.0000,NULL,NULL,NULL,2396,11,NULL),(58197,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2396,22,NULL),(58198,NULL,NULL,'Grapefruit, Nutmeg',NULL,NULL,NULL,NULL,NULL,NULL,2396,31,NULL),(58199,NULL,NULL,'Haitian Vetiver, Black Pepper',NULL,NULL,NULL,NULL,NULL,NULL,2396,32,NULL),(58200,NULL,NULL,'Benzoin, Atlas Cedar',NULL,NULL,NULL,NULL,NULL,NULL,2396,33,NULL),(58201,NULL,NULL,'ANIELS-3802',NULL,NULL,NULL,NULL,NULL,NULL,2397,1,NULL),(58202,'en','default','Elixir de Fleur Royal',NULL,NULL,NULL,NULL,NULL,NULL,2397,2,NULL),(58203,'en',NULL,'elixir-de-fleur-royal',NULL,NULL,NULL,NULL,NULL,NULL,2397,3,NULL),(58204,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2397,5,NULL),(58205,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2397,6,NULL),(58206,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2397,7,NULL),(58207,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2397,8,NULL),(58208,'en','default','Precious Damask rose and lychee resting on amberwood and golden peony.',NULL,NULL,NULL,NULL,NULL,NULL,2397,9,NULL),(58209,'en','default','<p>Precious Damask rose and lychee resting on amberwood and golden peony.</p><p><strong>Top Notes:</strong> Damask Rose, Lychee<br><strong>Heart Notes:</strong> Peony, White Musk<br><strong>Base Notes:</strong> Cedar, Amberwood</p>',NULL,NULL,NULL,NULL,NULL,NULL,2397,10,NULL),(58210,NULL,NULL,NULL,NULL,NULL,160000.0000,NULL,NULL,NULL,2397,11,NULL),(58211,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2397,22,NULL),(58212,NULL,NULL,'Damask Rose, Lychee',NULL,NULL,NULL,NULL,NULL,NULL,2397,31,NULL),(58213,NULL,NULL,'Peony, White Musk',NULL,NULL,NULL,NULL,NULL,NULL,2397,32,NULL),(58214,NULL,NULL,'Cedar, Amberwood',NULL,NULL,NULL,NULL,NULL,NULL,2397,33,NULL),(58215,NULL,NULL,'ANIELS-3803',NULL,NULL,NULL,NULL,NULL,NULL,2398,1,NULL),(58216,'en','default','Imperial Leather & Smoke',NULL,NULL,NULL,NULL,NULL,NULL,2398,2,NULL),(58217,'en',NULL,'imperial-leather-smoke',NULL,NULL,NULL,NULL,NULL,NULL,2398,3,NULL),(58218,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2398,5,NULL),(58219,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2398,6,NULL),(58220,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2398,7,NULL),(58221,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2398,8,NULL),(58222,'en','default','Rich Russian leather accented with wild raspberries and frankincense smoke.',NULL,NULL,NULL,NULL,NULL,NULL,2398,9,NULL),(58223,'en','default','<p>Rich Russian leather accented with wild raspberries and frankincense smoke.</p><p><strong>Top Notes:</strong> Tuscan Leather, Thyme<br><strong>Heart Notes:</strong> Raspberry, Frankincense<br><strong>Base Notes:</strong> Amber, Soft Suede</p>',NULL,NULL,NULL,NULL,NULL,NULL,2398,10,NULL),(58224,NULL,NULL,NULL,NULL,NULL,195000.0000,NULL,NULL,NULL,2398,11,NULL),(58225,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2398,22,NULL),(58226,NULL,NULL,'Tuscan Leather, Thyme',NULL,NULL,NULL,NULL,NULL,NULL,2398,31,NULL),(58227,NULL,NULL,'Raspberry, Frankincense',NULL,NULL,NULL,NULL,NULL,NULL,2398,32,NULL),(58228,NULL,NULL,'Amber, Soft Suede',NULL,NULL,NULL,NULL,NULL,NULL,2398,33,NULL),(58229,NULL,NULL,'ANIELS-3804',NULL,NULL,NULL,NULL,NULL,NULL,2399,1,NULL),(58230,'en','default','Oud Wood & Amber Sovereign',NULL,NULL,NULL,NULL,NULL,NULL,2399,2,NULL),(58231,'en',NULL,'oud-wood-amber-sovereign',NULL,NULL,NULL,NULL,NULL,NULL,2399,3,NULL),(58232,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2399,5,NULL),(58233,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2399,6,NULL),(58234,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2399,7,NULL),(58235,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2399,8,NULL),(58236,'en','default','Rare agarwood chips infused with rosewood, tonka beans, and liquid amber.',NULL,NULL,NULL,NULL,NULL,NULL,2399,9,NULL),(58237,'en','default','<p>Rare agarwood chips infused with rosewood, tonka beans, and liquid amber.</p><p><strong>Top Notes:</strong> Rosewood, Cardamom<br><strong>Heart Notes:</strong> Rare Oud, Sandalwood<br><strong>Base Notes:</strong> Tonka Bean, Amber</p>',NULL,NULL,NULL,NULL,NULL,NULL,2399,10,NULL),(58238,NULL,NULL,NULL,NULL,NULL,240000.0000,NULL,NULL,NULL,2399,11,NULL),(58239,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2399,22,NULL),(58240,NULL,NULL,'Rosewood, Cardamom',NULL,NULL,NULL,NULL,NULL,NULL,2399,31,NULL),(58241,NULL,NULL,'Rare Oud, Sandalwood',NULL,NULL,NULL,NULL,NULL,NULL,2399,32,NULL),(58242,NULL,NULL,'Tonka Bean, Amber',NULL,NULL,NULL,NULL,NULL,NULL,2399,33,NULL),(58243,NULL,NULL,'ANIELS-3805',NULL,NULL,NULL,NULL,NULL,NULL,2400,1,NULL),(58244,'en','default','Vanilla Bourbon Supreme',NULL,NULL,NULL,NULL,NULL,NULL,2400,2,NULL),(58245,'en',NULL,'vanilla-bourbon-supreme',NULL,NULL,NULL,NULL,NULL,NULL,2400,3,NULL),(58246,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2400,5,NULL),(58247,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2400,6,NULL),(58248,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2400,7,NULL),(58249,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2400,8,NULL),(58250,'en','default','Pure Madagascar vanilla caviar with Ceylon cinnamon and roasted cacao nibs.',NULL,NULL,NULL,NULL,NULL,NULL,2400,9,NULL),(58251,'en','default','<p>Pure Madagascar vanilla caviar with Ceylon cinnamon and roasted cacao nibs.</p><p><strong>Top Notes:</strong> Madagascar Vanilla, Cinnamon<br><strong>Heart Notes:</strong> Cacao Nibs, Tonka<br><strong>Base Notes:</strong> Dry Woods, Amber Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2400,10,NULL),(58252,NULL,NULL,NULL,NULL,NULL,140000.0000,NULL,NULL,NULL,2400,11,NULL),(58253,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2400,22,NULL),(58254,NULL,NULL,'Madagascar Vanilla, Cinnamon',NULL,NULL,NULL,NULL,NULL,NULL,2400,31,NULL),(58255,NULL,NULL,'Cacao Nibs, Tonka',NULL,NULL,NULL,NULL,NULL,NULL,2400,32,NULL),(58256,NULL,NULL,'Dry Woods, Amber Musk',NULL,NULL,NULL,NULL,NULL,NULL,2400,33,NULL),(58257,NULL,NULL,'ANIELS-3806',NULL,NULL,NULL,NULL,NULL,NULL,2401,1,NULL),(58258,'en','default','Bespoke Saffron & Patchouli',NULL,NULL,NULL,NULL,NULL,NULL,2401,2,NULL),(58259,'en',NULL,'bespoke-saffron-patchouli',NULL,NULL,NULL,NULL,NULL,NULL,2401,3,NULL),(58260,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2401,5,NULL),(58261,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2401,6,NULL),(58262,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2401,7,NULL),(58263,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2401,8,NULL),(58264,'en','default','A regal tapestry of red Kashmiri saffron, earthy patchouli, and grey ambergris.',NULL,NULL,NULL,NULL,NULL,NULL,2401,9,NULL),(58265,'en','default','<p>A regal tapestry of red Kashmiri saffron, earthy patchouli, and grey ambergris.</p><p><strong>Top Notes:</strong> Red Saffron, Nutmeg<br><strong>Heart Notes:</strong> Patchouli, Cedarwood<br><strong>Base Notes:</strong> Ambergris, Vintage Leather</p>',NULL,NULL,NULL,NULL,NULL,NULL,2401,10,NULL),(58266,NULL,NULL,NULL,NULL,NULL,155000.0000,NULL,NULL,NULL,2401,11,NULL),(58267,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2401,22,NULL),(58268,NULL,NULL,'Red Saffron, Nutmeg',NULL,NULL,NULL,NULL,NULL,NULL,2401,31,NULL),(58269,NULL,NULL,'Patchouli, Cedarwood',NULL,NULL,NULL,NULL,NULL,NULL,2401,32,NULL),(58270,NULL,NULL,'Ambergris, Vintage Leather',NULL,NULL,NULL,NULL,NULL,NULL,2401,33,NULL),(58271,NULL,NULL,'ANIELS-3808',NULL,NULL,NULL,NULL,NULL,NULL,2402,1,NULL),(58272,'en','default','Ambre Royale Intense',NULL,NULL,NULL,NULL,NULL,NULL,2402,2,NULL),(58273,'en',NULL,'ambre-royale-intense',NULL,NULL,NULL,NULL,NULL,NULL,2402,3,NULL),(58274,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2402,5,NULL),(58275,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2402,6,NULL),(58276,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2402,7,NULL),(58277,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2402,8,NULL),(58278,'en','default','Deep golden amber infused with Italian bergamot, labdanum resin, and sweet benzoin.',NULL,NULL,NULL,NULL,NULL,NULL,2402,9,NULL),(58279,'en','default','<p>Deep golden amber infused with Italian bergamot, labdanum resin, and sweet benzoin.</p><p><strong>Top Notes:</strong> Golden Amber, Bergamot<br><strong>Heart Notes:</strong> Labdanum, Patchouli<br><strong>Base Notes:</strong> Vanilla, Benzoin</p>',NULL,NULL,NULL,NULL,NULL,NULL,2402,10,NULL),(58280,NULL,NULL,NULL,NULL,NULL,170000.0000,NULL,NULL,NULL,2402,11,NULL),(58281,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2402,22,NULL),(58282,NULL,NULL,'Golden Amber, Bergamot',NULL,NULL,NULL,NULL,NULL,NULL,2402,31,NULL),(58283,NULL,NULL,'Labdanum, Patchouli',NULL,NULL,NULL,NULL,NULL,NULL,2402,32,NULL),(58284,NULL,NULL,'Vanilla, Benzoin',NULL,NULL,NULL,NULL,NULL,NULL,2402,33,NULL),(58285,NULL,NULL,'ANIELS-3809',NULL,NULL,NULL,NULL,NULL,NULL,2403,1,NULL),(58286,'en','default','Monarch Oud & Rose',NULL,NULL,NULL,NULL,NULL,NULL,2403,2,NULL),(58287,'en',NULL,'monarch-oud-rose',NULL,NULL,NULL,NULL,NULL,NULL,2403,3,NULL),(58288,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2403,5,NULL),(58289,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2403,6,NULL),(58290,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2403,7,NULL),(58291,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2403,8,NULL),(58292,'en','default','Noble Taif rose married with wild Cambodian oud and velvety Mysore sandalwood.',NULL,NULL,NULL,NULL,NULL,NULL,2403,9,NULL),(58293,'en','default','<p>Noble Taif rose married with wild Cambodian oud and velvety Mysore sandalwood.</p><p><strong>Top Notes:</strong> Taif Rose, Geranium<br><strong>Heart Notes:</strong> Cambodian Oud, Saffron<br><strong>Base Notes:</strong> Mysore Sandalwood, Musk</p>',NULL,NULL,NULL,NULL,NULL,NULL,2403,10,NULL),(58294,NULL,NULL,NULL,NULL,NULL,230000.0000,NULL,NULL,NULL,2403,11,NULL),(58295,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2403,22,NULL),(58296,NULL,NULL,'Taif Rose, Geranium',NULL,NULL,NULL,NULL,NULL,NULL,2403,31,NULL),(58297,NULL,NULL,'Cambodian Oud, Saffron',NULL,NULL,NULL,NULL,NULL,NULL,2403,32,NULL),(58298,NULL,NULL,'Mysore Sandalwood, Musk',NULL,NULL,NULL,NULL,NULL,NULL,2403,33,NULL),(58299,NULL,NULL,'ANIELS-3811',NULL,NULL,NULL,NULL,NULL,NULL,2404,1,NULL),(58300,'en','default','Ivory Musk & Jasmine',NULL,NULL,NULL,NULL,NULL,NULL,2404,2,NULL),(58301,'en',NULL,'ivory-musk-jasmine',NULL,NULL,NULL,NULL,NULL,NULL,2404,3,NULL),(58302,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2404,5,NULL),(58303,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2404,6,NULL),(58304,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2404,7,NULL),(58305,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2404,8,NULL),(58306,'en','default','Pure white tea petals, star jasmine, and clean ivory musk creating a soothing aura.',NULL,NULL,NULL,NULL,NULL,NULL,2404,9,NULL),(58307,'en','default','<p>Pure white tea petals, star jasmine, and clean ivory musk creating a soothing aura.</p><p><strong>Top Notes:</strong> White Tea, Bergamot<br><strong>Heart Notes:</strong> Star Jasmine, Lily<br><strong>Base Notes:</strong> Ivory Musk, Sandalwood</p>',NULL,NULL,NULL,NULL,NULL,NULL,2404,10,NULL),(58308,NULL,NULL,NULL,NULL,NULL,105000.0000,NULL,NULL,NULL,2404,11,NULL),(58309,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2404,22,NULL),(58310,NULL,NULL,'White Tea, Bergamot',NULL,NULL,NULL,NULL,NULL,NULL,2404,31,NULL),(58311,NULL,NULL,'Star Jasmine, Lily',NULL,NULL,NULL,NULL,NULL,NULL,2404,32,NULL),(58312,NULL,NULL,'Ivory Musk, Sandalwood',NULL,NULL,NULL,NULL,NULL,NULL,2404,33,NULL),(58313,NULL,NULL,'ANIELS-3812',NULL,NULL,NULL,NULL,NULL,NULL,2405,1,NULL),(58314,'en','default','Bespoke Smoked Tobacco & Vanilla',NULL,NULL,NULL,NULL,NULL,NULL,2405,2,NULL),(58315,'en',NULL,'bespoke-smoked-tobacco-vanilla',NULL,NULL,NULL,NULL,NULL,NULL,2405,3,NULL),(58316,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2405,5,NULL),(58317,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2405,6,NULL),(58318,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2405,7,NULL),(58319,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2405,8,NULL),(58320,'en','default','Opulent cured tobacco leaves infused with rich spices, tonka bean, and sweet wood sap.',NULL,NULL,NULL,NULL,NULL,NULL,2405,9,NULL),(58321,'en','default','<p>Opulent cured tobacco leaves infused with rich spices, tonka bean, and sweet wood sap.</p><p><strong>Top Notes:</strong> Cured Tobacco Leaf, Spices<br><strong>Heart Notes:</strong> Tonka Bean, Vanilla, Cacao<br><strong>Base Notes:</strong> Dried Fruit, Cedar</p>',NULL,NULL,NULL,NULL,NULL,NULL,2405,10,NULL),(58322,NULL,NULL,NULL,NULL,NULL,180000.0000,NULL,NULL,NULL,2405,11,NULL),(58323,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2405,22,NULL),(58324,NULL,NULL,'Cured Tobacco Leaf, Spices',NULL,NULL,NULL,NULL,NULL,NULL,2405,31,NULL),(58325,NULL,NULL,'Tonka Bean, Vanilla, Cacao',NULL,NULL,NULL,NULL,NULL,NULL,2405,32,NULL),(58326,NULL,NULL,'Dried Fruit, Cedar',NULL,NULL,NULL,NULL,NULL,NULL,2405,33,NULL),(58327,NULL,NULL,'ANIELS-3813',NULL,NULL,NULL,NULL,NULL,NULL,2406,1,NULL),(58328,'en','default','Elysian Citrus & White Wood',NULL,NULL,NULL,NULL,NULL,NULL,2406,2,NULL),(58329,'en',NULL,'elysian-citrus-white-wood',NULL,NULL,NULL,NULL,NULL,NULL,2406,3,NULL),(58330,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2406,5,NULL),(58331,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2406,6,NULL),(58332,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2406,7,NULL),(58333,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2406,8,NULL),(58334,'en','default','Crisp mandarin citrus opening up to magnolia blossoms and polished white cedar.',NULL,NULL,NULL,NULL,NULL,NULL,2406,9,NULL),(58335,'en','default','<p>Crisp mandarin citrus opening up to magnolia blossoms and polished white cedar.</p><p><strong>Top Notes:</strong> Mandarin, Bergamot<br><strong>Heart Notes:</strong> Magnolia, Orange Blossom<br><strong>Base Notes:</strong> White Cedar, Amber</p>',NULL,NULL,NULL,NULL,NULL,NULL,2406,10,NULL),(58336,NULL,NULL,NULL,NULL,NULL,90000.0000,NULL,NULL,NULL,2406,11,NULL),(58337,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2406,22,NULL),(58338,NULL,NULL,'Mandarin, Bergamot',NULL,NULL,NULL,NULL,NULL,NULL,2406,31,NULL),(58339,NULL,NULL,'Magnolia, Orange Blossom',NULL,NULL,NULL,NULL,NULL,NULL,2406,32,NULL),(58340,NULL,NULL,'White Cedar, Amber',NULL,NULL,NULL,NULL,NULL,NULL,2406,33,NULL),(58341,NULL,NULL,'ANIELS-6802',NULL,NULL,NULL,NULL,NULL,NULL,2407,1,NULL),(58342,'en','default','Aniel\'s Flagship Signature Reserve',NULL,NULL,NULL,NULL,NULL,NULL,2407,2,NULL),(58343,'en',NULL,'aniels-flagship-signature-reserve',NULL,NULL,NULL,NULL,NULL,NULL,2407,3,NULL),(58344,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2407,5,NULL),(58345,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2407,6,NULL),(58346,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2407,7,NULL),(58347,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,2407,8,NULL),(58348,'en','default','The ultimate expression of Aniel\'s Perfumery. Master blended with aged wild agarwood, Taif rose, red saffron, and royal ambergris.',NULL,NULL,NULL,NULL,NULL,NULL,2407,9,NULL),(58349,'en','default','<p>The ultimate expression of Aniel\'s Perfumery. Master blended with aged wild agarwood, Taif rose, red saffron, and royal ambergris.</p><p><strong>Top Notes:</strong> Aged Cambodian Oud, Red Saffron<br><strong>Heart Notes:</strong> Taif Rose, Myrrh, Frankincense<br><strong>Base Notes:</strong> Royal Ambergris, Mysore Sandalwood</p>',NULL,NULL,NULL,NULL,NULL,NULL,2407,10,NULL),(58350,NULL,NULL,NULL,NULL,NULL,280000.0000,NULL,NULL,NULL,2407,11,NULL),(58351,NULL,NULL,NULL,NULL,NULL,0.5000,NULL,NULL,NULL,2407,22,NULL),(58352,NULL,NULL,'Aged Cambodian Oud, Red Saffron',NULL,NULL,NULL,NULL,NULL,NULL,2407,31,NULL),(58353,NULL,NULL,'Taif Rose, Myrrh, Frankincense',NULL,NULL,NULL,NULL,NULL,NULL,2407,32,NULL),(58354,NULL,NULL,'Royal Ambergris, Mysore Sandalwood',NULL,NULL,NULL,NULL,NULL,NULL,2407,33,NULL);
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_products`
--

DROP TABLE IF EXISTS `product_bundle_option_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `pbop_option_id_idx` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_products`
--

LOCK TABLES `product_bundle_option_products` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_option_translations`
--

DROP TABLE IF EXISTS `product_bundle_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_option_translations`
--

LOCK TABLES `product_bundle_option_translations` WRITE;
/*!40000 ALTER TABLE `product_bundle_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bundle_options`
--

DROP TABLE IF EXISTS `product_bundle_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_bundle_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bundle_options`
--

LOCK TABLES `product_bundle_options` WRITE;
/*!40000 ALTER TABLE `product_bundle_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_bundle_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `product_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (2385,37),(2389,37),(2392,37),(2397,37),(2400,37),(2402,37),(2386,38),(2393,38),(2395,38),(2396,38),(2404,38),(2406,38),(2383,39),(2388,39),(2391,39),(2399,39),(2403,39),(2407,39),(2384,40),(2387,40),(2390,40),(2394,40),(2398,40),(2401,40),(2405,40);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_channels`
--

DROP TABLE IF EXISTS `product_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_channels` (
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  KEY `pc_product_id_channel_id_idx` (`product_id`,`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_channels`
--

LOCK TABLES `product_channels` WRITE;
/*!40000 ALTER TABLE `product_channels` DISABLE KEYS */;
INSERT INTO `product_channels` VALUES (2383,1),(2384,1),(2385,1),(2386,1),(2387,1),(2388,1),(2389,1),(2390,1),(2391,1),(2392,1),(2393,1),(2394,1),(2395,1),(2396,1),(2397,1),(2398,1),(2399,1),(2400,1),(2401,1),(2402,1),(2403,1),(2404,1),(2405,1),(2406,1),(2407,1);
/*!40000 ALTER TABLE `product_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_cross_sells`
--

DROP TABLE IF EXISTS `product_cross_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_cross_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_cross_sells`
--

LOCK TABLES `product_cross_sells` WRITE;
/*!40000 ALTER TABLE `product_cross_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_cross_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customer_group_prices`
--

DROP TABLE IF EXISTS `product_customer_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customer_group_prices`
--

LOCK TABLES `product_customer_group_prices` WRITE;
/*!40000 ALTER TABLE `product_customer_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customer_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customizable_option_prices`
--

DROP TABLE IF EXISTS `product_customizable_option_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customizable_option_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_customizable_option_id` int unsigned NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`),
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customizable_option_prices`
--

LOCK TABLES `product_customizable_option_prices` WRITE;
/*!40000 ALTER TABLE `product_customizable_option_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customizable_option_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customizable_option_translations`
--

DROP TABLE IF EXISTS `product_customizable_option_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customizable_option_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_customizable_option_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`),
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customizable_option_translations`
--

LOCK TABLES `product_customizable_option_translations` WRITE;
/*!40000 ALTER TABLE `product_customizable_option_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customizable_option_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_customizable_options`
--

DROP TABLE IF EXISTS `product_customizable_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_customizable_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `max_characters` text COLLATE utf8mb4_unicode_ci,
  `supported_file_extensions` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_customizable_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_customizable_options`
--

LOCK TABLES `product_customizable_options` WRITE;
/*!40000 ALTER TABLE `product_customizable_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_customizable_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_link_translations`
--

DROP TABLE IF EXISTS `product_downloadable_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_link_translations`
--

LOCK TABLES `product_downloadable_link_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_link_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_links`
--

DROP TABLE IF EXISTS `product_downloadable_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_links`
--

LOCK TABLES `product_downloadable_links` WRITE;
/*!40000 ALTER TABLE `product_downloadable_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_sample_translations`
--

DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

LOCK TABLES `product_downloadable_sample_translations` WRITE;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_sample_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_downloadable_samples`
--

DROP TABLE IF EXISTS `product_downloadable_samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_downloadable_samples` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_downloadable_samples`
--

LOCK TABLES `product_downloadable_samples` WRITE;
/*!40000 ALTER TABLE `product_downloadable_samples` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_downloadable_samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_flat`
--

DROP TABLE IF EXISTS `product_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_flat` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_flat`
--

LOCK TABLES `product_flat` WRITE;
/*!40000 ALTER TABLE `product_flat` DISABLE KEYS */;
INSERT INTO `product_flat` VALUES (2383,'ANIELS-3785','simple',NULL,'Aniel\'s Royal Oud Extrait','An opulent fusion of rare Cambodian Oud, warm amber, and golden rose.','<p>An opulent fusion of rare Cambodian Oud, warm amber, and golden rose.</p><p><strong>Top Notes:</strong> Cambodian Oud, Bergamot<br><strong>Heart Notes:</strong> Damask Rose, Amber<br><strong>Base Notes:</strong> Sandalwood, Royal Musk</p>','aniels-royal-oud-extrait',1,1,NULL,NULL,NULL,NULL,185000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2383,'2026-09-23 07:04:25',NULL,1),(2384,'ANIELS-3786','simple',NULL,'Sovereign Amber & Leather','A commanding blend of Tuscan leather, spicy cardamom, and rich Baltic amber.','<p>A commanding blend of Tuscan leather, spicy cardamom, and rich Baltic amber.</p><p><strong>Top Notes:</strong> Cardamom, Pink Pepper<br><strong>Heart Notes:</strong> Tuscan Leather, Orris<br><strong>Base Notes:</strong> Amber, Cedarwood</p>','sovereign-amber-leather',1,1,NULL,NULL,NULL,NULL,145000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2384,'2026-09-23 07:04:26',NULL,1),(2385,'ANIELS-3788','simple',NULL,'Velvet Rose & Smoked Vanilla','Sensual Turkish rose enveloped in Madagascar bourbon vanilla and soft patchouli.','<p>Sensual Turkish rose enveloped in Madagascar bourbon vanilla and soft patchouli.</p><p><strong>Top Notes:</strong> Turkish Rose, Red Saffron<br><strong>Heart Notes:</strong> Bourbon Vanilla, Patchouli<br><strong>Base Notes:</strong> Tonka Bean, Aged Oud</p>','velvet-rose-smoked-vanilla',1,1,NULL,NULL,NULL,NULL,120000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2385,'2026-09-23 07:04:26',NULL,1),(2386,'ANIELS-3789','simple',NULL,'Imperial Citrus & Cedar','Vibrant Italian bergamot balanced with crisp Atlas cedarwood and fresh vetiver.','<p>Vibrant Italian bergamot balanced with crisp Atlas cedarwood and fresh vetiver.</p><p><strong>Top Notes:</strong> Calabrian Bergamot, Lemon<br><strong>Heart Notes:</strong> Atlas Cedarwood, Vetiver<br><strong>Base Notes:</strong> White Musk, Oakmoss</p>','imperial-citrus-cedar',1,1,NULL,NULL,NULL,NULL,95000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2386,'2026-09-23 07:04:26',NULL,1),(2387,'ANIELS-3790','simple',NULL,'Nectar de Seduction','An intoxicating bouquet of ripe peach, golden plum, tuberoses, and warm cinnamon.','<p>An intoxicating bouquet of ripe peach, golden plum, tuberoses, and warm cinnamon.</p><p><strong>Top Notes:</strong> Peach, Plum, Cinnamon<br><strong>Heart Notes:</strong> Jasmine, Tuberose<br><strong>Base Notes:</strong> Vanilla, Benzoin</p>','nectar-de-seduction',1,1,NULL,NULL,NULL,NULL,165000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2387,'2026-09-23 07:04:26',NULL,1),(2388,'ANIELS-3791','simple',NULL,'Enugu Midnight Oud','A mysterious, dark extrait crafted with smoked frankincense, dark rose, and royal agarwood.','<p>A mysterious, dark extrait crafted with smoked frankincense, dark rose, and royal agarwood.</p><p><strong>Top Notes:</strong> Smoked Incense, Saffron<br><strong>Heart Notes:</strong> Aged Agarwood, Taif Rose<br><strong>Base Notes:</strong> Ambergris, Black Leather</p>','enugu-midnight-oud',1,1,NULL,NULL,NULL,NULL,220000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2388,'2026-09-23 07:04:26',NULL,1),(2389,'ANIELS-3792','simple',NULL,'Golden Sillage Extrait','Radiant golden nectar featuring wild honey, orange blossom, and cashmere woods.','<p>Radiant golden nectar featuring wild honey, orange blossom, and cashmere woods.</p><p><strong>Top Notes:</strong> Wild Honey, Orange Blossom<br><strong>Heart Notes:</strong> Ylang-Ylang, Frankincense<br><strong>Base Notes:</strong> Cashmere Wood, Bourbon Vanilla</p>','golden-sillage-extrait',1,1,NULL,NULL,NULL,NULL,210000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2389,'2026-09-23 07:04:26',NULL,1),(2390,'ANIELS-3793','simple',NULL,'Bespoke Cashmere & Iris','Powdery Italian iris combined with silky cashmere and warm labdanum resin.','<p>Powdery Italian iris combined with silky cashmere and warm labdanum resin.</p><p><strong>Top Notes:</strong> Italian Iris, Violet Leaf<br><strong>Heart Notes:</strong> Cashmeran, Cedar<br><strong>Base Notes:</strong> Musk, Labdanum</p>','bespoke-cashmere-iris',1,1,NULL,NULL,NULL,NULL,135000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2390,'2026-09-23 07:04:26',NULL,1),(2391,'ANIELS-3795','simple',NULL,'Oud Absolute 1926','The crown jewel of Aniel\'s. Rare Assam oud distillate with red saffron and dark tobacco.','<p>The crown jewel of Aniel\'s. Rare Assam oud distillate with red saffron and dark tobacco.</p><p><strong>Top Notes:</strong> Wild Saffron, Cardamom<br><strong>Heart Notes:</strong> Royal Assam Oud, Myrrh<br><strong>Base Notes:</strong> Pipe Tobacco, Sandalwood</p>','oud-absolute-1926',1,1,NULL,NULL,NULL,NULL,250000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2391,'2026-09-23 07:04:26',NULL,1),(2392,'ANIELS-3796','simple',NULL,'Aura of Opulence','A sparkling scent opening with pink pepper and mandora, settling into velvet patchouli.','<p>A sparkling scent opening with pink pepper and mandora, settling into velvet patchouli.</p><p><strong>Top Notes:</strong> Mandora, Pink Pepper<br><strong>Heart Notes:</strong> Lilac, Golden Patchouli<br><strong>Base Notes:</strong> Crystal Amber, Musk</p>','aura-of-opulence',1,1,NULL,NULL,NULL,NULL,150000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2392,'2026-09-23 07:04:26',NULL,1),(2393,'ANIELS-3797','simple',NULL,'Celeste Floral Elixir','Bright neroli and white gardenia petals dancing upon a bed of clean musk.','<p>Bright neroli and white gardenia petals dancing upon a bed of clean musk.</p><p><strong>Top Notes:</strong> Neroli, Bergamot<br><strong>Heart Notes:</strong> Jasmine Sambac, Gardenia<br><strong>Base Notes:</strong> Cedarwood, White Musk</p>','celeste-floral-elixir',1,1,NULL,NULL,NULL,NULL,115000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2393,'2026-09-23 07:04:26',NULL,1),(2394,'ANIELS-3798','simple',NULL,'Noir Saphir Intense','Dramatic black currant and smoky birch tar woven with velvet rose petals.','<p>Dramatic black currant and smoky birch tar woven with velvet rose petals.</p><p><strong>Top Notes:</strong> Black Currant, Cypress<br><strong>Heart Notes:</strong> Aged Oud, Dark Rose<br><strong>Base Notes:</strong> Suede, Birch Tar</p>','noir-saphir-intense',1,1,NULL,NULL,NULL,NULL,175000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2394,'2026-09-23 07:04:26',NULL,1),(2395,'ANIELS-3799','simple',NULL,'Soleil D\'Or Citrus','Sun-kissed blood orange and mandarin paired with aromatic Haitian vetiver.','<p>Sun-kissed blood orange and mandarin paired with aromatic Haitian vetiver.</p><p><strong>Top Notes:</strong> Blood Orange, Mandora<br><strong>Heart Notes:</strong> Orange Blossom, Jasmine<br><strong>Base Notes:</strong> Vetiver, Musk</p>','soleil-dor-citrus',1,1,NULL,NULL,NULL,NULL,100.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2395,'2026-09-23 07:04:26',NULL,1),(2396,'ANIELS-3800','simple',NULL,'Majestic Vetiver & Spices','Smoky Haitian vetiver combined with freshly cracked nutmeg and warm benzoin.','<p>Smoky Haitian vetiver combined with freshly cracked nutmeg and warm benzoin.</p><p><strong>Top Notes:</strong> Grapefruit, Nutmeg<br><strong>Heart Notes:</strong> Haitian Vetiver, Black Pepper<br><strong>Base Notes:</strong> Benzoin, Atlas Cedar</p>','majestic-vetiver-spices',1,1,NULL,NULL,NULL,NULL,130000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2396,'2026-09-23 07:04:26',NULL,1),(2397,'ANIELS-3802','simple',NULL,'Elixir de Fleur Royal','Precious Damask rose and lychee resting on amberwood and golden peony.','<p>Precious Damask rose and lychee resting on amberwood and golden peony.</p><p><strong>Top Notes:</strong> Damask Rose, Lychee<br><strong>Heart Notes:</strong> Peony, White Musk<br><strong>Base Notes:</strong> Cedar, Amberwood</p>','elixir-de-fleur-royal',1,1,NULL,NULL,NULL,NULL,160000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2397,'2026-09-23 07:04:26',NULL,1),(2398,'ANIELS-3803','simple',NULL,'Imperial Leather & Smoke','Rich Russian leather accented with wild raspberries and frankincense smoke.','<p>Rich Russian leather accented with wild raspberries and frankincense smoke.</p><p><strong>Top Notes:</strong> Tuscan Leather, Thyme<br><strong>Heart Notes:</strong> Raspberry, Frankincense<br><strong>Base Notes:</strong> Amber, Soft Suede</p>','imperial-leather-smoke',1,1,NULL,NULL,NULL,NULL,195000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2398,'2026-09-23 07:04:26',NULL,1),(2399,'ANIELS-3804','simple',NULL,'Oud Wood & Amber Sovereign','Rare agarwood chips infused with rosewood, tonka beans, and liquid amber.','<p>Rare agarwood chips infused with rosewood, tonka beans, and liquid amber.</p><p><strong>Top Notes:</strong> Rosewood, Cardamom<br><strong>Heart Notes:</strong> Rare Oud, Sandalwood<br><strong>Base Notes:</strong> Tonka Bean, Amber</p>','oud-wood-amber-sovereign',1,1,NULL,NULL,NULL,NULL,240000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2399,'2026-09-23 07:04:26',NULL,1),(2400,'ANIELS-3805','simple',NULL,'Vanilla Bourbon Supreme','Pure Madagascar vanilla caviar with Ceylon cinnamon and roasted cacao nibs.','<p>Pure Madagascar vanilla caviar with Ceylon cinnamon and roasted cacao nibs.</p><p><strong>Top Notes:</strong> Madagascar Vanilla, Cinnamon<br><strong>Heart Notes:</strong> Cacao Nibs, Tonka<br><strong>Base Notes:</strong> Dry Woods, Amber Musk</p>','vanilla-bourbon-supreme',1,1,NULL,NULL,NULL,NULL,140000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2400,'2026-09-23 07:04:26',NULL,1),(2401,'ANIELS-3806','simple',NULL,'Bespoke Saffron & Patchouli','A regal tapestry of red Kashmiri saffron, earthy patchouli, and grey ambergris.','<p>A regal tapestry of red Kashmiri saffron, earthy patchouli, and grey ambergris.</p><p><strong>Top Notes:</strong> Red Saffron, Nutmeg<br><strong>Heart Notes:</strong> Patchouli, Cedarwood<br><strong>Base Notes:</strong> Ambergris, Vintage Leather</p>','bespoke-saffron-patchouli',1,1,NULL,NULL,NULL,NULL,155000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2401,'2026-09-23 07:04:27',NULL,1),(2402,'ANIELS-3808','simple',NULL,'Ambre Royale Intense','Deep golden amber infused with Italian bergamot, labdanum resin, and sweet benzoin.','<p>Deep golden amber infused with Italian bergamot, labdanum resin, and sweet benzoin.</p><p><strong>Top Notes:</strong> Golden Amber, Bergamot<br><strong>Heart Notes:</strong> Labdanum, Patchouli<br><strong>Base Notes:</strong> Vanilla, Benzoin</p>','ambre-royale-intense',1,1,NULL,NULL,NULL,NULL,170000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2402,'2026-09-23 07:04:27',NULL,1),(2403,'ANIELS-3809','simple',NULL,'Monarch Oud & Rose','Noble Taif rose married with wild Cambodian oud and velvety Mysore sandalwood.','<p>Noble Taif rose married with wild Cambodian oud and velvety Mysore sandalwood.</p><p><strong>Top Notes:</strong> Taif Rose, Geranium<br><strong>Heart Notes:</strong> Cambodian Oud, Saffron<br><strong>Base Notes:</strong> Mysore Sandalwood, Musk</p>','monarch-oud-rose',1,1,NULL,NULL,NULL,NULL,230000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2403,'2026-09-23 07:04:27',NULL,1),(2404,'ANIELS-3811','simple',NULL,'Ivory Musk & Jasmine','Pure white tea petals, star jasmine, and clean ivory musk creating a soothing aura.','<p>Pure white tea petals, star jasmine, and clean ivory musk creating a soothing aura.</p><p><strong>Top Notes:</strong> White Tea, Bergamot<br><strong>Heart Notes:</strong> Star Jasmine, Lily<br><strong>Base Notes:</strong> Ivory Musk, Sandalwood</p>','ivory-musk-jasmine',1,1,NULL,NULL,NULL,NULL,105000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2404,'2026-09-23 07:04:27',NULL,1),(2405,'ANIELS-3812','simple',NULL,'Bespoke Smoked Tobacco & Vanilla','Opulent cured tobacco leaves infused with rich spices, tonka bean, and sweet wood sap.','<p>Opulent cured tobacco leaves infused with rich spices, tonka bean, and sweet wood sap.</p><p><strong>Top Notes:</strong> Cured Tobacco Leaf, Spices<br><strong>Heart Notes:</strong> Tonka Bean, Vanilla, Cacao<br><strong>Base Notes:</strong> Dried Fruit, Cedar</p>','bespoke-smoked-tobacco-vanilla',1,1,NULL,NULL,NULL,NULL,180000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2405,'2026-09-23 07:04:27',NULL,1),(2406,'ANIELS-3813','simple',NULL,'Elysian Citrus & White Wood','Crisp mandarin citrus opening up to magnolia blossoms and polished white cedar.','<p>Crisp mandarin citrus opening up to magnolia blossoms and polished white cedar.</p><p><strong>Top Notes:</strong> Mandarin, Bergamot<br><strong>Heart Notes:</strong> Magnolia, Orange Blossom<br><strong>Base Notes:</strong> White Cedar, Amber</p>','elysian-citrus-white-wood',1,1,NULL,NULL,NULL,NULL,90000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2406,'2026-09-23 07:04:27',NULL,1),(2407,'ANIELS-6802','simple',NULL,'Aniel\'s Flagship Signature Reserve','The ultimate expression of Aniel\'s Perfumery. Master blended with aged wild agarwood, Taif rose, red saffron, and royal ambergris.','<p>The ultimate expression of Aniel\'s Perfumery. Master blended with aged wild agarwood, Taif rose, red saffron, and royal ambergris.</p><p><strong>Top Notes:</strong> Aged Cambodian Oud, Red Saffron<br><strong>Heart Notes:</strong> Taif Rose, Myrrh, Frankincense<br><strong>Base Notes:</strong> Royal Ambergris, Mysore Sandalwood</p>','aniels-flagship-signature-reserve',1,1,NULL,NULL,NULL,NULL,280000.0000,NULL,NULL,NULL,NULL,'2026-07-26 06:46:08','en','default',1,2407,'2026-09-23 07:04:27',NULL,1);
/*!40000 ALTER TABLE `product_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_grouped_products`
--

DROP TABLE IF EXISTS `product_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_grouped_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `associated_product_id` int unsigned NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  KEY `pgp_product_id_idx` (`product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_grouped_products`
--

LOCK TABLES `product_grouped_products` WRITE;
/*!40000 ALTER TABLE `product_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_img_product_id_idx` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'image','product/2383/IMG_3785.jpg',2383,1),(2,'image','product/2384/IMG_3786.jpg',2384,1),(3,'image','product/2385/IMG_3788.jpg',2385,1),(4,'image','product/2386/IMG_3789.jpg',2386,1),(5,'image','product/2387/IMG_3790.jpg',2387,1),(6,'image','product/2388/IMG_3791.jpg',2388,1),(7,'image','product/2389/IMG_3792.jpg',2389,1),(8,'image','product/2390/IMG_3793.jpg',2390,1),(9,'image','product/2391/IMG_3795.jpg',2391,1),(10,'image','product/2392/IMG_3796.jpg',2392,1),(11,'image','product/2393/IMG_3797.jpg',2393,1),(12,'image','product/2394/IMG_3798.jpg',2394,1),(13,'image','product/2395/IMG_3799.jpg',2395,1),(14,'image','product/2396/IMG_3800.jpg',2396,1),(15,'image','product/2397/IMG_3802.jpg',2397,1),(16,'image','product/2398/IMG_3803.jpg',2398,1),(17,'image','product/2399/IMG_3804.jpg',2399,1),(18,'image','product/2400/IMG_3805.jpg',2400,1),(19,'image','product/2401/IMG_3806.jpg',2401,1),(20,'image','product/2402/IMG_3808.jpg',2402,1),(21,'image','product/2403/IMG_3809.jpg',2403,1),(22,'image','product/2404/IMG_3811.jpg',2404,1),(23,'image','product/2405/IMG_3812.jpg',2405,1),(24,'image','product/2406/IMG_3813.jpg',2406,1),(25,'image','product/2407/IMG_6802.JPG',2407,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0',
  `inventory_source_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (1929,50,2383,0,1),(1930,50,2384,0,1),(1931,50,2385,0,1),(1932,50,2386,0,1),(1933,50,2387,0,1),(1934,50,2388,0,1),(1935,50,2389,0,1),(1936,50,2390,0,1),(1937,50,2391,0,1),(1938,50,2392,0,1),(1939,50,2393,0,1),(1940,50,2394,0,1),(1941,50,2395,0,1),(1942,50,2396,0,1),(1943,50,2397,0,1),(1944,50,2398,0,1),(1945,50,2399,0,1),(1946,50,2400,0,1),(1947,50,2401,0,1),(1948,50,2402,0,1),(1949,50,2403,0,1),(1950,50,2404,0,1),(1951,50,2405,0,1),(1952,50,2406,0,1),(1953,50,2407,0,1);
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory_indices`
--

DROP TABLE IF EXISTS `product_inventory_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  KEY `prod_inv_product_id_idx` (`product_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory_indices`
--

LOCK TABLES `product_inventory_indices` WRITE;
/*!40000 ALTER TABLE `product_inventory_indices` DISABLE KEYS */;
INSERT INTO `product_inventory_indices` VALUES (2377,50,2383,1,NULL,NULL),(2378,50,2384,1,NULL,NULL),(2379,50,2385,1,NULL,NULL),(2380,50,2386,1,NULL,NULL),(2381,50,2387,1,NULL,NULL),(2382,50,2388,1,NULL,NULL),(2383,50,2389,1,NULL,NULL),(2384,50,2390,1,NULL,NULL),(2385,50,2391,1,NULL,NULL),(2386,50,2392,1,NULL,NULL),(2387,50,2393,1,NULL,NULL),(2388,50,2394,1,NULL,NULL),(2389,49,2395,1,NULL,'2026-09-23 07:44:15'),(2390,50,2396,1,NULL,NULL),(2391,50,2397,1,NULL,NULL),(2392,50,2398,1,NULL,NULL),(2393,50,2399,1,NULL,NULL),(2394,50,2400,1,NULL,NULL),(2395,50,2401,1,NULL,NULL),(2396,50,2402,1,NULL,NULL),(2397,50,2403,1,NULL,NULL),(2398,50,2404,1,NULL,NULL),(2399,50,2405,1,NULL,NULL),(2400,50,2406,1,NULL,NULL),(2401,50,2407,1,NULL,NULL);
/*!40000 ALTER TABLE `product_inventory_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_ordered_inventories`
--

DROP TABLE IF EXISTS `product_ordered_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_ordered_inventories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ordered_inventories`
--

LOCK TABLES `product_ordered_inventories` WRITE;
/*!40000 ALTER TABLE `product_ordered_inventories` DISABLE KEYS */;
INSERT INTO `product_ordered_inventories` VALUES (45,1,2395,1);
/*!40000 ALTER TABLE `product_ordered_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_price_indices`
--

DROP TABLE IF EXISTS `product_price_indices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_indices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `customer_group_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  KEY `ppi_product_id_customer_group_id_idx` (`product_id`,`customer_group_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_price_indices`
--

LOCK TABLES `product_price_indices` WRITE;
/*!40000 ALTER TABLE `product_price_indices` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_price_indices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_relations`
--

DROP TABLE IF EXISTS `product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_relations` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_relations`
--

LOCK TABLES `product_relations` WRITE;
/*!40000 ALTER TABLE `product_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_review_attachments`
--

DROP TABLE IF EXISTS `product_review_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_review_attachments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_review_attachments`
--

LOCK TABLES `product_review_attachments` WRITE;
/*!40000 ALTER TABLE `product_review_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_review_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_rev_product_id_idx` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_super_attributes`
--

DROP TABLE IF EXISTS `product_super_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_super_attributes` (
  `product_id` int unsigned NOT NULL,
  `attribute_id` int unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_super_attributes`
--

LOCK TABLES `product_super_attributes` WRITE;
/*!40000 ALTER TABLE `product_super_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_super_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_up_sells`
--

DROP TABLE IF EXISTS `product_up_sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_up_sells` (
  `parent_id` int unsigned NOT NULL,
  `child_id` int unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_up_sells`
--

LOCK TABLES `product_up_sells` WRITE;
/*!40000 ALTER TABLE `product_up_sells` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_up_sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_videos`
--

DROP TABLE IF EXISTS `product_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_vid_product_id_idx` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_videos`
--

LOCK TABLES `product_videos` WRITE;
/*!40000 ALTER TABLE `product_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned DEFAULT NULL,
  `attribute_family_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2408 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2383,'ANIELS-3785','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2384,'ANIELS-3786','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2385,'ANIELS-3788','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2386,'ANIELS-3789','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2387,'ANIELS-3790','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2388,'ANIELS-3791','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2389,'ANIELS-3792','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2390,'ANIELS-3793','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2391,'ANIELS-3795','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2392,'ANIELS-3796','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2393,'ANIELS-3797','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2394,'ANIELS-3798','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2395,'ANIELS-3799','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2396,'ANIELS-3800','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2397,'ANIELS-3802','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2398,'ANIELS-3803','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2399,'ANIELS-3804','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2400,'ANIELS-3805','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2401,'ANIELS-3806','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2402,'ANIELS-3808','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2403,'ANIELS-3809','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2404,'ANIELS-3811','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2405,'ANIELS-3812','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2406,'ANIELS-3813','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59'),(2407,'ANIELS-6802','simple',NULL,1,NULL,'2026-07-25 12:24:59','2026-07-25 12:24:59');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refund_items`
--

DROP TABLE IF EXISTS `refund_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refund_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `refund_id` int unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_items`
--

LOCK TABLES `refund_items` WRITE;
/*!40000 ALTER TABLE `refund_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma`
--

DROP TABLE IF EXISTS `rma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `rma_status_id` int unsigned DEFAULT NULL,
  `package_condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_order_id_foreign` (`order_id`),
  KEY `rma_rma_status_id_foreign` (`rma_status_id`),
  CONSTRAINT `rma_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_rma_status_id_foreign` FOREIGN KEY (`rma_status_id`) REFERENCES `rma_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma`
--

LOCK TABLES `rma` WRITE;
/*!40000 ALTER TABLE `rma` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_additional_fields`
--

DROP TABLE IF EXISTS `rma_additional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_additional_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_custom_field_id` int unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_additional_fields_rma_id_foreign` (`rma_id`),
  KEY `rma_additional_fields_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_additional_fields_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_additional_fields_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_additional_fields`
--

LOCK TABLES `rma_additional_fields` WRITE;
/*!40000 ALTER TABLE `rma_additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_additional_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_custom_field_options`
--

DROP TABLE IF EXISTS `rma_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_custom_field_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_custom_field_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_custom_field_options_rma_custom_field_id_foreign` (`rma_custom_field_id`),
  CONSTRAINT `rma_custom_field_options_rma_custom_field_id_foreign` FOREIGN KEY (`rma_custom_field_id`) REFERENCES `rma_custom_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_custom_field_options`
--

LOCK TABLES `rma_custom_field_options` WRITE;
/*!40000 ALTER TABLE `rma_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_custom_fields`
--

DROP TABLE IF EXISTS `rma_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_custom_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT '0',
  `position` int DEFAULT '0',
  `input_validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rma_custom_fields_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_custom_fields`
--

LOCK TABLES `rma_custom_fields` WRITE;
/*!40000 ALTER TABLE `rma_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_images`
--

DROP TABLE IF EXISTS `rma_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_images_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_images_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_images`
--

LOCK TABLES `rma_images` WRITE;
/*!40000 ALTER TABLE `rma_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_items`
--

DROP TABLE IF EXISTS `rma_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned DEFAULT NULL,
  `rma_reason_id` int unsigned DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `variant_id` int unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `resolution` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_items_rma_id_foreign` (`rma_id`),
  KEY `rma_items_rma_reason_id_foreign` (`rma_reason_id`),
  KEY `rma_items_order_item_id_foreign` (`order_item_id`),
  KEY `rma_items_variant_id_foreign` (`variant_id`),
  CONSTRAINT `rma_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rma_items_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rma_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_items`
--

LOCK TABLES `rma_items` WRITE;
/*!40000 ALTER TABLE `rma_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_messages`
--

DROP TABLE IF EXISTS `rma_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_id` int unsigned NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment_path` longtext COLLATE utf8mb4_unicode_ci,
  `attachment` longtext COLLATE utf8mb4_unicode_ci,
  `is_admin` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_messages_rma_id_foreign` (`rma_id`),
  CONSTRAINT `rma_messages_rma_id_foreign` FOREIGN KEY (`rma_id`) REFERENCES `rma` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_messages`
--

LOCK TABLES `rma_messages` WRITE;
/*!40000 ALTER TABLE `rma_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `rma_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_reason_resolutions`
--

DROP TABLE IF EXISTS `rma_reason_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_reason_resolutions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rma_reason_id` int unsigned NOT NULL,
  `resolution_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rma_reason_resolutions_rma_reason_id_foreign` (`rma_reason_id`),
  CONSTRAINT `rma_reason_resolutions_rma_reason_id_foreign` FOREIGN KEY (`rma_reason_id`) REFERENCES `rma_reasons` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_reason_resolutions`
--

LOCK TABLES `rma_reason_resolutions` WRITE;
/*!40000 ALTER TABLE `rma_reason_resolutions` DISABLE KEYS */;
INSERT INTO `rma_reason_resolutions` VALUES (1,1,'return','2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,1,'cancel_items','2026-07-14 19:05:13','2026-07-14 19:05:13'),(3,2,'return','2026-07-14 19:05:13','2026-07-14 19:05:13'),(4,2,'cancel_items','2026-07-14 19:05:13','2026-07-14 19:05:13'),(5,3,'return','2026-07-14 19:05:13','2026-07-14 19:05:13'),(6,3,'cancel_items','2026-07-14 19:05:13','2026-07-14 19:05:13'),(7,4,'return','2026-07-14 19:05:13','2026-07-14 19:05:13'),(8,4,'cancel_items','2026-07-14 19:05:13','2026-07-14 19:05:13'),(9,5,'return','2026-07-14 19:05:13','2026-07-14 19:05:13'),(10,5,'cancel_items','2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `rma_reason_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_reasons`
--

DROP TABLE IF EXISTS `rma_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_reasons`
--

LOCK TABLES `rma_reasons` WRITE;
/*!40000 ALTER TABLE `rma_reasons` DISABLE KEYS */;
INSERT INTO `rma_reasons` VALUES (1,'Manufacturer Defect',1,1,0,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,'Damaged During Shipping',1,2,0,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(3,'Wrong Description Online',1,3,0,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(4,'Dead On Arrival',1,4,0,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(5,'Product Not Received Yet',1,5,0,'2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `rma_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_rules`
--

DROP TABLE IF EXISTS `rma_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `return_period` int DEFAULT NULL,
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_rules`
--

LOCK TABLES `rma_rules` WRITE;
/*!40000 ALTER TABLE `rma_rules` DISABLE KEYS */;
INSERT INTO `rma_rules` VALUES (1,'Basic','1',1,10,NULL,'2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `rma_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rma_statuses`
--

DROP TABLE IF EXISTS `rma_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rma_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rma_statuses`
--

LOCK TABLES `rma_statuses` WRITE;
/*!40000 ALTER TABLE `rma_statuses` DISABLE KEYS */;
INSERT INTO `rma_statuses` VALUES (1,'Pending Review',1,'#efb308',1,NULL,NULL),(2,'Approved',1,'#12af56',1,NULL,NULL),(3,'Awaiting Return',1,'#f59e0b',1,NULL,NULL),(4,'Return In Transit',1,'#3b82f6',1,NULL,NULL),(5,'Refunded',1,'#10b981',1,NULL,NULL),(6,'Solved',1,'#47b84f',1,NULL,NULL),(7,'Request Declined',1,'#e11d48',1,NULL,NULL),(8,'Item Canceled',1,'#dc2626',1,NULL,NULL),(9,'Request Canceled',1,'#991b1b',1,NULL,NULL);
/*!40000 ALTER TABLE `rma_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrator','This role users will have all the access','all',NULL,NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_synonyms`
--

DROP TABLE IF EXISTS `search_synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_synonyms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_synonyms`
--

LOCK TABLES `search_synonyms` WRITE;
/*!40000 ALTER TABLE `search_synonyms` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_synonyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_terms`
--

DROP TABLE IF EXISTS `search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_terms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_terms`
--

LOCK TABLES `search_terms` WRITE;
/*!40000 ALTER TABLE `search_terms` DISABLE KEYS */;
INSERT INTO `search_terms` VALUES (1,'bold',0,3,NULL,0,'en',1,'2026-07-23 11:26:51','2026-09-23 06:49:16'),(10,'date',0,1,NULL,0,'en',1,'2026-07-23 21:50:19','2026-07-23 21:50:19');
/*!40000 ALTER TABLE `search_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('4w0qidJmyEy1kZisDHpwNYiCrwJiVjzjMl63KJet',NULL,'127.0.0.1','curl/7.81.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNHZCdG13RDZXQVozVnFXN053WWtrckw4SElibktBOHNzOG1jWFVrSCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiTkdOIjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1790127520),('A63rH1YxNWLhWyFAuIXR8L4hFY1WdZuafgGTznyJ',NULL,'127.0.0.1','curl/7.81.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN2dsNVc3OW5QZUxmWWsyVldSWURxU1BldVYxSzVRWjJTNnM2MDkweCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiTkdOIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1790126158),('mrKcqTwBSGQGdVcqd5O26woIkl9kkefYiXj8ZnJM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoidzcwV0t1eks3eEtCdEwzNmNxYnNNRDMyRTJFeEpScm1pU3Q3SHMzeSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiTkdOIjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0MDoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluL3NhbGVzL29yZGVycyI7czo1OiJyb3V0ZSI7czoyNDoiYWRtaW4uc2FsZXMub3JkZXJzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9',1790129679),('q3S1M1Gvyj52F4d4TARgFX3HDYGqtuIML6d7PEG3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:156.0) Gecko/20100101 Firefox/156.0','YTo2OntzOjY6Il90b2tlbiI7czo0MDoidU9yMTV0c09rUDhLTWM2Z3JyRlozQlU3RGRaNzl4VEZrQmFJU1BHQSI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6ODoiY3VycmVuY3kiO3M6MzoiTkdOIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0NjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2NoZWNrb3V0L29uZXBhZ2Uvc3VjY2VzcyI7czo1OiJyb3V0ZSI7czoyOToic2hvcC5jaGVja291dC5vbmVwYWdlLnN1Y2Nlc3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1790129657);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_items`
--

DROP TABLE IF EXISTS `shipment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_items`
--

LOCK TABLES `shipment_items` WRITE;
/*!40000 ALTER TABLE `shipment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `carrier_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `order_address_id` int unsigned DEFAULT NULL,
  `inventory_source_id` int unsigned DEFAULT NULL,
  `inventory_source_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemap_channels`
--

DROP TABLE IF EXISTS `sitemap_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemap_channels` (
  `sitemap_id` int unsigned NOT NULL,
  `channel_id` int unsigned NOT NULL,
  UNIQUE KEY `sitemap_channels_sitemap_id_channel_id_unique` (`sitemap_id`,`channel_id`),
  KEY `sitemap_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `sitemap_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sitemap_channels_sitemap_id_foreign` FOREIGN KEY (`sitemap_id`) REFERENCES `sitemaps` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemap_channels`
--

LOCK TABLES `sitemap_channels` WRITE;
/*!40000 ALTER TABLE `sitemap_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemap_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitemaps`
--

DROP TABLE IF EXISTS `sitemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitemaps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitemaps`
--

LOCK TABLES `sitemaps` WRITE;
/*!40000 ALTER TABLE `sitemaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers_list`
--

DROP TABLE IF EXISTS `subscribers_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers_list` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int unsigned DEFAULT NULL,
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers_list`
--

LOCK TABLES `subscribers_list` WRITE;
/*!40000 ALTER TABLE `subscribers_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribers_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories_tax_rates`
--

DROP TABLE IF EXISTS `tax_categories_tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int unsigned NOT NULL,
  `tax_rate_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories_tax_rates`
--

LOCK TABLES `tax_categories_tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_categories_tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories_tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customization_translations`
--

DROP TABLE IF EXISTS `theme_customization_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customization_translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customization_translations`
--

LOCK TABLES `theme_customization_translations` WRITE;
/*!40000 ALTER TABLE `theme_customization_translations` DISABLE KEYS */;
INSERT INTO `theme_customization_translations` VALUES (1,1,'en','{\"images\": [{\"link\": \"#formal-wear-female\", \"image\": \"storage/theme/1/0JEOIUZdxrHJOzqPBWBMetD5fXZEZLmtk53rbhcl.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"#formal-wear-men\", \"image\": \"storage/theme/1/ZmorNklUyV6WJSMj8dM3WVW1vcPblf6WSFMzAYcM.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"#active-wear-female\", \"image\": \"storage/theme/1/ZW2nfo4OY5gTpDFzZ1F8D0YONwt1calCaZZGsVdi.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"#smart-home-automation\", \"image\": \"storage/theme/1/YV1M9Gsnpz8Zzd6sSP2vCEHEA1Tf3Fczg0np60wW.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"#mobile-phones-accessories\", \"image\": \"storage/theme/1/BEnaLpSYyyPowfDyMkfMmOvIlfamja9539U48CXG.webp\", \"title\": \"Get Ready For New Collection\"}, {\"link\": \"#laptops-tablets\", \"image\": \"storage/theme/1/S6aYZnwfSHmUCB7OPiiUNJqNQDiFTYvFp29iBhnA.webp\", \"title\": \"Get Ready For New Collection\"}]}'),(2,2,'en','{\"css\": \".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\", \"html\": \"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW</h1></div>\"}'),(3,3,'en','{\"css\": \".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\", \"html\": \"<div class=\\\"top-collection-container\\\">\\n                                <div class=\\\"top-collection-header\\\">\\n                                    <h2>The game with our new additions!</h2>\\n                                </div>\\n\\n                                <div class=\\\"top-collection-grid container\\\">\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#electronics\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/E700Ie7UKuzZvhAJ4Nk8WIlW5apLpctg4lxG4IEO.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#mens\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/jWB82Q2pxyCLmBeMpcuauJFKyE0sEN8q46wTdEEt.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#womens\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/Qb24R37FCdbkuKSMVDXpFS03dH2gOSV604yok2QD.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#formal-wear-men\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/mYn1WDVds8L5pwQKHaPuJwkGK2lmbEHyXHuNdmVX.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#formal-wear-female\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/4WVaKcBiSLeLfmjaxBu3MFaevu4oe4dHd4SBZa2J.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n\\n                                    <div class=\\\"top-collection-card\\\">\\n                                        <a href=\\\"#wellness\\\" aria-label=\\\"The game with our new additions!\\\">\\n                                            <img src=\\\"\\\" data-src=\\\"storage/theme/5/iJm5GZuEePK11fa4Y2wZovvPKnyHv7XpgFieocVL.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\">\\n                                        </a>\\n                                    </div>\\n                                </div>\\n                            </div>\"}'),(4,4,'en','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\">\\n                                <div class=\\\"inline-col-wrapper\\\">\\n                                    <div class=\\\"inline-col-image-wrapper\\\">\\n                                        <img src=\\\"\\\" data-src=\\\"storage/theme/6/QyHfrCtKQvhGBwzPn0WOqcUMaIEre2clrK2tvaKE.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\">\\n                                    </div>\\n\\n                                    <div class=\\\"inline-col-content-wrapper\\\">\\n                                        <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! </h2> \\n                                        \\n                                        <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!</p>\\n                                        \\n                                        <a href=\\\"#wellness\\\">\\n                                            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button>\\n                                        </a>\\n                                    </div>\\n                                </div>\\n                            </div>\"}'),(5,5,'en','{\"css\": \".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\", \"html\": \"<div class=\\\"section-game\\\">\\n                                <div class=\\\"section-title\\\">\\n                                    <h2>The game with our new additions!</h2> \\n                                </div>\\n\\n                                <div class=\\\"section-gap container\\\">\\n                                    <div class=\\\"collection-card-wrapper\\\">\\n                                        <div class=\\\"single-collection-card\\\">\\n                                            <a href=\\\"#active-wear\\\">\\n                                                <img src=\\\"\\\" data-src=\\\"storage/theme/8/9CIfL15Tp1QjVaNfNfF9fZSyJJ3FB7WiIoC6Pp5e.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\">\\n                                                \\n                                                <h3 class=\\\"overlay-text\\\">Our Collections</h3> \\n                                            </a>\\n                                        </div>\\n\\n                                        <div class=\\\"single-collection-card\\\">\\n                                            <a href=\\\"#active-wear-female\\\">\\n                                                <img src=\\\"\\\" data-src=\\\"storage/theme/8/yRSyFSbBQJekSXa04ggi2IdKvYIxG2AssLo0FXn9.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\">\\n                                                \\n                                                <h3 class=\\\"overlay-text\\\"> Our Collections </h3> \\n                                            </a>\\n                                        </div>\\n                                    </div>\\n                                </div>\\n                            </div>\"}'),(6,6,'en','{\"css\": \".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\", \"html\": \"<div class=\\\"section-gap bold-collections container\\\">\\n                                <div class=\\\"inline-col-wrapper direction-rtl\\\">\\n                                    <div class=\\\"inline-col-image-wrapper\\\">\\n                                        <img src=\\\"\\\" data-src=\\\"storage/theme/10/xQxvtGTcAfhPrUlRKLxsBNZ1gnSHFxK9mo3UXLfT.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Unleash Your Boldness with Our New Collection!\\\">\\n                                    </div>\\n\\n                                    <div class=\\\"inline-col-content-wrapper direction-ltr\\\">\\n                                        <h2 class=\\\"inline-col-title\\\">Unleash Your Boldness with Our New Collection!</h2> \\n                                        \\n                                        <p class=\\\"inline-col-description\\\">Our Bold Collections are here to redefine your wardrobe with fearless designs and striking, vibrant colors. From daring patterns to powerful hues, this is your chance to break away from the ordinary and step into the extraordinary.</p>\\n                                        \\n                                        <a href=\\\"#electronics\\\">\\n                                            <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections</button>\\n                                        </a>\\n                                    </div>\\n                                </div>\\n                            </div>\"}'),(7,7,'en','{\"column_1\": [{\"url\": \"http://localhost/page/about-us\", \"title\": \"About Us\", \"sort_order\": 1}, {\"url\": \"http://localhost/contact-us\", \"title\": \"Contact Us\", \"sort_order\": 2}, {\"url\": \"http://localhost/page/customer-service\", \"title\": \"Customer Service\", \"sort_order\": 3}, {\"url\": \"http://localhost/page/whats-new\", \"title\": \"What\'s New\", \"sort_order\": 4}, {\"url\": \"http://localhost/page/terms-of-use\", \"title\": \"Terms of Use\", \"sort_order\": 5}, {\"url\": \"http://localhost/page/terms-conditions\", \"title\": \"Terms & Conditions\", \"sort_order\": 6}], \"column_2\": [{\"url\": \"http://localhost/page/privacy-policy\", \"title\": \"Privacy Policy\", \"sort_order\": 1}, {\"url\": \"http://localhost/page/payment-policy\", \"title\": \"Payment Policy\", \"sort_order\": 2}, {\"url\": \"http://localhost/page/shipping-policy\", \"title\": \"Shipping Policy\", \"sort_order\": 3}, {\"url\": \"http://localhost/page/refund-policy\", \"title\": \"Refund Policy\", \"sort_order\": 4}, {\"url\": \"http://localhost/page/return-policy\", \"title\": \"Return Policy\", \"sort_order\": 5}]}'),(8,8,'en','{\"services\": [{\"title\": \"Free Shipping\", \"description\": \"Enjoy free shipping on all orders\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Product Replace\", \"description\": \"Easy Product Replacement Available!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Emi Available\", \"description\": \"No cost EMI available on all major credit cards\", \"service_icon\": \"icon-dollar-sign\"}, {\"title\": \"24/7 Support\", \"description\": \"Dedicated 24/7 support via chat and email\", \"service_icon\": \"icon-support\"}]}');
/*!40000 ALTER TABLE `theme_customization_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theme_customizations`
--

DROP TABLE IF EXISTS `theme_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theme_customizations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theme_customizations`
--

LOCK TABLES `theme_customizations` WRITE;
/*!40000 ALTER TABLE `theme_customizations` DISABLE KEYS */;
INSERT INTO `theme_customizations` VALUES (1,'default','image_carousel','Image Carousel',1,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(2,'default','static_content','Offer Information',2,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(3,'default','static_content','Top Collections',5,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(4,'default','static_content','Bold Collections',6,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(5,'default','static_content','Game Container',8,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(6,'default','static_content','Bold Collections',10,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(7,'default','footer_links','Footer Links',11,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13'),(8,'default','services_content','Services Content',12,1,1,'2026-07-14 19:05:13','2026-07-14 19:05:13');
/*!40000 ALTER TABLE `theme_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_rewrites`
--

DROP TABLE IF EXISTS `url_rewrites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `url_rewrites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_rewrites_et_rp_lc_idx` (`entity_type`,`request_path`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_rewrites`
--

LOCK TABLES `url_rewrites` WRITE;
/*!40000 ALTER TABLE `url_rewrites` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_rewrites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist_items`
--

DROP TABLE IF EXISTS `wishlist_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist_items`
--

LOCK TABLES `wishlist_items` WRITE;
/*!40000 ALTER TABLE `wishlist_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23  3:16:03
