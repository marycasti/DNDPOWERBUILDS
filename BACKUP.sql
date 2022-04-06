CREATE DATABASE  IF NOT EXISTS `dnd_powerbuilds` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dnd_powerbuilds`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd_powerbuilds
-- ------------------------------------------------------
-- Server version	8.0.27

## TABLAS: caracteristica,caractxclase,caractxraza,clase,conjuros_add,conjuros_mas,conjurosxclase,equipo,equipoxclase,equipoxsubraza,experto,habilidad,habilidxclase,habilidxtrasf,log_cant_powerbuilds,log_cant_ratings,log_insercion_build,log_modificacion_ratingxsubclase,manual,powerbuild,ratingxsubclase,raza,subclase,subraza,trasfondo

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
-- Table structure for table `caracteristica`
--

DROP TABLE IF EXISTS `caracteristica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caracteristica` (
  `id_caract` varchar(3) NOT NULL,
  `nombre_caract` varchar(15) NOT NULL,
  PRIMARY KEY (`id_caract`),
  UNIQUE KEY `nombre_caract` (`nombre_caract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristica`
--

LOCK TABLES `caracteristica` WRITE;
/*!40000 ALTER TABLE `caracteristica` DISABLE KEYS */;
INSERT INTO `caracteristica` VALUES ('CHA','CARISMA'),('CON','CONSTITUCION'),('DEX','DESTREZA'),('STR','FUERZA'),('INT','INTELIGENCIA'),('WIS','SABIDURIA');
/*!40000 ALTER TABLE `caracteristica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caractxclase`
--

DROP TABLE IF EXISTS `caractxclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caractxclase` (
  `id_caractxclase` int NOT NULL AUTO_INCREMENT,
  `id_clase` int NOT NULL,
  `id_caract` varchar(3) NOT NULL,
  `aptitud_magica` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_caractxclase`),
  KEY `id_clase` (`id_clase`),
  KEY `id_caract` (`id_caract`),
  CONSTRAINT `caractxclase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `caractxclase_ibfk_2` FOREIGN KEY (`id_caract`) REFERENCES `caracteristica` (`id_caract`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caractxclase`
--

LOCK TABLES `caractxclase` WRITE;
/*!40000 ALTER TABLE `caractxclase` DISABLE KEYS */;
INSERT INTO `caractxclase` VALUES (1,1,'INT',1),(2,2,'STR',0),(3,3,'CHA',1),(4,4,'CHA',1),(5,5,'WIS',1),(6,6,'WIS',1),(7,7,'DEX',0),(8,7,'WIS',1),(9,8,'STR',0),(10,8,'DEX',0),(11,9,'CHA',1),(12,10,'INT',1),(13,11,'DEX',0),(14,11,'WIS',0),(15,12,'STR',0),(16,12,'CHA',1),(17,13,'DEX',0);
/*!40000 ALTER TABLE `caractxclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caractxraza`
--

DROP TABLE IF EXISTS `caractxraza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caractxraza` (
  `id_caractxraza` int NOT NULL AUTO_INCREMENT,
  `id_raza` int NOT NULL,
  `id_caract` varchar(3) NOT NULL,
  `mejora` int DEFAULT NULL,
  PRIMARY KEY (`id_caractxraza`),
  KEY `id_raza` (`id_raza`),
  KEY `id_caract` (`id_caract`),
  CONSTRAINT `caractxraza_ibfk_1` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`),
  CONSTRAINT `caractxraza_ibfk_2` FOREIGN KEY (`id_caract`) REFERENCES `caracteristica` (`id_caract`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caractxraza`
--

LOCK TABLES `caractxraza` WRITE;
/*!40000 ALTER TABLE `caractxraza` DISABLE KEYS */;
INSERT INTO `caractxraza` VALUES (1,1,'CON',2),(2,2,'DEX',2),(3,3,'DEX',2),(4,4,'STR',1),(5,4,'DEX',1),(6,4,'CON',1),(7,4,'INT',1),(8,4,'WIS',1),(9,4,'CHA',1),(10,5,'STR',2),(11,5,'CHA',1),(12,6,'INT',2),(13,7,'CHA',2),(14,8,'STR',2),(15,8,'CON',1),(16,9,'CHA',2),(17,9,'INT',1);
/*!40000 ALTER TABLE `caractxraza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `nombre_clase` varchar(10) NOT NULL,
  `dados_hp` varchar(3) NOT NULL,
  `full_casters` tinyint(1) DEFAULT NULL,
  `ataque_extra` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'ARTIFICE','d8',0,0),(2,'BARBARO','d12',0,1),(3,'BARDO','d8',1,0),(4,'BRUJO','d8',0,0),(5,'CLERIGO','d8',1,0),(6,'DRUIDA','d8',1,0),(7,'EXPLORADOR','d10',0,1),(8,'GUERRERO','d10',0,1),(9,'HECHICERO','d6',1,0),(10,'MAGO','d6',1,0),(11,'MONJE','d8',0,1),(12,'PALADIN','d10',0,1),(13,'PICARO','d8',0,0);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjuros_add`
--

DROP TABLE IF EXISTS `conjuros_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjuros_add` (
  `id_conjuros_add` int NOT NULL AUTO_INCREMENT,
  `id_subclase` int NOT NULL,
  `id_conjuro` int NOT NULL,
  PRIMARY KEY (`id_conjuros_add`),
  KEY `id_subclase` (`id_subclase`),
  KEY `id_conjuro` (`id_conjuro`),
  CONSTRAINT `conjuros_add_ibfk_1` FOREIGN KEY (`id_subclase`) REFERENCES `subclase` (`id_subclase`),
  CONSTRAINT `conjuros_add_ibfk_2` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros_mas` (`id_conjuro`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjuros_add`
--

LOCK TABLES `conjuros_add` WRITE;
/*!40000 ALTER TABLE `conjuros_add` DISABLE KEYS */;
INSERT INTO `conjuros_add` VALUES (1,1,11),(2,2,12),(3,2,13),(4,2,14),(5,2,19),(6,2,21),(7,3,12),(8,3,15),(9,4,10),(10,19,5),(11,19,13),(12,19,14),(13,19,19),(14,19,22),(15,20,9),(16,23,11),(17,23,16),(18,23,19),(19,23,22),(20,26,20),(21,27,22),(22,28,5),(23,28,11),(24,28,13),(25,28,14),(26,28,19),(27,28,22),(28,29,25),(29,30,12),(30,30,21),(31,30,24),(32,30,25),(33,52,3),(34,52,4),(35,52,5),(36,52,7),(37,52,8),(38,52,12),(39,52,13),(40,52,14),(41,52,15),(42,52,18),(43,52,19),(44,52,21),(45,86,6),(46,86,18),(47,85,21),(48,84,22),(49,93,3),(50,93,4);
/*!40000 ALTER TABLE `conjuros_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `conjuros_addxsubclase`
--

DROP TABLE IF EXISTS `conjuros_addxsubclase`;
/*!50001 DROP VIEW IF EXISTS `conjuros_addxsubclase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `conjuros_addxsubclase` AS SELECT 
 1 AS `get_clase(id_clase)`,
 1 AS `nombre_subclase`,
 1 AS `nombre_conjuro`,
 1 AS `nivel`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `conjuros_mas`
--

DROP TABLE IF EXISTS `conjuros_mas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjuros_mas` (
  `id_conjuro` int NOT NULL AUTO_INCREMENT,
  `nombre_conjuro` varchar(50) NOT NULL,
  `nivel` int NOT NULL,
  `concentracion` tinyint(1) DEFAULT NULL,
  `id_manual` varchar(3) NOT NULL,
  PRIMARY KEY (`id_conjuro`),
  KEY `id_manual` (`id_manual`),
  CONSTRAINT `conjuros_mas_ibfk_1` FOREIGN KEY (`id_manual`) REFERENCES `manual` (`id_manual`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjuros_mas`
--

LOCK TABLES `conjuros_mas` WRITE;
/*!40000 ALTER TABLE `conjuros_mas` DISABLE KEYS */;
INSERT INTO `conjuros_mas` VALUES (1,'Descarga sobrenatural',0,0,'PHB'),(2,'Llama sagrada',0,0,'PHB'),(3,'Rociada venenosa',0,0,'PHB'),(4,'Toque helado',0,0,'PHB'),(5,'Manos ardientes',1,0,'PHB'),(6,'Marca del cazador',1,1,'PHB'),(7,'Orbe cromático',1,0,'PHB'),(8,'Proyectil mágico',1,0,'PHB'),(9,'Susurros discordantes',1,0,'PHB'),(10,'Castigo marcador',2,1,'PHB'),(11,'Esfera de fuego',2,1,'PHB'),(12,'Hacer añicos',2,0,'PHB'),(13,'Rayo abrasador',2,0,'PHB'),(14,'Bola de fuego',3,0,'PHB'),(15,'Relámpago',3,0,'PHB'),(16,'Revivir',3,0,'PHB'),(17,'Toque vampírico',3,1,'PHB'),(18,'Destierro',4,1,'PHB'),(19,'Muro de fuego',4,1,'PHB'),(20,'Polimorfar',4,1,'PHB'),(21,'Tormenta de hielo',4,0,'PHB'),(22,'Golpe flamígero',5,0,'PHB'),(23,'Mano de Bigby',5,1,'PHB'),(24,'Ola destructora',5,0,'PHB'),(25,'Plaga de insectos',5,1,'PHB'),(26,'Circulo de muerte',6,0,'PHB'),(27,'Desintegrar',6,0,'PHB'),(28,'Mal de ojo',6,1,'PHB'),(29,'Muro de espinas',6,1,'PHB'),(30,'Dedo de la muerte',7,0,'PHB'),(31,'Palabra divina',7,0,'PHB'),(32,'Resurrección',7,0,'PHB'),(33,'Tormenta de fuego',7,0,'PHB'),(34,'Explosión solar',8,0,'PHB'),(35,'Nube incendiaria',8,1,'PHB'),(36,'Romper la mente',8,0,'PHB'),(37,'Tsunami',8,1,'PHB'),(38,'Deseo',9,0,'PHB'),(39,'Palabra de poder: Matar',9,0,'PHB'),(40,'Parar el tiempo',9,0,'PHB'),(41,'Tormenta de meteoritos',9,0,'PHB');
/*!40000 ALTER TABLE `conjuros_mas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjurosxclase`
--

DROP TABLE IF EXISTS `conjurosxclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conjurosxclase` (
  `id_conjurosxclase` int NOT NULL AUTO_INCREMENT,
  `id_clase` int NOT NULL,
  `id_conjuro` int NOT NULL,
  PRIMARY KEY (`id_conjurosxclase`),
  KEY `id_clase` (`id_clase`),
  KEY `id_conjuro` (`id_conjuro`),
  CONSTRAINT `conjurosxclase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `conjurosxclase_ibfk_2` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros_mas` (`id_conjuro`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjurosxclase`
--

LOCK TABLES `conjurosxclase` WRITE;
/*!40000 ALTER TABLE `conjurosxclase` DISABLE KEYS */;
INSERT INTO `conjurosxclase` VALUES (1,3,9),(2,3,12),(3,3,20),(4,3,28),(5,3,36),(6,3,39),(7,4,1),(8,4,3),(9,4,4),(10,4,12),(11,4,17),(12,4,18),(13,4,26),(14,4,28),(15,4,30),(16,4,36),(17,4,39),(18,5,2),(19,5,16),(20,5,18),(21,5,22),(22,5,25),(23,5,31),(24,5,32),(25,5,33),(26,6,3),(27,6,11),(28,6,19),(29,6,20),(30,6,21),(31,6,25),(32,6,29),(33,6,33),(34,6,34),(35,6,36),(36,6,37),(37,7,6),(38,9,3),(39,9,4),(40,9,5),(41,9,7),(42,9,8),(43,9,12),(44,9,13),(45,9,14),(46,9,15),(47,9,18),(48,9,19),(49,9,20),(50,9,21),(51,9,25),(52,9,26),(53,9,27),(54,9,28),(55,9,30),(56,9,33),(57,9,34),(58,9,35),(59,9,38),(60,9,39),(61,9,40),(62,9,41),(63,10,3),(64,10,4),(65,10,5),(66,10,7),(67,10,8),(68,10,11),(69,10,12),(70,10,13),(71,10,14),(72,10,15),(73,10,17),(74,10,18),(75,10,19),(76,10,20),(77,10,21),(78,10,23),(79,10,27),(80,10,28),(81,10,30),(82,10,34),(83,10,35),(84,10,36),(85,10,38),(86,10,39),(87,10,40),(88,10,41),(89,12,10),(90,12,16),(91,12,18),(92,12,24);
/*!40000 ALTER TABLE `conjurosxclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(30) NOT NULL,
  `tipo_equipo` varchar(50) NOT NULL,
  `daño_promedio` int DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Acolchada','Armaduras ligeras',NULL),(2,'Cuero','Armaduras ligeras',NULL),(3,'Cuero tachonado','Armaduras ligeras',NULL),(4,'Camisa de malla','Armaduras medias',NULL),(5,'Cota de escamas','Armaduras medias',NULL),(6,'Coraza','Armaduras medias',NULL),(7,'Media armadura','Armaduras medias',NULL),(8,'Pieles','Armaduras medias',NULL),(9,'Armadura de bandas','Armaduras pesadas',NULL),(10,'Armadura de placas','Armaduras pesadas',NULL),(11,'Cota guarnecida','Armaduras pesadas',NULL),(12,'Cota de malla','Armaduras pesadas',NULL),(13,'Escudo','Escudos',NULL),(14,'Bastón','Armas cuerpo a cuerpo sencillas',4),(15,'Daga','Armas cuerpo a cuerpo sencillas',3),(16,'Garrote','Armas cuerpo a cuerpo sencillas',3),(17,'Garrote grande','Armas cuerpo a cuerpo sencillas',5),(18,'Hacha de mano','Armas cuerpo a cuerpo sencillas',4),(19,'Hoz','Armas cuerpo a cuerpo sencillas',3),(20,'Jabalina','Armas cuerpo a cuerpo sencillas',4),(21,'Lanza','Armas cuerpo a cuerpo sencillas',4),(22,'Martillo ligero','Armas cuerpo a cuerpo sencillas',3),(23,'Maza','Armas cuerpo a cuerpo sencillas',4),(24,'Arco corto','Armas a distancia sencillas',4),(25,'Ballesta ligera','Armas a distancia sencillas',5),(26,'Dardo','Armas a distancia sencillas',3),(27,'Honda','Armas a distancia sencillas',3),(28,'Alabarda','Armas cuerpo a cuerpo marciales',6),(29,'Cimitarra','Armas cuerpo a cuerpo marciales',4),(30,'Espada corta','Armas cuerpo a cuerpo marciales',4),(31,'Espada larga','Armas cuerpo a cuerpo marciales',5),(32,'Espadón','Armas cuerpo a cuerpo marciales',7),(33,'Estoque','Armas cuerpo a cuerpo marciales',5),(34,'Flagelo','Armas cuerpo a cuerpo marciales',5),(35,'Guja','Armas cuerpo a cuerpo marciales',6),(36,'Hacha a dos manos','Armas cuerpo a cuerpo marciales',7),(37,'Hacha de guerra','Armas cuerpo a cuerpo marciales',5),(38,'Lanza de caballería','Armas cuerpo a cuerpo marciales',7),(39,'Látigo','Armas cuerpo a cuerpo marciales',3),(40,'Lucero del alba','Armas cuerpo a cuerpo marciales',5),(41,'Martillo de guerra','Armas cuerpo a cuerpo marciales',5),(42,'Maza a dos manos','Armas cuerpo a cuerpo marciales',7),(43,'Pica','Armas cuerpo a cuerpo marciales',6),(44,'Pico de guerra','Armas cuerpo a cuerpo marciales',5),(45,'Tridente','Armas cuerpo a cuerpo marciales',4),(46,'Arco largo','Armas a distancia marciales',5),(47,'Ballesta de mano','Armas a distancia marciales',4),(48,'Ballesta pesada','Armas a distancia marciales',6);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipoxclase`
--

DROP TABLE IF EXISTS `equipoxclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipoxclase` (
  `id_equipoxclase` int NOT NULL AUTO_INCREMENT,
  `id_clase` int NOT NULL,
  `id_equipo` int NOT NULL,
  PRIMARY KEY (`id_equipoxclase`),
  KEY `id_clase` (`id_clase`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `equipoxclase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `equipoxclase_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipoxclase`
--

LOCK TABLES `equipoxclase` WRITE;
/*!40000 ALTER TABLE `equipoxclase` DISABLE KEYS */;
INSERT INTO `equipoxclase` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,13),(10,1,14),(11,1,15),(12,1,16),(13,1,17),(14,1,18),(15,1,19),(16,1,20),(17,1,21),(18,1,22),(19,1,23),(20,1,24),(21,1,25),(22,1,26),(23,1,27),(24,2,1),(25,2,2),(26,2,3),(27,2,4),(28,2,5),(29,2,6),(30,2,7),(31,2,8),(32,2,13),(33,2,14),(34,2,15),(35,2,16),(36,2,17),(37,2,18),(38,2,19),(39,2,20),(40,2,21),(41,2,22),(42,2,23),(43,2,24),(44,2,25),(45,2,26),(46,2,27),(47,2,28),(48,2,29),(49,2,30),(50,2,31),(51,2,32),(52,2,33),(53,2,34),(54,2,35),(55,2,36),(56,2,37),(57,2,38),(58,2,39),(59,2,40),(60,2,41),(61,2,42),(62,2,43),(63,2,44),(64,2,45),(65,2,46),(66,2,47),(67,2,48),(68,3,1),(69,3,2),(70,3,3),(71,3,14),(72,3,15),(73,3,16),(74,3,17),(75,3,18),(76,3,19),(77,3,20),(78,3,21),(79,3,22),(80,3,23),(81,3,24),(82,3,25),(83,3,26),(84,3,27),(85,3,30),(86,3,31),(87,3,33),(88,3,47),(89,4,1),(90,4,2),(91,4,3),(92,4,14),(93,4,15),(94,4,16),(95,4,17),(96,4,18),(97,4,19),(98,4,20),(99,4,21),(100,4,22),(101,4,23),(102,4,24),(103,4,25),(104,4,26),(105,4,27),(106,5,1),(107,5,2),(108,5,3),(109,5,4),(110,5,5),(111,5,6),(112,5,7),(113,5,8),(114,5,13),(115,5,14),(116,5,15),(117,5,16),(118,5,17),(119,5,18),(120,5,19),(121,5,20),(122,5,21),(123,5,22),(124,5,23),(125,5,24),(126,5,25),(127,5,26),(128,5,27),(129,6,1),(130,6,2),(131,6,3),(132,6,4),(133,6,5),(134,6,6),(135,6,7),(136,6,8),(137,6,13),(138,6,14),(139,6,15),(140,6,16),(141,6,19),(142,6,20),(143,6,21),(144,6,23),(145,6,26),(146,6,27),(147,6,29),(148,7,1),(149,7,2),(150,7,3),(151,7,4),(152,7,5),(153,7,6),(154,7,7),(155,7,8),(156,7,13),(157,7,14),(158,7,15),(159,7,16),(160,7,17),(161,7,18),(162,7,19),(163,7,20),(164,7,21),(165,7,22),(166,7,23),(167,7,24),(168,7,25),(169,7,26),(170,7,27),(171,7,28),(172,7,29),(173,7,30),(174,7,31),(175,7,32),(176,7,33),(177,7,34),(178,7,35),(179,7,36),(180,7,37),(181,7,38),(182,7,39),(183,7,40),(184,7,41),(185,7,42),(186,7,43),(187,7,44),(188,7,45),(189,7,46),(190,7,47),(191,7,48),(192,8,1),(193,8,2),(194,8,3),(195,8,4),(196,8,5),(197,8,6),(198,8,7),(199,8,8),(200,8,9),(201,8,10),(202,8,11),(203,8,12),(204,8,13),(205,8,14),(206,8,15),(207,8,16),(208,8,17),(209,8,18),(210,8,19),(211,8,20),(212,8,21),(213,8,22),(214,8,23),(215,8,24),(216,8,25),(217,8,26),(218,8,27),(219,8,28),(220,8,29),(221,8,30),(222,8,31),(223,8,32),(224,8,33),(225,8,34),(226,8,35),(227,8,36),(228,8,37),(229,8,38),(230,8,39),(231,8,40),(232,8,41),(233,8,42),(234,8,43),(235,8,44),(236,8,45),(237,8,46),(238,8,47),(239,8,48),(240,9,14),(241,9,15),(242,9,25),(243,9,26),(244,9,27),(245,10,14),(246,10,15),(247,10,25),(248,10,26),(249,10,27),(250,11,14),(251,11,15),(252,11,16),(253,11,17),(254,11,18),(255,11,19),(256,11,20),(257,11,21),(258,11,22),(259,11,23),(260,11,24),(261,11,25),(262,11,26),(263,11,27),(264,11,30),(265,12,1),(266,12,2),(267,12,3),(268,12,4),(269,12,5),(270,12,6),(271,12,7),(272,12,8),(273,12,9),(274,12,10),(275,12,11),(276,12,12),(277,12,13),(278,12,14),(279,12,15),(280,12,16),(281,12,17),(282,12,18),(283,12,19),(284,12,20),(285,12,21),(286,12,22),(287,12,23),(288,12,24),(289,12,25),(290,12,26),(291,12,27),(292,12,28),(293,12,29),(294,12,30),(295,12,31),(296,12,32),(297,12,33),(298,12,34),(299,12,35),(300,12,36),(301,12,37),(302,12,38),(303,12,39),(304,12,40),(305,12,41),(306,12,42),(307,12,43),(308,12,44),(309,12,45),(310,12,46),(311,12,47),(312,12,48),(313,13,1),(314,13,2),(315,13,3),(316,13,14),(317,13,15),(318,13,16),(319,13,17),(320,13,18),(321,13,19),(322,13,20),(323,13,21),(324,13,22),(325,13,23),(326,13,24),(327,13,25),(328,13,26),(329,13,27),(330,13,30),(331,13,31),(332,13,33),(333,13,47);
/*!40000 ALTER TABLE `equipoxclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipoxsubraza`
--

DROP TABLE IF EXISTS `equipoxsubraza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipoxsubraza` (
  `id_equipoxsubraza` int NOT NULL AUTO_INCREMENT,
  `id_subraza` int NOT NULL,
  `id_equipo` int NOT NULL,
  PRIMARY KEY (`id_equipoxsubraza`),
  KEY `id_subraza` (`id_subraza`),
  KEY `id_equipo` (`id_equipo`),
  CONSTRAINT `equipoxsubraza_ibfk_1` FOREIGN KEY (`id_subraza`) REFERENCES `subraza` (`id_subraza`),
  CONSTRAINT `equipoxsubraza_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipoxsubraza`
--

LOCK TABLES `equipoxsubraza` WRITE;
/*!40000 ALTER TABLE `equipoxsubraza` DISABLE KEYS */;
INSERT INTO `equipoxsubraza` VALUES (1,1,18),(2,1,22),(3,1,37),(4,1,41),(5,2,1),(6,2,2),(7,2,3),(8,2,4),(9,2,5),(10,2,6),(11,2,7),(12,2,8),(13,2,18),(14,2,22),(15,2,37),(16,2,41),(17,3,24),(18,3,30),(19,3,31),(20,3,46),(21,4,24),(22,4,30),(23,4,31),(24,4,46),(25,5,30),(26,5,33),(27,5,47),(28,7,21),(29,7,25),(30,7,45);
/*!40000 ALTER TABLE `equipoxsubraza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experto`
--

DROP TABLE IF EXISTS `experto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experto` (
  `id_exp` int NOT NULL AUTO_INCREMENT,
  `nombre_exp` varchar(50) NOT NULL,
  `URL` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id_exp` (`id_exp`),
  UNIQUE KEY `nombre_exp` (`nombre_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experto`
--

LOCK TABLES `experto` WRITE;
/*!40000 ALTER TABLE `experto` DISABLE KEYS */;
INSERT INTO `experto` VALUES (1,'Dungeon Dudes','https://www.youtube.com/channel/UCQDKouT6G_6P1eBIfkTkC-w'),(2,'Now You Roll','https://www.nowyouroll.com/'),(3,'RPG Bot','https://rpgbot.net/'),(4,'Critical Role','https://critrole.com/'),(5,'Wargamer','https://www.wargamer.com/');
/*!40000 ALTER TABLE `experto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `habilid_comunes_clase`
--

DROP TABLE IF EXISTS `habilid_comunes_clase`;
/*!50001 DROP VIEW IF EXISTS `habilid_comunes_clase`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `habilid_comunes_clase` AS SELECT 
 1 AS `id_habilid`,
 1 AS `nombre_habilid`,
 1 AS `cant_habilidxclase`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `habilidad`
--

DROP TABLE IF EXISTS `habilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidad` (
  `id_habilid` int NOT NULL AUTO_INCREMENT,
  `nombre_habilid` varchar(20) NOT NULL,
  `id_caract` varchar(3) NOT NULL,
  PRIMARY KEY (`id_habilid`),
  KEY `id_caract` (`id_caract`),
  CONSTRAINT `habilidad_ibfk_1` FOREIGN KEY (`id_caract`) REFERENCES `caracteristica` (`id_caract`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidad`
--

LOCK TABLES `habilidad` WRITE;
/*!40000 ALTER TABLE `habilidad` DISABLE KEYS */;
INSERT INTO `habilidad` VALUES (1,'Atletismo','STR'),(2,'Acrobacia','DEX'),(3,'Juego de Manos','DEX'),(4,'Sigilo','DEX'),(5,'Arcana','INT'),(6,'Historia','INT'),(7,'Investigación','INT'),(8,'Naturaleza','INT'),(9,'Religión','INT'),(10,'Medicina','WIS'),(11,'Percepción','WIS'),(12,'Perspicacia','WIS'),(13,'Supervivencia','WIS'),(14,'Trato con Animales','WIS'),(15,'Engaño','CHA'),(16,'Interpretación','CHA'),(17,'Intimidación','CHA'),(18,'Persuasión','CHA');
/*!40000 ALTER TABLE `habilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidxclase`
--

DROP TABLE IF EXISTS `habilidxclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidxclase` (
  `id_habilidxclase` int NOT NULL AUTO_INCREMENT,
  `id_clase` int NOT NULL,
  `id_habilid` int NOT NULL,
  PRIMARY KEY (`id_habilidxclase`),
  KEY `id_clase` (`id_clase`),
  KEY `id_habilid` (`id_habilid`),
  CONSTRAINT `habilidxclase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `habilidxclase_ibfk_2` FOREIGN KEY (`id_habilid`) REFERENCES `habilidad` (`id_habilid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidxclase`
--

LOCK TABLES `habilidxclase` WRITE;
/*!40000 ALTER TABLE `habilidxclase` DISABLE KEYS */;
INSERT INTO `habilidxclase` VALUES (1,1,3),(2,1,5),(3,1,6),(4,1,7),(5,1,8),(6,1,10),(7,1,11),(8,2,1),(9,2,8),(10,2,11),(11,2,13),(12,2,14),(13,2,17),(14,3,1),(15,3,2),(16,3,3),(17,3,4),(18,3,5),(19,3,6),(20,3,7),(21,3,8),(22,3,9),(23,3,10),(24,3,11),(25,3,12),(26,3,13),(27,3,14),(28,3,15),(29,3,16),(30,3,17),(31,3,18),(32,4,5),(33,4,6),(34,4,7),(35,4,8),(36,4,9),(37,4,15),(38,4,17),(39,5,6),(40,5,9),(41,5,10),(42,5,12),(43,5,18),(44,6,5),(45,6,8),(46,6,9),(47,6,10),(48,6,11),(49,6,12),(50,6,14),(51,7,1),(52,7,4),(53,7,7),(54,7,8),(55,7,11),(56,7,12),(57,7,13),(58,7,14),(59,8,1),(60,8,2),(61,8,6),(62,8,11),(63,8,12),(64,8,13),(65,8,14),(66,8,17),(67,9,5),(68,9,9),(69,9,12),(70,9,15),(71,9,17),(72,9,18),(73,10,5),(74,10,6),(75,10,7),(76,10,9),(77,10,10),(78,10,12),(79,11,1),(80,11,2),(81,11,4),(82,11,6),(83,11,9),(84,11,12),(85,12,1),(86,12,9),(87,12,10),(88,12,12),(89,12,17),(90,12,18),(91,13,1),(92,13,2),(93,13,3),(94,13,4),(95,13,7),(96,13,11),(97,13,12),(98,13,15),(99,13,16),(100,13,17);
/*!40000 ALTER TABLE `habilidxclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidxtrasf`
--

DROP TABLE IF EXISTS `habilidxtrasf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilidxtrasf` (
  `id_habilidxtrasf` int NOT NULL AUTO_INCREMENT,
  `id_trasfondo` int NOT NULL,
  `id_habilid` int NOT NULL,
  PRIMARY KEY (`id_habilidxtrasf`),
  KEY `id_trasfondo` (`id_trasfondo`),
  KEY `id_habilid` (`id_habilid`),
  CONSTRAINT `habilidxtrasf_ibfk_1` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondo` (`id_trasfondo`),
  CONSTRAINT `habilidxtrasf_ibfk_2` FOREIGN KEY (`id_habilid`) REFERENCES `habilidad` (`id_habilid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidxtrasf`
--

LOCK TABLES `habilidxtrasf` WRITE;
/*!40000 ALTER TABLE `habilidxtrasf` DISABLE KEYS */;
INSERT INTO `habilidxtrasf` VALUES (1,1,12),(2,1,9),(3,2,2),(4,2,16),(5,3,12),(6,3,18),(7,4,15),(8,4,3),(9,5,15),(10,5,4),(11,6,10),(12,6,9),(13,7,5),(14,7,6),(15,8,13),(16,8,14),(17,9,3),(18,9,4),(19,10,1),(20,10,11),(21,11,6),(22,11,18),(23,12,1),(24,12,13),(25,13,1),(26,13,17);
/*!40000 ALTER TABLE `habilidxtrasf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_cant_powerbuilds`
--

DROP TABLE IF EXISTS `log_cant_powerbuilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cant_powerbuilds` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `cant_builds` int NOT NULL,
  `id_subclase` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cant_powerbuilds`
--

LOCK TABLES `log_cant_powerbuilds` WRITE;
/*!40000 ALTER TABLE `log_cant_powerbuilds` DISABLE KEYS */;
INSERT INTO `log_cant_powerbuilds` VALUES (1,1,1,'sel_ins_mod@localhost','2022-03-02 20:39:15');
/*!40000 ALTER TABLE `log_cant_powerbuilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_cant_ratings`
--

DROP TABLE IF EXISTS `log_cant_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_cant_ratings` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `cant_ratings` int NOT NULL,
  `id_exp` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_cant_ratings`
--

LOCK TABLES `log_cant_ratings` WRITE;
/*!40000 ALTER TABLE `log_cant_ratings` DISABLE KEYS */;
INSERT INTO `log_cant_ratings` VALUES (1,202,3,'root@localhost','2022-02-28 18:14:30');
/*!40000 ALTER TABLE `log_cant_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_insercion_build`
--

DROP TABLE IF EXISTS `log_insercion_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_insercion_build` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_build` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_insercion_build`
--

LOCK TABLES `log_insercion_build` WRITE;
/*!40000 ALTER TABLE `log_insercion_build` DISABLE KEYS */;
INSERT INTO `log_insercion_build` VALUES (1,18,'sel_ins_mod@localhost','2022-03-02 20:39:15');
/*!40000 ALTER TABLE `log_insercion_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_modificacion_ratingxsubclase`
--

DROP TABLE IF EXISTS `log_modificacion_ratingxsubclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_modificacion_ratingxsubclase` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_rating` int NOT NULL,
  `rating_v` int NOT NULL,
  `rating_n` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_modificacion_ratingxsubclase`
--

LOCK TABLES `log_modificacion_ratingxsubclase` WRITE;
/*!40000 ALTER TABLE `log_modificacion_ratingxsubclase` DISABLE KEYS */;
INSERT INTO `log_modificacion_ratingxsubclase` VALUES (1,196,3,4,'root@localhost','2022-03-15 19:24:46'),(2,196,4,3,'root@localhost','2022-03-15 19:25:17');
/*!40000 ALTER TABLE `log_modificacion_ratingxsubclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual`
--

DROP TABLE IF EXISTS `manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual` (
  `id_manual` varchar(3) NOT NULL,
  `nombre_manual` varchar(50) NOT NULL,
  `año` date NOT NULL,
  PRIMARY KEY (`id_manual`),
  UNIQUE KEY `nombre_manual` (`nombre_manual`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual`
--

LOCK TABLES `manual` WRITE;
/*!40000 ALTER TABLE `manual` DISABLE KEYS */;
INSERT INTO `manual` VALUES ('EGW','EXPLORER´S GUIDE TO WILDEMOUNT','2020-03-17'),('PHB','PLAYER´S HANDBOOK','2014-08-19'),('TCE','TASHA´S CAULDRON OF EVERYTHING','2020-11-17'),('XGE','XANATHAR´S GUIDE TO EVERYTHING','2017-11-15');
/*!40000 ALTER TABLE `manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `powerbuild`
--

DROP TABLE IF EXISTS `powerbuild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `powerbuild` (
  `id_build` int NOT NULL AUTO_INCREMENT,
  `id_subclase` int NOT NULL,
  `id_subraza` int NOT NULL,
  `id_trasfondo` int NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `notas` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_build`),
  KEY `id_subclase` (`id_subclase`),
  KEY `id_subraza` (`id_subraza`),
  KEY `id_trasfondo` (`id_trasfondo`),
  CONSTRAINT `powerbuild_ibfk_1` FOREIGN KEY (`id_subclase`) REFERENCES `subclase` (`id_subclase`),
  CONSTRAINT `powerbuild_ibfk_2` FOREIGN KEY (`id_subraza`) REFERENCES `subraza` (`id_subraza`),
  CONSTRAINT `powerbuild_ibfk_3` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondo` (`id_trasfondo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `powerbuild`
--

LOCK TABLES `powerbuild` WRITE;
/*!40000 ALTER TABLE `powerbuild` DISABLE KEYS */;
INSERT INTO `powerbuild` VALUES (1,3,17,7,'',''),(2,6,2,8,'',''),(3,12,18,5,'',''),(4,19,20,7,'',''),(5,22,18,7,'',''),(6,35,3,1,'',''),(7,37,4,6,'',''),(16,1,2,3,'PRUEBA','PRUEBA'),(17,6,2,3,'PRUEBA','PRUEBA'),(18,1,2,3,'PRUEBA2','PRUEBA');
/*!40000 ALTER TABLE `powerbuild` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contar_buildsxsubclase` BEFORE INSERT ON `powerbuild` FOR EACH ROW BEGIN
	SET @contar_builds = (SELECT COUNT(*) FROM powerbuild WHERE id_subclase=new.id_subclase);
	INSERT INTO log_cant_powerbuilds VALUES (NULL,@contar_builds,new.id_subclase,user(),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ins_build` AFTER INSERT ON `powerbuild` FOR EACH ROW INSERT INTO log_insercion_build VALUES (NULL,new.id_build,user(),now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `powerbuild_desc`
--

DROP TABLE IF EXISTS `powerbuild_desc`;
/*!50001 DROP VIEW IF EXISTS `powerbuild_desc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `powerbuild_desc` AS SELECT 
 1 AS `id_build`,
 1 AS `CLASE`,
 1 AS `SUBCLASE`,
 1 AS `RAZA`,
 1 AS `SUBRAZA`,
 1 AS `TRASFONDO`,
 1 AS `tag`,
 1 AS `notas`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ratingxsubclase`
--

DROP TABLE IF EXISTS `ratingxsubclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratingxsubclase` (
  `id_rating` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `id_subclase` int NOT NULL,
  `id_exp` int NOT NULL,
  PRIMARY KEY (`id_rating`),
  KEY `id_subclase` (`id_subclase`),
  KEY `id_exp` (`id_exp`),
  CONSTRAINT `ratingxsubclase_ibfk_1` FOREIGN KEY (`id_subclase`) REFERENCES `subclase` (`id_subclase`),
  CONSTRAINT `ratingxsubclase_ibfk_2` FOREIGN KEY (`id_exp`) REFERENCES `experto` (`id_exp`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingxsubclase`
--

LOCK TABLES `ratingxsubclase` WRITE;
/*!40000 ALTER TABLE `ratingxsubclase` DISABLE KEYS */;
INSERT INTO `ratingxsubclase` VALUES (1,4,1,3),(2,4,2,3),(3,5,3,3),(4,4,4,3),(5,1,5,3),(6,5,6,3),(7,2,7,3),(8,5,8,3),(9,4,9,3),(10,5,10,3),(11,4,11,3),(12,5,12,3),(13,2,13,3),(14,2,14,3),(15,4,15,3),(16,2,16,3),(17,5,17,3),(18,4,18,3),(19,5,19,3),(20,4,20,3),(21,4,21,3),(22,5,22,3),(23,2,23,3),(24,2,24,3),(25,5,25,3),(26,4,26,3),(27,2,27,3),(28,5,28,3),(29,2,29,3),(30,4,30,3),(31,5,31,3),(32,4,32,3),(33,5,33,3),(34,5,34,3),(35,5,35,3),(36,3,36,2),(37,5,37,2),(38,4,38,2),(39,3,39,2),(40,4,40,2),(41,5,41,2),(42,4,42,2),(43,3,43,2),(44,4,44,2),(45,5,45,2),(46,4,46,2),(47,4,47,2),(48,4,48,2),(49,4,49,2),(50,3,50,2),(51,4,51,2),(52,5,52,2),(53,1,53,2),(54,4,54,2),(55,5,55,2),(56,4,56,2),(57,3,57,2),(58,NULL,58,2),(59,5,59,2),(60,4,60,2),(61,5,61,2),(62,2,62,2),(63,4,63,2),(64,4,64,2),(65,3,65,2),(66,5,66,2),(67,4,67,2),(68,2,68,2),(69,3,69,2),(70,4,70,2),(71,5,71,2),(72,3,72,2),(73,3,73,2),(74,5,74,2),(75,3,75,2),(76,3,76,2),(77,4,77,2),(78,1,78,2),(79,NULL,79,2),(80,3,80,2),(81,2,81,2),(82,5,82,2),(83,4,83,2),(84,3,84,2),(85,3,85,2),(86,4,86,2),(87,4,87,2),(88,5,88,2),(89,4,89,2),(90,2,90,2),(91,4,91,2),(92,3,92,2),(93,4,93,2),(94,4,94,2),(95,4,95,2),(96,2,96,2),(97,2,97,2),(98,4,98,2),(99,4,99,2),(100,3,1,1),(101,4,2,1),(102,5,3,1),(103,4,4,1),(104,1,5,1),(105,5,6,1),(106,4,7,1),(107,4,8,1),(108,3,9,1),(109,3,10,1),(110,2,11,1),(111,5,12,1),(112,3,13,1),(113,2,14,1),(114,3,15,1),(115,2,16,1),(116,5,17,1),(117,3,18,1),(118,5,19,1),(119,3,20,1),(120,4,21,1),(121,5,22,1),(122,3,23,1),(123,4,24,1),(124,5,25,1),(125,3,26,1),(126,2,27,1),(127,4,28,1),(128,3,29,1),(129,5,30,1),(130,5,31,1),(131,4,32,1),(132,3,33,1),(133,5,34,1),(134,5,35,1),(135,3,36,1),(136,5,37,1),(137,4,38,1),(138,3,39,1),(139,3,40,1),(140,4,41,1),(141,4,42,1),(142,2,43,1),(143,1,44,1),(144,5,45,1),(145,4,46,1),(146,2,47,1),(147,3,48,1),(148,4,49,1),(149,3,50,1),(150,5,51,1),(151,4,52,1),(152,2,53,1),(153,4,54,1),(154,3,55,1),(155,3,56,1),(156,5,57,1),(157,5,58,1),(158,3,59,1),(159,4,60,1),(160,5,61,1),(161,2,62,1),(162,4,63,1),(163,5,64,1),(164,5,65,1),(165,4,66,1),(166,5,67,1),(167,3,68,1),(168,5,69,1),(169,3,70,1),(170,4,71,1),(171,2,72,1),(172,2,73,1),(173,4,74,1),(174,4,75,1),(175,4,76,1),(176,4,77,1),(177,1,78,1),(178,1,79,1),(179,4,80,1),(180,2,81,1),(181,4,82,1),(182,3,83,1),(183,3,84,1),(184,4,85,1),(185,5,86,1),(186,4,87,1),(187,4,88,1),(188,3,89,1),(189,4,90,1),(190,3,91,1),(191,2,92,1),(192,5,93,1),(193,4,94,1),(194,5,95,1),(195,2,96,1),(196,3,97,1),(197,3,98,1),(198,5,99,1),(199,4,36,3),(200,5,37,3);
/*!40000 ALTER TABLE `ratingxsubclase` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `contar_ratingxsubclase` BEFORE INSERT ON `ratingxsubclase` FOR EACH ROW BEGIN
	SET @contar_ratings = (SELECT COUNT(*) FROM ratingxsubclase);
	INSERT INTO log_cant_ratings VALUES (NULL,@contar_ratings,new.id_exp,user(),now());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `upd_rating` AFTER UPDATE ON `ratingxsubclase` FOR EACH ROW INSERT INTO log_modificacion_ratingxsubclase VALUES (NULL,old.id_rating,old.rating,new.rating,user(),now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `raza`
--

DROP TABLE IF EXISTS `raza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raza` (
  `id_raza` int NOT NULL AUTO_INCREMENT,
  `nombre_raza` varchar(15) NOT NULL,
  `velocidad_base` int NOT NULL,
  `tamaño` char(1) NOT NULL,
  `edad` int DEFAULT NULL,
  PRIMARY KEY (`id_raza`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raza`
--

LOCK TABLES `raza` WRITE;
/*!40000 ALTER TABLE `raza` DISABLE KEYS */;
INSERT INTO `raza` VALUES (1,'ENANO',25,'M',350),(2,'ELFO',30,'M',750),(3,'MEDIANO',25,'S',250),(4,'HUMANO',30,'M',80),(5,'DRACONIDO',30,'M',80),(6,'GNOMO',25,'S',500),(7,'SEMIELFO',30,'M',180),(8,'SEMIORCO',30,'M',75),(9,'TIEFLING',30,'M',80);
/*!40000 ALTER TABLE `raza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subclase`
--

DROP TABLE IF EXISTS `subclase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subclase` (
  `id_subclase` int NOT NULL AUTO_INCREMENT,
  `nombre_subclase` varchar(50) NOT NULL,
  `subclase_conjura` tinyint(1) DEFAULT NULL,
  `id_clase` int NOT NULL,
  `id_manual` varchar(3) NOT NULL,
  PRIMARY KEY (`id_subclase`),
  KEY `id_clase` (`id_clase`),
  KEY `id_manual` (`id_manual`),
  CONSTRAINT `subclase_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `subclase_ibfk_2` FOREIGN KEY (`id_manual`) REFERENCES `manual` (`id_manual`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subclase`
--

LOCK TABLES `subclase` WRITE;
/*!40000 ALTER TABLE `subclase` DISABLE KEYS */;
INSERT INTO `subclase` VALUES (1,'Alquimista',1,1,'TCE'),(2,'Artillero',1,1,'TCE'),(3,'Armero',1,1,'TCE'),(4,'Herrero de Batalla',1,1,'TCE'),(5,'Senda del Berserker',0,2,'PHB'),(6,'Senda del Totémico',0,2,'PHB'),(7,'Senda del Zelote',0,2,'XGE'),(8,'Senda de Guardián Ancestral',0,2,'XGE'),(9,'Senda del Heraldo de la Tormenta',0,2,'XGE'),(10,'Senda de la Bestia',0,2,'TCE'),(11,'Senda de la Magia Salvaje',0,2,'TCE'),(12,'Colegio del Conocimiento',1,3,'PHB'),(13,'Colegio del Valor',1,3,'PHB'),(14,'Colegio de las Espadas',1,3,'XGE'),(15,'Colegio del Glamour',1,3,'XGE'),(16,'Colegio de los Susurros',1,3,'XGE'),(17,'Colegio de la Elocuencia',1,3,'TCE'),(18,'Colegio de la Creación',1,3,'TCE'),(19,'El Infernal',1,4,'PHB'),(20,'El Primigenio',1,4,'PHB'),(21,'El Señor Feérico',1,4,'PHB'),(22,'El Filo Maldito',1,4,'XGE'),(23,'El Celestial',1,4,'XGE'),(24,'El Abismal',1,4,'TCE'),(25,'El Genio',1,4,'TCE'),(26,'Dominio del Engaño',1,5,'PHB'),(27,'Dominio de la Guerra',1,5,'PHB'),(28,'Dominio de la Luz',1,5,'PHB'),(29,'Dominio de la Naturaleza',1,5,'PHB'),(30,'Dominio de la Tempestad',1,5,'PHB'),(31,'Dominio de la Forja',1,5,'XGE'),(32,'Dominio de la Sepultura',1,5,'XGE'),(33,'Dominio del Orden',1,5,'TCE'),(34,'Dominio de la Paz',1,5,'TCE'),(35,'Dominio del Crepúsculo',1,5,'TCE'),(36,'Circulo de la Tierra',1,6,'PHB'),(37,'Circulo de la Luna',1,6,'PHB'),(38,'Círculo de Pastor',1,6,'XGE'),(39,'Círculo de los Sueños',1,6,'XGE'),(40,'Círculo de las Esporas',1,6,'TCE'),(41,'Círculo de las Estrellas',1,6,'TCE'),(42,'Círculo del Fuego Salvaje',1,6,'TCE'),(43,'Cazador',1,7,'PHB'),(44,'Señor de las Bestias',1,7,'PHB'),(45,'Acechador de la Penumbra',1,7,'XGE'),(46,'Caminante del Horizonte',1,7,'XGE'),(47,'Cazador de Monstruos',1,7,'XGE'),(48,'Errante Feérico',1,7,'TCE'),(49,'Guardián del Enjambre',1,7,'TCE'),(50,'Campeón',0,8,'PHB'),(51,'Maestro del Combate',0,8,'PHB'),(52,'Caballero Arcano',1,8,'PHB'),(53,'Arquero Arcano',0,8,'XGE'),(54,'Caballero',0,8,'XGE'),(55,'Samurái',0,8,'XGE'),(56,'Guerrero Psiónico',0,8,'TCE'),(57,'Caballero Rúnico',0,8,'TCE'),(58,'Caballero del Eco',0,8,'EGW'),(59,'Linaje Dracónico',1,9,'PHB'),(60,'Magia Salvaje',1,9,'PHB'),(61,'Alma Divina',1,9,'XGE'),(62,'Magia de la Tormenta',1,9,'XGE'),(63,'Magia de las Sombras',1,9,'XGE'),(64,'Mente Aberrante',1,9,'TCE'),(65,'Alma de Reloj',1,9,'TCE'),(66,'Abjuración',1,10,'PHB'),(67,'Adivinación',1,10,'PHB'),(68,'Conjuración',1,10,'PHB'),(69,'Encantamiento',1,10,'PHB'),(70,'Evocación',1,10,'PHB'),(71,'Ilusionismo',1,10,'PHB'),(72,'Transmutación',1,10,'PHB'),(73,'Magia de Guerra',1,10,'XGE'),(74,'Hoja Cantante',1,10,'TCE'),(75,'Orden de los Escribas',1,10,'TCE'),(76,'Camino de la Mano Abierta',0,11,'PHB'),(77,'Camino de la Sombra',0,11,'PHB'),(78,'Camino de los Elementos',0,11,'PHB'),(79,'Camino del Alma Solar',0,11,'XGE'),(80,'Camino del Kensei',0,11,'XGE'),(81,'Camino del Maestro Borracho',0,11,'XGE'),(82,'Camino de la Piedad',0,11,'TCE'),(83,'Camino del Yo Astral',0,11,'TCE'),(84,'Juramento de Entrega',1,12,'PHB'),(85,'Juramento de los Antiguos',1,12,'PHB'),(86,'Juramento de Venganza',1,12,'PHB'),(87,'Juramento de Conquista',1,12,'XGE'),(88,'Juramento de Redención',1,12,'XGE'),(89,'Juramento de Gloria',1,12,'TCE'),(90,'Juramento de Vigilancia',1,12,'TCE'),(91,'Ladrón',0,13,'PHB'),(92,'Asesino',0,13,'PHB'),(93,'Embaucador Arcano',1,13,'PHB'),(94,'Explorador',0,13,'XGE'),(95,'Espadachín',0,13,'XGE'),(96,'Inquisitivo',0,13,'XGE'),(97,'Mente Maestra',0,13,'XGE'),(98,'Fantasma',0,13,'TCE'),(99,'Cuchillo del Alma',0,13,'TCE');
/*!40000 ALTER TABLE `subclase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `subclases_conjuradoras`
--

DROP TABLE IF EXISTS `subclases_conjuradoras`;
/*!50001 DROP VIEW IF EXISTS `subclases_conjuradoras`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subclases_conjuradoras` AS SELECT 
 1 AS `nombre_subclase`,
 1 AS `nombre_clase`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `subraza`
--

DROP TABLE IF EXISTS `subraza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subraza` (
  `id_subraza` int NOT NULL AUTO_INCREMENT,
  `nombre_subraza` varchar(50) NOT NULL,
  `vision_noct` int DEFAULT NULL,
  `id_raza` int NOT NULL,
  `id_manual` varchar(3) NOT NULL,
  PRIMARY KEY (`id_subraza`),
  KEY `id_raza` (`id_raza`),
  KEY `id_manual` (`id_manual`),
  CONSTRAINT `subraza_ibfk_1` FOREIGN KEY (`id_raza`) REFERENCES `raza` (`id_raza`),
  CONSTRAINT `subraza_ibfk_2` FOREIGN KEY (`id_manual`) REFERENCES `manual` (`id_manual`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subraza`
--

LOCK TABLES `subraza` WRITE;
/*!40000 ALTER TABLE `subraza` DISABLE KEYS */;
INSERT INTO `subraza` VALUES (1,'Enano de las Colinas',60,1,'PHB'),(2,'Enano de las Montañas',60,1,'PHB'),(3,'Alto Elfo',60,2,'PHB'),(4,'Elfo de los Bosques',60,2,'PHB'),(5,'Elfo Oscuro',120,2,'PHB'),(6,'Elfo Pálido',60,2,'EGW'),(7,'Elfo del Mar',60,2,'EGW'),(8,'Piesligeros',0,3,'PHB'),(9,'Fornido',0,3,'PHB'),(10,'Lotusden',0,3,'EGW'),(11,'Humano',0,4,'PHB'),(12,'Variante',0,4,'PHB'),(13,'Dracónido',0,5,'PHB'),(14,'Dragonborn',60,5,'EGW'),(15,'Ravenite',60,5,'EGW'),(16,'Gnomo de los Bosques',60,6,'PHB'),(17,'Gnomo de las Rocas',60,6,'PHB'),(18,'Semielfo',60,7,'PHB'),(19,'Semiorco',60,8,'PHB'),(20,'Tiefling',60,9,'PHB');
/*!40000 ALTER TABLE `subraza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_10_subclases`
--

DROP TABLE IF EXISTS `top_10_subclases`;
/*!50001 DROP VIEW IF EXISTS `top_10_subclases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_10_subclases` AS SELECT 
 1 AS `CLASE`,
 1 AS `SUBCLASE`,
 1 AS `Rating_Promedio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trasfondo`
--

DROP TABLE IF EXISTS `trasfondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trasfondo` (
  `id_trasfondo` int NOT NULL AUTO_INCREMENT,
  `nombre_trasfondo` varchar(20) NOT NULL,
  PRIMARY KEY (`id_trasfondo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasfondo`
--

LOCK TABLES `trasfondo` WRITE;
/*!40000 ALTER TABLE `trasfondo` DISABLE KEYS */;
INSERT INTO `trasfondo` VALUES (1,'Acólito'),(2,'Animador'),(3,'Artesano Gremial'),(4,'Charlatán'),(5,'Criminal'),(6,'Ermitaño'),(7,'Erudito'),(8,'Héroe del Pueblo'),(9,'Huérfano'),(10,'Marinero'),(11,'Noble'),(12,'Salvaje'),(13,'Soldado');
/*!40000 ALTER TABLE `trasfondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dnd_powerbuilds'
--

--
-- Dumping routines for database 'dnd_powerbuilds'
--
/*!50003 DROP FUNCTION IF EXISTS `get_clase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_clase`(id_clasexsubclase int) RETURNS varchar(10) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE clasexsubclase VARCHAR(10);
    
    SELECT nombre_clase INTO clasexsubclase
    FROM clase
    WHERE id_clase = id_clasexsubclase;
    
    RETURN clasexsubclase;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_raza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_raza`(id_razaxsubraza int) RETURNS varchar(15) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE razaxsubraza VARCHAR(15);
    
    SELECT nombre_raza INTO razaxsubraza
    FROM raza
    WHERE id_raza = id_razaxsubraza;
    
    RETURN razaxsubraza;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `prom_rating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `prom_rating`(subclase int) RETURNS float
    DETERMINISTIC
BEGIN 
	DECLARE promedio FLOAT;
    
	SELECT AVG(rating) INTO promedio 
    FROM ratingxsubclase
	WHERE id_subclase = subclase;
    
    RETURN promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ins_del_powerbuilds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_del_powerbuilds`(IN accion VARCHAR(8),id INT,subclase INT, subraza INT, trasfondo INT, tag VARCHAR(50), notas VARCHAR(200))
BEGIN
	IF accion = 'ELIMINAR' THEN
	BEGIN
		DELETE FROM powerbuild WHERE id_build=id; 
	END;
	ELSEIF accion = 'INSERTAR' THEN
    BEGIN
		INSERT INTO powerbuild VALUES (id,subclase,subraza,trasfondo,tag,notas);
	END;
	ELSE
		SELECT 'Ingrese instrucción "INSERTAR" o "ELIMINAR"' AS ERROR;
	END IF;
    SELECT * FROM powerbuild ORDER BY id_build DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `orden_conjuros_mas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `orden_conjuros_mas`(IN campo VARCHAR (15), IN tipo_orden VARCHAR(4))
BEGIN
	IF campo <> '' AND tipo_orden = 'ASC' THEN
		SET @ordenar = concat('ORDER BY ', campo);
	ELSEIF campo <> '' AND tipo_orden = 'DESC' THEN
		SET @ordenar = concat('ORDER BY ', campo, ' DESC');
	ELSEIF campo <> '' AND tipo_orden NOT IN ('ASC','DESC') THEN
		SET @ordenar = 'Invalido';
		SELECT 'Debe indicarse orden "ASC" o "DESC"' AS ERROR;
    ELSE
		SET @ordenar = '';
	END IF;	    
    	IF @ordenar <> 'Inválido' THEN
		SET @clausula = concat('SELECT * FROM conjuros_mas ', @ordenar);
		PREPARE ejecucion FROM @clausula;
		EXECUTE ejecucion;
		DEALLOCATE PREPARE ejecucion;
	END IF;	    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `conjuros_addxsubclase`
--

/*!50001 DROP VIEW IF EXISTS `conjuros_addxsubclase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `conjuros_addxsubclase` AS select `get_clase`(`subclase`.`id_clase`) AS `get_clase(id_clase)`,`subclase`.`nombre_subclase` AS `nombre_subclase`,`conjuros_mas`.`nombre_conjuro` AS `nombre_conjuro`,`conjuros_mas`.`nivel` AS `nivel` from ((`conjuros_add` join `conjuros_mas` on((`conjuros_add`.`id_conjuro` = `conjuros_mas`.`id_conjuro`))) join `subclase` on((`conjuros_add`.`id_subclase` = `subclase`.`id_subclase`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `habilid_comunes_clase`
--

/*!50001 DROP VIEW IF EXISTS `habilid_comunes_clase`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `habilid_comunes_clase` AS select `habilidad`.`id_habilid` AS `id_habilid`,`habilidad`.`nombre_habilid` AS `nombre_habilid`,count(0) AS `cant_habilidxclase` from (`habilidxclase` join `habilidad` on((`habilidxclase`.`id_habilid` = `habilidad`.`id_habilid`))) group by `habilidad`.`id_habilid` order by `cant_habilidxclase` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `powerbuild_desc`
--

/*!50001 DROP VIEW IF EXISTS `powerbuild_desc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `powerbuild_desc` AS select `powerbuild`.`id_build` AS `id_build`,`get_clase`(`subclase`.`id_clase`) AS `CLASE`,`subclase`.`nombre_subclase` AS `SUBCLASE`,`get_raza`(`subraza`.`id_raza`) AS `RAZA`,`subraza`.`nombre_subraza` AS `SUBRAZA`,`trasfondo`.`nombre_trasfondo` AS `TRASFONDO`,`powerbuild`.`tag` AS `tag`,`powerbuild`.`notas` AS `notas` from (((`powerbuild` join `subclase` on((`powerbuild`.`id_subclase` = `subclase`.`id_subclase`))) join `subraza` on((`powerbuild`.`id_subraza` = `subraza`.`id_subraza`))) join `trasfondo` on((`powerbuild`.`id_trasfondo` = `trasfondo`.`id_trasfondo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subclases_conjuradoras`
--

/*!50001 DROP VIEW IF EXISTS `subclases_conjuradoras`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subclases_conjuradoras` AS select `subclase`.`nombre_subclase` AS `nombre_subclase`,`clase`.`nombre_clase` AS `nombre_clase` from (`subclase` join `clase` on((`subclase`.`id_clase` = `clase`.`id_clase`))) where (`subclase`.`subclase_conjura` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_subclases`
--

/*!50001 DROP VIEW IF EXISTS `top_10_subclases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_subclases` AS select `get_clase`(`subclase`.`id_clase`) AS `CLASE`,`subclase`.`nombre_subclase` AS `SUBCLASE`,`prom_rating`(`ratingxsubclase`.`id_subclase`) AS `Rating_Promedio` from (`ratingxsubclase` join `subclase` on((`ratingxsubclase`.`id_subclase` = `subclase`.`id_subclase`))) group by `subclase`.`id_subclase` order by `Rating_Promedio` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-05 22:14:42
