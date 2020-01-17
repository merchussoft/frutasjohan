-- MySQL dump 10.16  Distrib 10.1.43-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: agropecuaria-demo.c8wbfonri86l.us-east-1.rds.amazonaws.com    Database: fructusdeosas
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datos_usuarios`
--

CREATE DATABASE IF NOT EXISTS fructusdeosas;

USE fructusdeosas;


DROP TABLE IF EXISTS `datos_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_usuarios` (
  `cod_datos_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `cumpleanos` date DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_perfil` int(11) DEFAULT NULL,
  `cod_eps` int(11) DEFAULT NULL,
  `cod_grupo_sanguineo` int(11) DEFAULT NULL,
  `cod_pension_cesantias` int(11) DEFAULT NULL,
  PRIMARY KEY (`cod_datos_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `cod_usuario` (`cod_usuario`),
  KEY `cod_perfil` (`cod_perfil`),
  KEY `cod_eps` (`cod_eps`),
  KEY `cod_grupo_sanguineo` (`cod_grupo_sanguineo`),
  KEY `cod_pension_cesantias` (`cod_pension_cesantias`),
  CONSTRAINT `datos_usuarios_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`),
  CONSTRAINT `datos_usuarios_ibfk_2` FOREIGN KEY (`cod_perfil`) REFERENCES `perfiles` (`cod_perfil`),
  CONSTRAINT `datos_usuarios_ibfk_3` FOREIGN KEY (`cod_eps`) REFERENCES `eps` (`cod_eps`),
  CONSTRAINT `datos_usuarios_ibfk_4` FOREIGN KEY (`cod_grupo_sanguineo`) REFERENCES `grupo_sanguineo` (`cod_grupo_sanguineo`),
  CONSTRAINT `datos_usuarios_ibfk_5` FOREIGN KEY (`cod_pension_cesantias`) REFERENCES `pension_cesantias` (`cod_pension_cesantias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_usuarios`
--

LOCK TABLES `datos_usuarios` WRITE;
/*!40000 ALTER TABLE `datos_usuarios` DISABLE KEYS */;
INSERT INTO `datos_usuarios` VALUES (5,'merchussoft@hotmail.com','0000-00-00','3173634779','bogota','172.20.0.1',6,2,3,1,8),(6,'super_admin@hotmail.com','1985-09-18','3173634779','bogota',NULL,1,1,1,1,1),(7,'geris04@outlook.com','0000-00-00','3022762226','bogota','172.20.0.1',7,2,3,1,8),(8,'amerchan@hotmail.com','0000-00-00','3173634779','La casa de ella ','127.0.0.1',8,2,3,1,8),(9,'lbuitrago@hotmail.com','0000-00-00','3125725566','la casa de ella ','127.0.0.1',9,2,2,1,1);
/*!40000 ALTER TABLE `datos_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eps`
--

DROP TABLE IF EXISTS `eps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eps` (
  `cod_eps` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `regimen` varchar(50) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cod_eps`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eps`
--

LOCK TABLES `eps` WRITE;
/*!40000 ALTER TABLE `eps` DISABLE KEYS */;
INSERT INTO `eps` VALUES (1,'asmetsalud','contributivo',NULL),(2,'asmetsalud','subsidiado',NULL),(3,'salud total','contributivo',NULL),(4,'nueva eps','subsidiado',NULL),(5,'nueva eps','contributivo',NULL),(6,'cafesalud','subsidiado',NULL),(7,'cafesalud','contributivo',NULL),(8,'sura','subsidiado',NULL),(9,'sura','contributivo',NULL),(10,'sanitas','subsidiado',NULL),(11,'sanitas','contributivo',NULL),(12,'policia nacional','',NULL),(13,'sanidad militar','',NULL);
/*!40000 ALTER TABLE `eps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_sanguineo`
--

DROP TABLE IF EXISTS `grupo_sanguineo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo_sanguineo` (
  `cod_grupo_sanguineo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_sanguineo_rh` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_grupo_sanguineo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_sanguineo`
--

LOCK TABLES `grupo_sanguineo` WRITE;
/*!40000 ALTER TABLE `grupo_sanguineo` DISABLE KEYS */;
INSERT INTO `grupo_sanguineo` VALUES (1,'O+'),(2,'O-'),(3,'A+'),(4,'A-'),(5,'AB+'),(6,'AB-'),(7,'B+'),(8,'B-');
/*!40000 ALTER TABLE `grupo_sanguineo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulos` (
  `cod_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `directorio` varchar(100) NOT NULL,
  `activo` tinyint(4) DEFAULT '1',
  `icono` varchar(50) DEFAULT NULL,
  `createAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_modulo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Administrador','Administrador.php',1,'fa-tachometer-alt','2020-01-05 16:21:21','2020-01-05 19:57:20'),(2,'Nomina','Nomina.php',1,'fa-calculator','2020-01-05 19:42:53','2020-01-05 19:56:19'),(3,'Usuarios','Usuarios.php',1,'fa-user-plus','2020-01-07 12:33:57',NULL),(4,'Perfil','Perfil.php',1,'fa-user','2020-01-14 01:43:54',NULL);
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pension_cesantias`
--

DROP TABLE IF EXISTS `pension_cesantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pension_cesantias` (
  `cod_pension_cesantias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cesantias` varchar(100) NOT NULL,
  `entidad_pension` varchar(100) NOT NULL,
  PRIMARY KEY (`cod_pension_cesantias`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pension_cesantias`
--

LOCK TABLES `pension_cesantias` WRITE;
/*!40000 ALTER TABLE `pension_cesantias` DISABLE KEYS */;
INSERT INTO `pension_cesantias` VALUES (1,'Proteccion S.A.','Suramericana de Seguros'),(2,'Fondos de Pensiones y Cesantias Skandia','Askandia S.A'),(3,'Cesantias de Colombia S.A.','Banco de Colombia'),(4,'Sociedad Administradora de Fondos de Cesantia y Pensiones ','Colpatria'),(5,'Compania Colombiana Administradora de Fondos de Pensiones y de Cesantias S.A.','Colfondos'),(6,'Sociedad Administradora de Fondos de Cesantia y Pensiones Colmena','Colmena'),(7,'Fondos de Pensiones y Cesantias Granahorrar','Granfondo S.A.'),(8,'Fondos de Pensiones y Cesantias, Porvenir S.A.','Porvenir S.A.'),(9,'Sociedad Administradora de Fondos de Cesantias, Invertir ','entidad cooperativa'),(10,'Fondos de Pensiones y Cesantias de Santander S.A., Corfinansa','Corporacion Financiera de Santander'),(11,'Fondo de Pensiones y Cesantia, Davivir S.A.','Seguros Bolivar'),(12,'Fondos de Pensiones y Cesantias Diners S.A.','Fondo Diners Club de Colombia S.A'),(13,'Fondos de Pensiones y Cesantias, Invermanana','Inversora S.A.');
/*!40000 ALTER TABLE `pension_cesantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `cod_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `activo` tinyint(4) DEFAULT '1',
  `createdAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upgradeAT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_perfil`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,'super_admin',1,'2020-01-04 13:41:28',NULL),(2,'admin',1,'2020-01-04 13:41:28',NULL);
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso_modulos`
--

DROP TABLE IF EXISTS `permiso_modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permiso_modulos` (
  `cod_permiso_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) DEFAULT NULL,
  `cod_perfil` int(11) DEFAULT NULL,
  `cod_modulo` int(11) DEFAULT NULL,
  `visible` int(10) DEFAULT '1',
  PRIMARY KEY (`cod_permiso_modulo`),
  KEY `cod_usuario` (`cod_usuario`),
  KEY `cod_perfil` (`cod_perfil`),
  KEY `cod_modulo` (`cod_modulo`),
  CONSTRAINT `permiso_modulos_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`),
  CONSTRAINT `permiso_modulos_ibfk_2` FOREIGN KEY (`cod_perfil`) REFERENCES `perfiles` (`cod_perfil`),
  CONSTRAINT `permiso_modulos_ibfk_3` FOREIGN KEY (`cod_modulo`) REFERENCES `modulos` (`cod_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso_modulos`
--

LOCK TABLES `permiso_modulos` WRITE;
/*!40000 ALTER TABLE `permiso_modulos` DISABLE KEYS */;
INSERT INTO `permiso_modulos` VALUES (1,1,NULL,1,1),(2,1,NULL,2,1),(3,1,NULL,3,1),(4,1,NULL,4,0);
/*!40000 ALTER TABLE `permiso_modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `activo` tinyint(4) DEFAULT '1',
  `createAT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updateAT` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'super','admin','0000000010','super_admin','202cb962ac59075b964b07152d234b70',1,'2020-01-04 13:42:06',NULL),(6,'daniel alexander ','merchan cermeño','9773713','damerchan','827ccb0eea8a706c4c34a16891f84e7b',1,'2020-01-09 16:56:20',NULL),(7,'geraldine','ramirez','1094963587','gramirez','827ccb0eea8a706c4c34a16891f84e7b',1,'2020-01-09 17:11:27',NULL),(8,'Andrea','Merchan','1094947268','amerchan','827ccb0eea8a706c4c34a16891f84e7b',1,'2020-01-11 15:55:32',NULL),(9,'lorena','buitrago','1094902665','lbuitrago','827ccb0eea8a706c4c34a16891f84e7b',1,'2020-01-15 03:39:13',NULL);
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

-- Dump completed on 2020-01-16 22:32:15
