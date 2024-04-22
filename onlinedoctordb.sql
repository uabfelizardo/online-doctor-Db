-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: onlinedoctordb
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

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
-- Table structure for table `comunicacao`
--

DROP TABLE IF EXISTS `comunicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunicacao` (
  `id` int(11) NOT NULL,
  `inicio` datetime DEFAULT NULL,
  `fim` datetime DEFAULT NULL,
  `texto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicacao`
--

LOCK TABLES `comunicacao` WRITE;
/*!40000 ALTER TABLE `comunicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunicacao_utilizador`
--

DROP TABLE IF EXISTS `comunicacao_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comunicacao_utilizador` (
  `id` int(11) NOT NULL,
  `idcomunicacao` int(11) DEFAULT NULL,
  `idutilizador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comunicacao_utilizador_comunicacao` (`idcomunicacao`),
  KEY `FK_comunicacao_utilizador_utilizador` (`idutilizador`),
  CONSTRAINT `FK_comunicacao_utilizador_comunicacao` FOREIGN KEY (`idcomunicacao`) REFERENCES `comunicacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comunicacao_utilizador_utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicacao_utilizador`
--

LOCK TABLES `comunicacao_utilizador` WRITE;
/*!40000 ALTER TABLE `comunicacao_utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicacao_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `observacoes` varchar(50) NOT NULL DEFAULT '',
  `idutilizador` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_consulta_utilizador` (`idutilizador`),
  CONSTRAINT `FK_consulta_utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico`
--

DROP TABLE IF EXISTS `diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostico` (
  `id` int(11) NOT NULL,
  `diagnostico` varchar(50) NOT NULL,
  `data` datetime NOT NULL,
  `idconsulta` int(11) NOT NULL DEFAULT '0',
  `idutilizador` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_diagnostico_consulta` (`idconsulta`),
  KEY `FK_diagnostico_utilizador` (`idutilizador`),
  CONSTRAINT `FK_diagnostico_consulta` FOREIGN KEY (`idconsulta`) REFERENCES `consulta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_diagnostico_utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico`
--

LOCK TABLES `diagnostico` WRITE;
/*!40000 ALTER TABLE `diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `id` int(11) NOT NULL,
  `documento` varchar(50) NOT NULL DEFAULT '',
  `data` datetime NOT NULL,
  `idconsulta` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__consulta` (`idconsulta`),
  CONSTRAINT `FK__consulta` FOREIGN KEY (`idconsulta`) REFERENCES `consulta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento`
--

DROP TABLE IF EXISTS `medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `medicamento` varchar(50) DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `laboratorio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento`
--

LOCK TABLES `medicamento` WRITE;
/*!40000 ALTER TABLE `medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento_consulta`
--

DROP TABLE IF EXISTS `medicamento_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_consulta` (
  `id` int(11) NOT NULL,
  `idmedicamento` int(11) NOT NULL,
  `idconsulta` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__medicamento` (`idmedicamento`),
  KEY `FK_medicamento_consulta_consulta` (`idconsulta`),
  CONSTRAINT `FK_medicamento_consulta_consulta` FOREIGN KEY (`idconsulta`) REFERENCES `consulta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK__medicamento` FOREIGN KEY (`idmedicamento`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_consulta`
--

LOCK TABLES `medicamento_consulta` WRITE;
/*!40000 ALTER TABLE `medicamento_consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamento_utilizador`
--

DROP TABLE IF EXISTS `medicamento_utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicamento_utilizador` (
  `id` int(11) NOT NULL,
  `idmedicamento` int(11) DEFAULT NULL,
  `idutilizador` int(11) DEFAULT NULL,
  `data` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_medicamento_utilizador_medicamento` (`idmedicamento`),
  KEY `FK_medicamento_utilizador_utilizador` (`idutilizador`),
  CONSTRAINT `FK_medicamento_utilizador_medicamento` FOREIGN KEY (`idmedicamento`) REFERENCES `medicamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_medicamento_utilizador_utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_utilizador`
--

LOCK TABLES `medicamento_utilizador` WRITE;
/*!40000 ALTER TABLE `medicamento_utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_utilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notaconsulta`
--

DROP TABLE IF EXISTS `notaconsulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notaconsulta` (
  `id` int(11) NOT NULL,
  `nota` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `idutilizador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_notaconsulta_utilizador` (`idutilizador`),
  CONSTRAINT `FK_notaconsulta_utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notaconsulta`
--

LOCK TABLES `notaconsulta` WRITE;
/*!40000 ALTER TABLE `notaconsulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `notaconsulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacoes`
--

DROP TABLE IF EXISTS `notificacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacoes` (
  `id` int(11) NOT NULL,
  `textodefault` varchar(50) NOT NULL DEFAULT '',
  `idutilizador` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__utilizador` (`idutilizador`),
  CONSTRAINT `FK__utilizador` FOREIGN KEY (`idutilizador`) REFERENCES `utilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacoes`
--

LOCK TABLES `notificacoes` WRITE;
/*!40000 ALTER TABLE `notificacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocomunicacao`
--

DROP TABLE IF EXISTS `tipocomunicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocomunicacao` (
  `id` int(11) NOT NULL,
  `descricao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocomunicacao`
--

LOCK TABLES `tipocomunicacao` WRITE;
/*!40000 ALTER TABLE `tipocomunicacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipocomunicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoutilizador`
--

DROP TABLE IF EXISTS `tipoutilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoutilizador` (
  `id` int(11) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descricao` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoutilizador`
--

LOCK TABLES `tipoutilizador` WRITE;
/*!40000 ALTER TABLE `tipoutilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoutilizador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilizador`
--

DROP TABLE IF EXISTS `utilizador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilizador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `numeroutente` varchar(50) DEFAULT NULL,
  `idtipoutilizador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_utilizador_tipoutilizador` (`idtipoutilizador`),
  CONSTRAINT `FK_utilizador_tipoutilizador` FOREIGN KEY (`idtipoutilizador`) REFERENCES `tipoutilizador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilizador`
--

LOCK TABLES `utilizador` WRITE;
/*!40000 ALTER TABLE `utilizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilizador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-22 15:37:33
