CREATE DATABASE  IF NOT EXISTS `crm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crm`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `idBanco` int(9) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
INSERT INTO `banco` VALUES (1,1,'1','ativado','2018-05-16 21:47:04'),(2,2,'aaa','ativado','2018-05-16 21:47:16');
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER checkBanco
AFTER DELETE ON banco
FOR EACH ROW
UPDATE banco
SET nome=1
WHERE idBanco = 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `orgaoEmissor` varchar(20) DEFAULT NULL,
  `sexo` enum('F','M') NOT NULL,
  `estadoCivil` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `bairro` varchar(200) DEFAULT NULL,
  `cep` varchar(15) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone_1` varchar(13) NOT NULL COMMENT 'importante para localizar a ligacao na discadora',
  `telefone_2` varchar(13) DEFAULT NULL,
  `ocupacao` varchar(100) DEFAULT NULL,
  `peso` varchar(4) DEFAULT NULL,
  `altura` varchar(4) DEFAULT NULL,
  `renda` int(8) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `conta` varchar(10) DEFAULT NULL,
  `nome_benef_1` varchar(60) DEFAULT NULL,
  `nome_benef_2` varchar(60) DEFAULT NULL,
  `nome_benef_3` varchar(60) DEFAULT NULL,
  `nome_benef_4` varchar(60) DEFAULT NULL,
  `nome_benef_5` varchar(60) DEFAULT NULL,
  `parentesco_benef_1` varchar(60) DEFAULT NULL,
  `parentesco_benef_2` varchar(60) DEFAULT NULL,
  `parentesco_benef_3` varchar(60) DEFAULT NULL,
  `parentesco_benef_4` varchar(60) DEFAULT NULL,
  `parentesco_benef_5` varchar(60) DEFAULT NULL,
  `mailing` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nomeMae` varchar(60) DEFAULT NULL,
  `parentePolitico` enum('sim','nao') DEFAULT 'nao',
  `deficienteFisico` text,
  `cpf_benef_1` varchar(11) DEFAULT NULL,
  `cpf_benef_2` varchar(11) DEFAULT NULL,
  `cpf_benef_3` varchar(11) DEFAULT NULL,
  `cpf_benef_4` varchar(11) DEFAULT NULL,
  `cpf_benef_5` varchar(11) DEFAULT NULL,
  `nome_mae_benef_1` varchar(45) DEFAULT NULL,
  `nome_mae_benef_2` varchar(45) DEFAULT NULL,
  `nome_mae_benef_3` varchar(45) DEFAULT NULL,
  `nome_mae_benef_4` varchar(45) DEFAULT NULL,
  `nome_mae_benef_5` varchar(45) DEFAULT NULL,
  `data_nascimento_benef_1` date DEFAULT NULL,
  `data_nascimento_benef_2` date DEFAULT NULL,
  `data_nascimento_benef_3` date DEFAULT NULL,
  `data_nascimento_benef_4` date DEFAULT NULL,
  `data_nascimento_benef_5` date DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (10,'RICARDO ROCHA NOVAIS','99999999999','','','M','','2010-10-06','RUA JOãO GOMES JúNIOR','','JARDIM BONFIGLIOLI','05592001','SãO PAULO','','','1196239471254','','','','',0,'','','','CHEGUEI','','','','','','','','','','123','2018-04-11 12:20:56','','nao','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL),(11,'RICARDO','213','','','M','','2010-10-06','RUA JOãO GOMES JúNIOR','','JARDIM BONFIGLIOLI','05592001','SãO PAULO','','','1111111111111','','','','',0,'','','','CHEGUEI','','','','','','','','','','123','2018-04-11 12:21:29','','nao','','','','','','','','','','','','2018-04-10',NULL,NULL,NULL,NULL),(12,'JOAO','11111111111','','','F','','2010-10-10','','','','','','','','1111111111111','','','','',0,'',NULL,'','','','','','','','','','','','','2018-04-11 12:42:02','','nao','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL),(13,'ADRIANO','1231231','','','M','SOLTEIRO','2010-10-10','RUA JOãO GOMES JúNIOR','','JARDIM BONFIGLIOLI','05592001','SãO PAULO','SP','','123123123','','','','',0,'','','','','','','','','','','','','','','2018-04-11 22:11:05','','nao','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL),(14,'123','123','','','M','','2010-10-10','','','','','','','','12334','','','','',0,'',NULL,'','','','','','','','','','','','','2018-04-13 19:05:00','','nao','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL),(15,'RICRDO','00021331804','','','F','','2010-10-10','','','','','','','','9999999999999','','','','',0,'',NULL,'','','','','','','','','','','','','2018-06-29 23:20:17','','nao','','','','','','','','','','','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefone_1` varchar(13) DEFAULT NULL,
  `telefone_2` varchar(13) DEFAULT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `ip_pabx` varchar(15) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'A','','RUA JOãO GOMES JúNIOR','JARDIM BONFIGLIOLI','05592001','SãO PAULO','','','','','ativado','123','2018-04-10 19:23:00'),(2,'B','','','','','','','','','','ativado','11111','2018-04-10 19:38:41'),(3,'C','','','','','','','','','','ativado','123333','2018-04-10 19:43:18'),(4,'D','','','','','','','','','','ativado','22222','2018-04-10 19:46:21'),(5,'E','','','','','','','','','','ativado','324','2018-04-10 19:47:46'),(6,'F','','','','','','','','','','ativado','55','2018-04-10 19:48:20');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(2) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'SP','São Paulo'),(2,'RJ','Rio de Janeiro');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `idEstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'SOLTEIRO','ativado','2018-04-11 12:01:22');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_pedido_produto`
--

DROP TABLE IF EXISTS `lib_pedido_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_pedido_produto` (
  `idPedidoProduto` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPedidoProduto`),
  KEY `idPedido_lib_pedido_produto` (`idPedido`),
  KEY `idProduto_lib_pedido_produto` (`idProduto`),
  CONSTRAINT `idPedido_lib_pedido_produto` FOREIGN KEY (`idPedido`) REFERENCES `pedido_venda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProduto_lib_pedido_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_pedido_produto`
--

LOCK TABLES `lib_pedido_produto` WRITE;
/*!40000 ALTER TABLE `lib_pedido_produto` DISABLE KEYS */;
INSERT INTO `lib_pedido_produto` VALUES (1,10,1,'2018-04-11 12:20:56'),(2,11,1,'2018-04-11 12:21:29'),(3,12,3,'2018-04-11 22:11:05');
/*!40000 ALTER TABLE `lib_pedido_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_pedido_venda_comissao`
--

DROP TABLE IF EXISTS `lib_pedido_venda_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_pedido_venda_comissao` (
  `idComissao` int(11) NOT NULL AUTO_INCREMENT,
  `idPedidoVenda` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL COMMENT 'usuario que lança no sistema o pgto',
  `dataPagamento` datetime NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipoComissao` enum('pago','estorno','cancelamento') NOT NULL DEFAULT 'pago',
  PRIMARY KEY (`idComissao`),
  KEY `idPedidoVenda_lib_pedido_venda_comissao_idx` (`idPedidoVenda`),
  KEY `idUsuario_lib_pedido_venda_comissao_idx` (`idUsuario`),
  CONSTRAINT `idPedidoVenda_lib_pedido_venda_comissao` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedido_venda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_lib_pedido_venda_comissao` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_pedido_venda_comissao`
--

LOCK TABLES `lib_pedido_venda_comissao` WRITE;
/*!40000 ALTER TABLE `lib_pedido_venda_comissao` DISABLE KEYS */;
INSERT INTO `lib_pedido_venda_comissao` VALUES (14,12,12,'2018-05-02 00:00:00','2018-04-12 18:22:32','pago'),(15,12,12,'2018-04-12 00:00:00','2018-04-12 19:01:55','pago'),(16,12,12,'2018-04-21 00:00:00','2018-04-12 19:13:06','pago');
/*!40000 ALTER TABLE `lib_pedido_venda_comissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_produto_operacao`
--

DROP TABLE IF EXISTS `lib_produto_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_produto_operacao` (
  `idProdutoOperacao` int(9) NOT NULL AUTO_INCREMENT,
  `idProduto` int(9) NOT NULL,
  `idOperacao` int(9) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProdutoOperacao`),
  KEY `idProduto_produto` (`idProduto`),
  KEY `idProduto_operacao` (`idOperacao`),
  CONSTRAINT `idOperacao_lib_produto_operacao` FOREIGN KEY (`idOperacao`) REFERENCES `operacao` (`idOperacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProduto_lib_produto_operacao` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_produto_operacao`
--

LOCK TABLES `lib_produto_operacao` WRITE;
/*!40000 ALTER TABLE `lib_produto_operacao` DISABLE KEYS */;
INSERT INTO `lib_produto_operacao` VALUES (3,3,1,'ativado','2018-04-11 11:52:46'),(4,4,3,'ativado','2018-04-13 19:22:38'),(5,1,1,'ativado','2018-06-01 03:08:06'),(6,2,2,'ativado','2018-06-01 03:08:38');
/*!40000 ALTER TABLE `lib_produto_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_qualidade_pedido_venda`
--

DROP TABLE IF EXISTS `lib_qualidade_pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_qualidade_pedido_venda` (
  `idQualidadePedidoVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idPedidoVenda` int(11) NOT NULL,
  `apresentacao` float(2,1) NOT NULL DEFAULT '0.0',
  `ritmo` float(2,1) NOT NULL DEFAULT '0.0',
  `beneficio` float(2,1) NOT NULL DEFAULT '0.0',
  `pergunta` float(2,1) NOT NULL DEFAULT '0.0',
  `valor` float(2,1) NOT NULL DEFAULT '0.0',
  `objecao` float(2,1) NOT NULL DEFAULT '0.0',
  `pronuncia` float(2,1) NOT NULL DEFAULT '0.0',
  `intonacao` float(2,1) NOT NULL DEFAULT '0.0',
  `cordialidade` float(2,1) NOT NULL DEFAULT '0.0',
  `conclusao` float(2,1) NOT NULL DEFAULT '0.0',
  `mediaPonderada` float(3,1) NOT NULL DEFAULT '0.0',
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idQualidadePedidoVenda`),
  KEY `idQualidadePedidoVenda_lib_qualidade_pedido_venda_idx` (`idPedidoVenda`),
  CONSTRAINT `idQualidadePedidoVenda_lib_qualidade_pedido_venda` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedido_venda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_qualidade_pedido_venda`
--

LOCK TABLES `lib_qualidade_pedido_venda` WRITE;
/*!40000 ALTER TABLE `lib_qualidade_pedido_venda` DISABLE KEYS */;
INSERT INTO `lib_qualidade_pedido_venda` VALUES (1,10,1.5,3.0,2.5,2.5,2.5,2.5,3.0,3.0,3.0,3.0,2.7,'ativado','2018-04-11 12:20:56'),(2,11,4.5,2.5,4.5,5.0,4.5,3.5,2.5,5.0,2.0,3.0,3.7,'ativado','2018-04-11 12:21:29'),(3,12,1.0,0.5,0.5,1.0,0.5,0.5,0.5,4.5,1.0,1.0,1.1,'ativado','2018-04-11 22:11:05');
/*!40000 ALTER TABLE `lib_qualidade_pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_status_pedido_venda`
--

DROP TABLE IF EXISTS `lib_status_pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_status_pedido_venda` (
  `idStatusPedidoVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL DEFAULT '2' COMMENT 'Default 2 para iniciar como pendente',
  `idUsuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idStatusPedidoVenda`),
  KEY `idPedido_lib_status_pedido` (`idPedido`),
  KEY `idStatus_lib_status_pedido` (`idStatus`),
  KEY `idUsuario_lib_status_pedido_venda_idx` (`idUsuario`),
  CONSTRAINT `idPedidoVenda_lib_status_pedido_venda` FOREIGN KEY (`idPedido`) REFERENCES `pedido_venda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idStatus_lib_status_pedido_venda` FOREIGN KEY (`idStatus`) REFERENCES `status_pedido` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_lib_status_pedido_venda` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_status_pedido_venda`
--

LOCK TABLES `lib_status_pedido_venda` WRITE;
/*!40000 ALTER TABLE `lib_status_pedido_venda` DISABLE KEYS */;
INSERT INTO `lib_status_pedido_venda` VALUES (1,10,2,6,'2018-04-11 12:20:56'),(2,11,2,6,'2018-04-11 12:21:29'),(3,11,1,12,'2018-04-11 12:25:40'),(4,11,3,12,'2018-04-11 12:25:44'),(5,10,1,11,'2018-04-11 13:35:39'),(6,12,2,6,'2018-04-11 22:11:05'),(7,12,1,12,'2018-04-11 22:12:00'),(8,11,4,12,'2018-04-11 22:27:54'),(9,11,1,12,'2018-04-11 22:42:28'),(10,10,3,11,'2018-04-12 03:34:18'),(11,10,1,11,'2018-04-12 03:44:20'),(12,12,2,11,'2018-04-12 12:15:37'),(13,12,5,11,'2018-04-12 12:34:57'),(14,12,2,11,'2018-04-12 12:35:59'),(15,12,5,11,'2018-04-12 12:36:07'),(16,12,1,11,'2018-04-12 14:26:41'),(17,11,4,12,'2018-04-12 18:28:16'),(18,12,4,12,'2018-04-12 19:01:32'),(19,12,4,12,'2018-04-12 19:01:44'),(20,12,1,12,'2018-04-12 19:11:26'),(21,12,4,12,'2018-04-12 19:11:34'),(22,12,1,12,'2018-04-12 19:12:08'),(23,10,5,12,'2018-04-12 19:25:09'),(24,11,1,12,'2018-04-12 19:37:15'),(25,11,4,12,'2018-04-12 19:38:35'),(26,12,4,11,'2018-04-13 15:02:52'),(27,12,1,11,'2018-04-13 15:03:47'),(28,12,3,11,'2018-04-15 22:31:15'),(29,10,2,11,'2018-04-15 22:35:41');
/*!40000 ALTER TABLE `lib_status_pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lib_usuario_operacao`
--

DROP TABLE IF EXISTS `lib_usuario_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_usuario_operacao` (
  `idUsuarioOperacao` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idOperacao` int(11) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idUsuarioOperacao`),
  KEY `idUsuario_lib_usuario_empresa_operacao` (`idUsuario`),
  KEY `idOperacao_lib_usuario_empresa_operacao` (`idOperacao`),
  CONSTRAINT `idOperacao_lib_usuario_operacao` FOREIGN KEY (`idOperacao`) REFERENCES `operacao` (`idOperacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_lib_usuario_operacao` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lib_usuario_operacao`
--

LOCK TABLES `lib_usuario_operacao` WRITE;
/*!40000 ALTER TABLE `lib_usuario_operacao` DISABLE KEYS */;
INSERT INTO `lib_usuario_operacao` VALUES (1,6,1,'ativado','2018-04-10 22:01:35'),(2,7,1,'ativado','2018-04-10 22:02:12'),(3,13,3,'ativado','2018-04-13 19:22:11'),(4,6,2,'ativado','2018-06-01 03:09:12');
/*!40000 ALTER TABLE `lib_usuario_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motivo_pedido_nao_venda`
--

DROP TABLE IF EXISTS `motivo_pedido_nao_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivo_pedido_nao_venda` (
  `idMotivo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  PRIMARY KEY (`idMotivo`),
  KEY `idEmpresa_motivo_pedido_nao_venda_idx` (`idEmpresa`),
  CONSTRAINT `idEmpresa_motivo_pedido_nao_venda` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivo_pedido_nao_venda`
--

LOCK TABLES `motivo_pedido_nao_venda` WRITE;
/*!40000 ALTER TABLE `motivo_pedido_nao_venda` DISABLE KEYS */;
INSERT INTO `motivo_pedido_nao_venda` VALUES (1,'SEM DINHEIRO','ativado','2018-04-11 12:41:11',2),(2,'LIGACAO MUDA','ativado','2018-04-11 12:41:19',2),(3,'NAO RESPONDE EMPRESA C','ativado','2018-04-13 17:39:34',3),(4,'OI','ativado','2018-06-29 23:23:45',2),(5,'´','ativado','2018-06-29 23:24:01',2),(6,'TRUE','ativado','2018-06-29 23:24:30',2);
/*!40000 ALTER TABLE `motivo_pedido_nao_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacao`
--

DROP TABLE IF EXISTS `ocupacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocupacao` (
  `idOcupacao` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idOcupacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacao`
--

LOCK TABLES `ocupacao` WRITE;
/*!40000 ALTER TABLE `ocupacao` DISABLE KEYS */;
INSERT INTO `ocupacao` VALUES (1,'analista','2018-06-23 14:32:41'),(2,'pedreiro','2018-06-23 14:32:41');
/*!40000 ALTER TABLE `ocupacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operacao` (
  `idOperacao` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  PRIMARY KEY (`idOperacao`),
  KEY `idEmpresa_operacao_idx` (`idEmpresa`),
  CONSTRAINT `idEmpresa_operacao` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (1,'LAVA JATO','ativado','2018-04-10 22:01:12',2),(2,'MENSALãO','ativado','2018-04-10 23:00:08',2),(3,'PIRA PIRA','ativado','2018-04-13 19:21:52',3),(4,'','ativado','2018-06-29 23:26:36',2),(5,'CCC','ativado','2018-06-29 23:26:44',2),(6,'´','ativado','2018-06-29 23:26:53',2),(7,'\'','ativado','2018-06-29 23:26:59',2);
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgao_emissor`
--

DROP TABLE IF EXISTS `orgao_emissor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgao_emissor` (
  `idOrgaoEmissor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idOrgaoEmissor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgao_emissor`
--

LOCK TABLES `orgao_emissor` WRITE;
/*!40000 ALTER TABLE `orgao_emissor` DISABLE KEYS */;
INSERT INTO `orgao_emissor` VALUES (1,'SSP','2018-06-23 12:31:21'),(2,'RJ','2018-06-23 12:31:21');
/*!40000 ALTER TABLE `orgao_emissor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentesco`
--

DROP TABLE IF EXISTS `parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parentesco` (
  `idParentesco` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idParentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentesco`
--

LOCK TABLES `parentesco` WRITE;
/*!40000 ALTER TABLE `parentesco` DISABLE KEYS */;
INSERT INTO `parentesco` VALUES (1,'PAI','ativado','2018-04-11 12:00:44');
/*!40000 ALTER TABLE `parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_nao_venda`
--

DROP TABLE IF EXISTS `pedido_nao_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_nao_venda` (
  `idPedidoNaoVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idMotivo` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idPedidoNaoVenda`),
  KEY `idCliente_pedidonaovenda` (`idCliente`),
  KEY `idEmpresa_pedidonaovenda` (`idEmpresa`),
  KEY `idUsuario_pedidonaovenda` (`idUsuario`),
  KEY `idMotivo_pedidonaovenda_idx` (`idMotivo`),
  CONSTRAINT `idCliente_pedido_nao_venda` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idEmpresa_pedido_nao_venda` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idMotivo_pedido_nao_venda` FOREIGN KEY (`idMotivo`) REFERENCES `motivo_pedido_nao_venda` (`idMotivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_pedido_nao_venda` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_nao_venda`
--

LOCK TABLES `pedido_nao_venda` WRITE;
/*!40000 ALTER TABLE `pedido_nao_venda` DISABLE KEYS */;
INSERT INTO `pedido_nao_venda` VALUES (1,12,2,1,1,'2018-04-11 12:42:02'),(2,14,3,3,13,'2018-04-13 19:05:00'),(3,15,2,1,11,'2018-06-29 23:20:17');
/*!40000 ALTER TABLE `pedido_nao_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_venda`
--

DROP TABLE IF EXISTS `pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_venda` (
  `idPedidoVenda` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `obs` longtext,
  `numeroProposta` varchar(11) DEFAULT '0',
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  PRIMARY KEY (`idPedidoVenda`),
  KEY `idEmpresa_pedido` (`idEmpresa`),
  KEY `idUsuario_pedido` (`idUsuario`),
  KEY `idCliente_pedido` (`idCliente`),
  KEY `idStatus_pedido` (`idStatus`),
  CONSTRAINT `idCliente_pedido_venda` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idEmpresa_pedido_venda` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idStatus_pedido_venda` FOREIGN KEY (`idStatus`) REFERENCES `status_pedido` (`idStatus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUsuario_pedido_venda` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_venda`
--

LOCK TABLES `pedido_venda` WRITE;
/*!40000 ALTER TABLE `pedido_venda` DISABLE KEYS */;
INSERT INTO `pedido_venda` VALUES (10,2,6,10,2,'2018-04-11 12:20:56','','0','ativado'),(11,2,6,11,4,'2018-04-11 12:21:29','okkkkkkkkkkkkkkkkkkk\r\n','0','ativado'),(12,2,6,13,3,'2018-04-11 22:11:05','daksduiasdasDAKSDUIASDASDBASHDASDAKSDUIASDASDBASHDASDAKSDUIASDASDBASHDASDAKSDUIASDASDBASHDASDAKSDUIASDASDBASHDASdbashdasioio','0','ativado');
/*!40000 ALTER TABLE `pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `descricao` mediumtext,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `precoVenda` float(8,2) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `vitalicio` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  `primeiraParcela` float(8,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idProduto`),
  KEY `idEmpresa_produto_idx` (`idEmpresa`),
  CONSTRAINT `idEmpresa_produto` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'ABS PREMIAVEL 120 - ESPECIAL','A PRáTICA COTIDIANA PROVA QUE O COMPROMETIMENTO E','ativado',23.30,'2018-04-10 21:58:45',2,30.00,50.00),(2,'ABS PREMIAVEL 200','CAROS AMIGOS, A EXECUçãO DOS PONTOS DO PROGRAMA NOS OBRIGA à ANáLISE DE TODOS','ativado',123.56,'2018-04-10 22:48:47',2,15.00,40.00),(3,'DENTALPAR','PLANOS PARA DENTES 120 %','ativado',50.00,'2018-04-11 11:51:08',2,10.00,20.00),(4,'PROD C','','ativado',100.00,'2018-04-13 19:21:14',3,1.00,22.00),(5,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:39:31',2,11.00,222.00),(6,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:42:24',2,11.00,222.00),(7,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:43:42',2,11.00,222.00),(8,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:46:27',2,11.00,222.00),(9,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:46:50',2,11.00,222.00),(10,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:48:46',2,11.00,222.00),(11,'1','1','ativado',1.00,'2018-06-29 23:50:31',1,1.00,1.00),(12,'1','14444444444444444444444444444444444444444','ativado',44.00,'2018-06-29 23:51:03',1,441.00,44441.00),(13,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:52:14',2,11.00,222.00),(14,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-29 23:53:51',2,11.00,222.00),(15,'PRODUTO 1','DESCRICAOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO','ativado',90000.00,'2018-06-30 00:13:07',2,11.00,222.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_pedido`
--

DROP TABLE IF EXISTS `status_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_pedido` (
  `idStatus` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_pedido`
--

LOCK TABLES `status_pedido` WRITE;
/*!40000 ALTER TABLE `status_pedido` DISABLE KEYS */;
INSERT INTO `status_pedido` VALUES (1,'APROVADO','ativado','2018-04-11 12:00:59'),(2,'PENDENTE','ativado','2018-04-11 12:19:48'),(3,'REPROVADO','ativado','2018-04-11 12:19:57'),(4,'CANCELADO','ativado','2018-04-11 22:27:44'),(5,'ANÁLISE','ativado','2018-04-12 12:29:13');
/*!40000 ALTER TABLE `status_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transposta`
--

DROP TABLE IF EXISTS `transposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transposta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPedidoVenda` int(11) NOT NULL,
  `idComissao` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  `soma` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPedidoVenda_transposta_relatorio_comissao_idx` (`idPedidoVenda`),
  KEY `idComissao_transposta_idx` (`idComissao`),
  CONSTRAINT `idComissao_transposta` FOREIGN KEY (`idComissao`) REFERENCES `lib_pedido_venda_comissao` (`idComissao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPedidoVenda_transposta` FOREIGN KEY (`idPedidoVenda`) REFERENCES `pedido_venda` (`idPedidoVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transposta`
--

LOCK TABLES `transposta` WRITE;
/*!40000 ALTER TABLE `transposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `transposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(100) NOT NULL DEFAULT '123',
  `perfil` enum('agente','backoffice','supervisor','gerente','admin') NOT NULL DEFAULT 'agente',
  `status` enum('ativado','desativado') NOT NULL DEFAULT 'ativado',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idEmpresa` int(11) NOT NULL,
  `meta` float(8,2) DEFAULT '0.00',
  PRIMARY KEY (`idUsuario`),
  KEY `idEmpresa_usuario_idx` (`idEmpresa`),
  CONSTRAINT `idEmpresa_usuario` FOREIGN KEY (`idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'ANDRE','1','B.ANDRE','202cb962ac59075b964b07152d234b70','admin','ativado','2018-04-10 19:38:41',2,0.00),(2,'DAVI','0','C.DAVI','202cb962ac59075b964b07152d234b70','admin','ativado','2018-04-10 19:43:18',3,0.00),(3,'VERA LUCIA','22222222222','D.VERA','202cb962ac59075b964b07152d234b70','admin','ativado','2018-04-10 19:46:21',4,0.00),(4,'PEDRO','0','E.PEDRO','202cb962ac59075b964b07152d234b70','admin','ativado','2018-04-10 19:47:46',5,0.00),(5,'TONY','0','F.TONY','202cb962ac59075b964b07152d234b70','admin','ativado','2018-04-10 19:48:20',6,0.00),(6,'JOAO F','1123','JOAO','c4ca4238a0b923820dcc509a6f75849b','agente','ativado','2018-04-10 21:08:28',2,0.00),(7,'BRUNA','9999','B.BRUNA','202cb962ac59075b964b07152d234b70','agente','ativado','2018-04-10 21:09:30',2,1123.00),(8,'VALTER','12399','B.VALTER','202cb962ac59075b964b07152d234b70','supervisor','ativado','2018-04-10 21:10:20',2,200.00),(9,'CAIO','988','C.CAIO','202cb962ac59075b964b07152d234b70','agente','ativado','2018-04-10 21:10:48',2,500.00),(10,'RAFAEL','1881','B.RAFAEL','202cb962ac59075b964b07152d234b70','supervisor','ativado','2018-04-10 21:11:17',2,123.00),(11,'RICARDO','213','B.RICARDO','c4ca4238a0b923820dcc509a6f75849b','gerente','ativado','2018-04-10 21:11:42',2,1.00),(12,'GLAUCO','123','B.GLAUCO','202cb962ac59075b964b07152d234b70','backoffice','ativado','2018-04-10 21:12:05',2,1.00),(13,'FILIPE','2','C.FILIPE','202cb962ac59075b964b07152d234b70','agente','ativado','2018-04-13 19:02:55',3,2030.00),(14,'ALMIR','234','C.ALMIR','202cb962ac59075b964b07152d234b70','backoffice','ativado','2018-04-13 19:20:48',3,432.00);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_banco`
--

DROP TABLE IF EXISTS `view_banco`;
/*!50001 DROP VIEW IF EXISTS `view_banco`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_banco` (
  `idBanco` tinyint NOT NULL,
  `codigo` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_cidade`
--

DROP TABLE IF EXISTS `view_cidade`;
/*!50001 DROP VIEW IF EXISTS `view_cidade`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_cidade` (
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_cliente`
--

DROP TABLE IF EXISTS `view_cliente`;
/*!50001 DROP VIEW IF EXISTS `view_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_cliente` (
  `idCliente` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `orgaoEmissor` tinyint NOT NULL,
  `sexo` tinyint NOT NULL,
  `estadoCivil` tinyint NOT NULL,
  `dataNascimento` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefone_1` tinyint NOT NULL,
  `telefone_2` tinyint NOT NULL,
  `ocupacao` tinyint NOT NULL,
  `peso` tinyint NOT NULL,
  `altura` tinyint NOT NULL,
  `renda` tinyint NOT NULL,
  `banco` tinyint NOT NULL,
  `agencia` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `nome_benef_1` tinyint NOT NULL,
  `nome_benef_2` tinyint NOT NULL,
  `nome_benef_3` tinyint NOT NULL,
  `nome_benef_4` tinyint NOT NULL,
  `nome_benef_5` tinyint NOT NULL,
  `parentesco_benef_1` tinyint NOT NULL,
  `parentesco_benef_2` tinyint NOT NULL,
  `parentesco_benef_3` tinyint NOT NULL,
  `parentesco_benef_4` tinyint NOT NULL,
  `parentesco_benef_5` tinyint NOT NULL,
  `mailing` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_empresa`
--

DROP TABLE IF EXISTS `view_empresa`;
/*!50001 DROP VIEW IF EXISTS `view_empresa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_empresa` (
  `idEmpresa` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cnpj` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefone_1` tinyint NOT NULL,
  `telefone_2` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `ip_pabx` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_empresa_ativado`
--

DROP TABLE IF EXISTS `view_empresa_ativado`;
/*!50001 DROP VIEW IF EXISTS `view_empresa_ativado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_empresa_ativado` (
  `idEmpresa` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cnpj` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `telefone_1` tinyint NOT NULL,
  `telefone_2` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `ip_pabx` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_estado`
--

DROP TABLE IF EXISTS `view_estado`;
/*!50001 DROP VIEW IF EXISTS `view_estado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_estado` (
  `idEstado` tinyint NOT NULL,
  `sigla` tinyint NOT NULL,
  `descricao` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_estado_civil`
--

DROP TABLE IF EXISTS `view_estado_civil`;
/*!50001 DROP VIEW IF EXISTS `view_estado_civil`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_estado_civil` (
  `idEstadoCivil` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_lib_produto_operacao`
--

DROP TABLE IF EXISTS `view_lib_produto_operacao`;
/*!50001 DROP VIEW IF EXISTS `view_lib_produto_operacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_lib_produto_operacao` (
  `produto` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL,
  `operacao` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `idProdutoOperacao` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_lib_usuario_empresa`
--

DROP TABLE IF EXISTS `view_lib_usuario_empresa`;
/*!50001 DROP VIEW IF EXISTS `view_lib_usuario_empresa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_lib_usuario_empresa` (
  `usuario` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `status` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_lib_usuario_operacao`
--

DROP TABLE IF EXISTS `view_lib_usuario_operacao`;
/*!50001 DROP VIEW IF EXISTS `view_lib_usuario_operacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_lib_usuario_operacao` (
  `idUsuarioOperacao` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `operacao` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_meta_usuario`
--

DROP TABLE IF EXISTS `view_meta_usuario`;
/*!50001 DROP VIEW IF EXISTS `view_meta_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_meta_usuario` (
  `idUsuario` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `perfil` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `meta` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_motivo_pedido_nao_venda`
--

DROP TABLE IF EXISTS `view_motivo_pedido_nao_venda`;
/*!50001 DROP VIEW IF EXISTS `view_motivo_pedido_nao_venda`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_motivo_pedido_nao_venda` (
  `idMotivo` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_ocupacao`
--

DROP TABLE IF EXISTS `view_ocupacao`;
/*!50001 DROP VIEW IF EXISTS `view_ocupacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_ocupacao` (
  `idOcupacao` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_operacao`
--

DROP TABLE IF EXISTS `view_operacao`;
/*!50001 DROP VIEW IF EXISTS `view_operacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_operacao` (
  `idOperacao` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_operacao_ativado`
--

DROP TABLE IF EXISTS `view_operacao_ativado`;
/*!50001 DROP VIEW IF EXISTS `view_operacao_ativado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_operacao_ativado` (
  `idOperacao` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_orgao_emissor`
--

DROP TABLE IF EXISTS `view_orgao_emissor`;
/*!50001 DROP VIEW IF EXISTS `view_orgao_emissor`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_orgao_emissor` (
  `nome` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_parentesco`
--

DROP TABLE IF EXISTS `view_parentesco`;
/*!50001 DROP VIEW IF EXISTS `view_parentesco`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_parentesco` (
  `idParentesco` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pedido_nao_venda`
--

DROP TABLE IF EXISTS `view_pedido_nao_venda`;
/*!50001 DROP VIEW IF EXISTS `view_pedido_nao_venda`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pedido_nao_venda` (
  `idPedidoNaoVenda` tinyint NOT NULL,
  `idCliente` tinyint NOT NULL,
  `idEmpresa` tinyint NOT NULL,
  `idMotivo` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `motivo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pedido_venda`
--

DROP TABLE IF EXISTS `view_pedido_venda`;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pedido_venda` (
  `idPedidoVenda` tinyint NOT NULL,
  `idQualidadePedidoVenda` tinyint NOT NULL,
  `mediaPonderada` tinyint NOT NULL,
  `idEmpresa` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `idCliente` tinyint NOT NULL,
  `idStatus` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `statusPedido` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pedido_venda_aprovado`
--

DROP TABLE IF EXISTS `view_pedido_venda_aprovado`;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_aprovado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pedido_venda_aprovado` (
  `idPedidoVenda` tinyint NOT NULL,
  `idQualidadePedidoVenda` tinyint NOT NULL,
  `mediaPonderada` tinyint NOT NULL,
  `idEmpresa` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `idCliente` tinyint NOT NULL,
  `idStatus` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `statusPedido` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pedido_venda_pendente`
--

DROP TABLE IF EXISTS `view_pedido_venda_pendente`;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_pendente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pedido_venda_pendente` (
  `idPedidoVenda` tinyint NOT NULL,
  `idQualidadePedidoVenda` tinyint NOT NULL,
  `mediaPonderada` tinyint NOT NULL,
  `idEmpresa` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `idCliente` tinyint NOT NULL,
  `idStatus` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `statusPedido` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_pedido_venda_reprovado`
--

DROP TABLE IF EXISTS `view_pedido_venda_reprovado`;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_reprovado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_pedido_venda_reprovado` (
  `idPedidoVenda` tinyint NOT NULL,
  `idQualidadePedidoVenda` tinyint NOT NULL,
  `mediaPonderada` tinyint NOT NULL,
  `idEmpresa` tinyint NOT NULL,
  `idUsuario` tinyint NOT NULL,
  `idCliente` tinyint NOT NULL,
  `idStatus` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `usuario` tinyint NOT NULL,
  `empresa` tinyint NOT NULL,
  `statusPedido` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_produto`
--

DROP TABLE IF EXISTS `view_produto`;
/*!50001 DROP VIEW IF EXISTS `view_produto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_produto` (
  `idProduto` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `descricao` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL,
  `vitalicio` tinyint NOT NULL,
  `primeiraParcela` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_produto_ativado`
--

DROP TABLE IF EXISTS `view_produto_ativado`;
/*!50001 DROP VIEW IF EXISTS `view_produto_ativado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_produto_ativado` (
  `idProduto` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `descricao` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `precoVenda` tinyint NOT NULL,
  `vitalicio` tinyint NOT NULL,
  `primeiraParcela` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_robo`
--

DROP TABLE IF EXISTS `view_robo`;
/*!50001 DROP VIEW IF EXISTS `view_robo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_robo` (
  `cliente` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `rg` tinyint NOT NULL,
  `orgaoEmissor` tinyint NOT NULL,
  `codSexo` tinyint NOT NULL,
  `codEstadoCivil` tinyint NOT NULL,
  `dataNascimento` tinyint NOT NULL,
  `endereco` tinyint NOT NULL,
  `complemento` tinyint NOT NULL,
  `cep` tinyint NOT NULL,
  `bairro` tinyint NOT NULL,
  `cidade` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `telefone_1` tinyint NOT NULL,
  `telefone_2` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `ocupacao` tinyint NOT NULL,
  `peso` tinyint NOT NULL,
  `altura` tinyint NOT NULL,
  `agencia` tinyint NOT NULL,
  `digitoAgencia` tinyint NOT NULL,
  `conta` tinyint NOT NULL,
  `nome_benef_1` tinyint NOT NULL,
  `nome_benef_2` tinyint NOT NULL,
  `nome_benef_3` tinyint NOT NULL,
  `nome_benef_4` tinyint NOT NULL,
  `nome_benef_5` tinyint NOT NULL,
  `parentesco_benef_1` tinyint NOT NULL,
  `parentesco_benef_2` tinyint NOT NULL,
  `parentesco_benef_3` tinyint NOT NULL,
  `parentesco_benef_4` tinyint NOT NULL,
  `parentesco_benef_5` tinyint NOT NULL,
  `codOcupacao` tinyint NOT NULL,
  `codProduto` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_status_pedido`
--

DROP TABLE IF EXISTS `view_status_pedido`;
/*!50001 DROP VIEW IF EXISTS `view_status_pedido`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_status_pedido` (
  `idStatus` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `view_tempo_pausa`
--

DROP TABLE IF EXISTS `view_tempo_pausa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `view_tempo_pausa` (
  `tempoPausa` time DEFAULT NULL,
  `qtdPausa` bigint(21) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_tempo_pausa`
--

LOCK TABLES `view_tempo_pausa` WRITE;
/*!40000 ALTER TABLE `view_tempo_pausa` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_tempo_pausa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_usuario`
--

DROP TABLE IF EXISTS `view_usuario`;
/*!50001 DROP VIEW IF EXISTS `view_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_usuario` (
  `idUsuario` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `perfil` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `meta` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL,
  `empresa` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_usuario_ativado`
--

DROP TABLE IF EXISTS `view_usuario_ativado`;
/*!50001 DROP VIEW IF EXISTS `view_usuario_ativado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_usuario_ativado` (
  `idUsuario` tinyint NOT NULL,
  `nome` tinyint NOT NULL,
  `cpf` tinyint NOT NULL,
  `login` tinyint NOT NULL,
  `senha` tinyint NOT NULL,
  `perfil` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `timestamp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'crm'
--

--
-- Dumping routines for database 'crm'
--
/*!50003 DROP FUNCTION IF EXISTS `calculaMedia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculaMedia`(`apresentacao` FLOAT(4,2), `ritmo` FLOAT(4,2), `beneficio` FLOAT(4,2), `pergunta` FLOAT(4,2), `valor` FLOAT(4,2), `objecao` FLOAT(4,2), `pronuncia` FLOAT(4,2), `intonacao` FLOAT(4,2), `cordialidade` FLOAT(4,2), `conclusao` FLOAT(4,2)) RETURNS float(4,2)
BEGIN
 declare mediaPonderada float(4,2);

 set mediaPonderada = (((apresentacao+ritmo+beneficio+pergunta+valor+objecao+pronuncia+intonacao+cordialidade+conclusao)/10));
RETURN mediaPonderada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CORRIGECEP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CORRIGECEP`(`cep` VARCHAR(8)) RETURNS varchar(9) CHARSET utf8
BEGIN
declare cep2 varchar(9);

set cep2 =  concat(substr(cep,1,5),'-',substr(cep,6,3));

return cep2;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CORRIGEDATA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CORRIGEDATA`(`dataNascimento` DATE) RETURNS varchar(10) CHARSET utf8
BEGIN
declare ano int;
declare mes int;
declare dia int;

set ano = substr(dataNascimento,1,4);
set mes = substr(dataNascimento,6,2);
set dia = substr(dataNascimento,9,2);
return concat(dia,'/',mes,'/',ano);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `DIGITOAGENCIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `DIGITOAGENCIA`(`agencia` VARCHAR(10)) RETURNS int(11)
BEGIN
declare digitoAgencia int;
set digitoAgencia = substr(agencia,-1);

return digitoAgencia;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VERIFICAESTADOCIVIL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VERIFICAESTADOCIVIL`(`estadoCivil` VARCHAR(45)) RETURNS int(11)
BEGIN
declare codEstadoCivil int;

case 
when estadoCivil = 'SOLTEIRO' then 
	set codEstadoCivil = 1;
when estadoCivil = 'VIÚVO' then 
	set codEstadoCivil = 2;
when estadoCivil = 'CASADO' then 
	set codEstadoCivil = 3;
when estadoCivil = 'DESQUITADO' then 
	set codEstadoCivil = 4;
when estadoCivil = 'DIVORCIADO' then 
	set codEstadoCivil = 5;
    end case;
    return codEstadoCivil;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VERIFICAPRODUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VERIFICAPRODUTO`(`precoVenda` INT) RETURNS int(11)
BEGIN
declare codProduto int;

case 
when precoVenda = 11 then 
	set codProduto = 9;
when precoVenda = 22 then 
	set codProduto = 15;
when precoVenda = 44 then 
	set codProduto = 20;
when precoVenda = 66 then 
	set codProduto = 27;
    end case;
    return codProduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VERIFICASEXO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VERIFICASEXO`(`sexo` VARCHAR(1)) RETURNS int(11)
BEGIN
declare codSexo int;
if (sexo = 'M') then set codSexo= 1;
else set codSexo= 2;
 end if;


RETURN codSexo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_lib_empresa_operacao_idEmpresaOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lib_empresa_operacao_idEmpresaOperacao`(IN `idEmpresaOperacao` INT)
BEGIN

delete from lib_empresa_operacao where lib_empresa_operacao.idEmpresaOperacao = idEmpresaOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_lib_pedido_venda_comissao_idComissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lib_pedido_venda_comissao_idComissao`(IN `idComissao` INT)
BEGIN

delete from lib_pedido_venda_comissao where 

lib_pedido_venda_comissao.idComissao = idComissao 
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_lib_produto_operacao_idProdutoOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lib_produto_operacao_idProdutoOperacao`(IN `idProdutoOperacao` INT)
BEGIN
delete from lib_produto_operacao where lib_produto_operacao.idProdutoOperacao = idProdutoOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_lib_usuario_empresa_idUsuarioEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lib_usuario_empresa_idUsuarioEmpresa`(IN `idUsuarioEmpresa` INT)
BEGIN
delete from lib_usuario_empresa where lib_usuario_empresa.idUsuarioEmpresa = idUsuarioEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_lib_usuario_operacao_idUsuarioOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_lib_usuario_operacao_idUsuarioOperacao`(IN `idUsuarioOperacao` INT)
BEGIN
delete from lib_usuario_operacao where lib_usuario_operacao.idUsuarioOperacao = idUsuarioOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_empresa`(IN `nome` VARCHAR(45), IN `cnpj` VARCHAR(25), IN `endereco` VARCHAR(100), IN `bairro` VARCHAR(45), IN `cep` VARCHAR(8), IN `cidade` VARCHAR(45), IN `estado` VARCHAR(2), IN `email` VARCHAR(60), IN `telefone_1` VARCHAR(13), IN `telefone_2` VARCHAR(13), IN `ip_pabx` VARCHAR(15))
BEGIN
INSERT INTO empresa
(nome,
cnpj,
endereco,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ip_pabx)
VALUES
(nome,
cnpj,
endereco,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ip_pabx);

select max(idEmpresa) into @idEmpresa from empresa;

set @nomeEmpresa = concat('admin.',nome);

insert into usuario (
nome,
cpf,
login,
senha,
perfil,
status,
idEmpresa) 
VALUE (
@nomeEmpresa,
0,
@nomeEmpresa,
md5('123'),
'admin',
'ativado',
@idEmpresa);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_lib_empresa_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_lib_empresa_operacao`(IN `idEmpresa` INT, IN `idOperacao` INT)
BEGIN
insert into lib_empresa_operacao (idEmpresa,idOperacao) value (idEmpresa,idOperacao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_lib_pedido_venda_comissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_lib_pedido_venda_comissao`(IN `idPedidoVenda` INT, IN `idUsuario` INT, IN `tipoComissao` ENUM('pago','estorno','cancelamento'), IN `dataPagamento` DATE)
BEGIN
insert into lib_pedido_venda_comissao (
idPedidoVenda,
idUsuario,
tipoComissao,
dataPagamento
) value (
idPedidoVenda,
idUsuario,
tipoComissao,
dataPagamento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_lib_produto_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_lib_produto_operacao`(IN `idProduto` INT, IN `idOperacao` INT)
BEGIN
insert into lib_produto_operacao (idProduto,idOperacao) 
value (idProduto,idOperacao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_lib_usuario_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_lib_usuario_empresa`(IN `idUsuario` INT, IN `idEmpresa` INT)
BEGIN
insert into lib_usuario_empresa (idUsuario,idEmpresa) value (idUsuario,idEmpresa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_lib_usuario_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_lib_usuario_operacao`(IN `idUsuario` INT, IN `idOperacao` INT)
BEGIN
insert into lib_usuario_operacao (idUsuario,idOperacao) 
value (idUsuario,idOperacao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_motivo_pedido_nao_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_motivo_pedido_nao_venda`(IN `nome` VARCHAR(200), IN `idEmpresa` INT)
BEGIN
insert into motivo_pedido_nao_venda (nome,idEmpresa) value (nome,idEmpresa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_operacao`(IN `nome` VARCHAR(45), IN `idEmpresa` INT)
BEGIN
INSERT INTO operacao
(nome,idEmpresa)
VALUES
(nome,idEmpresa);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_pedido_nao_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_pedido_nao_venda`(IN `nome` VARCHAR(60), IN `cpf` VARCHAR(11), IN `rg` VARCHAR(15), IN `orgaoEmissor` VARCHAR(20), IN `sexo` ENUM('F','M'), IN `estadoCivil` VARCHAR(25), IN `dataNascimento` DATE, IN `endereco` VARCHAR(100), IN `complemento` VARCHAR(20), IN `bairro` VARCHAR(45), IN `cep` VARCHAR(8), IN `cidade` VARCHAR(20), IN `estado` VARCHAR(2), IN `email` VARCHAR(45), IN `telefone_1` VARCHAR(13), IN `telefone_2` VARCHAR(13), IN `ocupacao` VARCHAR(100), IN `peso` VARCHAR(4), IN `altura` VARCHAR(4), IN `renda` VARCHAR(9), IN `banco` VARCHAR(45), IN `agencio` VARCHAR(10), IN `conta` VARCHAR(10), IN `nome_benef_1` VARCHAR(60), IN `nome_benef_2` VARCHAR(60), IN `nome_benef_3` VARCHAR(60), IN `nome_benef_4` VARCHAR(60), IN `nome_benef_5` VARCHAR(60), IN `parentesco_benef_1` VARCHAR(60), IN `parentesco_benef_2` VARCHAR(60), IN `parentesco_benef_3` VARCHAR(60), IN `parentesco_benef_4` VARCHAR(60), IN `parentesco_benef_5` VARCHAR(60), IN `mailing` VARCHAR(100), IN `nomeMae` VARCHAR(60), IN `deficienteFisico` TEXT(200), IN `parentePolitico` ENUM('sim','nao'), IN `idEmpresa` INT, IN `idUsuario` INT, IN `idMotivo` INT, IN `cpf_benef_1` VARCHAR(11), IN `cpf_benef_2` VARCHAR(11), IN `cpf_benef_3` VARCHAR(11), IN `cpf_benef_4` VARCHAR(11), IN `cpf_benef_5` VARCHAR(11), IN `nome_mae_benef_1` VARCHAR(60), IN `nome_mae_benef_2` VARCHAR(60), IN `nome_mae_benef_3` VARCHAR(60), IN `nome_mae_benef_4` VARCHAR(60), IN `nome_mae_benef_5` VARCHAR(60), IN `data_nascimento_benef_1` DATE, IN `data_nascimento_benef_2` DATE, IN `data_nascimento_benef_3` DATE, IN `data_nascimento_benef_4` DATE, IN `data_nascimento_benef_5` DATE)
BEGIN
INSERT INTO cliente
(
nome,
cpf,
rg,
orgaoEmissor,
sexo,
estadoCivil,
dataNascimento,
endereco,
complemento,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ocupacao,
peso,
altura,
renda,
banco,
agencia,
conta,
nome_benef_1,
nome_benef_2,
nome_benef_3,
nome_benef_4,
nome_benef_5,
parentesco_benef_1,
parentesco_benef_2,
parentesco_benef_3,
parentesco_benef_4,
parentesco_benef_5,
mailing,
nomeMae,
parentePolitico,
deficienteFisico,
cpf_benef_1,
cpf_benef_2,
cpf_benef_3,
cpf_benef_4,
cpf_benef_5,
nome_mae_benef_1,
nome_mae_benef_2,
nome_mae_benef_3,
nome_mae_benef_4,
nome_mae_benef_5,
data_nascimento_benef_1,
data_nascimento_benef_2,
data_nascimento_benef_3,
data_nascimento_benef_4,
data_nascimento_benef_5)
VALUES
(nome,
cpf,
rg,
orgaoEmissor,
sexo,
estadoCivil,
dataNascimento,
endereco,
complemento,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ocupacao,
peso,
altura,
renda,
banco,
agencia,
conta,
nome_benef_1,
nome_benef_2,
nome_benef_3,
nome_benef_4,
nome_benef_5,
parentesco_benef_1,
parentesco_benef_2,
parentesco_benef_3,
parentesco_benef_4,
parentesco_benef_5,
mailing,
nomeMae,
parentePolitico,
deficienteFisico,
cpf_benef_1,
cpf_benef_2,
cpf_benef_3,
cpf_benef_4,
cpf_benef_5,
nome_mae_benef_1,
nome_mae_benef_2,
nome_mae_benef_3,
nome_mae_benef_4,
nome_mae_benef_5,
data_nascimento_benef_1,
data_nascimento_benef_2,
data_nascimento_benef_3,
data_nascimento_benef_4,
data_nascimento_benef_5);

select max(idCliente) into @idCliente from cliente;

insert into pedido_nao_venda (
pedido_nao_venda.idEmpresa,
pedido_nao_venda.idUsuario,
pedido_nao_venda.idCliente,
pedido_nao_venda.idMotivo
) 
value (
idEmpresa,
idUsuario,
@idCliente,
idMotivo
);

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_pedido_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_pedido_venda`(IN `nome` VARCHAR(60), IN `cpf` VARCHAR(11), IN `rg` VARCHAR(15), IN `orgaoEmissor` VARCHAR(20), IN `sexo` ENUM('F','M'), IN `estadoCivil` VARCHAR(25), IN `dataNascimento` DATE, IN `endereco` VARCHAR(100), IN `complemento` VARCHAR(45), IN `bairro` VARCHAR(20), IN `cep` VARCHAR(8), IN `cidade` VARCHAR(20), IN `estado` VARCHAR(2), IN `email` VARCHAR(45), IN `telefone_1` VARCHAR(13), IN `telefone_2` VARCHAR(13), IN `ocupacao` VARCHAR(100), IN `peso` VARCHAR(4), IN `altura` VARCHAR(4), IN `renda` VARCHAR(9), IN `banco` VARCHAR(45), IN `agencia` VARCHAR(10), IN `conta` VARCHAR(10), IN `nome_benef_1` VARCHAR(60), IN `nome_benef_2` VARCHAR(60), IN `nome_benef_3` VARCHAR(60), IN `nome_benef_4` VARCHAR(60), IN `nome_benef_5` VARCHAR(60), IN `parentesco_benef_1` VARCHAR(60), IN `parentesco_benef_2` VARCHAR(60), IN `parentesco_benef_3` VARCHAR(60), IN `parentesco_benef_4` VARCHAR(60), IN `parentesco_benef_5` VARCHAR(60), IN `mailing` VARCHAR(100), IN `nomeMae` VARCHAR(60), IN `deficienteFisico` TEXT(200), IN `parentePolitico` ENUM('sim','nao'), IN `idEmpresa` INT, IN `idUsuario` INT, IN `idProduto` INT, IN `cpf_benef_1` VARCHAR(11), IN `cpf_benef_2` VARCHAR(11), IN `cpf_benef_3` VARCHAR(11), IN `cpf_benef_4` VARCHAR(11), IN `cpf_benef_5` VARCHAR(11), IN `nome_mae_benef_1` VARCHAR(45), IN `nome_mae_benef_2` VARCHAR(45), IN `nome_mae_benef_3` VARCHAR(45), IN `nome_mae_benef_4` VARCHAR(45), IN `nome_mae_benef_5` VARCHAR(45), IN `data_nascimento_benef_1` DATE, IN `data_nascimento_benef_2` DATE, IN `data_nascimento_benef_3` DATE, IN `data_nascimento_benef_4` DATE, IN `data_nascimento_benef_5` DATE)
BEGIN
Declare exit handler for sqlexception 
	begin
		rollback; 
	end;

declare exit handler for sqlwarning
	begin
		rollback;
    end;
     
start transaction;

INSERT INTO cliente
(
nome,
cpf,
rg,
orgaoEmissor,
sexo,
estadoCivil,
dataNascimento,
endereco,
complemento,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ocupacao,
peso,
altura,
renda,
banco,
agencia,
conta,
nome_benef_1,
nome_benef_2,
nome_benef_3,
nome_benef_4,
nome_benef_5,
parentesco_benef_1,
parentesco_benef_2,
parentesco_benef_3,
parentesco_benef_4,
parentesco_benef_5,
mailing,
nomeMae,
parentePolitico,
deficienteFisico,
cpf_benef_1,
cpf_benef_2,
cpf_benef_3,
cpf_benef_4,
cpf_benef_5,
nome_mae_benef_1,
nome_mae_benef_2,
nome_mae_benef_3,
nome_mae_benef_4,
nome_mae_benef_5,
data_nascimento_benef_1,
data_nascimento_benef_2,
data_nascimento_benef_3,
data_nascimento_benef_4,
data_nascimento_benef_5
)
VALUES
(nome,
cpf,
rg,
orgaoEmissor,
sexo,
estadoCivil,
dataNascimento,
endereco,
complemento,
bairro,
cep,
cidade,
estado,
email,
telefone_1,
telefone_2,
ocupacao,
peso,
altura,
renda,
banco,
agencia,
conta,
nome_benef_1,
nome_benef_2,
nome_benef_3,
nome_benef_4,
nome_benef_5,
parentesco_benef_1,
parentesco_benef_2,
parentesco_benef_3,
parentesco_benef_4,
parentesco_benef_5,
mailing,
nomeMae,
parentePolitico,
deficienteFisico,
cpf_benef_1,
cpf_benef_2,
cpf_benef_3,
cpf_benef_4,
cpf_benef_5,
nome_mae_benef_1,
nome_mae_benef_2,
nome_mae_benef_3,
nome_mae_benef_4,
nome_mae_benef_5,
data_nascimento_benef_1,
data_nascimento_benef_2,
data_nascimento_benef_3,
data_nascimento_benef_4,
data_nascimento_benef_5);

set @idCLiente = last_insertid();
set @idStatus = 2;

insert into pedido_venda (
pedido_venda.idEmpresa,
pedido_venda.idUsuario,
pedido_venda.idCliente,
pedido_venda.idStatus) 
value (
idEmpresa,
idUsuario,
@idCliente,
@idStatus);

set @idPedidoVenda = last_insert_id();
#idStatus = 2 Default para iniciar como PENDENTE
insert into lib_status_pedido_venda (idPedido,idStatus,idUsuario) value
 ( @idPedidoVenda, @idStatus,idUsuario);
 
 
#idStatus = 2 Default para iniciar como PENDENTE
insert into lib_pedido_produto (idPedido,idProduto) value
 ( @idPedidoVenda, idProduto);
 
 #iniciar com valores 0 na qualidade
insert into lib_qualidade_pedido_venda (idPedidoVenda) value
 ( @idPedidoVenda);
 
 commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_produto`(
IN `nome` VARCHAR(200), 
IN `descricao` TEXT(600),
 IN `precoVenda` FLOAT(8,2), 
 IN `vitalicio` FLOAT(8,2), 
 IN `primeiraParcela` FLOAT(8,2), 
 IN `idEmpresa` INT)
    NO SQL
BEGIN
INSERT INTO produto
(
nome,
descricao,
precoVenda,
vitalicio,
primeiraParcela,
idEmpresa)
VALUES
(nome,
descricao,
precoVenda,
vitalicio,
primeiraParcela,
idEmpresa);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_status_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_status_pedido`(IN `nome` VARCHAR(45))
BEGIN
insert into status_pedido (nome) value (nome);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_transposta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_transposta`(IN `idPedidoVenda` INT, IN `idComissao` INT, IN `soma` INT, IN `qtd` INT)
BEGIN
insert into transposta value (default,idPedidoVenda,idComissao,qtd,soma);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_usuario`(IN `nome` VARCHAR(45), IN `cpf` VARCHAR(11), IN `login` VARCHAR(20), IN `senha` VARCHAR(100), IN `perfil` ENUM('agente','supervisor','gerente','backoffice','admin'), IN `idEmpresa` INT, IN `meta` FLOAT(6,2))
BEGIN
INSERT INTO usuario (
nome,
cpf,
login,
senha,
perfil,
idEmpresa,
meta)
VALUES
(
nome,
cpf,
login,
md5(senha),
perfil,
idEmpresa,
meta);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_cliente`(IN `idEmpresa` INT)
BEGIN
select * from cliente c join
 pedido_venda pv on pv.idCliente = c.idCliente where
 pv.idEmpresa = idEmpresa limit 50; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_comissao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_comissao`(IN `idEmpresa` INT)
BEGIN
SELECT 
        `u`.`nome` AS `usuario`,
        `c`.`nome` AS `cliente`,
        `c`.`cpf` AS `cpf`,
        `lpvc`.`dataPagamento` AS `dataPagamento`,
        `lpvc`.`timestamp` AS `timestamp`,
        `lpvc`.`idComissao` AS `idComissao`,
        `lpvc`.`tipoComissao` AS `tipoComissao`,
        `prod`.`nome` AS `produto`,
        `prod`.`precoVenda` AS `precoVenda`,
        `o`.`nome` AS `operacao`,
        `prod`.`vitalicio` AS `vitalicio`,
        `prod`.`primeiraParcela` AS `primeiraParcela`,
        `pv`.`idPedidoVenda` AS `idPedidoVenda`
    FROM
        (((((((`lib_pedido_venda_comissao` `lpvc`
        JOIN `pedido_venda` `pv` ON ((`pv`.`idPedidoVenda` = `lpvc`.`idPedidoVenda`)))
        JOIN `usuario` `u` ON ((`u`.`idUsuario` = `pv`.`idUsuario`)))
        JOIN `cliente` `c` ON ((`c`.`idCliente` = `pv`.`idCliente`)))
        JOIN `lib_pedido_produto` `lpp` ON ((`lpp`.`idPedido` = `pv`.`idPedidoVenda`)))
        JOIN `produto` `prod` ON ((`prod`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `lib_produto_operacao` `lpo` ON ((`lpo`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `operacao` `o` ON ((`o`.`idOperacao` = `lpo`.`idOperacao`)))
        where pv.idEmpresa = idEmpresa
    ORDER BY `lpvc`.`dataPagamento` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_comissoes_idPedidoVenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_comissoes_idPedidoVenda`(IN `idEmpresa` INT, IN `idPedidoVenda` INT)
BEGIN
SELECT         
*    FROM
        pedido_venda pv
        
    WHERE
        pv.idPedidoVenda = idPedidoVenda
        and pv.idEmpresa = idEmpresa; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_cpf`(IN `cpf` BIGINT)
BEGIN
select * from usuario u where u.cpf = cpf and perfil = 'agente';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_cpf_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_cpf_usuario`(IN `cpf` bigint(11))
BEGIN
select * from usuario u where u.cpf = cpf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_empresa`(IN `idEmpresa` INT)
BEGIN
select * from empresa  e where e.idEmpresa = idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_gravacao_empresa_idPedidoVenda_telefone_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_gravacao_empresa_idPedidoVenda_telefone_1`(IN `idEmpresa` INT, IN `idPedidoVenda` INT, IN `telefone_1` VARCHAR(13))
BEGIN
SELECT 
recordingfile,
extract(day from call_center.calls.start_time) as dia,
extract(month from call_center.calls.start_time) as mes,
extract(year from call_center.calls.start_time) as ano

 FROM call_center.calls join
 crm.cliente on crm.cliente.telefone_1 = call_center.calls.phone join 
 call_center.call_recording on call_center.call_recording.id_call_outgoing = call_center.calls.id join
 crm.pedido_venda on crm.cliente.idCliente = crm.pedido_venda.idCliente
 where
 
 crm.cliente.telefone_1 = telefone_1 and 
 crm.pedido_venda.idPedidoVenda = idPedidoVenda and
 crm.pedido_venda.idEmpresa = idEmpresa ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_liberacao_produto_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_liberacao_produto_operacao`(IN `idProduto` INT, IN `idOperacao` INT)
BEGIN
SELECT * FROM lib_produto_operacao 
where 

lib_produto_operacao.idProduto = idProduto and
lib_produto_operacao.idOperacao = idOperacao ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_liberacao_usuario_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_liberacao_usuario_operacao`(IN `idUsuario` INT, IN `idOperacao` INT)
BEGIN
SELECT * FROM lib_usuario_operacao 
where 

lib_usuario_operacao.idUsuario = idUsuario and
lib_usuario_operacao.idOperacao = idOperacao ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_produto_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_produto_operacao`(IN `idEmpresa` INT)
BEGIN
select 
prod.nome as produto,
prod.idProduto,
prod.precoVenda,
o.idOperacao,
o.nome as operacao,
lpo.idProdutoOperacao,
lpo.status,
lpo.timestamp,
e.nome as empresa
from lib_produto_operacao lpo 
join produto prod on prod.idProduto = lpo.idProduto 
join operacao o on o.idOperacao = lpo.idOperacao 
join empresa e on e.idEmpresa = o.idEmpresa
where o.idEmpresa = idEmpresa and prod.idEmpresa=idEmpresa 
order by o.nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_produto_operacao_idProdutoOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_produto_operacao_idProdutoOperacao`(IN `idProdutoOperacao` INT)
BEGIN
select 
prod.nome as produto,
prod.idProduto,
o.idOperacao,
o.nome as operacao,
lpo.idProdutoOperacao,
lpo.status
from lib_produto_operacao lpo 
join produto prod on prod.idProduto = lpo.idProduto 
join operacao o on o.idOperacao = lpo.idOperacao
where lpo.idProdutoOperacao = idProdutoOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_qualidade_pedido_venda_idQualidadePedidoVenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_qualidade_pedido_venda_idQualidadePedidoVenda`(IN `idQualidadePedidoVenda` INT)
BEGIN

select 

lqpv.*,
c.telefone_1,
u.nome as usuario,
c.nome as cliente,
pv.idPedidoVenda,
pv.obs,
pv.timestamp,
sp.idStatus,
prod.precoVenda,
sp.nome as nomeStatus,
prod.nome as produto

 from lib_qualidade_pedido_venda lqpv
join pedido_venda pv on pv.idPedidoVenda =  lqpv.idPedidoVenda 
join cliente c on c.idCliente = pv.idCliente
join usuario u on u.idUsuario = pv.idUsuario
join lib_pedido_produto lpp on lpp.idPedido = pv.idPedidoVenda
join produto prod on prod.idProduto = lpp.idProduto
join lib_status_pedido_venda lspv on lspv.idPedido= pv.idPedidoVenda
join status_pedido sp on sp.idStatus = pv.idStatus
where lqpv.idQualidadePedidoVenda = idQualidadePedidoVenda;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_status_pedido_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_status_pedido_venda`(IN `idPedidoVenda` INT)
BEGIN
SELECT 
        `u`.`nome` AS `alteradoPor`,
        `lspv`.`idPedido` as `idPedido`,
        `sp`.`nome` AS `statusPedido`,
        `lspv`.`timestamp` AS `timestamp`,
        u2.nome as usuario
    FROM
        `lib_status_pedido_venda` `lspv`
        JOIN `usuario` `u` ON `lspv`.`idUsuario` = `u`.`idUsuario`
        JOIN `status_pedido` `sp` ON `sp`.`idStatus` = `lspv`.`idStatus`
        join pedido_venda pv on pv.idPedidoVenda = lspv.idPedido 
        join usuario u2 on pv.idUsuario = u2.idUsuario
        where `lspv`.`idPedido` = idPedidoVenda order by `lspv`.`timestamp` desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_usuario_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_usuario_operacao`(IN `idEmpresa` INT)
BEGIN

select 
u.nome as usuario,
u.idUsuario,
o.nome as operacao,
o.idOperacao,
luo.idUsuarioOperacao,
luo.status,
luo.timestamp,
e.nome as empresa
 from lib_usuario_operacao luo 
join operacao o on o.idOperacao = luo.idOperacao
join usuario u on u.idUsuario = luo.idUsuario
join empresa e on u.idEmpresa = e.idEmpresa
where 
u.idEmpresa = idEmpresa and o.idEmpresa=idEmpresa
order by o.nome;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_lib_usuario_operacao_idUsuarioOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_lib_usuario_operacao_idUsuarioOperacao`(IN `idUsuarioOperacao` INT)
BEGIN

select 
u.nome as usuario,
u.idUsuario,
o.nome as operacao,
o.idOperacao,
luo.idUsuarioOperacao,
luo.status

 from lib_usuario_operacao luo 
join operacao o on o.idOperacao = luo.idOperacao
join usuario u on u.idUsuario = luo.idUsuario
where luo.idUsuarioOperacao = idUsuarioOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_login`(IN `login` VARCHAR(20), IN `senha` VARCHAR(20))
BEGIN
select 
u.idUsuario,
u.login,
u.cpf,
u.nome as usuario,
u.perfil,
e.nome as empresa,
e.ip_pabx,
e.idEmpresa

 from usuario u join empresa e on e.idEmpresa = u.idEmpresa

 where u.login = login and u.senha = md5(senha) and
 u.status = 'ativado' and e.status = 'ativado' 
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_login_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_login_usuario`(IN `login` VARCHAR(20))
BEGIN
select * from usuario u where u.login = login;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_meta_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_meta_idUsuario`(IN `idUsuario` INT)
BEGIN
SELECT meta from usuario u where  u.idUsuario=idUsuario;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_meta_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_meta_usuario`(IN `idEmpresa` INT)
BEGIN
SELECT 
u.*,
e.nome as empresa
 FROM usuario u join 
empresa e on e.idEmpresa = u.idEmpresa
 where u.idEmpresa=idEmpresa and
        `u`.`perfil` = 'agente'
 order by(u.perfil),u.meta
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_motivo_pedido_nao_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_motivo_pedido_nao_venda`(IN `idEmpresa` INT)
BEGIN
select 
e.nome as empresa,
mpnv.*
 from motivo_pedido_nao_venda mpnv join 
empresa e on e.idEmpresa = mpnv.idEmpresa

where mpnv.idEmpresa = idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_nao_vendas_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_nao_vendas_idUsuario`(IN `idUsuario` INT, IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
count(*) as qtd_mes,
substr(pnv.timestamp,9,2) as dia
FROM pedido_nao_venda pnv 
  where 
pnv.idEmpresa = idEmpresa and  
substr(pnv.timestamp,1,4) = ano and 
substr(pnv.timestamp,6,2)=mes and
pnv.idUsuario = idUsuario
group by (dia);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_nao_vendas_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_nao_vendas_usuarios`(IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
count(*) as qtd_mes,
substr(pnv.timestamp,9,2) as dia
FROM pedido_nao_venda pnv 
  where 
pnv.idEmpresa = idEmpresa and  
substr(pnv.timestamp,1,4) = ano and 
substr(pnv.timestamp,6,2)=mes
group by (dia);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_operacao`(IN `idEmpresa` INT)
BEGIN
SELECT 
o.*,
e.nome as empresa
 FROM operacao o join empresa e on e.idEmpresa = o.idEmpresa

where 
o.idEmpresa= idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_operacao_idOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_operacao_idOperacao`(IN `idOperacao` INT)
BEGIN
select * from operacao where operacao.idOperacao = idOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda`(IN `idEmpresa` INT)
BEGIN
select 
pnv.idPedidoNaoVenda,
c.nome as cliente,
c.cpf,
pnv.timestamp,
u.nome as usuario,
mpnv.nome as motivo

 from pedido_nao_venda pnv join
 cliente c on c.idCliente = pnv.idCliente join 
 usuario u on u.idUsuario = pnv.idUsuario join
 motivo_pedido_nao_venda mpnv on mpnv.idMotivo = pnv.idMotivo
where

 pnv.idEmpresa = idEmpresa and
 pnv.timestamp BETWEEN (CURDATE() - INTERVAL 3 DAY) AND NOW()
 order by pnv.timestamp desc
 
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_ano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_ano`(IN `idEmpresa` INT, IN `ano` INT)
BEGIN
select count(*) as qtd_ano from pedido_nao_venda pnv
 where
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa 
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_ano_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_ano_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `idUsuario` INT)
BEGIN
select count(*) as qtd_ano from pedido_nao_venda pnv
 where
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa and
 pnv.idUsuario = idUsuario
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_cliente_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_cliente_cpf`(IN `idEmpresa` INT, IN `cpf` VARCHAR(11))
BEGIN
select * from cliente c join
 pedido_nao_venda pnv on pnv.idCliente = c.idCliente where
 c.cpf = cpf  and
 pnv.idEmpresa = idEmpresa; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_data`(IN `dataInicio` DATETIME, IN `dataFim` DATETIME)
BEGIN
SELECT 
pnv.idPedidoNaoVenda as idPedidoNaoVenda,
c.nome as cliente,
c.cpf as cpf,
mpnv.nome as motivo,
u.nome as usuario,
pnv.timestamp as timestamp
FROM pedido_nao_venda pnv 
join cliente c on
c.idCliente = pnv.idCliente join usuario u on u.idUsuario = pnv.idUsuario
join motivo_pedido_nao_venda mpnv on mpnv.idMotivo = pnv.idMotivo
where pnv.timestamp between dataInicio and dataFim order by  (pnv.timestamp) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_data_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_data_idUsuario`(IN `dataInicio` DATETIME, IN `dataFim` DATETIME, IN `idUsuario` INT)
BEGIN
SELECT 
pnv.idPedidoNaoVenda as idPedidoNaoVenda,
c.nome as cliente,
c.cpf as cpf,
mpnv.nome as motivo,
u.nome as usuario,
pnv.timestamp as timestamp
FROM pedido_nao_venda pnv 
join cliente c on
c.idCliente = pnv.idCliente join usuario u on u.idUsuario = pnv.idUsuario
join motivo_pedido_nao_venda mpnv on mpnv.idMotivo = pnv.idMotivo
where
pnv.idUsuario = idUsuario and
 pnv.timestamp between dataInicio and dataFim 
 order by  (pnv.timestamp) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_dia`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `dia` INT)
BEGIN
select count(*) as qtd_dia from pedido_nao_venda pnv
 where
 extract(day from pnv.timestamp) = dia and
 extract(month from pnv.timestamp) = mes and
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa 
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_dia_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_dia_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `dia` INT, IN `idUsuario` INT)
BEGIN
select count(*) as qtd_dia from pedido_nao_venda pnv
 where
 extract(day from pnv.timestamp) = dia and
 extract(month from pnv.timestamp) = mes and
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa and
 pnv.idUsuario = idUsuario
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_mes`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT)
BEGIN
select count(*) as qtd_mes from pedido_nao_venda pnv
 where
 extract(month from pnv.timestamp) = mes and
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa 
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_nao_venda_mes_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_nao_venda_mes_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `idUsuario` INT)
BEGIN
select count(*) as qtd_mes from pedido_nao_venda pnv
 where
 extract(month from pnv.timestamp) = mes and
 extract(year from pnv.timestamp) = ano and
 pnv.idEmpresa = idEmpresa and
 pnv.idUsuario = idUsuario
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_cliente_cpf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_cliente_cpf`(IN `idEmpresa` INT, IN `cpf` VARCHAR(11))
BEGIN
select * from cliente c join
 pedido_venda pv on pv.idCliente = c.idCliente where
 c.cpf = cpf and
 pv.idEmpresa = idEmpresa; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_comissoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_comissoes`(IN `idEmpresa` INT, IN `idPedidoVenda` INT)
BEGIN
 SELECT 
        `u`.`nome` AS `usuario`,
        `c`.`nome` AS `cliente`,
        `c`.`cpf` AS `cpf`,
        `lpvc`.`dataPagamento` AS `dataPagamento`,
        `lpvc`.`timestamp` AS `timestamp`,
         `lpvc`.`tipoComissao` AS `tipoComissao`,
        `lpvc`.`idComissao` AS `idComissao`,
        `prod`.`nome` AS `produto`,
        `prod`.`precoVenda` AS `precoVenda`,
        `o`.`nome` AS `operacao`,
        c.telefone_1,
        `pv`.`idPedidoVenda` AS `idPedidoVenda`,
        `pv`.`status` AS `status`,
        prod.vitalicio,
        prod.primeiraParcela,
        pv.timestamp as dataVenda,
        sp.nome as nomeStatus
    FROM
        ((((((((`lib_pedido_venda_comissao` `lpvc`
        JOIN `pedido_venda` `pv` ON ((`pv`.`idPedidoVenda` = `lpvc`.`idPedidoVenda`)))
        JOIN `usuario` `u` ON ((`u`.`idUsuario` = `lpvc`.`idUsuario`)))
        JOIN `cliente` `c` ON ((`c`.`idCliente` = `pv`.`idCliente`)))
        JOIN `lib_pedido_produto` `lpp` ON ((`lpp`.`idPedido` = `pv`.`idPedidoVenda`)))
        JOIN `produto` `prod` ON ((`prod`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `lib_produto_operacao` `lpo` ON ((`lpo`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `operacao` `o` ON ((`o`.`idOperacao` = `lpo`.`idOperacao`)))
        JOIN `status_pedido` `sp` ON ((`sp`.`idStatus` = `pv`.`idStatus`)))
    WHERE
        `lpvc`.`idPedidoVenda` = idPedidoVenda and
        pv.idEmpresa = idEmpresa
        order by lpvc.dataPagamento;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_data_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_data_pagamento`(IN `idEmpresa` INT, IN `idPedidoVenda` INT)
BEGIN
 SELECT 
        `u`.`nome` AS `usuario`,
        `c`.`nome` AS `cliente`,
        `c`.`cpf` AS `cpf`,
        `lpvc`.`dataPagamento` AS `dataPagamento`,
        `lpvc`.`timestamp` AS `timestamp`,
         `lpvc`.`tipoComissao` AS `tipoComissao`,
        `lpvc`.`idComissao` AS `idComissao`,
        `prod`.`nome` AS `produto`,
        `prod`.`precoVenda` AS `precoVenda`,
        `o`.`nome` AS `operacao`,
        c.telefone_1,
        `pv`.`idPedidoVenda` AS `idPedidoVenda`,
        `pv`.`status` AS `status`,
        prod.vitalicio,
        prod.primeiraParcela,
        pv.timestamp as dataVenda,
        sp.nome as nomeStatus
    FROM
        ((((((((`lib_pedido_venda_comissao` `lpvc`
        JOIN `pedido_venda` `pv` ON ((`pv`.`idPedidoVenda` = `lpvc`.`idPedidoVenda`)))
        JOIN `usuario` `u` ON ((`u`.`idUsuario` = `lpvc`.`idUsuario`)))
        JOIN `cliente` `c` ON ((`c`.`idCliente` = `pv`.`idCliente`)))
        JOIN `lib_pedido_produto` `lpp` ON ((`lpp`.`idPedido` = `pv`.`idPedidoVenda`)))
        JOIN `produto` `prod` ON ((`prod`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `lib_produto_operacao` `lpo` ON ((`lpo`.`idProduto` = `lpp`.`idProduto`)))
        JOIN `operacao` `o` ON ((`o`.`idOperacao` = `lpo`.`idOperacao`)))
        JOIN `status_pedido` `sp` ON ((`sp`.`idStatus` = `pv`.`idStatus`)))
    WHERE
        `lpvc`.`idPedidoVenda` = idPedidoVenda and
        pv.idEmpresa = idEmpresa and 
        lpvc.dataPagamento <> ''
        order by lpvc.dataPagamento;
        END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_idEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_idEmpresa`(IN `idEmpresa` INT)
BEGIN
select 
pv.idPedidoVenda,
c.nome as cliente,
c.cpf,
sp.nome as statusPedido,
pv.timestamp,
prod.precoVenda,
prod.nome as produto,
u.nome as usuario,
lqpv.mediaPonderada,
lqpv.idQualidadePedidoVenda
 from pedido_venda pv join
 cliente c on c.idCliente = pv.idCliente join 
 usuario u on u.idUsuario = pv.idUsuario join
 lib_pedido_produto lpp
on lpp.idPedido = pv.idPedidoVenda join 
produto prod on prod.idProduto = lpp.idProduto join
lib_qualidade_pedido_venda lqpv on lqpv.idPedidoVenda = pv.idPedidoVenda join status_pedido sp on sp.idStatus = pv.idStatus
where 
pv.idEmpresa = idEmpresa 
order by pv.timestamp desc
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_idEmpresa_idStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_idEmpresa_idStatus`(IN `idEmpresa` INT, IN `idStatus` INT)
BEGIN
select 
pv.idPedidoVenda,
c.nome as cliente,
c.cpf,
sp.nome as statusPedido,
pv.timestamp,
prod.precoVenda,
prod.nome as produto,
u.nome as usuario,
lqpv.mediaPonderada,
lqpv.idQualidadePedidoVenda
 from pedido_venda pv join
 cliente c on c.idCliente = pv.idCliente join 
 usuario u on u.idUsuario = pv.idUsuario join
 lib_pedido_produto lpp
on lpp.idPedido = pv.idPedidoVenda join 
produto prod on prod.idProduto = lpp.idProduto join
lib_qualidade_pedido_venda lqpv on lqpv.idPedidoVenda = pv.idPedidoVenda join 
status_pedido sp on sp.idStatus = pv.idStatus
where 
pv.idEmpresa = idEmpresa and
pv.idStatus = idStatus
order by pv.timestamp desc
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_idPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_idPedido`(IN `idPedido` INT)
BEGIN
select 
pv.idUsuario,
pv.idStatus,
pv.timestamp,
pv.numeroProposta,
pv.obs,
sp.nome as nomeStatus,
u.nome as usuario,
c.nomeMae,
c.parentePolitico,
c.deficienteFisico,
c.idCliente as idCliente,
c.nome as cliente,
c.cpf,
c.rg,
c.dataNascimento,
c.orgaoEmissor,
c.sexo,
c.estadoCivil,
c.endereco,
c.complemento,
c.bairro,
c.cidade,
c.estado,
c.cep,
c.email,
c.telefone_1,
c.telefone_2,
c.ocupacao,
c.peso,
c.altura,
c.renda,
c.banco,
c.agencia,
c.conta,
c.nome_benef_1,
c.nome_benef_2,
c.nome_benef_3,
c.nome_benef_4,
c.nome_benef_5,
c.parentesco_benef_1,
c.parentesco_benef_2,
c.parentesco_benef_3,
c.parentesco_benef_4,
c.parentesco_benef_5,
c.cpf_benef_1,
c.cpf_benef_2,
c.cpf_benef_3,
c.cpf_benef_4,
c.cpf_benef_5,
c.nome_mae_benef_1,
c.nome_mae_benef_2,
c.nome_mae_benef_3,
c.nome_mae_benef_4,
c.nome_mae_benef_5,
c.data_nascimento_benef_1,
c.data_nascimento_benef_2,
c.data_nascimento_benef_3,
c.data_nascimento_benef_4,
c.data_nascimento_benef_5,
c.mailing,
prod.idProduto as idProduto,
prod.nome as produto,
prod.precoVenda as precoVenda
 from 
pedido_venda pv inner join cliente c on c.idCliente = pv.idCliente join usuario u on u.idUsuario = pv.idUsuario join 
status_pedido sp on sp.idStatus = pv.idStatus
join lib_pedido_produto lpp on lpp.idPedido = pv.idPedidoVenda 
join produto prod on prod.idProduto = lpp.idProduto

where pv.idPedidoVenda = idPedido ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_idPedidoVenda_idEmpresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_idPedidoVenda_idEmpresa`(IN `idPedidoVenda` INT, IN `idEmpresa` int)
BEGIN
select 
pv.idPedidoVenda,
pv.idUsuario,
pv.idStatus,
pv.timestamp,
pv.numeroProposta,
pv.obs,
sp.nome as nomeStatus,
u.nome as usuario,
c.nomeMae,
c.parentePolitico,
c.deficienteFisico,
c.idCliente as idCliente,
c.nome as cliente,
c.cpf,
c.rg,
c.dataNascimento,
c.orgaoEmissor,
c.sexo,
c.estadoCivil,
c.endereco,
c.complemento,
c.bairro,
c.cidade,
c.estado,
c.cep,
c.email,
c.telefone_1,
c.telefone_2,
c.ocupacao,
c.peso,
c.altura,
c.renda,
c.banco,
c.agencia,
c.conta,
c.nome_benef_1,
c.nome_benef_2,
c.nome_benef_3,
c.nome_benef_4,
c.nome_benef_5,
c.parentesco_benef_1,
c.parentesco_benef_2,
c.parentesco_benef_3,
c.parentesco_benef_4,
c.parentesco_benef_5,
c.cpf_benef_1,
c.cpf_benef_2,
c.cpf_benef_3,
c.cpf_benef_4,
c.cpf_benef_5,
c.nome_mae_benef_1,
c.nome_mae_benef_2,
c.nome_mae_benef_3,
c.nome_mae_benef_4,
c.nome_mae_benef_5,
c.data_nascimento_benef_1,
c.data_nascimento_benef_2,
c.data_nascimento_benef_3,
c.data_nascimento_benef_4,
c.data_nascimento_benef_5,
c.mailing,
prod.idProduto as idProduto,
prod.nome as produto,
prod.precoVenda as precoVenda,
prod.vitalicio,
prod.primeiraParcela
 from 
pedido_venda pv inner join cliente c on c.idCliente = pv.idCliente join usuario u on u.idUsuario = pv.idUsuario join 
status_pedido sp on sp.idStatus = pv.idStatus
join lib_pedido_produto lpp on lpp.idPedido = pv.idPedidoVenda 
join produto prod on prod.idProduto = lpp.idProduto

where pv.idPedidoVenda = idPedidoVenda and pv.idEmpresa = idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_ano` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_ano`(IN `idEmpresa` INT, IN `ano` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_ano,
count(*) as qtd_ano,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp)= ano 
group by (sp.nome)
order by (soma_ano) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_ano_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_ano_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `idUsuario` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_ano,
count(*) as qtd_ano,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
  pv.idUsuario = idUsuario and
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp)= ano 
group by (sp.nome)
order by (soma_ano) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_dia`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `dia` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_dia,
count(*) as qtd_dia,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp)= ano and
extract(month from pv.timestamp)= mes and
extract(day from pv.timestamp)= dia 
group by (sp.nome)
order by (soma_dia) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_dia_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_dia_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `dia` INT, IN `idUsuario` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_dia,
count(*) as qtd_dia,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
pv.idEmpresa = idEmpresa and  
pv.idUsuario = idUsuario and
extract(year from pv.timestamp)= ano and
extract(month from pv.timestamp)= mes and
extract(day from pv.timestamp)= dia 
group by (sp.nome)
order by (soma_dia) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_mes`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp)= ano and
extract(month from pv.timestamp)= mes 
group by (sp.nome)
order by (soma_mes) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_pedido_venda_status_mes_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_pedido_venda_status_mes_idUsuario`(IN `idEmpresa` INT, IN `ano` INT, IN `mes` INT, IN `idUsuario` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
sp.nome as status
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario  join
status_pedido sp on sp.idStatus = pv.idStatus
  where 
pv.idEmpresa = idEmpresa and  
pv.idUsuario = idUsuario and
extract(year from pv.timestamp)= ano and
extract(month from pv.timestamp)= mes 
group by (sp.nome)
order by (soma_mes) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_produto`(IN `idEmpresa` INT)
BEGIN

select prod.*,e.nome as empresa from produto prod join
 empresa e on e.idEmpresa = prod.idEmpresa
 where prod.idEmpresa = idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_produto_idProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_produto_idProduto`(IN `idProduto` INT)
BEGIN

select * from produto where produto.idProduto = idProduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_produto_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_produto_idUsuario`(IN `idUsuario` INT, IN idEmpresa INT)
BEGIN
select 
prod.nome as produto,
prod.idProduto,
prod.precoVenda,
u.nome as usuario
from usuario u 
join lib_usuario_operacao luo on luo.idUsuario = u.idUsuario 
join lib_produto_operacao lpo on lpo.idOperacao = luo.idOperacao
join produto prod on prod.idProduto = lpo.idProduto 
where
 u.idUsuario = idUsuario and 
 prod.status ='ativado' and
 u.status='ativado' and
 luo.status='ativado' and
 lpo.status='ativado' and
 u.idEmpresa = idEmpresa and
 prod.idEmpresa=idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_transposta_idPedidovenda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_transposta_idPedidovenda`(IN `idPedidoVenda` INT)
BEGIN
SELECT 
 `u`.`nome` AS `usuario`,
        `c`.`nome` AS `cliente`,
        `c`.`cpf` AS `cpf`,
        `lpvc`.`dataPagamento` AS `dataPagamento`,
        `lpvc`.`timestamp` AS `timestamp`,
        `lpvc`.`idComissao` AS `idComissao`,
        `lpvc`.`tipoComissao` AS `tipoComissao`,
        `prod`.`nome` AS `produto`,
        `prod`.`precoVenda` AS `precoVenda`,
        `o`.`nome` AS `operacao`,
        c.telefone_1,
        `pv`.`idPedidoVenda` AS `idPedidoVenda`,
        prod.vitalicio,
        prod.primeiraParcela,
        pv.timestamp as dataVenda,
        t.qtd,
        t.soma,
        pv.numeroProposta


 FROM crm.transposta t join pedido_venda pv on pv.idPedidoVenda = t.idPedidoVenda join
cliente c on c.idCliente = pv.idCliente join
usuario u on u.idUsuario = pv.idUsuario join
lib_pedido_produto lpp on lpp.idPedido = pv.idPedidoVenda join
produto prod on prod.idProduto = lpp.idProduto join
lib_produto_operacao lpo on lpo.idProduto = lpp.idProduto join
operacao o on o.idOperacao = lpo.idOperacao join 
lib_pedido_venda_comissao lpvc on lpvc.idComissao = t.idComissao 

where t.idPedidoVenda = idPedidoVenda;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuario`(IN `idEmpresa` INT)
BEGIN
SELECT 
u.*,
e.nome as empresa
 FROM usuario u join 
empresa e on e.idEmpresa = u.idEmpresa
 where u.idEmpresa=idEmpresa
 order by(u.perfil)
 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_usuario_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_usuario_idUsuario`(IN `idUsuario` INT)
BEGIN
select 
u.nome,
u.idUsuario,
u.login,
u.cpf,
u.perfil,
u.timestamp,
u.status,
u.meta,
e.nome nomeEmpresa
 from usuario u join empresa e on u.idEmpresa = e.idEmpresa  where u.idUsuario = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_aprovadas_mes_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_aprovadas_mes_idUsuario`(IN `idUsuario` INT, IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
u.nome as usuario
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
  pv.idUsuario = idUsuario and
pv.idEmpresa = idEmpresa and  
extract(month from pv.timestamp)=mes and
extract(year from pv.timestamp)=ano and
pv.idStatus = 1
group by (u.nome);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_historico_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_historico_empresa`(IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
extract(day from pv.timestamp) as dia
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp) = ano and 
extract(month from pv.timestamp)=mes and
pv.idStatus = 1
group by (dia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_historico_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_historico_idUsuario`(IN `idUsuario` INT, IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
extract(day from pv.timestamp) as dia
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
pv.idUsuario = idUsuario and
pv.idEmpresa = idEmpresa and  
extract(year from pv.timestamp) = ano and 
extract(month from pv.timestamp)=mes and
pv.idStatus = 1
group by (dia);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_pendentes_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_pendentes_usuarios`(IN `idEmpresa` INT)
BEGIN
select count(*) as total, 
u.nome as usuario


from pedido_venda pv join
 usuario u on u.idUsuario  = pv.idUsuario 
 where
 pv.idStatus = 2  and
 pv.idEmpresa = idEmpresa 
 group by (u.nome) order by (total) desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_pendentes_usuario_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_pendentes_usuario_idUsuario`(IN `idEmpresa` INT, IN `idUsuario` INT)
BEGIN
select count(*) as total from 
pedido_venda pv join 
usuario u on pv.idUsuario = u.idUsuario
where
 u.idUsuario  = idUsuario and 
 pv.idStatus = 2 and
 u.idEmpresa= idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_qualidade_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_qualidade_idUsuario`(IN `idUsuario` INT, IN `idEmpresa` INT)
BEGIN
select
sum(mediaPonderada)/count(*) as mediaTotal,
count(*) as qtd,
sum(mediaPonderada) as somaMediaPonderada
from lib_qualidade_pedido_venda lqpv join 
pedido_venda pv on pv.idPedidoVenda = lqpv.idPedidoVenda 
where
 pv.idUsuario = idUsuario and
 lqpv.mediaPonderada <> 0 and 
 pv.idEmpresa = idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_qualidade_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_qualidade_usuarios`(IN `idEmpresa` INT)
BEGIN
select
u.nome as usuario,
sum(mediaPonderada)/count(*) as mediaTotal,
count(*) as qtd,
sum(mediaPonderada) as somaMediaPonderada
from lib_qualidade_pedido_venda lqpv join 
pedido_venda pv on pv.idPedidoVenda = lqpv.idPedidoVenda 
join usuario u on u.idUsuario = pv.idUsuario
where
 lqpv.mediaPonderada <> 0 and 
 pv.idEmpresa = idEmpresa
 group by(u.nome) order by mediaTotal desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_ranking_dia_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_ranking_dia_usuarios`(IN `dia` INT, IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
u.nome as usuario
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
  
pv.idEmpresa = idEmpresa and  
extract(day from pv.timestamp) = dia and 
extract(month from pv.timestamp)=mes and
extract(year from pv.timestamp)=ano and
pv.idStatus = 1
group by (u.nome)
order by (soma_mes) desc;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_ranking_mes_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_ranking_mes_usuarios`(IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
u.nome as usuario
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
pv.idEmpresa = idEmpresa and  
extract(month from pv.timestamp)=mes and
extract(year from pv.timestamp)=ano and
pv.idStatus= 1
group by (u.nome)
order by (soma_mes) desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_reprovadas_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_reprovadas_usuarios`(IN `mes` INT, IN `ano` INT, IN `idEmpresa` INT)
BEGIN
SELECT 
sum(prod.precoVenda) as soma_mes,
count(*) as qtd_mes,
u.nome as usuario
FROM pedido_venda pv 
join lib_pedido_produto lpp on pv.idPedidoVenda = lpp.idPedido
join produto prod on prod.idProduto = lpp.idProduto 
join usuario u on u.idUsuario = pv.idUsuario 
  where 
pv.idEmpresa = idEmpresa and  
extract(month from pv.timestamp)=mes and
extract(year from pv.timestamp)=ano and
pv.idStatus= 3
group by (u.nome)
order by (soma_mes) desc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_sexo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_sexo`(IN `idEmpresa` INT)
BEGIN
select count(*) as total,
c.sexo

 from pedido_venda pv join 
cliente c on c.idCliente = pv.idCliente 
where
 pv.idStatus=1 and
 pv.idEmpresa=idEmpresa 
 group by(c.sexo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_vendas_sexo_idUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_vendas_sexo_idUsuario`(IN `idUsuario` INT, IN `idEmpresa` INT)
BEGIN
select ifnull(count(*),0) as total,
	c.sexo
	from
pedido_venda pv join 
cliente c on c.idCliente = pv.idCliente 
	where
 pv.idStatus=1 and
 pv.idUsuario=idUsuario and
 pv.idEmpresa = idEmpresa
 
 group by(c.sexo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_cliente`(IN `nome` VARCHAR(60), IN `cpf` INT(11), IN `rg` VARCHAR(15), IN `orgaoEmissor` VARCHAR(20), IN `sexo` ENUM('M','H'), IN `estadoCivil` VARCHAR(25), IN `dataNascimento` DATE, IN `endereco` VARCHAR(100), IN `complemento` VARCHAR(20), IN `bairro` VARCHAR(20), IN `cep` INT(8), IN `cidade` VARCHAR(20), IN `estado` TINYINT(2), IN `email` VARCHAR(20), IN `telefone_1` INT(13), IN `telefone_2` INT(13), IN `ocupacao` VARCHAR(100), IN `peso` INT(4), IN `altura` INT(4), IN `renda` INT(9), IN `banco` VARCHAR(45), IN `agencio` VARCHAR(10), IN `conta` VARCHAR(10), IN `nome_benef_1` VARCHAR(60), IN `nome_benef_2` VARCHAR(60), IN `nome_benef_3` VARCHAR(60), IN `nome_benef_4` VARCHAR(60), IN `nome_benef_5` VARCHAR(60), IN `parentesco_benef_1` VARCHAR(45), IN `parentesco_benef_2` VARCHAR(45), IN `parentesco_benef_3` VARCHAR(45), IN `parentesco_benef_4` VARCHAR(45), IN `parentesco_benef_5` VARCHAR(45), IN `mailing` VARCHAR(100), IN `idCliente` INT)
BEGIN
UPDATE cliente
SET
cliente.nome =nome,
cliente.cpf =cpf,
cliente.rg =rg,
cliente.orgaoEmissor =orgaoEmissor,
cliente.sexo =sexo,
cliente.estadoCivil =estadoCivil,
cliente.dataNascimento =dataNascimento,
cliente.endereco =endereco,
cliente.complemento =complemento,
cliente.bairro =bairro,
cliente.cep =cep,
cliente.cidade =cidade,
cliente.estado =estado,
cliente.email =email,
cliente.telefone_1 =telefone_1,
cliente.telefone_2 =telefone_2,
cliente.ocupacao =ocupacao,
cliente.peso =peso,
cliente.altura =altura,
cliente.renda =renda,
cliente.banco =banco,
cliente.agencia =agencia,
cliente.conta =conta,
cliente.nome_benef_1 =nome_benef_1,
cliente.nome_benef_2 =nome_benef_2,
cliente.nome_benef_3 =nome_benef_3,
cliente.nome_benef_4 =nome_benef_4,
cliente.nome_benef_5 =nome_benef_5,
cliente.parentesco_benef_1 =parentesco_benef_1,
cliente.parentesco_benef_2 =parentesco_benef_2,
cliente.parentesco_benef_3 =parentesco_benef_3,
cliente.parentesco_benef_4 =parentesco_benef_4,
cliente.parentesco_benef_5 =parentesco_benef_5,
cliente.mailing =mailing
WHERE cliente.idCliente =idCliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_empresa`(IN `nome` VARCHAR(45), IN `cnpj` VARCHAR(25), IN `endereco` VARCHAR(100), IN `bairro` VARCHAR(45), IN `cep` VARCHAR(8), IN `cidade` VARCHAR(45), IN `estado` VARCHAR(45), IN `email` VARCHAR(45), IN `telefone_1` VARCHAR(13), IN `telefone_2` VARCHAR(13), IN `ip_pabx` VARCHAR(15), IN `status` ENUM('ativado','desativado'), IN `idEmpresa` INT)
BEGIN
update empresa set
empresa.nome		=	nome,
empresa.cnpj		=	cnpj,
empresa.endereco	=	endereco,
empresa.bairro		=	bairro,
empresa.cep			=	cep,
empresa.cidade		=	cidade,
empresa.estado		=	estado,
empresa.telefone_1	=	telefone_1,
empresa.telefone_2	=	telefone_2,
empresa.status	=	status,
empresa.ip_pabx		=	ip_pabx
where
empresa.idEmpresa 	=	idEmpresa;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_empresa_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lib_empresa_operacao`(IN `status` ENUM('ativado','desativado'), IN `idEmpresaOperacao` INT)
BEGIN
update lib_empresa_operacao set
status = status 
where
lib_empresa_operacao.idEmpresaOperacao = idEmpresaOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_pedido_venda_comissao_estorno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_lib_pedido_venda_comissao_estorno`(IN `idPedidoVenda` INT, IN `idUsuario` INT)
BEGIN
update lib_pedido_venda_comissao lpvc set
 lpvc.tipoComissao = 'estorno', 
 lpvc.idUsuario = idUsuario
 where lpvc.idPedidoVenda  = idPedidoVenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_produto_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lib_produto_operacao`(IN `status` ENUM('ativado','desativado'), IN `idProdutoOperacao` INT)
BEGIN
update lib_produto_operacao set
status = status
where
lib_produto_operacao.idProdutoOperacao = idProdutoOperacao;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_qualidade_pedido_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lib_qualidade_pedido_venda`(IN `apresentacao` FLOAT(2,1), IN `ritmo` FLOAT(2,1), IN `beneficio` FLOAT(2,1), IN `pergunta` FLOAT(2,1), IN `valor` FLOAT(2,1), IN `objecao` FLOAT(2,1), IN `pronuncia` FLOAT(2,1), IN `intonacao` FLOAT(2,1), IN `cordialidade` FLOAT(2,1), IN `conclusao` FLOAT(2,1), IN `idQualidadePedidoVenda` INT)
BEGIN

declare mediaPonderada float(2,1);

set mediaPonderada = calculaMedia(apresentacao,ritmo,beneficio,pergunta,valor,objecao,pronuncia,intonacao,cordialidade,conclusao);

update lib_qualidade_pedido_venda  set 
lib_qualidade_pedido_venda.apresentacao = apresentacao,
lib_qualidade_pedido_venda.ritmo=ritmo,
lib_qualidade_pedido_venda.beneficio=beneficio,
lib_qualidade_pedido_venda.pergunta=pergunta,
lib_qualidade_pedido_venda.valor=valor,
lib_qualidade_pedido_venda.objecao=objecao,
lib_qualidade_pedido_venda.pronuncia=pronuncia,
lib_qualidade_pedido_venda.intonacao=intonacao,
lib_qualidade_pedido_venda.cordialidade=cordialidade,
lib_qualidade_pedido_venda.conclusao=conclusao,
lib_qualidade_pedido_venda.mediaPonderada = mediaPonderada where

lib_qualidade_pedido_venda.idQualidadePedidoVenda = idQualidadePedidoVenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_usuario_empresa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lib_usuario_empresa`(IN `status` ENUM('ativado','desativado'), IN `idUsuarioEmpresa` INT)
BEGIN
update lib_usuario_empresa set
status = status
where
lib_usuario_empresa.idUsuarioEmpresa = idUsuarioEmpresa;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lib_usuario_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lib_usuario_operacao`(IN `status` ENUM('ativado','desativado'), IN `idUsuariooperacao` INT)
BEGIN
update lib_usuario_operacao set
status = status
where
lib_usuario_operacao.idUsuariooperacao = idUsuariooperacao;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_meta_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_meta_usuario`( IN `idUsuario` INT, IN `meta` FLOAT(6,2))
BEGIN

update usuario set 
usuario.meta	= meta
where
usuario.idUsuario = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_operacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_operacao`(IN `nome` VARCHAR(45), IN `status` ENUM('ativado','desativado'), IN `idOperacao` INT)
BEGIN
update operacao set 
operacao.nome		=	nome,
operacao.status	  =status
where
operacao.idOperacao	=	idOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_pedido_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_pedido_venda`(IN `nome` VARCHAR(60), IN `cpf` VARCHAR(11), IN `rg` VARCHAR(15), IN `orgaoEmissor` VARCHAR(20), IN `sexo` ENUM('F','M'), IN `estadoCivil` VARCHAR(25), IN `dataNascimento` DATE, IN `endereco` VARCHAR(100), IN `complemento` VARCHAR(45), IN `bairro` VARCHAR(200), IN `cep` VARCHAR(8), IN `cidade` VARCHAR(45), IN `estado` VARCHAR(2), IN `email` VARCHAR(45), IN `telefone_1` VARCHAR(13), IN `telefone_2` VARCHAR(13), IN `ocupacao` VARCHAR(100), IN `peso` VARCHAR(4), IN `altura` VARCHAR(4), IN `renda` VARCHAR(9), IN `banco` VARCHAR(45), IN `agencio` VARCHAR(10), IN `conta` VARCHAR(10), IN `nome_benef_1` VARCHAR(60), IN `nome_benef_2` VARCHAR(60), IN `nome_benef_3` VARCHAR(60), IN `nome_benef_4` VARCHAR(60), IN `nome_benef_5` VARCHAR(60), IN `parentesco_benef_1` VARCHAR(45), IN `parentesco_benef_2` VARCHAR(45), IN `parentesco_benef_3` VARCHAR(45), IN `parentesco_benef_4` VARCHAR(45), IN `parentesco_benef_5` VARCHAR(45), IN `mailing` VARCHAR(100), IN `nomeMae` VARCHAR(60), IN `deficienteFisico` TEXT(200), IN `parentePolitico` ENUM('sim','nao'), IN `idUsuario` INT, IN `idCliente` INT, IN `idProduto` INT, IN `idPedido` INT, IN `cpf_benef_1` VARCHAR(11), IN `cpf_benef_2` VARCHAR(11), IN `cpf_benef_3` VARCHAR(11), IN `cpf_benef_4` VARCHAR(11), IN `cpf_benef_5` VARCHAR(11), IN `nome_mae_benef_1` VARCHAR(45), IN `nome_mae_benef_2` VARCHAR(45), IN `nome_mae_benef_3` VARCHAR(45), IN `nome_mae_benef_4` VARCHAR(45), IN `nome_mae_benef_5` VARCHAR(45), IN `data_nascimento_benef_1` DATE, IN `data_nascimento_benef_2` DATE, IN `data_nascimento_benef_3` DATE, IN `data_nascimento_benef_4` DATE, IN `data_nascimento_benef_5` DATE, IN `numeroProposta` VARCHAR(11))
BEGIN
Declare exit handler for sqlexception 
	begin
		rollback; 
	end;

declare exit handler for sqlwarning
	begin
		rollback;
    end;
     
start transaction;
UPDATE cliente 
SET 
    cliente.nome = nome,
    cliente.cpf = cpf,
    cliente.rg = rg,
    cliente.orgaoEmissor = orgaoEmissor,
    cliente.sexo = sexo,
    cliente.estadoCivil = estadoCivil,
    cliente.dataNascimento = dataNascimento,
    cliente.endereco = endereco,
    cliente.complemento = complemento,
    cliente.bairro = bairro,
    cliente.cep = cep,
    cliente.cidade = cidade,
    cliente.estado = estado,
    cliente.email = email,
    cliente.telefone_1 = telefone_1,
    cliente.telefone_2 = telefone_2,
    cliente.ocupacao = ocupacao,
    cliente.peso = peso,
    cliente.altura = altura,
    cliente.renda = renda,
    cliente.banco = banco,
    cliente.agencia = agencia,
    cliente.conta = conta,
    cliente.nome_benef_1 = nome_benef_1,
    cliente.nome_benef_2 = nome_benef_2,
    cliente.nome_benef_3 = nome_benef_3,
    cliente.nome_benef_4 = nome_benef_4,
    cliente.nome_benef_5 = nome_benef_5,
    cliente.parentesco_benef_1 = parentesco_benef_1,
    cliente.parentesco_benef_2 = parentesco_benef_2,
    cliente.parentesco_benef_3 = parentesco_benef_3,
    cliente.parentesco_benef_4 = parentesco_benef_4,
    cliente.parentesco_benef_5 = parentesco_benef_5,
    cliente.mailing = mailing,
    cliente.nomeMae = nomeMae,
    cliente.parentePolitico = parentePolitico,
    cliente.deficienteFisico = deficienteFisico,
    cliente.cpf_benef_1 = cpf_benef_1,
    cliente.cpf_benef_2 = cpf_benef_2,
    cliente.cpf_benef_3 = cpf_benef_3,
    cliente.cpf_benef_4 = cpf_benef_4,
    cliente.cpf_benef_5 = cpf_benef_5,
    cliente.nome_mae_benef_1 = nome_mae_benef_1,
    cliente.nome_mae_benef_2 = nome_mae_benef_2,
    cliente.nome_mae_benef_3 = nome_mae_benef_3,
    cliente.nome_mae_benef_4 = nome_mae_benef_4,
    cliente.nome_mae_benef_5 = nome_mae_benef_5,
    cliente.data_nascimento_benef_1 = data_nascimento_benef_1,
    cliente.data_nascimento_benef_2 = data_nascimento_benef_2,
    cliente.data_nascimento_benef_3 = data_nascimento_benef_3,
    cliente.data_nascimento_benef_4 = data_nascimento_benef_4,
    cliente.data_nascimento_benef_5 = data_nascimento_benef_5
WHERE
    cliente.idCliente = idCliente;


UPDATE pedido_venda 
SET 
    pedido_venda.idUsuario = idUsuario,
    pedido_venda.numeroProposta = numeroProposta
WHERE
    pedido_venda.idPedidoVenda = idPedido;


UPDATE lib_pedido_produto 
SET 
    lib_pedido_produto.idProduto = idProduto
WHERE
    lib_pedido_produto.idPedido = idPedido;
commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_pedido_venda_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `update_pedido_venda_status`(IN `idPedidoVenda` INT, IN `status` ENUM('ativado','desativado'))
BEGIN
update pedido_venda pv set pv.status = status where pv.idPedidoVenda = idPedidoVenda;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_produto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_produto`(
IN `nome` VARCHAR(200), 
IN `descricao` TEXT(600), 
IN `precoVenda` FLOAT(8,2), 
IN `vitalicio` FLOAT(8,2),
 IN `primeiraParcela` FLOAT(8,2), 
 IN `status` ENUM('ativado','desativado'),
 IN `idProduto` INT)
BEGIN
update produto set 
produto.nome		=	nome,
produto.descricao =	descricao,
produto.precoVenda =	precoVenda,
produto.vitalicio = vitalicio,
produto.primeiraParcela	  =primeiraParcela,
produto.status	  =status
where
produto.idProduto	=	idProduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_status_pedido_venda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_status_pedido_venda`(IN `idPedidoVenda` INT, IN `idUsuario` INT, IN `idStatus` INT, IN `obs` TEXT(200))
BEGIN

update pedido_venda set 
pedido_venda.idStatus 	= idStatus,
pedido_venda.obs = obs
where 
pedido_venda.idPedidoVenda = idPedidoVenda;


insert into lib_status_pedido_venda (idPedido,idUsuario,idStatus) value (idPedidoVenda,idUsuario,idStatus);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_usuario`(IN `nome` VARCHAR(45), IN `cpf` VARCHAR(11), IN `login` VARCHAR(20), IN `senha` VARCHAR(100), IN `perfil` ENUM('agente','supervisor','gerente','backoffice','admin'), IN `status` ENUM('ativado','desativado'), IN `idUsuario` INT, IN `meta` FLOAT(6,2))
BEGIN

update usuario set 
usuario.nome 	= 	nome,
usuario.cpf		=	cpf,
usuario.login	=	login,
usuario.senha	=	md5(senha),
usuario.perfil	=	perfil,
usuario.status	=	status,
usuario.meta	= meta
where
usuario.idUsuario = idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_banco`
--

/*!50001 DROP TABLE IF EXISTS `view_banco`*/;
/*!50001 DROP VIEW IF EXISTS `view_banco`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_banco` AS select `banco`.`idBanco` AS `idBanco`,`banco`.`codigo` AS `codigo`,`banco`.`nome` AS `nome`,`banco`.`status` AS `status`,`banco`.`timestamp` AS `timestamp` from `banco` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_cidade`
--

/*!50001 DROP TABLE IF EXISTS `view_cidade`*/;
/*!50001 DROP VIEW IF EXISTS `view_cidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cidade` AS select `cidade`.`nome` AS `nome` from `cidade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_cliente`
--

/*!50001 DROP TABLE IF EXISTS `view_cliente`*/;
/*!50001 DROP VIEW IF EXISTS `view_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_cliente` AS select `cliente`.`idCliente` AS `idCliente`,`cliente`.`nome` AS `nome`,`cliente`.`cpf` AS `cpf`,`cliente`.`rg` AS `rg`,`cliente`.`orgaoEmissor` AS `orgaoEmissor`,`cliente`.`sexo` AS `sexo`,`cliente`.`estadoCivil` AS `estadoCivil`,`cliente`.`dataNascimento` AS `dataNascimento`,`cliente`.`endereco` AS `endereco`,`cliente`.`complemento` AS `complemento`,`cliente`.`bairro` AS `bairro`,`cliente`.`cep` AS `cep`,`cliente`.`cidade` AS `cidade`,`cliente`.`estado` AS `estado`,`cliente`.`email` AS `email`,`cliente`.`telefone_1` AS `telefone_1`,`cliente`.`telefone_2` AS `telefone_2`,`cliente`.`ocupacao` AS `ocupacao`,`cliente`.`peso` AS `peso`,`cliente`.`altura` AS `altura`,`cliente`.`renda` AS `renda`,`cliente`.`banco` AS `banco`,`cliente`.`agencia` AS `agencia`,`cliente`.`conta` AS `conta`,`cliente`.`nome_benef_1` AS `nome_benef_1`,`cliente`.`nome_benef_2` AS `nome_benef_2`,`cliente`.`nome_benef_3` AS `nome_benef_3`,`cliente`.`nome_benef_4` AS `nome_benef_4`,`cliente`.`nome_benef_5` AS `nome_benef_5`,`cliente`.`parentesco_benef_1` AS `parentesco_benef_1`,`cliente`.`parentesco_benef_2` AS `parentesco_benef_2`,`cliente`.`parentesco_benef_3` AS `parentesco_benef_3`,`cliente`.`parentesco_benef_4` AS `parentesco_benef_4`,`cliente`.`parentesco_benef_5` AS `parentesco_benef_5`,`cliente`.`mailing` AS `mailing`,`cliente`.`timestamp` AS `timestamp` from `cliente` where (`cliente`.`timestamp` between (curdate() - interval 20 day) and now()) order by `cliente`.`idCliente` desc limit 50 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_empresa`
--

/*!50001 DROP TABLE IF EXISTS `view_empresa`*/;
/*!50001 DROP VIEW IF EXISTS `view_empresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empresa` AS select `empresa`.`idEmpresa` AS `idEmpresa`,`empresa`.`nome` AS `nome`,`empresa`.`cnpj` AS `cnpj`,`empresa`.`endereco` AS `endereco`,`empresa`.`bairro` AS `bairro`,`empresa`.`cep` AS `cep`,`empresa`.`cidade` AS `cidade`,`empresa`.`estado` AS `estado`,`empresa`.`email` AS `email`,`empresa`.`telefone_1` AS `telefone_1`,`empresa`.`telefone_2` AS `telefone_2`,`empresa`.`status` AS `status`,`empresa`.`ip_pabx` AS `ip_pabx`,`empresa`.`timestamp` AS `timestamp` from `empresa` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_empresa_ativado`
--

/*!50001 DROP TABLE IF EXISTS `view_empresa_ativado`*/;
/*!50001 DROP VIEW IF EXISTS `view_empresa_ativado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_empresa_ativado` AS select `empresa`.`idEmpresa` AS `idEmpresa`,`empresa`.`nome` AS `nome`,`empresa`.`cnpj` AS `cnpj`,`empresa`.`endereco` AS `endereco`,`empresa`.`bairro` AS `bairro`,`empresa`.`cep` AS `cep`,`empresa`.`cidade` AS `cidade`,`empresa`.`estado` AS `estado`,`empresa`.`email` AS `email`,`empresa`.`telefone_1` AS `telefone_1`,`empresa`.`telefone_2` AS `telefone_2`,`empresa`.`status` AS `status`,`empresa`.`ip_pabx` AS `ip_pabx`,`empresa`.`timestamp` AS `timestamp` from `empresa` where (`empresa`.`status` = 'ativado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_estado`
--

/*!50001 DROP TABLE IF EXISTS `view_estado`*/;
/*!50001 DROP VIEW IF EXISTS `view_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_estado` AS select `estado`.`idEstado` AS `idEstado`,`estado`.`sigla` AS `sigla`,`estado`.`descricao` AS `descricao` from `estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_estado_civil`
--

/*!50001 DROP TABLE IF EXISTS `view_estado_civil`*/;
/*!50001 DROP VIEW IF EXISTS `view_estado_civil`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_estado_civil` AS select `estado_civil`.`idEstadoCivil` AS `idEstadoCivil`,`estado_civil`.`nome` AS `nome`,`estado_civil`.`status` AS `status`,`estado_civil`.`timestamp` AS `timestamp` from `estado_civil` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lib_produto_operacao`
--

/*!50001 DROP TABLE IF EXISTS `view_lib_produto_operacao`*/;
/*!50001 DROP VIEW IF EXISTS `view_lib_produto_operacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lib_produto_operacao` AS select `prod`.`nome` AS `produto`,`prod`.`precoVenda` AS `precoVenda`,`o`.`nome` AS `operacao`,`e`.`nome` AS `empresa`,`lpo`.`idProdutoOperacao` AS `idProdutoOperacao`,`lpo`.`timestamp` AS `timestamp`,`lpo`.`status` AS `status` from (((`lib_produto_operacao` `lpo` join `produto` `prod` on((`prod`.`idProduto` = `lpo`.`idProduto`))) join `operacao` `o` on((`o`.`idOperacao` = `lpo`.`idOperacao`))) join `empresa` `e` on((`e`.`idEmpresa` = `o`.`idEmpresa`))) order by `e`.`nome`,`prod`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lib_usuario_empresa`
--

/*!50001 DROP TABLE IF EXISTS `view_lib_usuario_empresa`*/;
/*!50001 DROP VIEW IF EXISTS `view_lib_usuario_empresa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lib_usuario_empresa` AS select `u`.`nome` AS `usuario`,`u`.`idUsuario` AS `idUsuario`,`e`.`nome` AS `empresa`,`u`.`timestamp` AS `timestamp`,`u`.`status` AS `status` from (`usuario` `u` join `empresa` `e` on((`u`.`idEmpresa` = `e`.`idEmpresa`))) order by `e`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_lib_usuario_operacao`
--

/*!50001 DROP TABLE IF EXISTS `view_lib_usuario_operacao`*/;
/*!50001 DROP VIEW IF EXISTS `view_lib_usuario_operacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_lib_usuario_operacao` AS select `luo`.`idUsuarioOperacao` AS `idUsuarioOperacao`,`u`.`nome` AS `usuario`,`o`.`nome` AS `operacao`,`e`.`nome` AS `empresa`,`luo`.`status` AS `status`,`luo`.`timestamp` AS `timestamp` from (((`lib_usuario_operacao` `luo` join `usuario` `u` on((`u`.`idUsuario` = `luo`.`idUsuario`))) join `operacao` `o` on((`o`.`idOperacao` = `luo`.`idOperacao`))) join `empresa` `e` on((`e`.`idEmpresa` = `u`.`idEmpresa`))) order by `e`.`nome`,`o`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_meta_usuario`
--

/*!50001 DROP TABLE IF EXISTS `view_meta_usuario`*/;
/*!50001 DROP VIEW IF EXISTS `view_meta_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_meta_usuario` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`nome` AS `nome`,`u`.`cpf` AS `cpf`,`u`.`login` AS `login`,`u`.`senha` AS `senha`,`u`.`perfil` AS `perfil`,`u`.`status` AS `status`,`u`.`meta` AS `meta`,`u`.`timestamp` AS `timestamp`,`e`.`nome` AS `empresa` from (`usuario` `u` join `empresa` `e` on((`u`.`idEmpresa` = `e`.`idEmpresa`))) where (`u`.`perfil` = 'agente') order by `u`.`perfil` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_motivo_pedido_nao_venda`
--

/*!50001 DROP TABLE IF EXISTS `view_motivo_pedido_nao_venda`*/;
/*!50001 DROP VIEW IF EXISTS `view_motivo_pedido_nao_venda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_motivo_pedido_nao_venda` AS select `mpnv`.`idMotivo` AS `idMotivo`,`mpnv`.`nome` AS `nome`,`mpnv`.`status` AS `status`,`mpnv`.`timestamp` AS `timestamp`,`e`.`nome` AS `empresa` from (`motivo_pedido_nao_venda` `mpnv` join `empresa` `e` on((`e`.`idEmpresa` = `mpnv`.`idEmpresa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_ocupacao`
--

/*!50001 DROP TABLE IF EXISTS `view_ocupacao`*/;
/*!50001 DROP VIEW IF EXISTS `view_ocupacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ocupacao` AS select `ocupacao`.`idOcupacao` AS `idOcupacao`,`ocupacao`.`nome` AS `nome`,`ocupacao`.`timestamp` AS `timestamp` from `ocupacao` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_operacao`
--

/*!50001 DROP TABLE IF EXISTS `view_operacao`*/;
/*!50001 DROP VIEW IF EXISTS `view_operacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_operacao` AS select `o`.`idOperacao` AS `idOperacao`,`o`.`nome` AS `nome`,`o`.`status` AS `status`,`o`.`timestamp` AS `timestamp`,`e`.`nome` AS `empresa` from (`operacao` `o` join `empresa` `e` on((`e`.`idEmpresa` = `o`.`idEmpresa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_operacao_ativado`
--

/*!50001 DROP TABLE IF EXISTS `view_operacao_ativado`*/;
/*!50001 DROP VIEW IF EXISTS `view_operacao_ativado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_operacao_ativado` AS select `operacao`.`idOperacao` AS `idOperacao`,`operacao`.`nome` AS `nome`,`operacao`.`status` AS `status`,`operacao`.`timestamp` AS `timestamp` from `operacao` where (`operacao`.`status` = 'ativado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orgao_emissor`
--

/*!50001 DROP TABLE IF EXISTS `view_orgao_emissor`*/;
/*!50001 DROP VIEW IF EXISTS `view_orgao_emissor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orgao_emissor` AS select `orgao_emissor`.`nome` AS `nome` from `orgao_emissor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_parentesco`
--

/*!50001 DROP TABLE IF EXISTS `view_parentesco`*/;
/*!50001 DROP VIEW IF EXISTS `view_parentesco`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_parentesco` AS select `parentesco`.`idParentesco` AS `idParentesco`,`parentesco`.`nome` AS `nome`,`parentesco`.`status` AS `status`,`parentesco`.`timestamp` AS `timestamp` from `parentesco` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedido_nao_venda`
--

/*!50001 DROP TABLE IF EXISTS `view_pedido_nao_venda`*/;
/*!50001 DROP VIEW IF EXISTS `view_pedido_nao_venda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedido_nao_venda` AS select `pedido_nao_venda`.`idPedidoNaoVenda` AS `idPedidoNaoVenda`,`pedido_nao_venda`.`idCliente` AS `idCliente`,`pedido_nao_venda`.`idEmpresa` AS `idEmpresa`,`pedido_nao_venda`.`idMotivo` AS `idMotivo`,`pedido_nao_venda`.`idUsuario` AS `idUsuario`,`pedido_nao_venda`.`timestamp` AS `timestamp`,`cliente`.`nome` AS `cliente`,`cliente`.`cpf` AS `cpf`,`usuario`.`nome` AS `usuario`,`empresa`.`nome` AS `empresa`,`motivo_pedido_nao_venda`.`nome` AS `motivo` from ((((`pedido_nao_venda` join `cliente` on((`cliente`.`idCliente` = `pedido_nao_venda`.`idCliente`))) join `usuario` on((`usuario`.`idUsuario` = `pedido_nao_venda`.`idUsuario`))) join `empresa` on((`empresa`.`idEmpresa` = `pedido_nao_venda`.`idEmpresa`))) join `motivo_pedido_nao_venda` on((`motivo_pedido_nao_venda`.`idMotivo` = `pedido_nao_venda`.`idMotivo`))) where (`pedido_nao_venda`.`timestamp` between (curdate() - interval 5 day) and now()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedido_venda`
--

/*!50001 DROP TABLE IF EXISTS `view_pedido_venda`*/;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedido_venda` AS select `pv`.`idPedidoVenda` AS `idPedidoVenda`,`lqpv`.`idQualidadePedidoVenda` AS `idQualidadePedidoVenda`,`lqpv`.`mediaPonderada` AS `mediaPonderada`,`pv`.`idEmpresa` AS `idEmpresa`,`pv`.`idUsuario` AS `idUsuario`,`pv`.`idCliente` AS `idCliente`,`pv`.`idStatus` AS `idStatus`,`pv`.`timestamp` AS `timestamp`,`cliente`.`nome` AS `cliente`,`cliente`.`cpf` AS `cpf`,`usuario`.`nome` AS `usuario`,`empresa`.`nome` AS `empresa`,`status_pedido`.`nome` AS `statusPedido`,`prod`.`precoVenda` AS `precoVenda` from (((((((`pedido_venda` `pv` join `cliente` on((`cliente`.`idCliente` = `pv`.`idCliente`))) join `usuario` on((`usuario`.`idUsuario` = `pv`.`idUsuario`))) join `empresa` on((`empresa`.`idEmpresa` = `pv`.`idEmpresa`))) join `status_pedido` on((`status_pedido`.`idStatus` = `pv`.`idStatus`))) join `lib_pedido_produto` `lpp` on((`lpp`.`idPedido` = `pv`.`idPedidoVenda`))) join `produto` `prod` on((`prod`.`idProduto` = `lpp`.`idProduto`))) join `lib_qualidade_pedido_venda` `lqpv` on((`lqpv`.`idPedidoVenda` = `pv`.`idPedidoVenda`))) where (`pv`.`timestamp` between (curdate() - interval 5 day) and now()) order by `pv`.`timestamp` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedido_venda_aprovado`
--

/*!50001 DROP TABLE IF EXISTS `view_pedido_venda_aprovado`*/;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_aprovado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedido_venda_aprovado` AS select `pv`.`idPedidoVenda` AS `idPedidoVenda`,`lqpv`.`idQualidadePedidoVenda` AS `idQualidadePedidoVenda`,`lqpv`.`mediaPonderada` AS `mediaPonderada`,`pv`.`idEmpresa` AS `idEmpresa`,`pv`.`idUsuario` AS `idUsuario`,`pv`.`idCliente` AS `idCliente`,`pv`.`idStatus` AS `idStatus`,`pv`.`timestamp` AS `timestamp`,`cliente`.`nome` AS `cliente`,`cliente`.`cpf` AS `cpf`,`usuario`.`nome` AS `usuario`,`empresa`.`nome` AS `empresa`,`status_pedido`.`nome` AS `statusPedido`,`prod`.`precoVenda` AS `precoVenda` from (((((((`pedido_venda` `pv` join `cliente` on((`cliente`.`idCliente` = `pv`.`idCliente`))) join `usuario` on((`usuario`.`idUsuario` = `pv`.`idUsuario`))) join `empresa` on((`empresa`.`idEmpresa` = `pv`.`idEmpresa`))) join `status_pedido` on((`status_pedido`.`idStatus` = `pv`.`idStatus`))) join `lib_pedido_produto` `lpp` on((`lpp`.`idPedido` = `pv`.`idPedidoVenda`))) join `produto` `prod` on((`prod`.`idProduto` = `lpp`.`idProduto`))) join `lib_qualidade_pedido_venda` `lqpv` on((`lqpv`.`idPedidoVenda` = `pv`.`idPedidoVenda`))) where ((`pv`.`idStatus` = 1) and (`pv`.`timestamp` between (curdate() - interval 5 day) and now())) order by `pv`.`timestamp` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedido_venda_pendente`
--

/*!50001 DROP TABLE IF EXISTS `view_pedido_venda_pendente`*/;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_pendente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedido_venda_pendente` AS select `pv`.`idPedidoVenda` AS `idPedidoVenda`,`lqpv`.`idQualidadePedidoVenda` AS `idQualidadePedidoVenda`,`lqpv`.`mediaPonderada` AS `mediaPonderada`,`pv`.`idEmpresa` AS `idEmpresa`,`pv`.`idUsuario` AS `idUsuario`,`pv`.`idCliente` AS `idCliente`,`pv`.`idStatus` AS `idStatus`,`pv`.`timestamp` AS `timestamp`,`cliente`.`nome` AS `cliente`,`cliente`.`cpf` AS `cpf`,`usuario`.`nome` AS `usuario`,`empresa`.`nome` AS `empresa`,`status_pedido`.`nome` AS `statusPedido`,`prod`.`precoVenda` AS `precoVenda` from (((((((`pedido_venda` `pv` join `cliente` on((`cliente`.`idCliente` = `pv`.`idCliente`))) join `usuario` on((`usuario`.`idUsuario` = `pv`.`idUsuario`))) join `empresa` on((`empresa`.`idEmpresa` = `pv`.`idEmpresa`))) join `status_pedido` on((`status_pedido`.`idStatus` = `pv`.`idStatus`))) join `lib_pedido_produto` `lpp` on((`lpp`.`idPedido` = `pv`.`idPedidoVenda`))) join `produto` `prod` on((`prod`.`idProduto` = `lpp`.`idProduto`))) join `lib_qualidade_pedido_venda` `lqpv` on((`lqpv`.`idPedidoVenda` = `pv`.`idPedidoVenda`))) where ((`pv`.`idStatus` = 2) and (`pv`.`timestamp` between (curdate() - interval 5 day) and now())) order by `pv`.`timestamp` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedido_venda_reprovado`
--

/*!50001 DROP TABLE IF EXISTS `view_pedido_venda_reprovado`*/;
/*!50001 DROP VIEW IF EXISTS `view_pedido_venda_reprovado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedido_venda_reprovado` AS select `pv`.`idPedidoVenda` AS `idPedidoVenda`,`lqpv`.`idQualidadePedidoVenda` AS `idQualidadePedidoVenda`,`lqpv`.`mediaPonderada` AS `mediaPonderada`,`pv`.`idEmpresa` AS `idEmpresa`,`pv`.`idUsuario` AS `idUsuario`,`pv`.`idCliente` AS `idCliente`,`pv`.`idStatus` AS `idStatus`,`pv`.`timestamp` AS `timestamp`,`cliente`.`nome` AS `cliente`,`cliente`.`cpf` AS `cpf`,`usuario`.`nome` AS `usuario`,`empresa`.`nome` AS `empresa`,`status_pedido`.`nome` AS `statusPedido`,`prod`.`precoVenda` AS `precoVenda` from (((((((`pedido_venda` `pv` join `cliente` on((`cliente`.`idCliente` = `pv`.`idCliente`))) join `usuario` on((`usuario`.`idUsuario` = `pv`.`idUsuario`))) join `empresa` on((`empresa`.`idEmpresa` = `pv`.`idEmpresa`))) join `status_pedido` on((`status_pedido`.`idStatus` = `pv`.`idStatus`))) join `lib_pedido_produto` `lpp` on((`lpp`.`idPedido` = `pv`.`idPedidoVenda`))) join `produto` `prod` on((`prod`.`idProduto` = `lpp`.`idProduto`))) join `lib_qualidade_pedido_venda` `lqpv` on((`lqpv`.`idPedidoVenda` = `pv`.`idPedidoVenda`))) where ((`pv`.`idStatus` = 3) and (`pv`.`timestamp` between (curdate() - interval 5 day) and now())) order by `pv`.`timestamp` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_produto`
--

/*!50001 DROP TABLE IF EXISTS `view_produto`*/;
/*!50001 DROP VIEW IF EXISTS `view_produto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_produto` AS select `prod`.`idProduto` AS `idProduto`,`prod`.`nome` AS `nome`,`prod`.`descricao` AS `descricao`,`prod`.`status` AS `status`,`prod`.`timestamp` AS `timestamp`,`prod`.`precoVenda` AS `precoVenda`,`prod`.`vitalicio` AS `vitalicio`,`prod`.`primeiraParcela` AS `primeiraParcela`,`e`.`nome` AS `empresa` from (`produto` `prod` join `empresa` `e` on((`e`.`idEmpresa` = `prod`.`idEmpresa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_produto_ativado`
--

/*!50001 DROP TABLE IF EXISTS `view_produto_ativado`*/;
/*!50001 DROP VIEW IF EXISTS `view_produto_ativado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_produto_ativado` AS select `prod`.`idProduto` AS `idProduto`,`prod`.`nome` AS `nome`,`prod`.`descricao` AS `descricao`,`prod`.`status` AS `status`,`prod`.`timestamp` AS `timestamp`,`prod`.`precoVenda` AS `precoVenda`,`prod`.`vitalicio` AS `vitalicio`,`prod`.`primeiraParcela` AS `primeiraParcela`,`e`.`nome` AS `empresa` from (`produto` `prod` join `empresa` `e` on((`e`.`idEmpresa` = `prod`.`idEmpresa`))) where (`prod`.`status` = 'ativado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_robo`
--

/*!50001 DROP TABLE IF EXISTS `view_robo`*/;
/*!50001 DROP VIEW IF EXISTS `view_robo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_robo` AS select `c`.`nome` AS `cliente`,`c`.`cpf` AS `cpf`,`c`.`rg` AS `rg`,`c`.`orgaoEmissor` AS `orgaoEmissor`,`VERIFICASEXO`(`c`.`sexo`) AS `codSexo`,`VERIFICAESTADOCIVIL`(`c`.`estadoCivil`) AS `codEstadoCivil`,`CORRIGEDATA`(`c`.`dataNascimento`) AS `dataNascimento`,`c`.`endereco` AS `endereco`,`c`.`complemento` AS `complemento`,`CORRIGECEP`(`c`.`cep`) AS `cep`,`c`.`bairro` AS `bairro`,`c`.`cidade` AS `cidade`,`c`.`estado` AS `estado`,`c`.`telefone_1` AS `telefone_1`,`c`.`telefone_2` AS `telefone_2`,`c`.`email` AS `email`,`c`.`ocupacao` AS `ocupacao`,`c`.`peso` AS `peso`,`c`.`altura` AS `altura`,`c`.`agencia` AS `agencia`,`DIGITOAGENCIA`(`c`.`agencia`) AS `digitoAgencia`,`c`.`conta` AS `conta`,`c`.`nome_benef_1` AS `nome_benef_1`,`c`.`nome_benef_2` AS `nome_benef_2`,`c`.`nome_benef_3` AS `nome_benef_3`,`c`.`nome_benef_4` AS `nome_benef_4`,`c`.`nome_benef_5` AS `nome_benef_5`,`c`.`parentesco_benef_1` AS `parentesco_benef_1`,`c`.`parentesco_benef_2` AS `parentesco_benef_2`,`c`.`parentesco_benef_3` AS `parentesco_benef_3`,`c`.`parentesco_benef_4` AS `parentesco_benef_4`,`c`.`parentesco_benef_5` AS `parentesco_benef_5`,1868 AS `codOcupacao`,`VERIFICAPRODUTO`(`prod`.`precoVenda`) AS `codProduto` from ((((`pedido_venda` `pv` join `cliente` `c` on((`c`.`idCliente` = `pv`.`idCliente`))) join `usuario` `u` on((`u`.`idUsuario` = `pv`.`idUsuario`))) join `lib_pedido_produto` `lpp` on((`lpp`.`idPedido` = `pv`.`idPedidoVenda`))) join `produto` `prod` on((`prod`.`idProduto` = `lpp`.`idProduto`))) where ((`pv`.`idStatus` = 1) and (`c`.`agencia` <> '')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_status_pedido`
--

/*!50001 DROP TABLE IF EXISTS `view_status_pedido`*/;
/*!50001 DROP VIEW IF EXISTS `view_status_pedido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_status_pedido` AS select `status_pedido`.`idStatus` AS `idStatus`,`status_pedido`.`nome` AS `nome`,`status_pedido`.`status` AS `status`,`status_pedido`.`timestamp` AS `timestamp` from `status_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_usuario`
--

/*!50001 DROP TABLE IF EXISTS `view_usuario`*/;
/*!50001 DROP VIEW IF EXISTS `view_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_usuario` AS select `u`.`idUsuario` AS `idUsuario`,`u`.`nome` AS `nome`,`u`.`cpf` AS `cpf`,`u`.`login` AS `login`,`u`.`senha` AS `senha`,`u`.`perfil` AS `perfil`,`u`.`status` AS `status`,`u`.`meta` AS `meta`,`u`.`timestamp` AS `timestamp`,`e`.`nome` AS `empresa` from (`usuario` `u` join `empresa` `e` on((`u`.`idEmpresa` = `e`.`idEmpresa`))) order by `e`.`nome`,`u`.`perfil` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_usuario_ativado`
--

/*!50001 DROP TABLE IF EXISTS `view_usuario_ativado`*/;
/*!50001 DROP VIEW IF EXISTS `view_usuario_ativado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_usuario_ativado` AS select `usuario`.`idUsuario` AS `idUsuario`,`usuario`.`nome` AS `nome`,`usuario`.`cpf` AS `cpf`,`usuario`.`login` AS `login`,`usuario`.`senha` AS `senha`,`usuario`.`perfil` AS `perfil`,`usuario`.`status` AS `status`,`usuario`.`timestamp` AS `timestamp` from `usuario` where (`usuario`.`status` = 'ativado') */;
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

-- Dump completed on 2018-06-30 10:28:26
