-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: api_product
-- ------------------------------------------------------
-- Server version	8.0.34

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (8,'2014_10_12_000000_create_users_table',1),(9,'2014_10_12_100000_create_password_reset_tokens_table',1),(10,'2019_08_19_000000_create_failed_jobs_table',1),(11,'2019_12_14_000001_create_personal_access_tokens_table',1),(12,'2024_07_30_113512_create_products_table',1),(13,'2024_07_30_113540_create_properties_table',1),(14,'2024_07_30_114143_product_property',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
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
-- Table structure for table `product_property`
--

DROP TABLE IF EXISTS `product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_property` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `property_id` bigint unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_product_id_foreign` (`product_id`),
  KEY `product_property_property_id_foreign` (`property_id`),
  CONSTRAINT `product_property_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_property`
--

LOCK TABLES `product_property` WRITE;
/*!40000 ALTER TABLE `product_property` DISABLE KEYS */;
INSERT INTO `product_property` VALUES (1,2,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(2,2,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(3,2,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(4,3,1,'Зеленый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(5,3,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(6,3,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(7,4,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(8,4,2,'Средний','2024-07-30 09:56:09','2024-07-30 09:56:09'),(9,4,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(10,5,1,'Синий','2024-07-30 09:56:09','2024-07-30 09:56:09'),(11,5,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(12,5,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(13,6,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(14,6,2,'Средний','2024-07-30 09:56:09','2024-07-30 09:56:09'),(15,6,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(16,7,1,'Синий','2024-07-30 09:56:09','2024-07-30 09:56:09'),(17,7,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(18,7,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(19,8,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(20,8,2,'Средний','2024-07-30 09:56:09','2024-07-30 09:56:09'),(21,8,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(22,9,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(23,9,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(24,9,3,'BrandB','2024-07-30 09:56:09','2024-07-30 09:56:09'),(25,10,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(26,10,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(27,10,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(28,11,1,'Синий','2024-07-30 09:56:09','2024-07-30 09:56:09'),(29,11,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(30,11,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(31,12,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(32,12,2,'Средний','2024-07-30 09:56:09','2024-07-30 09:56:09'),(33,12,3,'BrandB','2024-07-30 09:56:09','2024-07-30 09:56:09'),(34,13,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(35,13,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(36,13,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(37,14,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(38,14,2,'Большой','2024-07-30 09:56:09','2024-07-30 09:56:09'),(39,14,3,'BrandA','2024-07-30 09:56:09','2024-07-30 09:56:09'),(40,15,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(41,15,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(42,15,3,'BrandC','2024-07-30 09:56:09','2024-07-30 09:56:09'),(43,16,1,'Зеленый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(44,16,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(45,16,3,'BrandB','2024-07-30 09:56:09','2024-07-30 09:56:09'),(46,17,1,'Желтый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(47,17,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(48,17,3,'BrandB','2024-07-30 09:56:09','2024-07-30 09:56:09'),(49,18,1,'Красный','2024-07-30 09:56:09','2024-07-30 09:56:09'),(50,18,2,'Малый','2024-07-30 09:56:09','2024-07-30 09:56:09'),(51,18,3,'BrandA','2024-07-30 09:56:10','2024-07-30 09:56:10'),(52,19,1,'Желтый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(53,19,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(54,19,3,'BrandA','2024-07-30 09:56:10','2024-07-30 09:56:10'),(55,20,1,'Зеленый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(56,20,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(57,20,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(58,21,1,'Желтый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(59,21,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(60,21,3,'BrandA','2024-07-30 09:56:10','2024-07-30 09:56:10'),(61,22,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(62,22,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(63,22,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(64,23,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(65,23,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(66,23,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(67,24,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(68,24,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(69,24,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(70,25,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(71,25,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(72,25,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(73,26,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(74,26,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(75,26,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(76,27,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(77,27,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(78,27,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(79,28,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(80,28,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(81,28,3,'BrandA','2024-07-30 09:56:10','2024-07-30 09:56:10'),(82,29,1,'Зеленый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(83,29,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(84,29,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(85,30,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(86,30,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(87,30,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(88,31,1,'Желтый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(89,31,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(90,31,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(91,32,1,'Желтый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(92,32,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(93,32,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(94,33,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(95,33,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(96,33,3,'BrandA','2024-07-30 09:56:10','2024-07-30 09:56:10'),(97,34,1,'Зеленый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(98,34,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(99,34,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(100,35,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(101,35,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(102,35,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(103,36,1,'Зеленый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(104,36,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(105,36,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(106,37,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(107,37,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(108,37,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(109,38,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(110,38,2,'Большой','2024-07-30 09:56:10','2024-07-30 09:56:10'),(111,38,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(112,39,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(113,39,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(114,39,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10'),(115,40,1,'Красный','2024-07-30 09:56:10','2024-07-30 09:56:10'),(116,40,2,'Средний','2024-07-30 09:56:10','2024-07-30 09:56:10'),(117,40,3,'BrandB','2024-07-30 09:56:10','2024-07-30 09:56:10'),(118,41,1,'Синий','2024-07-30 09:56:10','2024-07-30 09:56:10'),(119,41,2,'Малый','2024-07-30 09:56:10','2024-07-30 09:56:10'),(120,41,3,'BrandC','2024-07-30 09:56:10','2024-07-30 09:56:10');
/*!40000 ALTER TABLE `product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2024-07-30 09:53:12','2024-07-30 09:53:12','Товар 1',34.00,71),(2,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 1',74.00,74),(3,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 2',93.00,14),(4,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 3',44.00,15),(5,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 4',75.00,77),(6,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 5',71.00,57),(7,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 6',21.00,36),(8,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 7',16.00,95),(9,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 8',31.00,40),(10,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 9',53.00,70),(11,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 10',24.00,85),(12,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 11',84.00,81),(13,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 12',89.00,81),(14,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 13',15.00,48),(15,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 14',47.00,91),(16,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 15',92.00,51),(17,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 16',40.00,74),(18,'2024-07-30 09:56:09','2024-07-30 09:56:09','Товар 17',36.00,68),(19,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 18',68.00,77),(20,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 19',47.00,74),(21,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 20',44.00,97),(22,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 21',63.00,29),(23,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 22',13.00,2),(24,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 23',84.00,71),(25,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 24',95.00,91),(26,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 25',31.00,51),(27,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 26',96.00,7),(28,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 27',36.00,30),(29,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 28',73.00,61),(30,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 29',72.00,37),(31,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 30',46.00,32),(32,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 31',68.00,94),(33,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 32',98.00,68),(34,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 33',72.00,92),(35,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 34',72.00,100),(36,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 35',12.00,5),(37,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 36',92.00,79),(38,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 37',97.00,51),(39,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 38',28.00,13),(40,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 39',48.00,33),(41,'2024-07-30 09:56:10','2024-07-30 09:56:10','Товар 40',69.00,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'2024-07-30 09:53:12','2024-07-30 09:53:12','Цвет'),(2,'2024-07-30 09:56:09','2024-07-30 09:56:09','Размер'),(3,'2024-07-30 09:56:09','2024-07-30 09:56:09','Бренд');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-30 20:23:14
