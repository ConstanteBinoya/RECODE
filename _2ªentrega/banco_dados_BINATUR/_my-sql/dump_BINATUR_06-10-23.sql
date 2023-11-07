CREATE DATABASE  IF NOT EXISTS `binatur` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `binatur`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: binatur
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `aereo_reserva`
--

DROP TABLE IF EXISTS `aereo_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aereo_reserva` (
  `id_reserva_voo` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(15) NOT NULL,
  `id_transporte` int NOT NULL,
  `num_voo` int NOT NULL,
  `num_assento` varchar(5) NOT NULL,
  `data_embarque` date NOT NULL,
  `hora_embarque` datetime NOT NULL,
  PRIMARY KEY (`id_reserva_voo`),
  UNIQUE KEY `num_assento` (`num_assento`),
  KEY `cpf_cliente` (`cpf_cliente`),
  KEY `id_transporte` (`id_transporte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aereo_reserva`
--

LOCK TABLES `aereo_reserva` WRITE;
/*!40000 ALTER TABLE `aereo_reserva` DISABLE KEYS */;
INSERT INTO `aereo_reserva` VALUES (1,'015.287.633-98',3,747,'26-A','2023-04-26','2003-00-00 00:00:00');
/*!40000 ALTER TABLE `aereo_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cate_quarto_hosp`
--

DROP TABLE IF EXISTS `cate_quarto_hosp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cate_quarto_hosp` (
  `id_quarto` int NOT NULL,
  `id_hospedagem` int NOT NULL,
  PRIMARY KEY (`id_quarto`,`id_hospedagem`),
  KEY `id_hospedagem` (`id_hospedagem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cate_quarto_hosp`
--

LOCK TABLES `cate_quarto_hosp` WRITE;
/*!40000 ALTER TABLE `cate_quarto_hosp` DISABLE KEYS */;
INSERT INTO `cate_quarto_hosp` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `cate_quarto_hosp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_quarto`
--

DROP TABLE IF EXISTS `categoria_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_quarto` (
  `id_quarto` int NOT NULL AUTO_INCREMENT,
  `standard` tinyint(1) NOT NULL,
  `luxo` tinyint(1) NOT NULL,
  `premeum` tinyint(1) NOT NULL,
  `conjugado` tinyint(1) NOT NULL,
  `animal_estimacao` tinyint(1) NOT NULL,
  `qtd_quarto` int NOT NULL,
  PRIMARY KEY (`id_quarto`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_quarto`
--

LOCK TABLES `categoria_quarto` WRITE;
/*!40000 ALTER TABLE `categoria_quarto` DISABLE KEYS */;
INSERT INTO `categoria_quarto` VALUES (1,0,0,1,1,1,2),(2,1,0,0,0,0,1),(3,0,1,1,1,1,2),(4,1,1,1,0,1,3);
/*!40000 ALTER TABLE `categoria_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpf` varchar(15) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('014.279.577-21','Constante','Binoya','(81)9.9670-1523','constantebinoyaz1@gmail.com','1989-04-26'),('314.970.587-01','Joaquim','José da Silva Chavier','(83)3471-2156','tiradentesemcabeca@outlook.com','1990-05-15'),('911.289.397-44','João','Cabral de Melo Neto','(61)3487-5501','morte_vida_severina@bol.com.br','1970-03-12'),('546.279.546-36','Pedro','Holmes','(11)3491-4417','elementar_watson@gmail.com','1959-12-12'),('015.287.633-98','Monkey','D. Luffy','(21)3497-2215','onepeace_ismy@hotmail.com','2003-09-11'),('917.386.288-54','Ahab','Capitão','(76)9.8924-8550','mob_dick_papaperna@gmail.com.br','1982-06-25');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_cliente`
--

DROP TABLE IF EXISTS `endereco_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_cliente` (
  `cpf_cliente` varchar(15) NOT NULL,
  `cep` varchar(12) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `pais` varchar(20) NOT NULL,
  PRIMARY KEY (`cpf_cliente`,`cep`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_cliente`
--

LOCK TABLES `endereco_cliente` WRITE;
/*!40000 ALTER TABLE `endereco_cliente` DISABLE KEYS */;
INSERT INTO `endereco_cliente` VALUES ('014.279.577-21','34518-200','Rua do Jacarandá','23-A','Ali perto de lá','Brasilovics','Binoyopolis','Pernambuco','Brazöwya'),('314.970.587-01','23517-200','Avenida do Jabuticabal','45','Virando a esquina','Piedade','Itaquaquecetuba','São Paulo','Brazöwya'),('911.289.397-44','83513-400','Beco do sai Quieto','235','Logo ali','piedade','Rio doce','Paraiba','Brazöwya'),('546.279.546-36','43510-900','Travessa da Agonia','200-C','Vai indo e vira','Dois carneiros','Apipucos','Rio Grande do Norte','Brazöwya'),('015.287.633-98','23511-500','Alameda dos Anos','212-B','seguindo a primeira estrela da manhã','Going Marry','Red Line','Rio Grande do Sul','Brazöwya'),('917.386.288-54','53090-330','Rua walfrido de Zazaserto','388','Bloco D, apto 208','Janga','Paulista','Pernambuco','Brazöwya');
/*!40000 ALTER TABLE `endereco_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferroviario_reserva`
--

DROP TABLE IF EXISTS `ferroviario_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ferroviario_reserva` (
  `id_reserva_trem` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(15) NOT NULL,
  `id_transporte` int NOT NULL,
  `num_trem` int NOT NULL,
  `num_assento` varchar(5) NOT NULL,
  `data_embarque` date NOT NULL,
  `hora_embarque` datetime NOT NULL,
  PRIMARY KEY (`id_reserva_trem`),
  UNIQUE KEY `num_assento` (`num_assento`),
  KEY `cpf_cliente` (`cpf_cliente`),
  KEY `id_transporte` (`id_transporte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferroviario_reserva`
--

LOCK TABLES `ferroviario_reserva` WRITE;
/*!40000 ALTER TABLE `ferroviario_reserva` DISABLE KEYS */;
INSERT INTO `ferroviario_reserva` VALUES (1,'917.386.288-54',4,1,'44-3-','2023-11-23','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ferroviario_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosp_cliente`
--

DROP TABLE IF EXISTS `hosp_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosp_cliente` (
  `cpf_cliente` varchar(15) NOT NULL,
  `id_hospedagem` int NOT NULL,
  PRIMARY KEY (`cpf_cliente`,`id_hospedagem`),
  KEY `id_hospedagem` (`id_hospedagem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosp_cliente`
--

LOCK TABLES `hosp_cliente` WRITE;
/*!40000 ALTER TABLE `hosp_cliente` DISABLE KEYS */;
INSERT INTO `hosp_cliente` VALUES ('015.287.633-98',3),('546.279.546-36',2),('911.289.397-44',1),('917.386.288-54',4);
/*!40000 ALTER TABLE `hosp_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedagem` (
  `id_hospedagem` int NOT NULL AUTO_INCREMENT,
  `qtd_pessoas` int NOT NULL,
  `nome_hotel` varchar(30) NOT NULL,
  `chekin` datetime NOT NULL,
  `chekout` datetime NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_hospedagem`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedagem`
--

LOCK TABLES `hospedagem` WRITE;
/*!40000 ALTER TABLE `hospedagem` DISABLE KEYS */;
INSERT INTO `hospedagem` VALUES (1,2,'Dolphin Hotel','2020-12-02 14:00:00','2020-12-20 12:00:00',2936.50),(2,1,'Pinewood Motel','2021-02-16 15:30:00','2021-02-19 11:00:00',400.00),(3,4,'Waldorf Astoria','2023-04-26 16:45:00','2023-05-15 10:15:00',5750.00),(4,6,'Overlook Hotel','2023-11-25 13:00:00','2023-11-28 09:30:00',3000.00);
/*!40000 ALTER TABLE `hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maritmo_reserva`
--

DROP TABLE IF EXISTS `maritmo_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maritmo_reserva` (
  `id_reserva_cruzeiro` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(15) NOT NULL,
  `id_transporte` int NOT NULL,
  `nome_cruzeiro` int NOT NULL,
  `num_cabine` varchar(5) NOT NULL,
  `data_embarque` date NOT NULL,
  `hora_embarque` datetime NOT NULL,
  PRIMARY KEY (`id_reserva_cruzeiro`),
  UNIQUE KEY `num_cabine` (`num_cabine`),
  KEY `cpf_cliente` (`cpf_cliente`),
  KEY `id_transporte` (`id_transporte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maritmo_reserva`
--

LOCK TABLES `maritmo_reserva` WRITE;
/*!40000 ALTER TABLE `maritmo_reserva` DISABLE KEYS */;
INSERT INTO `maritmo_reserva` VALUES (1,'314.970.587-01',2,0,'10-su','2021-02-15','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `maritmo_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacote`
--

DROP TABLE IF EXISTS `pacote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacote` (
  `id_pacote` int NOT NULL AUTO_INCREMENT,
  `id_viagem` int NOT NULL,
  `id_transporte` int NOT NULL,
  `id_hospedagem` int NOT NULL,
  `preco_pacote` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pacote`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacote`
--

LOCK TABLES `pacote` WRITE;
/*!40000 ALTER TABLE `pacote` DISABLE KEYS */;
INSERT INTO `pacote` VALUES (1,3,3,3,4340.00),(2,4,4,4,3990.00);
/*!40000 ALTER TABLE `pacote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacote_cliente`
--

DROP TABLE IF EXISTS `pacote_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacote_cliente` (
  `cpf_cliente` varchar(15) NOT NULL,
  `id_pacote` int NOT NULL,
  PRIMARY KEY (`cpf_cliente`,`id_pacote`),
  KEY `id_pacote` (`id_pacote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacote_cliente`
--

LOCK TABLES `pacote_cliente` WRITE;
/*!40000 ALTER TABLE `pacote_cliente` DISABLE KEYS */;
INSERT INTO `pacote_cliente` VALUES ('015.287.633-98',1),('917.386.288-54',2);
/*!40000 ALTER TABLE `pacote_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacote_hospedagem`
--

DROP TABLE IF EXISTS `pacote_hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacote_hospedagem` (
  `id_hospedagem` int NOT NULL,
  `id_pacote` int NOT NULL,
  PRIMARY KEY (`id_hospedagem`,`id_pacote`),
  KEY `id_pacote` (`id_pacote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacote_hospedagem`
--

LOCK TABLES `pacote_hospedagem` WRITE;
/*!40000 ALTER TABLE `pacote_hospedagem` DISABLE KEYS */;
INSERT INTO `pacote_hospedagem` VALUES (3,1),(4,2);
/*!40000 ALTER TABLE `pacote_hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacote_viagem`
--

DROP TABLE IF EXISTS `pacote_viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacote_viagem` (
  `id_viagem` int NOT NULL,
  `id_pacote` int NOT NULL,
  PRIMARY KEY (`id_viagem`,`id_pacote`),
  KEY `id_pacote` (`id_pacote`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacote_viagem`
--

LOCK TABLES `pacote_viagem` WRITE;
/*!40000 ALTER TABLE `pacote_viagem` DISABLE KEYS */;
INSERT INTO `pacote_viagem` VALUES (3,1),(4,2);
/*!40000 ALTER TABLE `pacote_viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rodoviario_reserva`
--

DROP TABLE IF EXISTS `rodoviario_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rodoviario_reserva` (
  `id_reserva_onibus` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(15) NOT NULL,
  `id_transporte` int NOT NULL,
  `num_onibus` int NOT NULL,
  `num_assento` varchar(5) NOT NULL,
  `data_embarque` date NOT NULL,
  `hora_embarque` datetime NOT NULL,
  PRIMARY KEY (`id_reserva_onibus`),
  UNIQUE KEY `num_assento` (`num_assento`),
  KEY `cpf_cliente` (`cpf_cliente`),
  KEY `id_transporte` (`id_transporte`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rodoviario_reserva`
--

LOCK TABLES `rodoviario_reserva` WRITE;
/*!40000 ALTER TABLE `rodoviario_reserva` DISABLE KEYS */;
INSERT INTO `rodoviario_reserva` VALUES (1,'014.279.577-21',1,1001,'12-D','2020-12-01','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `rodoviario_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_transporte`
--

DROP TABLE IF EXISTS `tipo_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_transporte` (
  `id_transporte` int NOT NULL AUTO_INCREMENT,
  `aereo` tinyint(1) NOT NULL,
  `maritmo` tinyint(1) NOT NULL,
  `rodoviario` tinyint(1) NOT NULL,
  `ferroviario` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_transporte`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_transporte`
--

LOCK TABLES `tipo_transporte` WRITE;
/*!40000 ALTER TABLE `tipo_transporte` DISABLE KEYS */;
INSERT INTO `tipo_transporte` VALUES (1,0,0,1,0),(2,0,1,0,0),(3,1,0,0,0),(4,0,0,0,1);
/*!40000 ALTER TABLE `tipo_transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem`
--

DROP TABLE IF EXISTS `viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem` (
  `id_viagem` int NOT NULL AUTO_INCREMENT,
  `origem` varchar(50) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `data_partida` date NOT NULL,
  `data_chegada` date NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_viagem`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem`
--

LOCK TABLES `viagem` WRITE;
/*!40000 ALTER TABLE `viagem` DISABLE KEYS */;
INSERT INTO `viagem` VALUES (1,'Recife','São Paulo','2020-12-01','2020-12-02',950.00),(2,'Salvador','Paulo Afonso','2021-02-15','2021-02-16',1500.00),(3,'Rio de janeiro','Jalapão','2023-04-26','2023-04-26',450.00),(4,'Acre','Canoa Quebrada','2023-11-23','2023-11-25',2700.00);
/*!40000 ALTER TABLE `viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem_cliente`
--

DROP TABLE IF EXISTS `viagem_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem_cliente` (
  `cpf_cliente` varchar(15) NOT NULL,
  `id_viagem` int NOT NULL,
  PRIMARY KEY (`cpf_cliente`,`id_viagem`),
  KEY `id_viagem` (`id_viagem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem_cliente`
--

LOCK TABLES `viagem_cliente` WRITE;
/*!40000 ALTER TABLE `viagem_cliente` DISABLE KEYS */;
INSERT INTO `viagem_cliente` VALUES ('014.279.577-21',1),('015.287.633-98',3),('314.970.587-01',2),('917.386.288-54',4);
/*!40000 ALTER TABLE `viagem_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viagem_tipo_transporte`
--

DROP TABLE IF EXISTS `viagem_tipo_transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viagem_tipo_transporte` (
  `id_viagem` int NOT NULL,
  `id_transporte` int NOT NULL,
  PRIMARY KEY (`id_viagem`,`id_transporte`),
  KEY `id_transporte` (`id_transporte`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viagem_tipo_transporte`
--

LOCK TABLES `viagem_tipo_transporte` WRITE;
/*!40000 ALTER TABLE `viagem_tipo_transporte` DISABLE KEYS */;
INSERT INTO `viagem_tipo_transporte` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `viagem_tipo_transporte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 19:50:58
