-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sistema_notas
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `dni` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `curso` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'matematica'),(2,'ingles'),(3,'juridico'),(4,'asistencia'),(5,'autogestion'),(6,'hardware'),(7,'practicas'),(8,'programacion'),(9,'redes'),(10,'arduino');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `dni_alumno` varchar(20) DEFAULT NULL,
  `id_materia` int DEFAULT NULL,
  `informe_1_cuatrimestre1` int DEFAULT NULL,
  `informe_2_cuatrimestre1` int DEFAULT NULL,
  `nota_cuatrimestre1` int DEFAULT NULL,
  `informe_1_cuatrimestre2` int DEFAULT NULL,
  `informe_2_cuatrimestre2` int DEFAULT NULL,
  `nota_cuatrimestre2` int DEFAULT NULL,
  `nota_anual` int DEFAULT NULL,
  `rec_dic` int DEFAULT NULL,
  `rec_feb` int DEFAULT NULL,
  `nota_final` int DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  UNIQUE KEY `unique_dni_materia` (`dni_alumno`,`id_materia`),
  KEY `fk_id_materia` (`id_materia`),
  CONSTRAINT `fk_id_materia` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`dni_alumno`) REFERENCES `usuarios` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (16,'12345678',1,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'12345678',2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'12345678',3,NULL,7,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'12345678',4,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL),(20,'12345678',5,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL),(21,'12345678',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7),(22,'12345678',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'12345678',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'12345678',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'12345678',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'45888880',1,9,7,8,8,9,8,8,NULL,NULL,NULL),(28,'45888880',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'12345678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'45888880',10,6,6,7,8,8,7,6,NULL,NULL,NULL),(33,'45888880',2,7,8,7,8,9,9,8,NULL,NULL,NULL),(34,'45888880',3,8,7,8,8,9,8,7,NULL,NULL,NULL),(35,'45888880',4,6,8,9,10,8,9,8,NULL,NULL,NULL),(36,'45888880',5,7,7,6,8,9,10,6,NULL,NULL,NULL),(37,'45888880',6,6,6,8,8,8,9,8,NULL,NULL,NULL),(38,'45888880',7,7,8,8,9,7,8,7,NULL,NULL,NULL),(39,'45888880',8,6,7,7,9,8,8,8,NULL,NULL,NULL),(40,'45888880',9,7,6,7,9,7,8,6,NULL,NULL,NULL),(941,'87654321',1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(942,'87654321',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(943,'87654321',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(944,'87654321',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(945,'87654321',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(946,'87654321',6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(947,'87654321',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(948,'87654321',8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(949,'87654321',9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(950,'87654321',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('12345678','matias','no se','gio.paule05@gmail.com','alumno','alumno'),('45888879','Giovanni','Pauletto','gio.paule05@gmail.com','administrador','admin123'),('45888880','Gio','Pau','fliapauletto@gmail.com','alumno','alumno'),('45888890','pablo','xd','gio.paule05@gmail.com','encargado','encargado'),('87654321','lucas','lucas','gio.paule05@gmail.com','alumno','alumno');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 18:32:18
