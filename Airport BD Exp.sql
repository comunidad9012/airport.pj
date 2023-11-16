-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: aeropuerto
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
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo_iata` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
INSERT INTO `aerolinea` VALUES (1,'American Airlines','AA'),(2,'Delta Air Lines','DL'),(3,'United Airlines','UA'),(4,'Lufthansa','LH'),(5,'Emirates','EK'),(6,'British Airways','BA'),(7,'Air France','AF'),(8,'Qantas','QF'),(9,'Singapore Airlines','SQ'),(10,'Cathay Pacific','CX');
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `codigo_iata` varchar(50) NOT NULL,
  `codigo_icao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES (1,'Star Airport','Londres','Reino Unido','LHR','EGLL'),(2,'París Louvre Airport','París','Francia','CDG','LFPG'),(3,'Tokio Rising Sun Airport','Tokio','Japón','NRT','RJAA'),(4,'Sídney Harbor Airfield','Sídney','Australia','SYD','YSSY'),(5,'Roma Eternal City Terminal','Roma','Italia','FCO','LIRF'),(6,'Pekín Great Wall Aeroport','Pekín','China','PEK','ZBAA'),(7,'Aeropuerto Madrid Solstice','Madrid','España','MAD','LEMD'),(8,'Los Ángeles LAX Central Airport','Los Ángeles','Estados Unidos','LAX','KLAX'),(9,'Toronto Maple Leaf Terminal','Toronto','Canadá','YYZ','CYYZ'),(10,'Copenhague Nordic Gateway','Copenhague','Dinamarca','CPH','EKCH');
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_icao` int NOT NULL,
  `matricula` int NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `capacidad_pasajeros` int NOT NULL,
  `estado_actual` varchar(50) NOT NULL,
  `ano_fabricacion` int NOT NULL,
  `piloto` int NOT NULL,
  `azafata` int NOT NULL,
  `tecnico_encargado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piloto` (`piloto`),
  KEY `azafata` (`azafata`),
  KEY `tecnico_encargado` (`tecnico_encargado`),
  CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`piloto`) REFERENCES `pilotos` (`id`),
  CONSTRAINT `avion_ibfk_2` FOREIGN KEY (`azafata`) REFERENCES `azafatas` (`id`),
  CONSTRAINT `avion_ibfk_3` FOREIGN KEY (`tecnico_encargado`) REFERENCES `tecnicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,54321,98765,'Airbus A320',180,'En servicio',2016,2,4,3),(2,67890,54321,'Boeing 787',240,'En reparación',2018,4,6,5),(3,43210,76543,'Embraer E190',110,'En servicio',2017,3,2,6),(4,98765,32109,'Airbus A350',280,'En mantenimiento',2019,1,3,5),(5,76543,89012,'Boeing 747',380,'En servicio',2015,5,1,4),(6,10987,54321,'Airbus A380',560,'En reparación',2017,2,6,1),(7,54321,76543,'Boeing 777',300,'En servicio',2014,6,5,2),(8,89012,43210,'Embraer E170',90,'En servicio',2016,3,2,4),(9,76543,54321,'Airbus A330',260,'En mantenimiento',2018,1,4,5),(10,32109,10987,'Boeing 737',150,'En servicio',2017,4,1,3),(11,12345,67890,'Airbus A320',180,'En servicio',2015,2,3,4),(12,23456,78901,'Boeing 787',240,'En reparación',2019,4,5,6),(13,34567,89012,'Embraer E190',110,'En servicio',2018,3,6,2),(14,45678,90123,'Airbus A350',280,'En mantenimiento',2016,1,5,3),(15,56789,12345,'Boeing 747',380,'En servicio',2017,5,4,1),(16,67890,23456,'Airbus A380',560,'En reparación',2014,2,1,6),(17,78901,34567,'Boeing 777',300,'En servicio',2016,6,2,5),(18,89012,45678,'Embraer E170',90,'En servicio',2017,3,4,2),(19,90123,56789,'Airbus A330',260,'En mantenimiento',2018,1,5,4),(20,10123,67890,'Boeing 737',150,'En servicio',2015,4,3,1),(21,11111,22222,'Airbus A320',180,'En servicio',2016,3,6,5),(22,12121,33333,'Boeing 787',240,'En reparación',2018,2,1,4),(23,13131,44444,'Embraer E190',110,'En servicio',2019,5,6,3),(24,14141,55555,'Airbus A350',280,'En mantenimiento',2017,6,2,1),(25,15151,66666,'Boeing 747',380,'En servicio',2014,4,1,3),(26,16161,77777,'Airbus A380',560,'En reparación',2016,1,5,2),(27,17171,88888,'Boeing 777',300,'En servicio',2017,3,2,6),(28,18181,99999,'Embraer E170',90,'En servicio',2015,6,2,4),(29,19191,10101,'Airbus A330',260,'En mantenimiento',2016,2,1,5),(30,20202,11111,'Boeing 737',150,'En servicio',2018,4,3,5),(31,21212,12121,'Airbus A320',180,'En servicio',2017,5,6,4),(32,22222,13131,'Boeing 787',240,'En reparación',2015,3,4,6),(33,23232,14141,'Embraer E190',110,'En servicio',2016,2,3,5),(34,24242,15151,'Airbus A350',280,'En mantenimiento',2019,6,4,1),(35,25252,16161,'Boeing 747',380,'En servicio',2014,4,1,3),(36,26262,17171,'Airbus A380',560,'En reparación',2016,1,5,2),(37,27272,18181,'Boeing 777',300,'En servicio',2017,3,2,6),(38,28282,19191,'Embraer E170',90,'En servicio',2015,6,2,4),(39,29292,20202,'Airbus A330',260,'En mantenimiento',2017,6,3,1),(40,30303,21212,'Boeing 737',150,'En servicio',2016,2,1,5),(41,31313,22222,'Airbus A320',180,'En servicio',2015,1,3,4),(42,32323,23232,'Boeing 787',240,'En reparación',2019,3,5,6),(43,33333,24242,'Embraer E190',110,'En servicio',2018,4,6,2),(44,34343,25252,'Airbus A350',280,'En mantenimiento',2017,5,3,1),(45,35353,26262,'Boeing 747',380,'En servicio',2016,1,6,5),(46,36363,27272,'Airbus A380',560,'En reparación',2015,6,4,3),(47,37373,28282,'Boeing 777',300,'En servicio',2014,2,3,1),(48,38383,29292,'Embraer E170',90,'En servicio',2017,4,5,6),(49,39393,30303,'Airbus A330',260,'En mantenimiento',2018,3,1,5),(50,40404,31313,'Boeing 737',150,'En servicio',2016,5,4,2);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `azafatas`
--

DROP TABLE IF EXISTS `azafatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `azafatas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `aerolinea_en_la_que_trabaja` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aerolinea_en_la_que_trabaja` (`aerolinea_en_la_que_trabaja`),
  CONSTRAINT `azafatas_ibfk_1` FOREIGN KEY (`aerolinea_en_la_que_trabaja`) REFERENCES `aerolinea` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azafatas`
--

LOCK TABLES `azafatas` WRITE;
/*!40000 ALTER TABLE `azafatas` DISABLE KEYS */;
INSERT INTO `azafatas` VALUES (1,'Marina','Gómez',32,3012345,'Femenino',10),(2,'Alejandro','López',45,25023456,'Masculino',8),(3,'Claudia','Fernández',28,29034567,'Femenino',6),(4,'Andrés','Martínez',39,39045678,'Masculino',3),(5,'Isabel','Pérez',29,30056789,'Femenino',2),(6,'Roberto','Díaz',37,31067890,'Masculino',1),(7,'Julia','Sánchez',26,40078901,'Femenino',3),(8,'Luis','Ramírez',44,24089012,'Masculino',9),(9,'Paula','García',31,31090123,'Femenino',5),(10,'Javier','Torres',40,29101234,'Masculino',4);
/*!40000 ALTER TABLE `azafatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajeros`
--

DROP TABLE IF EXISTS `pasajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajeros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `vuelo` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vuelo` (`vuelo`),
  CONSTRAINT `pasajeros_ibfk_1` FOREIGN KEY (`vuelo`) REFERENCES `vuelos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajeros`
--

LOCK TABLES `pasajeros` WRITE;
/*!40000 ALTER TABLE `pasajeros` DISABLE KEYS */;
INSERT INTO `pasajeros` VALUES (1,'Gabriela','Hernández',29,34012345,'Femenino',8),(2,'Andrés','Gómez',38,29023456,'Masculino',4),(3,'Isabel','Pérez',26,36034567,'Femenino',6),(4,'Miguel Ángel','Fernández',35,25045678,'Masculino',7),(5,'Valeria','López',31,32056789,'Femenino',2),(6,'Carlos Alberto','Sánchez',45,19067890,'Masculino',1),(7,'Ana María','Torres',33,34078901,'Femenino',3),(8,'Santiago','Martínez',42,17089012,'Masculino',6),(9,'Lucía','Ramírez',30,30090123,'Femenino',9),(10,'Juan Carlos','García',37,27001234,'Masculino',10),(11,'Gabriel','González',33,31012345,'Masculino',23),(12,'María','Hernández',29,29023456,'Femenino',45),(13,'Javier','Pérez',37,37034567,'Masculino',1),(14,'Luisa','Fernández',45,45045678,'Femenino',36),(15,'Andrés','López',28,28056789,'Masculino',12),(16,'Sara','Gómez',30,30067890,'Femenino',27),(17,'Carlos','Rodríguez',41,41078901,'Masculino',6),(18,'Laura','Díaz',26,26089012,'Femenino',38),(19,'Miguel','Ramírez',34,34090123,'Masculino',8),(20,'Elena','Martínez',38,38001234,'Femenino',31),(21,'Jorge','Torres',44,44012345,'Masculino',21),(22,'Isabel','Sánchez',27,27023456,'Femenino',17),(23,'Luis','Pérez',35,35034567,'Masculino',7),(24,'Alicia','González',32,32045678,'Femenino',44),(25,'Diego','Fernández',40,40056789,'Masculino',14),(26,'Ana','López',29,29067890,'Femenino',49),(27,'Alejandro','Gómez',36,36078901,'Masculino',37),(28,'Valeria','Ramírez',31,31090123,'Femenino',20),(29,'Juan','Martínez',43,43001234,'Masculino',16),(30,'Carmen','Hernández',39,39012345,'Femenino',13),(31,'Felipe','López',30,30023456,'Masculino',48),(32,'Julia','Gómez',26,26034567,'Femenino',10),(33,'Rodrigo','Fernández',38,38045678,'Femenino',35),(34,'Paola','Sánchez',28,28056789,'Masculino',40),(35,'Manuel','Pérez',35,35067890,'Femenino',33),(36,'Teresa','Martínez',29,29078901,'Femenino',18),(37,'Gustavo','Ramírez',42,42090123,'Masculino',25),(38,'Isabella','López',33,33001234,'Femenino',32),(39,'Roberto','González',37,37012345,'Masculino',9),(40,'Carolina','Hernández',40,40023456,'Femenino',3),(41,'Fernando','Pérez',36,36034567,'Masculino',15),(42,'Camila','Fernández',31,31045678,'Femenino',24),(43,'Ricardo','Gómez',27,27056789,'Masculino',4),(44,'Gabriela','Ramírez',34,34067890,'Femenino',42),(45,'Alejandro','Sánchez',28,28078901,'Masculino',50),(46,'Daniela','Martínez',37,37090123,'Femenino',41),(47,'Joaquín','López',38,38001234,'Masculino',26),(48,'Natalia','Hernández',29,29012345,'Femenino',46),(49,'Martín','Gómez',42,42023456,'Masculino',11),(50,'Valentina','Ramírez',25,25034567,'Femenino',22);
/*!40000 ALTER TABLE `pasajeros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajes`
--

DROP TABLE IF EXISTS `pasajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_pasaje` varchar(50) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `vuelo_comprado` int NOT NULL,
  `pertenece_al_pasajero` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pertenece_al_pasajero` (`pertenece_al_pasajero`),
  KEY `vuelo_comprado` (`vuelo_comprado`),
  CONSTRAINT `pasajes_ibfk_1` FOREIGN KEY (`pertenece_al_pasajero`) REFERENCES `pasajeros` (`id`),
  CONSTRAINT `pasajes_ibfk_2` FOREIGN KEY (`vuelo_comprado`) REFERENCES `vuelos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajes`
--

LOCK TABLES `pasajes` WRITE;
/*!40000 ALTER TABLE `pasajes` DISABLE KEYS */;
INSERT INTO `pasajes` VALUES (1,'123','2023-05-12',250.50,'Confirmado',5,1),(2,'234','2023-06-18',320.75,'Cancelado',7,9),(3,'345','2023-07-25',180.00,'Confirmado',8,4),(4,'456','2023-08-04',420.00,'Confirmado',2,6),(5,'567','2023-09-09',310.25,'Cancelado',6,5),(6,'678','2023-01-15',275.80,'Confirmado',4,10),(7,'789','2023-03-21',190.50,'Confirmado',10,7),(8,'890','2023-02-28',380.90,'Cancelado',9,2),(9,'901','2023-01-02',220.00,'Confirmado',3,3),(10,'101','2023-03-03',450.00,'Confirmado',1,8),(11,'222','2023-04-07',295.25,'Confirmado',17,15),(12,'333','2023-05-10',185.80,'Cancelado',24,28),(13,'444','2023-06-14',410.00,'Confirmado',5,31),(14,'555','2023-07-21',230.50,'Confirmado',33,47),(15,'666','2023-08-02',355.75,'Cancelado',8,19),(16,'777','2023-09-06',310.20,'Confirmado',2,45),(17,'888','2023-01-12',199.00,'Confirmado',10,37),(18,'999','2023-02-26',375.60,'Cancelado',19,8),(19,'111','2023-03-01',212.50,'Confirmado',6,22),(20,'212','2023-03-29',432.75,'Confirmado',45,12),(21,'121','2023-04-17',315.75,'Cancelado',23,33),(22,'232','2023-05-22',200.50,'Confirmado',9,14),(23,'343','2023-06-30',420.25,'Cancelado',12,11),(24,'454','2023-07-08',285.00,'Confirmado',37,26),(25,'565','2023-08-12',372.80,'Confirmado',41,7);
/*!40000 ALTER TABLE `pasajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_migraciones`
--

DROP TABLE IF EXISTS `personal_migraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_migraciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `aeropuerto_en_el_que_trabaja` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aeropuerto_en_el_que_trabaja` (`aeropuerto_en_el_que_trabaja`),
  CONSTRAINT `personal_migraciones_ibfk_1` FOREIGN KEY (`aeropuerto_en_el_que_trabaja`) REFERENCES `aeropuerto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_migraciones`
--

LOCK TABLES `personal_migraciones` WRITE;
/*!40000 ALTER TABLE `personal_migraciones` DISABLE KEYS */;
INSERT INTO `personal_migraciones` VALUES (1,'Luisa','Morales',28,35012345,'Femenino',3),(2,'Andrés','García',35,25023456,'Masculino',2),(3,'Valeria','López',29,36034567,'Femenino',5),(4,'Gabriel','Martínez',42,19045678,'Masculino',6),(5,'Ana','Sánchez',31,38056789,'Femenino',9),(6,'Pedro','Díaz',37,21067890,'Masculino',10),(7,'María','Torres',26,40078901,'Femenino',2),(8,'Javier','Ramírez',34,24089012,'Masculino',1),(9,'Luciana','Fernández',30,37090123,'Femenino',8),(10,'Diego','Pérez',44,17001234,'Masculino',6);
/*!40000 ALTER TABLE `personal_migraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilotos`
--

DROP TABLE IF EXISTS `pilotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `aerolinea_en_la_que_trabaja` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aerolinea_en_la_que_trabaja` (`aerolinea_en_la_que_trabaja`),
  CONSTRAINT `pilotos_ibfk_1` FOREIGN KEY (`aerolinea_en_la_que_trabaja`) REFERENCES `aerolinea` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilotos`
--

LOCK TABLES `pilotos` WRITE;
/*!40000 ALTER TABLE `pilotos` DISABLE KEYS */;
INSERT INTO `pilotos` VALUES (1,'Ana','García',28,38012345,'Femenino',1),(2,'Carlos','Martínez',35,31023456,'Masculino',3),(3,'Elena','López',42,22034567,'Femenino',5),(4,'Luis','Rodríguez',30,30045678,'Masculino',6),(5,'Sofía','Fernández',25,41056789,'Femenino',2),(6,'Juan','Pérez',38,26067890,'Masculino',1),(7,'María','Gómez',31,29078901,'Femenino',8),(8,'Pedro','Ramírez',27,35089012,'Otros',9),(9,'Laura','Díaz',29,37090123,'Femenino',4),(10,'Diego','Sánchez',34,28001234,'Masculino',10);
/*!40000 ALTER TABLE `pilotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `genero` enum('Masculino','Femenino','Otros') NOT NULL,
  `aeropuerto_en_el_que_trabaja` int NOT NULL,
  `avion_mantenido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avion_mantenido` (`avion_mantenido`),
  KEY `aeropuerto_en_el_que_trabaja` (`aeropuerto_en_el_que_trabaja`),
  CONSTRAINT `tecnicos_ibfk_1` FOREIGN KEY (`avion_mantenido`) REFERENCES `avion` (`id`),
  CONSTRAINT `tecnicos_ibfk_2` FOREIGN KEY (`aeropuerto_en_el_que_trabaja`) REFERENCES `aeropuerto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'Laura','Hernández',29,39012345,'Femenino',1,6),(2,'Pedro','Gómez',38,28023456,'Masculino',3,3),(3,'Isabella','Pérez',26,40034567,'Femenino',4,2),(4,'Miguel','Fernández',35,32045678,'Masculino',5,1),(5,'Valentina','López',31,33056789,'Femenino',6,4),(6,'Carlos','Sánchez',45,25067890,'Masculino',8,8),(7,'Ana','Torres',33,31078901,'Femenino',7,9),(8,'Santiago','Martínez',42,29089012,'Masculino',6,3),(9,'Lucía','Ramírez',30,37090123,'Femenino',9,7),(10,'Juan','García',37,27001234,'Masculino',3,10);
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelos`
--

DROP TABLE IF EXISTS `vuelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `num_vuelo` int NOT NULL,
  `destino` varchar(50) NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `fecha_llegada` datetime NOT NULL,
  `escalas` varchar(50) DEFAULT NULL,
  `aeropuerto_origen` int NOT NULL,
  `aerolinea_perteneciente` int NOT NULL,
  `avion_utilizado` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aeropuerto_origen` (`aeropuerto_origen`),
  KEY `aerolinea_perteneciente` (`aerolinea_perteneciente`),
  KEY `avion_utilizado` (`avion_utilizado`),
  CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`aeropuerto_origen`) REFERENCES `aeropuerto` (`id`),
  CONSTRAINT `vuelos_ibfk_2` FOREIGN KEY (`aerolinea_perteneciente`) REFERENCES `aerolinea` (`id`),
  CONSTRAINT `vuelos_ibfk_3` FOREIGN KEY (`avion_utilizado`) REFERENCES `avion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelos`
--

LOCK TABLES `vuelos` WRITE;
/*!40000 ALTER TABLE `vuelos` DISABLE KEYS */;
INSERT INTO `vuelos` VALUES (1,123,'Londres','2023-10-15 08:30:00','2023-10-15 16:45:00','Berlín',2,1,3),(2,202,'París','2023-10-16 09:15:00','2023-10-16 17:30:00','Madrid',3,2,4),(3,303,'Nueva York','2023-10-17 10:00:00','2023-10-17 18:15:00','Sin escalas',1,3,5),(4,404,'Los Ángeles','2023-10-18 11:45:00','2023-10-18 20:00:00','Miami',5,4,1),(5,505,'Tokio','2023-10-19 07:30:00','2023-10-19 22:45:00','Sin escalas',4,5,2),(6,606,'Sídney','2023-10-20 08:15:00','2023-10-20 16:30:00','Santiago de Chile',6,1,3),(7,707,'Roma','2023-10-21 09:00:00','2023-10-21 17:15:00','Madrid',3,2,4),(8,808,'Madrid','2023-10-22 10:45:00','2023-10-22 19:00:00','Barcelona',7,3,5),(9,909,'Berlín','2023-10-23 11:30:00','2023-10-23 20:45:00','París',8,4,1),(10,1001,'Pekín','2023-10-24 12:15:00','2023-10-24 21:30:00','Tokio',6,5,2),(11,1111,'Madrid','2023-10-25 13:00:00','2023-10-25 21:15:00','Lisboa',4,1,15),(12,1222,'Los Ángeles','2023-10-26 14:45:00','2023-10-26 23:00:00','Phoenix',6,2,39),(13,1333,'Roma','2023-10-27 15:30:00','2023-10-27 23:45:00','Atenas',5,3,17),(14,1444,'París','2023-10-28 16:15:00','2023-10-28 00:30:00','Ámsterdam',2,4,28),(15,1555,'Sídney','2023-10-29 17:00:00','2023-10-29 01:15:00','Melbourne',1,5,4),(16,1666,'Nueva York','2023-10-30 18:45:00','2023-10-30 03:00:00','Chicago',4,1,33),(17,1777,'Pekín','2023-10-31 19:30:00','2023-10-31 04:45:00','Shanghái',3,2,22),(18,1888,'Los Ángeles','2023-11-01 20:15:00','2023-11-01 06:30:00','Las Vegas',6,3,16),(19,1999,'Tokio','2023-11-02 21:00:00','2023-11-02 07:15:00','Osaka',5,4,47),(20,2000,'Sídney','2023-11-03 22:45:00','2023-11-03 08:00:00','Brisbane',1,1,49),(21,2111,'Madrid','2023-11-04 23:30:00','2023-11-04 09:45:00','Barcelona',2,2,19),(22,2222,'Londres','2023-11-05 00:15:00','2023-11-05 10:30:00','Edimburgo',3,3,10),(23,2333,'París','2023-11-06 01:00:00','2023-11-06 11:15:00','Lyon',4,4,25),(24,2444,'Roma','2023-11-07 02:45:00','2023-11-07 12:00:00','Nápoles',5,5,36),(25,2555,'Atenas','2023-11-08 03:30:00','2023-11-08 13:45:00','Salónica',6,1,11),(26,2666,'Lisboa','2023-11-09 04:15:00','2023-11-09 14:30:00','Oporto',1,2,5),(27,2777,'Viena','2023-11-10 05:00:00','2023-11-10 15:15:00','Praga',2,3,12),(28,2888,'Budapest','2023-11-11 06:45:00','2023-11-11 16:00:00','Bratislava',3,4,30),(29,2999,'Varsovia','2023-11-12 07:30:00','2023-11-12 17:45:00','Cracovia',4,5,20),(30,3000,'Berlín','2023-11-13 08:15:00','2023-11-13 18:30:00','Hamburgo',5,1,40),(31,3111,'Ámsterdam','2023-11-14 09:00:00','2023-11-14 19:15:00','Róterdam',6,2,27),(32,3222,'Bruselas','2023-11-15 10:45:00','2023-11-15 21:00:00','Gante',1,3,18),(33,3333,'Zúrich','2023-11-16 11:30:00','2023-11-16 21:45:00','Ginebra',2,4,14),(34,3444,'Estocolmo','2023-11-17 12:15:00','2023-11-17 22:30:00','Gotemburgo',3,5,7),(35,3555,'Copenhague','2023-11-18 13:00:00','2023-11-18 23:15:00','Malmö',4,1,23),(36,3666,'Oslo','2023-11-19 14:45:00','2023-11-19 01:00:00','Estocolmo',5,2,48),(37,3777,'Helsinki','2023-11-20 15:30:00','2023-11-20 02:45:00','Tallin',6,3,6),(38,3888,'Riga','2023-11-21 16:15:00','2023-11-21 03:30:00','Vilna',1,4,29),(39,3999,'Varsovia','2023-11-22 17:00:00','2023-11-22 04:15:00','Cracovia',2,5,37),(40,4000,'Copenhague','2023-11-23 18:45:00','2023-11-23 05:00:00','Malmö',4,1,13),(41,4111,'Oslo','2023-11-24 19:30:00','2023-11-24 06:45:00','Estocolmo',3,2,31),(42,4222,'Helsinki','2023-11-25 20:15:00','2023-11-25 08:30:00','Tallin',6,1,9),(43,4333,'Riga','2023-11-26 21:00:00','2023-11-26 09:15:00','Vilna',5,4,21),(44,4444,'Estocolmo','2023-11-27 22:45:00','2023-11-27 11:00:00','Gotemburgo',2,3,43),(45,4555,'Oslo','2023-11-28 23:30:00','2023-11-29 12:45:00','Copenhague',1,5,26),(46,4666,'Helsinki','2023-11-30 00:15:00','2023-11-30 13:30:00','Estocolmo',3,2,38),(47,4777,'Riga','2023-12-01 01:00:00','2023-12-01 14:15:00','Vilna',5,4,45),(48,4888,'Estocolmo','2023-12-02 02:45:00','2023-12-02 16:00:00','Gotemburgo',2,3,46),(49,4999,'Copenhague','2023-12-03 03:30:00','2023-12-03 17:45:00','Malmö',4,1,42),(50,5000,'Oslo','2023-12-04 04:15:00','2023-12-04 21:30:00','Estocolmo',3,4,35);
/*!40000 ALTER TABLE `vuelos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-03 17:57:23

-- Consulta para obtener el nombre y apellido de los pasajeros y el destino de los vuelos que han comprado
SELECT p.nombre AS PasajeroNombre, p.apellido AS PasajeroApellido, v.destino AS DestinoVuelo
FROM pasajeros p
INNER JOIN pasajes pa ON p.id = pa.pertenece_al_pasajero
INNER JOIN vuelos v ON pa.vuelo_comprado = v.id;

-- Consulta para obtener detalles del vuelo
SELECT v.destino, a.nombre AS aerolinea, av.modelo AS modelo_avion
FROM vuelos v
JOIN aerolinea a ON v.aerolinea_perteneciente = a.id
JOIN avion av ON v.avion_utilizado = av.id
WHERE v.num_vuelo = '4999';

-- Consulta para obtener información de vuelos y personal de cabina en una fecha específica
SELECT
    v.num_vuelo AS NumeroVuelo,
    a.modelo AS ModeloAvion,
    al.nombre AS NombreAerolinea,
    CONCAT(az.nombre, ' ', az.apellido) AS NombreAzafata
FROM vuelos v
INNER JOIN avion a ON v.avion_utilizado = a.id
INNER JOIN aerolinea al ON v.aerolinea_perteneciente = al.id
LEFT JOIN azafatas az ON az.aerolinea_en_la_que_trabaja = al.id
WHERE v.fecha_salida >= '2023-10-15' AND v.fecha_salida <= '2023-10-20';

-- Consulta para obtener información de los vuelos en referencia a los pilotos y los aviones
SELECT 
    v.num_vuelo,
    v.destino,
    v.fecha_salida,
    a.modelo AS modelo_avion,
    a.capacidad_pasajeros,
    p.nombre AS nombre_piloto,
    p.apellido AS apellido_piloto,
    ae.nombre AS nombre_aerolinea
FROM vuelos v
INNER JOIN avion a ON v.avion_utilizado = a.id
INNER JOIN pilotos p ON v.id = p.aerolinea_en_la_que_trabaja
INNER JOIN aerolinea ae ON v.aerolinea_perteneciente = ae.id;

-- Consulta para obtener información del pasajero
SELECT
    p.nombre AS NombrePasajero,
    p.apellido AS ApellidoPasajero,
    p.edad AS EdadPasajero,
    v.num_vuelo AS NumeroVuelo,
    v.destino AS Destino,
    v.fecha_salida AS FechaSalida,
    ae.nombre AS NombreAerolinea
FROM
    pasajes ps
INNER JOIN pasajeros p ON ps.pertenece_al_pasajero = p.id
INNER JOIN vuelos v ON ps.vuelo_comprado = v.id
INNER JOIN aerolinea ae ON v.aerolinea_perteneciente = ae.id;