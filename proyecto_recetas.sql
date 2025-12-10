-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_recetas
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `area_trabajo`
--

DROP TABLE IF EXISTS `area_trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area_trabajo` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cat├ílogo de ├íreas f├¡sicas o estaciones de trabajo en el comedor.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_trabajo`
--

LOCK TABLES `area_trabajo` WRITE;
/*!40000 ALTER TABLE `area_trabajo` DISABLE KEYS */;
INSERT INTO `area_trabajo` VALUES (1,'Bodega Principal','Área de Inventario y Almacén para registro de entradas y salidas de materia prima.',1),(2,'Cocina Caliente','Área de Producción y Preparación de platos fuertes y calientes.',1),(3,'Cocina Fría/Panadería','Área de preparación de ensaladas, postres, bebidas y panadería.',1),(4,'Línea de Servicio','Área donde el Personal de Servicio entrega las porciones de alimentos al cliente.',1),(5,'Punto de Venta (POS)','Área de registro de ventas, pagos de Cajeras y cierres de caja.',1);
/*!40000 ALTER TABLE `area_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_detalle`
--

DROP TABLE IF EXISTS `auditoria_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_detalle` (
  `id_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_evento` bigint NOT NULL,
  `nombre_campo` varchar(100) NOT NULL,
  `valor_anterior` text,
  `valor_nuevo` text,
  PRIMARY KEY (`id_detalle`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `auditoria_detalle_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `auditoria_evento` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de cambios de campo asociados a un evento de auditor├¡a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_detalle`
--

LOCK TABLES `auditoria_detalle` WRITE;
/*!40000 ALTER TABLE `auditoria_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_evento`
--

DROP TABLE IF EXISTS `auditoria_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_evento` (
  `id_evento` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tabla` varchar(100) NOT NULL,
  `pk_valor` varchar(100) NOT NULL,
  `tipo_operacion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha_evento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `auditoria_evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evento general de auditor├¡a por operaci├│n en una tabla';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_evento`
--

LOCK TABLES `auditoria_evento` WRITE;
/*!40000 ALTER TABLE `auditoria_evento` DISABLE KEYS */;
INSERT INTO `auditoria_evento` VALUES (252,'ingrediente','1','INSERT',NULL,'2025-12-09 01:16:10',NULL),(253,'ingrediente','2','INSERT',NULL,'2025-12-09 01:16:10',NULL),(254,'ingrediente','3','INSERT',NULL,'2025-12-09 01:16:10',NULL),(255,'ingrediente','4','INSERT',NULL,'2025-12-09 01:16:10',NULL),(256,'ingrediente','5','INSERT',NULL,'2025-12-09 01:16:10',NULL),(257,'ingrediente','6','INSERT',NULL,'2025-12-09 01:16:10',NULL),(258,'ingrediente','7','INSERT',NULL,'2025-12-09 01:16:10',NULL),(259,'ingrediente','8','INSERT',NULL,'2025-12-09 01:16:10',NULL),(260,'ingrediente','9','INSERT',NULL,'2025-12-09 01:16:10',NULL),(261,'ingrediente','10','INSERT',NULL,'2025-12-09 01:16:10',NULL),(262,'ingrediente','11','INSERT',NULL,'2025-12-09 01:16:10',NULL),(263,'ingrediente','12','INSERT',NULL,'2025-12-09 01:16:10',NULL),(264,'ingrediente','13','INSERT',NULL,'2025-12-09 01:16:10',NULL),(265,'ingrediente','14','INSERT',NULL,'2025-12-09 01:16:10',NULL),(266,'ingrediente','15','INSERT',NULL,'2025-12-09 01:16:10',NULL),(267,'ingrediente','16','INSERT',NULL,'2025-12-09 01:16:10',NULL),(268,'ingrediente','17','INSERT',NULL,'2025-12-09 01:16:10',NULL),(269,'ingrediente','18','INSERT',NULL,'2025-12-09 01:16:10',NULL),(270,'ingrediente','19','INSERT',NULL,'2025-12-09 01:16:10',NULL),(271,'ingrediente','20','INSERT',NULL,'2025-12-09 01:16:10',NULL),(272,'ingrediente','21','INSERT',NULL,'2025-12-09 01:16:10',NULL),(273,'ingrediente','22','INSERT',NULL,'2025-12-09 01:16:10',NULL),(274,'ingrediente','24','INSERT',NULL,'2025-12-09 01:16:10',NULL),(275,'ingrediente','25','INSERT',NULL,'2025-12-09 01:16:10',NULL),(276,'ingrediente','26','INSERT',NULL,'2025-12-09 01:16:10',NULL),(277,'ingrediente','27','INSERT',NULL,'2025-12-09 01:16:10',NULL),(278,'ingrediente','28','INSERT',NULL,'2025-12-09 01:16:10',NULL),(279,'ingrediente','29','INSERT',NULL,'2025-12-09 01:16:10',NULL),(280,'ingrediente','30','INSERT',NULL,'2025-12-09 01:16:10',NULL),(281,'ingrediente','31','INSERT',NULL,'2025-12-09 01:16:10',NULL),(282,'ingrediente','32','INSERT',NULL,'2025-12-09 01:16:10',NULL),(283,'ingrediente','33','INSERT',NULL,'2025-12-09 01:16:10',NULL),(284,'ingrediente','34','INSERT',NULL,'2025-12-09 01:16:10',NULL),(285,'ingrediente','35','INSERT',NULL,'2025-12-09 01:16:10',NULL),(286,'ingrediente','36','INSERT',NULL,'2025-12-09 01:16:10',NULL),(287,'ingrediente','37','INSERT',NULL,'2025-12-09 01:16:10',NULL),(288,'ingrediente','38','INSERT',NULL,'2025-12-09 01:16:10',NULL),(289,'ingrediente','39','INSERT',NULL,'2025-12-09 01:16:10',NULL),(290,'ingrediente','40','INSERT',NULL,'2025-12-09 01:16:10',NULL),(291,'ingrediente','42','INSERT',NULL,'2025-12-09 01:16:10',NULL),(292,'ingrediente','43','INSERT',NULL,'2025-12-09 01:16:10',NULL),(293,'ingrediente','44','INSERT',NULL,'2025-12-09 01:16:10',NULL),(294,'ingrediente','45','INSERT',NULL,'2025-12-09 01:16:10',NULL),(295,'ingrediente','46','INSERT',NULL,'2025-12-09 01:16:10',NULL),(296,'ingrediente','47','INSERT',NULL,'2025-12-09 01:16:10',NULL),(297,'ingrediente','48','INSERT',NULL,'2025-12-09 01:16:10',NULL),(298,'ingrediente','49','INSERT',NULL,'2025-12-09 01:16:10',NULL),(299,'ingrediente','50','INSERT',NULL,'2025-12-09 01:16:10',NULL),(300,'ingrediente','51','INSERT',NULL,'2025-12-09 01:16:10',NULL),(301,'ingrediente','52','INSERT',NULL,'2025-12-09 01:16:10',NULL),(302,'ingrediente','53','INSERT',NULL,'2025-12-09 01:16:10',NULL),(303,'ingrediente','54','INSERT',NULL,'2025-12-09 01:16:10',NULL),(304,'ingrediente','55','INSERT',NULL,'2025-12-09 01:16:10',NULL),(305,'ingrediente','56','INSERT',NULL,'2025-12-09 01:16:10',NULL),(306,'ingrediente','57','INSERT',NULL,'2025-12-09 01:16:10',NULL),(307,'ingrediente','58','INSERT',NULL,'2025-12-09 01:16:10',NULL),(308,'ingrediente','59','INSERT',NULL,'2025-12-09 01:16:10',NULL),(309,'ingrediente','60','INSERT',NULL,'2025-12-09 01:16:10',NULL),(310,'ingrediente','61','INSERT',NULL,'2025-12-09 01:16:10',NULL),(311,'ingrediente','62','INSERT',NULL,'2025-12-09 01:16:10',NULL),(312,'ingrediente','63','INSERT',NULL,'2025-12-09 01:16:10',NULL),(313,'ingrediente','64','INSERT',NULL,'2025-12-09 01:16:10',NULL),(314,'ingrediente','65','INSERT',NULL,'2025-12-09 01:16:10',NULL),(315,'ingrediente','66','INSERT',NULL,'2025-12-09 01:16:10',NULL),(316,'ingrediente','67','INSERT',NULL,'2025-12-09 01:16:10',NULL),(317,'ingrediente','68','INSERT',NULL,'2025-12-09 01:16:10',NULL),(318,'ingrediente','69','INSERT',NULL,'2025-12-09 01:16:10',NULL),(319,'ingrediente','70','INSERT',NULL,'2025-12-09 01:16:10',NULL),(320,'ingrediente','71','INSERT',NULL,'2025-12-09 01:16:10',NULL),(321,'ingrediente','72','INSERT',NULL,'2025-12-09 01:16:10',NULL),(322,'ingrediente','73','INSERT',NULL,'2025-12-09 01:16:10',NULL),(323,'ingrediente','74','INSERT',NULL,'2025-12-09 01:16:10',NULL),(324,'ingrediente','75','INSERT',NULL,'2025-12-09 01:16:10',NULL),(325,'ingrediente','76','INSERT',NULL,'2025-12-09 01:16:10',NULL),(326,'ingrediente','77','INSERT',NULL,'2025-12-09 01:16:10',NULL),(327,'ingrediente','78','INSERT',NULL,'2025-12-09 01:16:10',NULL),(328,'ingrediente','79','INSERT',NULL,'2025-12-09 01:16:10',NULL),(329,'ingrediente','80','INSERT',NULL,'2025-12-09 01:16:10',NULL),(330,'ingrediente','81','INSERT',NULL,'2025-12-09 01:16:10',NULL),(331,'ingrediente','82','INSERT',NULL,'2025-12-09 01:16:10',NULL),(332,'ingrediente','83','INSERT',NULL,'2025-12-09 01:16:10',NULL),(333,'ingrediente','84','INSERT',NULL,'2025-12-09 01:16:10',NULL),(334,'ingrediente','85','INSERT',NULL,'2025-12-09 01:16:10',NULL),(335,'ingrediente','86','INSERT',NULL,'2025-12-09 01:16:10',NULL),(336,'ingrediente','87','INSERT',NULL,'2025-12-09 01:16:10',NULL),(337,'ingrediente','88','INSERT',NULL,'2025-12-09 01:16:10',NULL),(338,'ingrediente','89','INSERT',NULL,'2025-12-09 01:16:10',NULL),(339,'ingrediente','90','INSERT',NULL,'2025-12-09 01:16:10',NULL),(340,'ingrediente','91','INSERT',NULL,'2025-12-09 01:16:10',NULL),(341,'ingrediente','92','INSERT',NULL,'2025-12-09 01:16:10',NULL),(342,'ingrediente','93','INSERT',NULL,'2025-12-09 01:16:10',NULL),(343,'ingrediente','94','INSERT',NULL,'2025-12-09 01:16:10',NULL),(344,'ingrediente','95','INSERT',NULL,'2025-12-09 01:16:10',NULL),(345,'ingrediente','96','INSERT',NULL,'2025-12-09 01:16:10',NULL),(346,'ingrediente','97','INSERT',NULL,'2025-12-09 01:16:10',NULL),(347,'ingrediente','98','INSERT',NULL,'2025-12-09 01:16:10',NULL),(348,'ingrediente','99','INSERT',NULL,'2025-12-09 01:16:10',NULL),(349,'ingrediente','100','INSERT',NULL,'2025-12-09 01:16:10',NULL),(350,'ingrediente','101','INSERT',NULL,'2025-12-09 01:16:10',NULL),(351,'ingrediente','102','INSERT',NULL,'2025-12-09 01:16:10',NULL),(352,'ingrediente','103','INSERT',NULL,'2025-12-09 01:16:10',NULL),(353,'ingrediente','104','INSERT',NULL,'2025-12-09 01:16:10',NULL),(354,'ingrediente','105','INSERT',NULL,'2025-12-09 01:16:10',NULL),(355,'ingrediente','106','INSERT',NULL,'2025-12-09 01:16:10',NULL),(356,'ingrediente','107','INSERT',NULL,'2025-12-09 01:16:10',NULL),(357,'ingrediente','108','INSERT',NULL,'2025-12-09 01:16:10',NULL),(358,'ingrediente','109','INSERT',NULL,'2025-12-09 01:16:10',NULL),(359,'ingrediente','110','INSERT',NULL,'2025-12-09 01:16:10',NULL),(360,'ingrediente','111','INSERT',NULL,'2025-12-09 01:16:10',NULL),(361,'ingrediente','112','INSERT',NULL,'2025-12-09 01:16:10',NULL),(362,'ingrediente','113','INSERT',NULL,'2025-12-09 01:16:10',NULL),(363,'ingrediente','114','INSERT',NULL,'2025-12-09 01:16:10',NULL),(364,'ingrediente','115','INSERT',NULL,'2025-12-09 01:16:10',NULL),(365,'ingrediente','116','INSERT',NULL,'2025-12-09 01:16:10',NULL),(366,'ingrediente','117','INSERT',NULL,'2025-12-09 01:16:10',NULL),(367,'ingrediente','118','INSERT',NULL,'2025-12-09 01:16:10',NULL),(368,'ingrediente','119','INSERT',NULL,'2025-12-09 01:16:10',NULL),(369,'ingrediente','120','INSERT',NULL,'2025-12-09 01:16:10',NULL),(370,'ingrediente','121','INSERT',NULL,'2025-12-09 01:16:10',NULL),(371,'ingrediente','122','INSERT',NULL,'2025-12-09 01:16:10',NULL),(372,'ingrediente','123','INSERT',NULL,'2025-12-09 01:16:10',NULL),(373,'ingrediente','124','INSERT',NULL,'2025-12-09 01:16:10',NULL),(374,'ingrediente','125','INSERT',NULL,'2025-12-09 01:16:10',NULL),(375,'ingrediente','126','INSERT',NULL,'2025-12-09 01:16:10',NULL),(376,'ingrediente','127','INSERT',NULL,'2025-12-09 01:16:10',NULL),(377,'ingrediente','128','INSERT',NULL,'2025-12-09 01:16:10',NULL),(378,'ingrediente','129','INSERT',NULL,'2025-12-09 01:16:10',NULL),(379,'ingrediente','130','INSERT',NULL,'2025-12-09 01:16:10',NULL),(380,'ingrediente','131','INSERT',NULL,'2025-12-09 01:16:10',NULL),(381,'ingrediente','132','INSERT',NULL,'2025-12-09 01:16:10',NULL),(382,'ingrediente','133','INSERT',NULL,'2025-12-09 01:16:10',NULL),(383,'ingrediente','134','INSERT',NULL,'2025-12-09 01:16:10',NULL),(384,'ingrediente','135','INSERT',NULL,'2025-12-09 01:16:10',NULL),(385,'ingrediente','136','INSERT',NULL,'2025-12-09 01:16:10',NULL),(386,'ingrediente','137','INSERT',NULL,'2025-12-09 01:16:10',NULL),(387,'ingrediente','138','INSERT',NULL,'2025-12-09 01:16:10',NULL),(388,'ingrediente','140','INSERT',NULL,'2025-12-09 01:16:10',NULL),(389,'ingrediente','141','INSERT',NULL,'2025-12-09 01:16:10',NULL),(390,'ingrediente','142','INSERT',NULL,'2025-12-09 01:16:10',NULL),(391,'ingrediente','143','INSERT',NULL,'2025-12-09 01:16:10',NULL),(392,'ingrediente','144','INSERT',NULL,'2025-12-09 01:16:10',NULL),(393,'ingrediente','145','INSERT',NULL,'2025-12-09 01:16:10',NULL),(394,'ingrediente','146','INSERT',NULL,'2025-12-09 01:16:10',NULL),(395,'ingrediente','147','INSERT',NULL,'2025-12-09 01:16:10',NULL),(396,'ingrediente','148','INSERT',NULL,'2025-12-09 01:16:10',NULL),(397,'ingrediente','149','INSERT',NULL,'2025-12-09 01:16:10',NULL),(398,'ingrediente','150','INSERT',NULL,'2025-12-09 01:16:10',NULL),(399,'ingrediente','151','INSERT',NULL,'2025-12-09 01:16:10',NULL),(400,'ingrediente','152','INSERT',NULL,'2025-12-09 01:16:10',NULL),(401,'ingrediente','153','INSERT',NULL,'2025-12-09 01:16:10',NULL),(402,'ingrediente','154','INSERT',NULL,'2025-12-09 01:16:10',NULL),(403,'ingrediente','155','INSERT',NULL,'2025-12-09 01:16:10',NULL),(404,'ingrediente','156','INSERT',NULL,'2025-12-09 01:16:10',NULL),(405,'ingrediente','157','INSERT',NULL,'2025-12-09 01:16:10',NULL),(406,'ingrediente','158','INSERT',NULL,'2025-12-09 01:16:10',NULL),(407,'ingrediente','159','INSERT',NULL,'2025-12-09 01:16:10',NULL),(408,'ingrediente','160','INSERT',NULL,'2025-12-09 01:16:10',NULL),(409,'ingrediente','161','INSERT',NULL,'2025-12-09 01:16:10',NULL),(410,'ingrediente','162','INSERT',NULL,'2025-12-09 01:16:10',NULL),(411,'ingrediente','163','INSERT',NULL,'2025-12-09 01:16:10',NULL),(412,'ingrediente','164','INSERT',NULL,'2025-12-09 01:16:10',NULL),(413,'ingrediente','165','INSERT',NULL,'2025-12-09 01:16:10',NULL),(414,'ingrediente','166','INSERT',NULL,'2025-12-09 01:16:10',NULL),(415,'ingrediente','167','INSERT',NULL,'2025-12-09 01:16:10',NULL),(416,'ingrediente','168','INSERT',NULL,'2025-12-09 01:16:10',NULL),(417,'ingrediente','169','INSERT',NULL,'2025-12-09 01:16:10',NULL),(418,'ingrediente','170','INSERT',NULL,'2025-12-09 01:16:10',NULL),(419,'ingrediente','172','INSERT',NULL,'2025-12-09 01:16:10',NULL),(420,'ingrediente','173','INSERT',NULL,'2025-12-09 01:16:10',NULL),(421,'ingrediente','174','INSERT',NULL,'2025-12-09 01:16:10',NULL),(422,'ingrediente','175','INSERT',NULL,'2025-12-09 01:16:10',NULL),(423,'ingrediente','176','INSERT',NULL,'2025-12-09 01:16:10',NULL),(424,'ingrediente','177','INSERT',NULL,'2025-12-09 01:16:10',NULL),(425,'ingrediente','178','INSERT',NULL,'2025-12-09 01:16:10',NULL),(426,'ingrediente','179','INSERT',NULL,'2025-12-09 01:16:10',NULL),(427,'ingrediente','180','INSERT',NULL,'2025-12-09 01:16:10',NULL),(428,'ingrediente','181','INSERT',NULL,'2025-12-09 01:16:10',NULL),(429,'ingrediente','182','INSERT',NULL,'2025-12-09 01:16:10',NULL),(430,'ingrediente','183','INSERT',NULL,'2025-12-09 01:16:10',NULL),(431,'ingrediente','184','INSERT',NULL,'2025-12-09 01:16:10',NULL),(432,'ingrediente','185','INSERT',NULL,'2025-12-09 01:16:10',NULL),(433,'ingrediente','186','INSERT',NULL,'2025-12-09 01:16:10',NULL),(434,'ingrediente','187','INSERT',NULL,'2025-12-09 01:16:10',NULL),(435,'ingrediente','188','INSERT',NULL,'2025-12-09 01:16:10',NULL),(436,'ingrediente','190','INSERT',NULL,'2025-12-09 01:16:10',NULL),(437,'ingrediente','191','INSERT',NULL,'2025-12-09 01:16:10',NULL),(438,'ingrediente','192','INSERT',NULL,'2025-12-09 01:16:10',NULL),(439,'ingrediente','193','INSERT',NULL,'2025-12-09 01:16:10',NULL),(440,'ingrediente','194','INSERT',NULL,'2025-12-09 01:16:10',NULL),(441,'ingrediente','195','INSERT',NULL,'2025-12-09 01:16:10',NULL),(442,'ingrediente','196','INSERT',NULL,'2025-12-09 01:16:10',NULL),(443,'ingrediente','197','INSERT',NULL,'2025-12-09 01:16:10',NULL),(444,'ingrediente','198','INSERT',NULL,'2025-12-09 01:16:10',NULL),(445,'ingrediente','199','INSERT',NULL,'2025-12-09 01:16:10',NULL),(446,'ingrediente','200','INSERT',NULL,'2025-12-09 01:16:10',NULL),(447,'ingrediente','201','INSERT',NULL,'2025-12-09 01:16:10',NULL),(448,'ingrediente','202','INSERT',NULL,'2025-12-09 01:16:10',NULL),(449,'ingrediente','203','INSERT',NULL,'2025-12-09 01:16:10',NULL),(450,'ingrediente','204','INSERT',NULL,'2025-12-09 01:16:10',NULL),(451,'ingrediente','205','INSERT',NULL,'2025-12-09 01:16:10',NULL),(452,'ingrediente','206','INSERT',NULL,'2025-12-09 01:16:10',NULL),(453,'ingrediente','207','INSERT',NULL,'2025-12-09 01:16:10',NULL),(454,'ingrediente','208','INSERT',NULL,'2025-12-09 01:16:10',NULL),(455,'ingrediente','209','INSERT',NULL,'2025-12-09 01:16:10',NULL),(456,'ingrediente','210','INSERT',NULL,'2025-12-09 01:16:10',NULL),(457,'ingrediente','211','INSERT',NULL,'2025-12-09 01:16:10',NULL),(458,'ingrediente','212','INSERT',NULL,'2025-12-09 01:16:10',NULL),(459,'ingrediente','213','INSERT',NULL,'2025-12-09 01:16:10',NULL),(460,'ingrediente','214','INSERT',NULL,'2025-12-09 01:16:10',NULL),(461,'ingrediente','215','INSERT',NULL,'2025-12-09 01:16:10',NULL),(462,'ingrediente','216','INSERT',NULL,'2025-12-09 01:16:10',NULL),(463,'ingrediente','217','INSERT',NULL,'2025-12-09 01:16:10',NULL),(464,'ingrediente','218','INSERT',NULL,'2025-12-09 01:16:10',NULL),(465,'ingrediente','219','INSERT',NULL,'2025-12-09 01:16:10',NULL),(466,'ingrediente','220','INSERT',NULL,'2025-12-09 01:16:10',NULL),(467,'ingrediente','221','INSERT',NULL,'2025-12-09 01:16:10',NULL),(468,'ingrediente','222','INSERT',NULL,'2025-12-09 01:16:10',NULL),(469,'ingrediente','223','INSERT',NULL,'2025-12-09 01:16:10',NULL),(470,'ingrediente','224','INSERT',NULL,'2025-12-09 01:16:10',NULL),(471,'ingrediente','225','INSERT',NULL,'2025-12-09 01:16:10',NULL),(472,'ingrediente','226','INSERT',NULL,'2025-12-09 01:16:10',NULL),(473,'ingrediente','227','INSERT',NULL,'2025-12-09 01:16:10',NULL),(474,'ingrediente','228','INSERT',NULL,'2025-12-09 01:16:10',NULL),(475,'ingrediente','229','INSERT',NULL,'2025-12-09 01:16:10',NULL),(476,'ingrediente','230','INSERT',NULL,'2025-12-09 01:16:10',NULL),(477,'ingrediente','231','INSERT',NULL,'2025-12-09 01:16:10',NULL),(478,'ingrediente','232','INSERT',NULL,'2025-12-09 01:16:10',NULL),(479,'ingrediente','233','INSERT',NULL,'2025-12-09 01:16:10',NULL),(480,'ingrediente','234','INSERT',NULL,'2025-12-09 01:16:10',NULL),(481,'ingrediente','235','INSERT',NULL,'2025-12-09 01:16:10',NULL),(482,'ingrediente','236','INSERT',NULL,'2025-12-09 01:16:10',NULL),(483,'ingrediente','237','INSERT',NULL,'2025-12-09 01:16:10',NULL),(484,'ingrediente','238','INSERT',NULL,'2025-12-09 01:16:10',NULL),(485,'ingrediente','239','INSERT',NULL,'2025-12-09 01:16:10',NULL),(486,'ingrediente','240','INSERT',NULL,'2025-12-09 01:16:10',NULL),(487,'ingrediente','241','INSERT',NULL,'2025-12-09 01:16:10',NULL),(488,'ingrediente','242','INSERT',NULL,'2025-12-09 01:16:10',NULL),(489,'ingrediente','243','INSERT',NULL,'2025-12-09 01:16:10',NULL),(490,'ingrediente','244','INSERT',NULL,'2025-12-09 01:16:10',NULL),(491,'ingrediente','245','INSERT',NULL,'2025-12-09 01:16:10',NULL),(492,'ingrediente','246','INSERT',NULL,'2025-12-09 01:16:10',NULL),(493,'ingrediente','247','INSERT',NULL,'2025-12-09 01:16:10',NULL),(494,'ingrediente','248','INSERT',NULL,'2025-12-09 01:16:10',NULL),(495,'ingrediente','249','INSERT',NULL,'2025-12-09 01:16:10',NULL),(496,'ingrediente','250','INSERT',NULL,'2025-12-09 01:16:10',NULL),(497,'ingrediente','251','INSERT',NULL,'2025-12-09 01:16:10',NULL),(498,'ingrediente','252','INSERT',NULL,'2025-12-09 01:16:10',NULL),(499,'ingrediente','253','INSERT',NULL,'2025-12-09 01:16:10',NULL),(500,'ingrediente','254','INSERT',NULL,'2025-12-09 01:16:10',NULL),(501,'ingrediente','255','INSERT',NULL,'2025-12-09 01:16:10',NULL),(502,'ingrediente','256','INSERT',NULL,'2025-12-09 01:16:10',NULL),(503,'ingrediente','257','INSERT',NULL,'2025-12-09 01:16:10',NULL),(504,'ingrediente','258','INSERT',NULL,'2025-12-09 01:16:10',NULL),(505,'ingrediente','259','INSERT',NULL,'2025-12-09 01:16:10',NULL),(506,'ingrediente','260','INSERT',NULL,'2025-12-09 01:16:10',NULL),(507,'ingrediente','261','INSERT',NULL,'2025-12-09 01:16:10',NULL),(508,'ingrediente','262','INSERT',NULL,'2025-12-09 01:16:10',NULL),(509,'ingrediente','263','INSERT',NULL,'2025-12-09 01:16:10',NULL),(510,'ingrediente','264','INSERT',NULL,'2025-12-09 01:16:10',NULL),(511,'ingrediente','265','INSERT',NULL,'2025-12-09 01:16:10',NULL),(512,'ingrediente','266','INSERT',NULL,'2025-12-09 01:16:10',NULL),(513,'ingrediente','267','INSERT',NULL,'2025-12-09 01:16:10',NULL),(514,'ingrediente','268','INSERT',NULL,'2025-12-09 01:16:10',NULL),(515,'ingrediente','269','INSERT',NULL,'2025-12-09 01:16:10',NULL),(516,'ingrediente','270','INSERT',NULL,'2025-12-09 01:16:10',NULL),(517,'ingrediente','271','INSERT',NULL,'2025-12-09 01:16:10',NULL),(518,'ingrediente','272','INSERT',NULL,'2025-12-09 01:16:10',NULL),(519,'ingrediente','273','INSERT',NULL,'2025-12-09 01:16:10',NULL),(520,'ingrediente','274','INSERT',NULL,'2025-12-09 01:16:10',NULL),(521,'ingrediente','275','INSERT',NULL,'2025-12-09 01:16:10',NULL),(522,'ingrediente','276','INSERT',NULL,'2025-12-09 01:16:10',NULL),(523,'ingrediente','277','INSERT',NULL,'2025-12-09 01:16:10',NULL),(524,'ingrediente','278','INSERT',NULL,'2025-12-09 01:16:10',NULL),(525,'ingrediente','279','INSERT',NULL,'2025-12-09 01:16:10',NULL),(526,'ingrediente','280','INSERT',NULL,'2025-12-09 01:16:10',NULL),(527,'ingrediente','281','INSERT',NULL,'2025-12-09 01:16:10',NULL),(528,'ingrediente','282','INSERT',NULL,'2025-12-09 01:16:10',NULL),(529,'ingrediente','283','INSERT',NULL,'2025-12-09 01:16:10',NULL),(530,'ingrediente','284','INSERT',NULL,'2025-12-09 01:16:10',NULL),(531,'ingrediente','285','INSERT',NULL,'2025-12-09 01:16:10',NULL),(532,'ingrediente','286','INSERT',NULL,'2025-12-09 01:16:10',NULL),(533,'ingrediente','287','INSERT',NULL,'2025-12-09 01:16:10',NULL),(534,'ingrediente','288','INSERT',NULL,'2025-12-09 01:16:10',NULL),(535,'ingrediente','289','INSERT',NULL,'2025-12-09 01:16:10',NULL),(536,'ingrediente','290','INSERT',NULL,'2025-12-09 01:16:10',NULL),(537,'ingrediente','291','INSERT',NULL,'2025-12-09 01:16:10',NULL),(538,'ingrediente','292','INSERT',NULL,'2025-12-09 01:16:10',NULL),(539,'ingrediente','293','INSERT',NULL,'2025-12-09 01:16:10',NULL),(540,'ingrediente','294','INSERT',NULL,'2025-12-09 01:16:10',NULL),(541,'ingrediente','295','INSERT',NULL,'2025-12-09 01:16:10',NULL),(542,'ingrediente','296','INSERT',NULL,'2025-12-09 01:16:10',NULL),(543,'ingrediente','297','INSERT',NULL,'2025-12-09 01:16:10',NULL),(544,'ingrediente','298','INSERT',NULL,'2025-12-09 01:16:10',NULL),(545,'ingrediente','299','INSERT',NULL,'2025-12-09 01:16:10',NULL),(546,'ingrediente','300','INSERT',NULL,'2025-12-09 01:16:10',NULL),(547,'ingrediente','301','INSERT',NULL,'2025-12-09 01:16:10',NULL),(548,'ingrediente','302','INSERT',NULL,'2025-12-09 01:16:10',NULL),(549,'ingrediente','303','INSERT',NULL,'2025-12-09 01:16:10',NULL),(550,'ingrediente','304','INSERT',NULL,'2025-12-09 01:16:10',NULL),(551,'ingrediente','305','INSERT',NULL,'2025-12-09 01:16:10',NULL),(552,'ingrediente','306','INSERT',NULL,'2025-12-09 01:16:10',NULL),(553,'ingrediente','307','INSERT',NULL,'2025-12-09 01:16:10',NULL),(554,'ingrediente','309','INSERT',NULL,'2025-12-09 01:16:10',NULL),(555,'ingrediente','310','INSERT',NULL,'2025-12-09 01:16:10',NULL),(556,'ingrediente','311','INSERT',NULL,'2025-12-09 01:16:10',NULL),(557,'ingrediente','312','INSERT',NULL,'2025-12-09 01:16:10',NULL),(558,'ingrediente','313','INSERT',NULL,'2025-12-09 01:16:10',NULL),(559,'ingrediente','314','INSERT',NULL,'2025-12-09 01:16:10',NULL),(560,'ingrediente','315','INSERT',NULL,'2025-12-09 01:16:10',NULL),(561,'ingrediente','316','INSERT',NULL,'2025-12-09 01:16:10',NULL),(562,'ingrediente','317','INSERT',NULL,'2025-12-09 01:16:10',NULL),(563,'ingrediente','318','INSERT',NULL,'2025-12-09 01:16:10',NULL),(564,'ingrediente','319','INSERT',NULL,'2025-12-09 01:16:10',NULL),(565,'ingrediente','320','INSERT',NULL,'2025-12-09 01:16:10',NULL),(566,'ingrediente','321','INSERT',NULL,'2025-12-09 01:16:10',NULL),(567,'ingrediente','322','INSERT',NULL,'2025-12-09 01:16:10',NULL),(568,'ingrediente','323','INSERT',NULL,'2025-12-09 01:16:10',NULL),(569,'ingrediente','324','INSERT',NULL,'2025-12-09 01:16:10',NULL),(570,'ingrediente','325','INSERT',NULL,'2025-12-09 01:16:10',NULL),(571,'ingrediente','326','INSERT',NULL,'2025-12-09 01:16:10',NULL),(572,'ingrediente','327','INSERT',NULL,'2025-12-09 01:16:10',NULL),(573,'ingrediente','328','INSERT',NULL,'2025-12-09 01:16:10',NULL),(574,'ingrediente','329','INSERT',NULL,'2025-12-09 01:16:10',NULL),(575,'ingrediente','330','INSERT',NULL,'2025-12-09 01:16:10',NULL),(576,'ingrediente','331','INSERT',NULL,'2025-12-09 01:16:10',NULL),(577,'ingrediente','332','INSERT',NULL,'2025-12-09 01:16:10',NULL),(578,'ingrediente','333','INSERT',NULL,'2025-12-09 01:16:10',NULL),(579,'ingrediente','334','INSERT',NULL,'2025-12-09 01:16:10',NULL),(580,'ingrediente','335','INSERT',NULL,'2025-12-09 01:16:10',NULL),(581,'ingrediente','336','INSERT',NULL,'2025-12-09 01:16:10',NULL),(582,'ingrediente','337','INSERT',NULL,'2025-12-09 01:16:10',NULL),(583,'ingrediente','338','INSERT',NULL,'2025-12-09 01:16:10',NULL),(584,'ingrediente','339','INSERT',NULL,'2025-12-09 01:16:10',NULL),(585,'ingrediente','340','INSERT',NULL,'2025-12-09 01:16:10',NULL),(586,'ingrediente','341','INSERT',NULL,'2025-12-09 01:16:10',NULL),(587,'ingrediente','342','INSERT',NULL,'2025-12-09 01:16:10',NULL),(588,'ingrediente','343','INSERT',NULL,'2025-12-09 01:16:10',NULL),(589,'ingrediente','344','INSERT',NULL,'2025-12-09 01:16:10',NULL),(590,'ingrediente','345','INSERT',NULL,'2025-12-09 01:16:10',NULL),(591,'ingrediente','346','INSERT',NULL,'2025-12-09 01:16:10',NULL),(592,'ingrediente','347','INSERT',NULL,'2025-12-09 01:16:10',NULL),(593,'ingrediente','348','INSERT',NULL,'2025-12-09 01:16:10',NULL),(594,'ingrediente','349','INSERT',NULL,'2025-12-09 01:16:10',NULL),(595,'ingrediente','350','INSERT',NULL,'2025-12-09 01:16:10',NULL),(596,'ingrediente','351','INSERT',NULL,'2025-12-09 01:16:10',NULL),(597,'ingrediente','352','INSERT',NULL,'2025-12-09 01:16:10',NULL),(598,'ingrediente','353','INSERT',NULL,'2025-12-09 01:16:10',NULL),(599,'ingrediente','354','INSERT',NULL,'2025-12-09 01:16:10',NULL),(600,'ingrediente','355','INSERT',NULL,'2025-12-09 01:16:10',NULL),(601,'ingrediente','356','INSERT',NULL,'2025-12-09 01:16:10',NULL),(602,'ingrediente','357','INSERT',NULL,'2025-12-09 01:16:10',NULL),(603,'ingrediente','358','INSERT',NULL,'2025-12-09 01:16:10',NULL),(604,'ingrediente','359','INSERT',NULL,'2025-12-09 01:16:10',NULL),(605,'ingrediente','360','INSERT',NULL,'2025-12-09 01:16:10',NULL),(606,'ingrediente','361','INSERT',NULL,'2025-12-09 01:16:10',NULL),(607,'ingrediente','362','INSERT',NULL,'2025-12-09 01:16:10',NULL),(608,'ingrediente','363','INSERT',NULL,'2025-12-09 01:16:10',NULL),(609,'ingrediente','364','INSERT',NULL,'2025-12-09 01:16:10',NULL),(610,'ingrediente','366','INSERT',NULL,'2025-12-09 01:16:10',NULL),(611,'ingrediente','367','INSERT',NULL,'2025-12-09 01:16:10',NULL),(612,'ingrediente','368','INSERT',NULL,'2025-12-09 01:16:10',NULL),(613,'ingrediente','369','INSERT',NULL,'2025-12-09 01:16:10',NULL),(614,'ingrediente','370','INSERT',NULL,'2025-12-09 01:16:10',NULL),(615,'ingrediente','375','INSERT',NULL,'2025-12-09 01:16:10',NULL),(616,'ingrediente','376','INSERT',NULL,'2025-12-09 01:16:10',NULL),(617,'ingrediente','377','INSERT',NULL,'2025-12-09 01:16:10',NULL),(618,'ingrediente','379','INSERT',NULL,'2025-12-09 01:16:10',NULL),(619,'ingrediente','380','INSERT',NULL,'2025-12-09 01:16:10',NULL),(620,'ingrediente','381','INSERT',NULL,'2025-12-09 01:16:10',NULL),(621,'ingrediente','382','INSERT',NULL,'2025-12-09 01:16:10',NULL),(622,'ingrediente','383','INSERT',NULL,'2025-12-09 01:16:10',NULL),(623,'ingrediente','384','INSERT',NULL,'2025-12-09 01:16:10',NULL),(624,'ingrediente','385','INSERT',NULL,'2025-12-09 01:16:10',NULL),(625,'ingrediente','386','INSERT',NULL,'2025-12-09 01:16:10',NULL),(626,'ingrediente','387','INSERT',NULL,'2025-12-09 01:16:10',NULL),(627,'ingrediente','388','INSERT',NULL,'2025-12-09 01:16:10',NULL),(628,'ingrediente','389','INSERT',NULL,'2025-12-09 01:16:10',NULL),(629,'ingrediente','390','INSERT',NULL,'2025-12-09 01:16:10',NULL),(630,'ingrediente','391','INSERT',NULL,'2025-12-09 01:16:10',NULL),(631,'ingrediente','392','INSERT',NULL,'2025-12-09 01:16:10',NULL),(632,'ingrediente','393','INSERT',NULL,'2025-12-09 01:16:10',NULL),(633,'ingrediente','394','INSERT',NULL,'2025-12-09 01:16:10',NULL),(634,'ingrediente','395','INSERT',NULL,'2025-12-09 01:16:10',NULL),(635,'ingrediente','396','INSERT',NULL,'2025-12-09 01:16:10',NULL),(636,'ingrediente','397','INSERT',NULL,'2025-12-09 01:16:10',NULL);
/*!40000 ALTER TABLE `auditoria_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_ingrediente`
--

DROP TABLE IF EXISTS `categoria_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_ingrediente` (
  `id_categoria_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_categoria_ingrediente`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `categoria_ingrediente_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categor├¡as generales de ingredientes (carnes, vegetales, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_ingrediente`
--

LOCK TABLES `categoria_ingrediente` WRITE;
/*!40000 ALTER TABLE `categoria_ingrediente` DISABLE KEYS */;
INSERT INTO `categoria_ingrediente` VALUES (1,'Proteína Animal','Carnes rojas, pollo, cerdo, pescado y otros productos cárnicos.','2025-12-09 00:19:10',1),(2,'Lácteos y Derivados','Leche, quesos, yogures, mantequilla y cremas.','2025-12-09 00:19:10',1),(3,'Granos y Leguminosas','Arroz, frijoles, lentejas, garbanzos, pasta y granos secos.','2025-12-09 00:19:10',1),(4,'Frutas y Verduras','Vegetales frescos o congelados, hortalizas y frutas para consumo directo o preparación.','2025-12-09 00:19:10',1),(5,'Tubérculos y Almidones','Papas, yuca, plátanos, camote y otros ingredientes ricos en almidón.','2025-12-09 00:19:10',1),(6,'Aceites y Grasas','Aceites de cocina (vegetal, oliva), mantecas y margarinas.','2025-12-09 00:19:10',1),(7,'Especias y Condimentos','Sal, pimienta, orégano, comino, hierbas secas y otros sazonadores.','2025-12-09 00:19:10',1),(8,'Salsas y Aderezos','Salsas de tomate, mayonesa, mostaza, vinagretas y bases para guisos.','2025-12-09 00:19:10',1),(9,'Bebidacategoriarecetas e Infusiones','Café, té, bases para refrescos y jugos en polvo/concentrados.','2025-12-09 00:19:10',1),(10,'Insumos de Panadería/Reposteria','Harinas, azúcares, levaduras, polvos de hornear y jarabes.','2025-12-09 00:19:10',1),(11,'Enlatados y Conservas','Atúcategoria_recetan enlatado, vegetales encurtidos y otros productos con larga vida útil.','2025-12-09 00:19:10',1),(12,'Limpieza y Desinfección','Insumos no comestibles necesarios para la operación del comedor.','2025-12-09 00:19:10',1),(13,'Empaques y Desechables','Platos, vasos, cubiertos, servilletas y otros materiales de servicio no comestibles.','2025-12-09 00:19:10',1),(14,'Insumos Generales','Materiales de empaque, plástico adhesivo, papel aluminio, bolsas y otros insumos no comestibles para operación','2025-12-09 01:08:33',NULL);
/*!40000 ALTER TABLE `categoria_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_receta`
--

DROP TABLE IF EXISTS `categoria_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_receta` (
  `id_categoria_receta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `costo_max` decimal(10,2) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  `valor_referencia` int NOT NULL DEFAULT '0' COMMENT 'Valor numérico de referencia o costo/calorías por receta (asunción).',
  PRIMARY KEY (`id_categoria_receta`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `categoria_receta_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categor├¡as de recetas (entrada, plato fuerte, postre, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_receta`
--

LOCK TABLES `categoria_receta` WRITE;
/*!40000 ALTER TABLE `categoria_receta` DISABLE KEYS */;
INSERT INTO `categoria_receta` VALUES (1,'Bebidas',NULL,'2025-12-09 00:51:38',1,600),(2,'Carne de cerdo',NULL,'2025-12-09 00:51:38',1,1500),(3,'Carne de pollo',NULL,'2025-12-09 00:51:38',1,1500),(4,'Desayuno',NULL,'2025-12-09 00:51:38',1,15000),(5,'Arroz y frijoles',NULL,'2025-12-09 00:51:38',1,10000),(6,'Carne de res y embutidos',NULL,'2025-12-09 00:51:38',1,1500),(7,'Frutas',NULL,'2025-12-09 00:51:38',1,600),(8,'Ensaladas',NULL,'2025-12-09 00:51:38',1,1000),(9,'Carne atún y pescado',NULL,'2025-12-09 00:51:38',1,3000),(10,'Guarnición',NULL,'2025-12-09 00:51:38',1,1000),(11,'Vegetarianas',NULL,'2025-12-09 00:51:38',1,1500),(12,'Recetas de la tarde',NULL,'2025-12-09 00:51:38',1,1500),(13,'Emparedados',NULL,'2025-12-09 00:51:38',1,1500),(14,'Postres',NULL,'2025-12-09 00:51:38',1,1500);
/*!40000 ALTER TABLE `categoria_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo_menu`
--

DROP TABLE IF EXISTS `ciclo_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo_menu` (
  `id_ciclo` int NOT NULL AUTO_INCREMENT,
  `nombre_ciclo` varchar(100) NOT NULL,
  `duracion_dias` int DEFAULT NULL COMMENT 'Duraci├│n del ciclo en d├¡as (ej. 7, 14, 28).',
  `version` int NOT NULL DEFAULT '1' COMMENT 'N├║mero de versi├│n del ciclo de men├║.',
  `id_ciclo_padre` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_ciclo`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  KEY `ciclo_menu_ibfk_2` (`id_ciclo_padre`),
  CONSTRAINT `ciclo_menu_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ciclo_menu_ibfk_2` FOREIGN KEY (`id_ciclo_padre`) REFERENCES `ciclo_menu` (`id_ciclo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Maestro de ciclos de men├║ para planificaci├│n a largo plazo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_menu`
--

LOCK TABLES `ciclo_menu` WRITE;
/*!40000 ALTER TABLE `ciclo_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ciclo_version_insert` AFTER INSERT ON `ciclo_menu` FOR EACH ROW BEGIN
    INSERT INTO ciclo_menu_historico(
        id_ciclo_activa,
        version,
        estado_version,
        motivo_cambio,
        nombre_ciclo,
        duracion_dias,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_ciclo,
        NEW.version,
        'aprobada',
        'Versión inicial',
        NEW.nombre_ciclo,
        NEW.duracion_dias,
        NEW.id_usuario_creacion
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ciclo_version_update` AFTER UPDATE ON `ciclo_menu` FOR EACH ROW BEGIN
    DECLARE v_version INT;

    SELECT COALESCE(MAX(version),0)
    INTO v_version
    FROM ciclo_menu_historico
    WHERE id_ciclo_activa = NEW.id_ciclo;

    INSERT INTO ciclo_menu_historico(
        id_ciclo_activa,
        version,
        estado_version,
        motivo_cambio,
        nombre_ciclo,
        duracion_dias,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_ciclo,
        v_version + 1,
        'aprobada',
        'Actualización de ciclo',
        NEW.nombre_ciclo,
        NEW.duracion_dias,
        NEW.id_usuario_creacion
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ciclo_menu_detalle`
--

DROP TABLE IF EXISTS `ciclo_menu_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo_menu_detalle` (
  `id_ciclo` int NOT NULL,
  `id_menu` int NOT NULL COMMENT 'FK al men├║ diario o plantilla de men├║.',
  `dia_ciclo` int NOT NULL COMMENT 'D├¡a dentro del ciclo (1 a N).',
  PRIMARY KEY (`id_ciclo`,`id_menu`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `ciclo_menu_detalle_ibfk_1` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclo_menu` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ciclo_menu_detalle_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Asociaci├│n de plantillas de men├║s al ciclo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_menu_detalle`
--

LOCK TABLES `ciclo_menu_detalle` WRITE;
/*!40000 ALTER TABLE `ciclo_menu_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_menu_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo_menu_historico`
--

DROP TABLE IF EXISTS `ciclo_menu_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciclo_menu_historico` (
  `id_ciclo_historico` int NOT NULL AUTO_INCREMENT,
  `id_ciclo_activa` int NOT NULL,
  `version` int NOT NULL,
  `estado_version` enum('aprobada','deprecada','inactiva') DEFAULT 'aprobada',
  `motivo_cambio` varchar(255) DEFAULT NULL,
  `nombre_ciclo` varchar(100) NOT NULL,
  `duracion_dias` int DEFAULT NULL,
  `fecha_versionado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_versionado` int DEFAULT NULL,
  PRIMARY KEY (`id_ciclo_historico`),
  UNIQUE KEY `uk_ciclo_version` (`id_ciclo_activa`,`version`),
  KEY `ciclo_historico_ibfk_2` (`id_usuario_versionado`),
  CONSTRAINT `ciclo_historico_ibfk_1` FOREIGN KEY (`id_ciclo_activa`) REFERENCES `ciclo_menu` (`id_ciclo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ciclo_historico_ibfk_2` FOREIGN KEY (`id_usuario_versionado`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de versiones de ciclos de men├║.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_menu_historico`
--

LOCK TABLES `ciclo_menu_historico` WRITE;
/*!40000 ALTER TABLE `ciclo_menu_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_menu_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierre_caja`
--

DROP TABLE IF EXISTS `cierre_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cierre_caja` (
  `id_cierre` int NOT NULL AUTO_INCREMENT,
  `id_usuario_cajero` int NOT NULL COMMENT 'Cajero que realiza el corte (FK a usuario).',
  `fecha_cierre` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Momento en que se realiza el corte de caja.',
  `fecha_apertura` timestamp NULL DEFAULT NULL COMMENT 'Momento en que se abri├│ el turno/caja.',
  `total_ventas_sistema` decimal(10,2) NOT NULL,
  `total_pagos_sistema` decimal(10,2) NOT NULL,
  `total_anulaciones` decimal(10,2) DEFAULT '0.00',
  `monto_contado_efectivo` decimal(10,2) NOT NULL COMMENT 'Monto en efectivo f├¡sico contado por el cajero.',
  `diferencia_efectivo` decimal(10,2) NOT NULL COMMENT 'Diferencia entre total_ventas_sistema y monto_contado_efectivo.',
  `comentarios_cierre` text,
  PRIMARY KEY (`id_cierre`),
  KEY `id_usuario_cajero` (`id_usuario_cajero`),
  CONSTRAINT `cierre_caja_ibfk_1` FOREIGN KEY (`id_usuario_cajero`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de los cierres (cortes) diarios o por turno de caja.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cierre_caja`
--

LOCK TABLES `cierre_caja` WRITE;
/*!40000 ALTER TABLE `cierre_caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierre_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demanda_no_atendida`
--

DROP TABLE IF EXISTS `demanda_no_atendida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `demanda_no_atendida` (
  `id_demanda` int NOT NULL AUTO_INCREMENT,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n de receta que se agot├│.',
  `fecha_demanda` date NOT NULL,
  `hora_demanda` time NOT NULL,
  `id_tiempo` int DEFAULT NULL COMMENT 'Almuerzo, Cena, etc.',
  `cantidad_perdida` int NOT NULL DEFAULT '1' COMMENT 'N├║mero de porciones que se dejaron de vender en esta instancia.',
  `motivo` enum('agotado','problema_calidad','sistema_caido') DEFAULT 'agotado' COMMENT 'Raz├│n por la que se perdi├│ la venta.',
  `id_usuario_registro` int DEFAULT NULL COMMENT 'Cajero que registra la venta perdida.',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_demanda`),
  KEY `id_receta_historico` (`id_receta_historico`),
  KEY `id_tiempo` (`id_tiempo`),
  KEY `demanda_no_atendida_ibfk_3` (`id_usuario_registro`),
  CONSTRAINT `demanda_no_atendida_ibfk_1` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `demanda_no_atendida_ibfk_2` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `demanda_no_atendida_ibfk_3` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de productos que clientes intentaron comprar pero estaban agotados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demanda_no_atendida`
--

LOCK TABLES `demanda_no_atendida` WRITE;
/*!40000 ALTER TABLE `demanda_no_atendida` DISABLE KEYS */;
/*!40000 ALTER TABLE `demanda_no_atendida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factor_conversion`
--

DROP TABLE IF EXISTS `factor_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factor_conversion` (
  `id_factor` int NOT NULL AUTO_INCREMENT,
  `id_unidad_origen` int NOT NULL COMMENT 'FK a la unidad que se va a convertir (ej: Kilogramo).',
  `id_unidad_destino` int NOT NULL COMMENT 'FK a la unidad a la que se desea convertir (ej: Gramo).',
  `factor` decimal(20,10) NOT NULL COMMENT 'El n├║mero por el cual se debe multiplicar la cantidad de origen para obtener la cantidad destino (ej: 1000 para KG -> GR).',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_factor`),
  UNIQUE KEY `uk_conversion` (`id_unidad_origen`,`id_unidad_destino`),
  KEY `factor_conversion_ibfk_2` (`id_unidad_destino`),
  CONSTRAINT `factor_conversion_ibfk_1` FOREIGN KEY (`id_unidad_origen`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `factor_conversion_ibfk_2` FOREIGN KEY (`id_unidad_destino`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Factores para convertir entre unidades compatibles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factor_conversion`
--

LOCK TABLES `factor_conversion` WRITE;
/*!40000 ALTER TABLE `factor_conversion` DISABLE KEYS */;
INSERT INTO `factor_conversion` VALUES (1,1,2,1000.0000000000,1,'2025-12-09 00:20:27'),(2,2,1,0.0010000000,1,'2025-12-09 00:20:27'),(3,1,3,2.2046226218,1,'2025-12-09 00:20:27'),(4,3,1,0.4535923700,1,'2025-12-09 00:20:27'),(5,3,2,453.5923700000,1,'2025-12-09 00:20:27'),(6,4,5,1000.0000000000,1,'2025-12-09 00:20:27'),(7,5,4,0.0010000000,1,'2025-12-09 00:20:27'),(8,6,4,3.7854100000,1,'2025-12-09 00:20:27'),(9,10,5,240.0000000000,1,'2025-12-09 00:20:27'),(10,11,5,15.0000000000,1,'2025-12-09 00:20:27'),(11,12,5,5.0000000000,1,'2025-12-09 00:20:27');
/*!40000 ALTER TABLE `factor_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_proveedor`
--

DROP TABLE IF EXISTS `factura_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_proveedor` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL COMMENT 'FK al pedido que origin├│ esta factura.',
  `id_proveedor` int NOT NULL COMMENT 'FK al proveedor, redundante pero ├║til para consultas.',
  `numero_factura` varchar(100) NOT NULL COMMENT 'N├║mero o c├│digo fiscal de la factura.',
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuesto_monto` decimal(10,2) DEFAULT '0.00' COMMENT 'Monto total de impuestos.',
  `total_factura` decimal(10,2) NOT NULL,
  `estado_pago` enum('pendiente','pagada','parcial','anulada') DEFAULT 'pendiente',
  `id_usuario_registro` int DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `uk_factura_pedido` (`id_pedido`,`numero_factura`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_usuario_registro` (`id_usuario_registro`),
  CONSTRAINT `factura_proveedor_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `factura_proveedor_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `factura_proveedor_ibfk_3` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de facturas recibidas de proveedores, enlazadas a los pedidos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_proveedor`
--

LOCK TABLES `factura_proveedor` WRITE;
/*!40000 ALTER TABLE `factura_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingrediente`
--

DROP TABLE IF EXISTS `ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente` (
  `id_ingrediente` int NOT NULL AUTO_INCREMENT,
  `id_unidad_base` int NOT NULL,
  `id_categoria_ingrediente` int NOT NULL,
  `nombre_ingrediente` varchar(100) NOT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `trazabilidad` tinyint(1) DEFAULT '0',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  PRIMARY KEY (`id_ingrediente`),
  KEY `id_unidad_base` (`id_unidad_base`),
  KEY `id_categoria_ingrediente` (`id_categoria_ingrediente`),
  CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_unidad_base`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ingrediente_ibfk_2` FOREIGN KEY (`id_categoria_ingrediente`) REFERENCES `categoria_ingrediente` (`id_categoria_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lista de ingredientes disponibles en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
INSERT INTO `ingrediente` VALUES (1,2,1,'Leche Fluida 2% Grasa (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(2,1,1,'Natilla (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(3,1,1,'Yogurt Natural (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(4,1,1,'Queso Amarillo en Bloque/Rebanado (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(5,1,1,'Queso Turrialba (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(6,2,1,'Queso Crema (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(7,2,11,'Jugo de Naranja (Natural/Marca Desconocida)',1,0,'2025-12-09 01:16:10',NULL,NULL),(8,1,11,'Cocoa Dulce en Polvo (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(9,1,11,'Dulce T (Tipo Leche en Polvo Azucarada)',1,0,'2025-12-09 01:16:10',NULL,NULL),(10,1,11,'Avena en Hojuela (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(11,5,11,'Sirope Sabor Kola (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(12,5,3,'Azúcar Blanco en Sobres (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(13,1,7,'Margarina Industrial/Genérica',1,0,'2025-12-09 01:16:10',NULL,NULL),(14,1,7,'Achiote en Pasta/Aceite (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(15,1,13,'Salsa de Tomate Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(16,5,13,'Mostaza Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(17,1,11,'Café Urbano (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(18,1,4,'Crema de Tomate Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(19,1,4,'Sopa Maggi Olla de Carne (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(20,1,4,'Crema de Hongos Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(21,1,4,'Leche Condensada Nestlé (Lata/Caja)',1,0,'2025-12-09 01:16:10',NULL,19),(22,1,4,'Almidón de Maíz Maizena',1,0,'2025-12-09 01:16:10',NULL,14),(24,1,4,'Dulce de Leche El Angel (Lata/Pote)',1,0,'2025-12-09 01:16:10',NULL,20),(25,1,4,'Arroz Blanco Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(26,2,4,'Vinagre Claro (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(27,1,4,'Frijol Rojo Seco (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(28,1,4,'Jalea de Frutas Ujarras',1,0,'2025-12-09 01:16:10',NULL,21),(29,1,6,'Garbanzos en Lata Del Monte',1,0,'2025-12-09 01:16:10',NULL,9),(30,1,4,'Lentejas Secas Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(31,1,7,'Aceite en Spray (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(32,1,4,'Polvo de Hornear (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(33,1,4,'Sopa de Pollo c/ Fideos Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(34,1,8,'Cereal Komplete Almendra Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(35,1,8,'Cereal Choco Krispis Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(36,1,8,'Cereal Zucaritas Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(37,4,14,'Plástico Adhesivo/Film (Insumo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(38,1,4,'Azúcar Blanco Ingenio Taboga',1,0,'2025-12-09 01:16:10',NULL,7),(39,1,4,'Harina de Maíz Maseca',1,0,'2025-12-09 01:16:10',NULL,16),(40,4,14,'Papel de Aluminio (Insumo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(42,1,4,'Harina de Trigo (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(43,1,6,'Palmito Cortado en Lata/Frasco (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(44,1,4,'Crema de Espinaca (Instantánea/Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(45,2,6,'Leche Evaporada Nestlé (Lata)',1,0,'2025-12-09 01:16:10',NULL,19),(46,1,10,'Sal Refinada (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(47,2,6,'Leche de Coco Roland (Lata)',1,0,'2025-12-09 01:16:10',NULL,30),(48,1,6,'Hongos Champiñones Richly (Enlatados)',1,0,'2025-12-09 01:16:10',NULL,22),(49,2,13,'Salsa China Taiwan (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(50,1,5,'Atún en Aceite (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(51,1,6,'Petit Pois/Arvejas Verdes Del Monte (Enlatadas)',1,0,'2025-12-09 01:16:10',NULL,9),(52,1,6,'Maíz Dulce Richly (Enlatado)',1,0,'2025-12-09 01:16:10',NULL,22),(53,1,5,'Chuleta Riñonada de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(54,1,5,'Tilapia Nacional (Filete)',1,0,'2025-12-09 01:16:10',NULL,NULL),(55,1,5,'Trocitos de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(56,1,5,'Mezcla de Mariscos (Congelada)',1,0,'2025-12-09 01:16:10',NULL,NULL),(57,1,5,'Mondongo en Trocitos (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(58,1,5,'Cubitos de Res (Carne)',1,0,'2025-12-09 01:16:10',NULL,NULL),(59,1,5,'Carne Molida de Res (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(60,1,5,'Carne Molida de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(61,1,5,'Mano de Piedra de Res (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(62,1,5,'Trocitos de Res (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(63,1,5,'Bistec de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(64,1,5,'Chuleta Ahumada de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(65,1,5,'Carne de Res Quititeña (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(66,1,5,'Huevo de Gallina (Unidad/Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(67,1,5,'Muslito de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(68,1,4,'Pre-Mezcla Chop Suey (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(69,9,12,'Arreglados de Hojaldre (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(70,10,12,'Pan Baguette (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(71,1,3,'Apio Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(72,1,3,'Arracache Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(73,9,2,'Banano Maduro',1,0,'2025-12-09 01:16:10',NULL,NULL),(74,1,2,'Fruta Cas (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(75,1,3,'Cebolla Morada Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(76,1,3,'Cebolla Blanca Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(77,4,3,'Cebollino Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(78,9,3,'Chayote Tierno (Grande)',1,0,'2025-12-09 01:16:10',NULL,NULL),(79,1,3,'Chile Panameño Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(80,9,3,'Chile Dulce/Pimiento Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(81,9,2,'Coco Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(82,9,3,'Coliflor Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(83,9,3,'Culantro Corriente Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(84,4,3,'Culantro Coyote Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(85,1,3,'Jengibre Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(86,9,3,'Lechuga Boston/Genérica',1,0,'2025-12-09 01:16:10',NULL,NULL),(87,9,2,'Limón Mandarina',1,0,'2025-12-09 01:16:10',NULL,NULL),(88,9,2,'Limón Mesino/Ácido',1,0,'2025-12-09 01:16:10',NULL,NULL),(89,1,3,'Maíz Cascado (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(90,1,3,'Ñame Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(91,4,3,'Orégano Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(92,1,2,'Papaya Híbrida',1,0,'2025-12-09 01:16:10',NULL,NULL),(93,1,2,'Papaya Verde',1,0,'2025-12-09 01:16:10',NULL,NULL),(94,1,3,'Pepino Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(95,9,2,'Piña Primera (Calidad)',1,0,'2025-12-09 01:16:10',NULL,NULL),(96,9,3,'Plátano Maduro',1,0,'2025-12-09 01:16:10',NULL,NULL),(97,9,3,'Plátano Verde',1,0,'2025-12-09 01:16:10',NULL,NULL),(98,9,3,'Remolacha Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(99,1,3,'Repollo Verde Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(100,1,2,'Sandía Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(101,1,3,'Tiquisque Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(102,1,3,'Tomate Primera (Calidad)',1,0,'2025-12-09 01:16:10',NULL,NULL),(103,4,3,'Tomillo Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(104,1,3,'Vainica Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(105,1,3,'Yuca Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(106,1,3,'Zanahoria Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(107,9,12,'Pan para Hamburguesa (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(108,10,12,'Pan Lápiz Bimbo',1,0,'2025-12-09 01:16:10',NULL,25),(109,10,12,'Pan Español (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(110,9,12,'Pan Cena (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(111,9,12,'Pan para Perro Caliente (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(112,9,12,'Cangrejo Surimi sin Relleno',1,0,'2025-12-09 01:16:10',NULL,NULL),(113,1,12,'Pan Molido (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(114,2,7,'Aceite de Soya California',1,0,'2025-12-09 01:16:10',NULL,13),(115,9,11,'Té de Manzanilla (Bolsitas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(116,2,13,'Salsa Inglesa Lizano',1,0,'2025-12-09 01:16:10',NULL,23),(117,1,13,'Salsa Sabor a Ostiones (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(118,2,4,'Vinagre de Manzana Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(119,1,6,'Vegetales Mixtos Del Monte (Enlatados)',1,0,'2025-12-09 01:16:10',NULL,9),(120,1,4,'Miel de Abeja (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(121,1,4,'Arroz Precocido Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(122,1,4,'Frijol Negro Seco Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(123,1,4,'Frijol Blanco Seco Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(124,1,4,'Garbanzo Seco en Paquete Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(125,1,4,'Masa para Empanadas Maseca',1,0,'2025-12-09 01:16:10',NULL,16),(126,1,4,'Vitamaíz (Harina de Maíz fortificada)',1,0,'2025-12-09 01:16:10',NULL,NULL),(127,1,4,'Levadura (Seca/Fresca)',1,0,'2025-12-09 01:16:10',NULL,NULL),(128,1,4,'Cereal Choco Krispis Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(129,1,4,'Cereal Froot Loops Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(130,1,4,'Cereal Komplete Regular Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(131,1,4,'Cereal Choco Zucaritas Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(132,1,4,'Cereal Zucaritas Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(133,1,6,'Atún con Vegetales (Enlatado/Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(134,1,6,'Coctel de Frutas Del Monte (Enlatado)',1,0,'2025-12-09 01:16:10',NULL,9),(135,1,6,'Leche Condensada Nestlé (Lata/Caja)',1,0,'2025-12-09 01:16:10',NULL,19),(136,1,6,'Melocotón Rebanado Del Monte (Enlatado)',1,0,'2025-12-09 01:16:10',NULL,9),(137,1,13,'Pasta de Tomate Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(138,1,4,'Dulce de Leche Nestlé (Lata/Pote)',1,0,'2025-12-09 01:16:10',NULL,19),(140,8,6,'Vegetal Mixto Del Monte (Enlatado)',1,0,'2025-12-09 01:16:10',NULL,9),(141,2,4,'Vinagre Balsámico Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(142,2,4,'Vino Blanco para Cocinar (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(143,1,4,'Cola de Res (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(144,1,10,'Consomé de Mariscos Maggi',1,0,'2025-12-09 01:16:10',NULL,15),(145,1,4,'Crema de Espárragos Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(146,1,4,'Crema de Mariscos Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(147,1,4,'Crema de Brócoli Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(148,1,13,'Mostaza Preparada Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(149,1,13,'Salsa BBQ Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(150,1,4,'Sopa Knorr Frijol Negro (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,NULL),(151,5,13,'Salsa para Pizza Zafran',1,0,'2025-12-09 01:16:10',NULL,24),(152,1,4,'Sopa de Pollo Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(153,1,4,'Sopa Olla de Carne Maggi (Instantánea)',1,0,'2025-12-09 01:16:10',NULL,15),(154,2,4,'Vainilla (Esencia)',1,0,'2025-12-09 01:16:10',NULL,NULL),(155,2,7,'Aceite de Oliva Extra Virgen California',1,0,'2025-12-09 01:16:10',NULL,13),(156,2,7,'Aceite para Freidor Pichinga California',1,0,'2025-12-09 01:16:10',NULL,13),(157,2,7,'Aceite de Ajonjolí California',1,0,'2025-12-09 01:16:10',NULL,13),(158,6,11,'Sirope (Azucarado/Saborizado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(159,2,4,'Sirope de Maple/Pancake (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(160,11,11,'Té de Manzanilla (Bolsitas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(161,11,11,'Té Negro (Bolsitas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(162,1,11,'Salvado de Avena (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(163,1,11,'Horchata en Polvo Vigui',1,0,'2025-12-09 01:16:10',NULL,28),(164,1,4,'Flan de Coco (Pre-Mezcla/Instantáneo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(165,1,4,'Flan de Vainilla (Pre-Mezcla/Instantáneo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(166,1,4,'Gelatina de Frambuesa (Pre-Mezcla)',1,0,'2025-12-09 01:16:10',NULL,NULL),(167,1,4,'Gelatina de Fresa (Pre-Mezcla)',1,0,'2025-12-09 01:16:10',NULL,NULL),(168,1,4,'Gelatina de Limón (Pre-Mezcla)',1,0,'2025-12-09 01:16:10',NULL,NULL),(169,1,4,'Gelatina de Uva (Pre-Mezcla)',1,0,'2025-12-09 01:16:10',NULL,NULL),(170,1,4,'Jalea de Guayaba Ujarras',1,0,'2025-12-09 01:16:10',NULL,21),(172,1,4,'Jalea de Fresa Ujarras',1,0,'2025-12-09 01:16:10',NULL,21),(173,1,4,'Pre Mezcla de Chocolate Nacional de Chocolates (Choco Listo)',1,0,'2025-12-09 01:16:10',NULL,11),(174,1,4,'Pre Mezcla Queque de Vainilla (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(175,1,4,'Pre Mezcla para Chorreadas Maseca',1,0,'2025-12-09 01:16:10',NULL,16),(176,1,4,'Pasas (Uvas Secas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(177,1,4,'Coco Rallado Seco (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(178,1,4,'Leche en Polvo Entera Coronado',1,0,'2025-12-09 01:16:10',NULL,17),(179,9,14,'Bolsa Polipak (Insumo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(180,1,10,'Achiote en Polvo Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(181,1,10,'Albahaca Molida Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(182,1,10,'Ajo en Polvo Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(183,1,10,'Base para Salsa Barbacoa Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(184,1,10,'Canela Molida Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(185,1,10,'Canela en Astilla Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(186,1,10,'Clavo de Olor Entero/Molido Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(187,1,10,'Curry en Polvo Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(188,1,10,'Laurel en Hoja Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(190,1,10,'Empanizador para Pollo Rey (Saco 10kg)',1,0,'2025-12-09 01:16:10',NULL,3),(191,1,10,'Marinador para Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(192,1,10,'Orégano Molido Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(193,1,10,'Páprika (Pimentón) Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(194,1,10,'Perejil Seco Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(195,1,10,'Pimienta Negra Molida Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(196,1,10,'Pimienta Negra en Grano Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(197,1,10,'Romero Seco Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(198,1,4,'Pasta Plumas (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(199,1,4,'Pasta Cabitos (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(200,1,4,'Pasta Tornillos (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(201,1,4,'Pasta Caracolitos (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(202,1,4,'Pasta Coditos (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(203,1,4,'Pasta Espagueti (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(204,1,4,'Pasta Lasaña (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(205,1,5,'Mortadela (Genérica) Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(206,1,5,'Mortadela Mixta Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(207,1,5,'Salchichón (Genérico) Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(208,1,5,'Chorizo Precocido Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(209,1,5,'Salchicha Económica Kimby',1,0,'2025-12-09 01:16:10',NULL,12),(210,1,5,'Tocineta Ahumada La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(211,2,1,'Crema Dulce Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(212,1,8,'Cereal Froot Loops Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(213,1,8,'Cereal Choco Zucaritas Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(214,1,5,'Atún con Vegetales (Enlatado/Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(215,1,10,'Consomé de Pollo Maggi',1,0,'2025-12-09 01:16:10',NULL,15),(216,1,3,'Frijol Tierno Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(217,1,3,'Ajo Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(218,1,5,'Pechuga de Pollo a Granel Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(219,9,12,'Tortillas de Maíz Maseca',1,0,'2025-12-09 01:16:10',NULL,16),(220,1,3,'Papa Amarilla Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(221,1,4,'Granola (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(222,12,4,'Arroz para Gallo Pinto Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(223,12,4,'Frijoles para Gallo Pinto Tío Pelón',1,0,'2025-12-09 01:16:10',NULL,4),(224,12,13,'Salsa Rosada Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(225,1,7,'Aceite de Ajo California',1,0,'2025-12-09 01:16:10',NULL,13),(226,1,5,'Cuartos de Muslo de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(227,1,10,'Comino Molido Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(228,1,2,'Melón Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(229,12,13,'Mayonesa Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(230,1,3,'Brócoli Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(231,1,3,'Repollo Morado Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(232,4,3,'Rábano Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(233,9,3,'Zucchini Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(234,1,3,'Tomate Verde (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(235,1,3,'Ayote Sazón (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(236,1,3,'Camote Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(237,9,3,'Elote Fresco (Maíz)',1,0,'2025-12-09 01:16:10',NULL,NULL),(238,9,2,'Naranja Dulce (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(239,1,3,'Ñampi Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(240,4,3,'Espinaca Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(241,1,5,'Muslo Deshuesado de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(242,1,5,'Nuggets de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(243,1,3,'Alfalfa (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(244,4,3,'Perejil Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(245,1,2,'Fresas Frescas',1,0,'2025-12-09 01:16:10',NULL,NULL),(246,1,5,'Ala de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(247,4,3,'Albahaca Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(248,1,10,'Consomé de Res Maggi',1,0,'2025-12-09 01:16:10',NULL,15),(249,4,3,'Romero Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(250,12,13,'Salsa Tártara Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(251,1,5,'Calamar (Congelado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(252,1,5,'Mejillón Entero (Congelado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(253,1,5,'Camarón Pink (Congelado/Pelado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(254,1,5,'Mariscada Mixta (Congelada)',1,0,'2025-12-09 01:16:10',NULL,NULL),(255,1,5,'Ternero (Carne de Res)',1,0,'2025-12-09 01:16:10',NULL,NULL),(256,9,3,'Puerro Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(257,1,3,'Papa Mini Semilla',1,0,'2025-12-09 01:16:10',NULL,NULL),(258,9,3,'Berenjena Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(259,9,3,'Ayote Tierno/Zapallo',1,0,'2025-12-09 01:16:10',NULL,NULL),(260,9,2,'Manzana Roja (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(261,9,12,'Tortilla de Trigo para Wrap Bimbo',1,0,'2025-12-09 01:16:10',NULL,25),(262,1,4,'Maní (Cacahuate)',1,0,'2025-12-09 01:16:10',NULL,NULL),(263,9,2,'Manzana Verde (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(264,9,2,'Kiwi Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(265,1,5,'Jamón Prensado Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(266,1,5,'Mortadela Bologna Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(267,1,5,'Mortadela Especial Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(268,1,5,'Salchicha Ahumada Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(269,1,5,'Paté Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(270,1,5,'Salchichón sin Tocino Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(271,1,5,'Salchichón Criollo Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(272,1,5,'Salchichón Parrillero Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(273,9,3,'Aguacate Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(274,1,13,'Mayonesa en Galón Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(275,1,4,'Pasta Canelones (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(276,12,13,'Salsa de Tomate Natural en Bandeja Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(277,1,5,'Chorizo Parrillero Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(278,1,5,'Jamón de Pavo Sigma Alimentos',1,0,'2025-12-09 01:16:10',NULL,2),(279,1,5,'Salchicha de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(280,1,13,'Salsa Rosada para Emparedado Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(281,9,2,'Mango Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(282,9,3,'Kale Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(283,1,13,'Mayonesa para Ensalada Banquete',1,0,'2025-12-09 01:16:10',NULL,8),(284,1,4,'Gelatina Dietex Sweetwell (Baja en Calorías)',1,0,'2025-12-09 01:16:10',NULL,29),(285,9,12,'Pan Integral de Molde Bimbo',1,0,'2025-12-09 01:16:10',NULL,25),(286,1,5,'Tocineta (Genérica)',1,0,'2025-12-09 01:16:10',NULL,10),(287,1,5,'Pechuga Deshuesada de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(288,1,1,'Queso Pizzero (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(289,1,10,'Cebolla en Polvo Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(290,1,10,'Nuez Moscada Molida Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(291,2,13,'Aderezo Mil Islas Del Chef',1,0,'2025-12-09 01:16:10',NULL,26),(292,1,13,'Salsa Sandwich Mc Cormick (Banquete)',1,0,'2025-12-09 01:16:10',NULL,8),(293,1,4,'Azúcar Molida (Pulverizada) Ingenio Taboga',1,0,'2025-12-09 01:16:10',NULL,7),(294,1,4,'Azúcar Moreno Ingenio Taboga',1,0,'2025-12-09 01:16:10',NULL,7),(295,1,8,'Cereal de Hojuela (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(296,1,8,'Cereal All Inklusive (Marca Desconocida)',1,0,'2025-12-09 01:16:10',NULL,NULL),(297,12,4,'Sacarina Ancla (Endulzante Artificial)',1,0,'2025-12-09 01:16:10',NULL,27),(298,1,5,'Costilla de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(299,1,5,'Fajitas de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(300,1,5,'Lomo de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(301,1,5,'Bistec de Res (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(302,1,5,'Fajitas de Res (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(303,1,5,'Jarrete de Res (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(304,1,5,'Fajitas de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(305,1,8,'Cereal Komplete Pasas Kellogg\'s',1,0,'2025-12-09 01:16:10',NULL,31),(306,4,3,'Berros Frescos',1,0,'2025-12-09 01:16:10',NULL,NULL),(307,9,3,'Zapallito Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(309,1,2,'Mora Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(310,4,3,'Hierba Buena Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(311,9,2,'Mandarina Nacional',1,0,'2025-12-09 01:16:10',NULL,NULL),(312,3,3,'Chayote Cocoro (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(313,9,2,'Naranja Importada (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(314,1,3,'Chayote Tierno Pequeño',1,0,'2025-12-09 01:16:10',NULL,NULL),(315,1,4,'Mezcla para Panqueques Maizena',1,0,'2025-12-09 01:16:10',NULL,14),(316,1,3,'Chile Jalapeño Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(317,4,3,'Arúgula Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(318,9,3,'Lechuga Lolo Rosa',1,0,'2025-12-09 01:16:10',NULL,NULL),(319,5,11,'Pulpa de Frutas Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(320,5,11,'Pulpa de Guanábana Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(321,5,11,'Pulpa de Mango Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(322,5,11,'Pulpa de Maracuyá Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(323,1,2,'Maracuyá Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(324,9,5,'Tamal de Cerdo La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(325,5,11,'Pulpa de Piña Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(326,5,11,'Pulpa de Piña Colada Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(327,5,11,'Pulpa de Tamarindo Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(328,1,3,'Arvejas Frescas (Genéricas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(329,1,3,'Tomate Cherry Fresco',1,0,'2025-12-09 01:16:10',NULL,NULL),(330,9,3,'Lechuga Romana Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(331,5,13,'Salsa Tabasco (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(332,9,12,'Tortilla de Maíz Mediana Maseca',1,0,'2025-12-09 01:16:10',NULL,16),(333,2,9,'Pulpa de Maracuyá Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(334,2,9,'Pulpa de Mango Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(335,2,9,'Frutas Tropicales Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(336,2,9,'Carambola Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(337,2,9,'Pulpa de Piña Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(338,2,9,'Pulpa de Guanábana Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(339,12,11,'Pulpa de Fruta c/ Edulcorante Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(340,2,9,'Pulpa de Tamarindo Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(341,1,10,'Nuez Moscada Entera Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(342,1,11,'Té Frío de Melocotón Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(343,1,11,'Té Frío Sabor a Limón Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(344,1,4,'Mayonesa Heinz (Banquete)',1,0,'2025-12-09 01:16:10',NULL,8),(345,12,4,'Salsa Rosada Del Chef',1,0,'2025-12-09 01:16:10',NULL,26),(346,1,10,'Tomillo Triturado Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(347,1,10,'Albahaca en Hojuela Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(348,1,10,'Romero en Hojuela Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(349,1,10,'Tomillo en Polvo Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(350,1,5,'Posta de Cerdo en Cubitos La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(351,9,12,'Pan Cuadrado Integral Bimbo',1,0,'2025-12-09 01:16:10',NULL,25),(352,1,5,'Mortadela de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(353,9,2,'Manzana Gala Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(354,9,2,'Granadilla Fresca',1,0,'2025-12-09 01:16:10',NULL,NULL),(355,9,2,'Mandarina Importada (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(356,9,4,'Tapa de Dulce (Ingenio Taboga)',1,0,'2025-12-09 01:16:10',NULL,7),(357,1,11,'Horchata en Polvo Vigui',1,0,'2025-12-09 01:16:10',NULL,28),(358,1,11,'Crema Dos Pinos',1,0,'2025-12-09 01:16:10',NULL,1),(359,9,5,'Torta/Hamburguesa de Pollo Pollo Rey',1,0,'2025-12-09 01:16:10',NULL,3),(360,1,10,'Orégano Granulado Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(361,1,3,'Tomate Segunda (Calidad)',1,0,'2025-12-09 01:16:10',NULL,NULL),(362,4,3,'Eneldo Molido Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(363,1,4,'Pasta Corbata Lazo (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(364,1,4,'Pasta Cabello de Ángel (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(366,1,10,'Cúrcuma Molida Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(367,1,10,'Culantro en Polvo Fábesco',1,0,'2025-12-09 01:16:10',NULL,5),(368,1,5,'Cecina de Res (Carne Seca)',1,0,'2025-12-09 01:16:10',NULL,NULL),(369,1,5,'Costilla de Res (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(370,1,5,'Hígado en Bistec o Fajitas de Res',1,0,'2025-12-09 01:16:10',NULL,NULL),(375,1,5,'Rabo de Res (Corte)',1,0,'2025-12-09 01:16:10',NULL,NULL),(376,9,5,'Torta/Hamburguesa de Res (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(377,1,5,'Chicharrón de Concha Picado La Granja',1,0,'2025-12-09 01:16:10',NULL,10),(379,1,5,'Cabeza de Pescado (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(380,1,5,'Atún Fresco (Filete/Lomo)',1,0,'2025-12-09 01:16:10',NULL,NULL),(381,1,5,'Filete de Marlín Blanco',1,0,'2025-12-09 01:16:10',NULL,NULL),(382,1,5,'Macarela (Pescado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(383,1,5,'Camarón Blanco Pelado (Congelado)',1,0,'2025-12-09 01:16:10',NULL,NULL),(384,1,4,'Tallarines de Arroz (Genérico)',1,0,'2025-12-09 01:16:10',NULL,NULL),(385,1,4,'Pasta Corbata Lazo (Genérica)',1,0,'2025-12-09 01:16:10',NULL,NULL),(386,1,12,'Pan Fresco Salado (Panadería)',1,0,'2025-12-09 01:16:10',NULL,NULL),(387,1,10,'Pimienta Blanca Molida Productos Suprema',1,0,'2025-12-09 01:16:10',NULL,6),(388,1,11,'Limonada Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(389,1,4,'Jalea de Piña Ujarras',1,0,'2025-12-09 01:16:10',NULL,21),(390,2,11,'Té Frío de Melocotón Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(391,2,11,'Té Frío Limón Dos Pinos (Concentrado)',1,0,'2025-12-09 01:16:10',NULL,1),(392,1,4,'Galleta de Avena c/ Arándanos Pozuelo',1,0,'2025-12-09 01:16:10',NULL,18),(393,3,4,'Galleta Club Extra Bokitas Pozuelo',1,0,'2025-12-09 01:16:10',NULL,18),(394,3,4,'Galleta Soda Pozuelo',1,0,'2025-12-09 01:16:10',NULL,18),(395,9,11,'Té de Frutas Mixtas (Bolsitas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(396,9,11,'Té de Menta (Bolsitas)',1,0,'2025-12-09 01:16:10',NULL,NULL),(397,11,4,'Endulzante Artificial Sweetwell (Sobres/Polvo)',1,0,'2025-12-09 01:16:10',NULL,29);
/*!40000 ALTER TABLE `ingrediente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_ai` AFTER INSERT ON `ingrediente` FOR EACH ROW BEGIN
  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente', NEW.id_ingrediente, 'INSERT', @usuario_app);
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_au` AFTER UPDATE ON `ingrediente` FOR EACH ROW BEGIN
  DECLARE v_evento_id BIGINT;

  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente', NEW.id_ingrediente, 'UPDATE', @usuario_app);
  SET v_evento_id = LAST_INSERT_ID();

  IF NOT (OLD.id_unidad_base <=> NEW.id_unidad_base) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'id_unidad_base', OLD.id_unidad_base, NEW.id_unidad_base);
  END IF;

  IF NOT (OLD.id_categoria_ingrediente <=> NEW.id_categoria_ingrediente) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'id_categoria_ingrediente', OLD.id_categoria_ingrediente, NEW.id_categoria_ingrediente);
  END IF;

  IF NOT (OLD.nombre_ingrediente <=> NEW.nombre_ingrediente) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'nombre_ingrediente', OLD.nombre_ingrediente, NEW.nombre_ingrediente);
  END IF;

  IF NOT (OLD.activo <=> NEW.activo) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'activo', OLD.activo, NEW.activo);
  END IF;

  IF NOT (OLD.trazabilidad <=> NEW.trazabilidad) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'trazabilidad', OLD.trazabilidad, NEW.trazabilidad);
  END IF;

  IF NOT (OLD.fecha_creacion <=> NEW.fecha_creacion) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'fecha_creacion', OLD.fecha_creacion, NEW.fecha_creacion);
  END IF;

  IF NOT (OLD.fecha_modificacion <=> NEW.fecha_modificacion) THEN
    INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo)
    VALUES (v_evento_id, 'fecha_modificacion', OLD.fecha_modificacion, NEW.fecha_modificacion);
  END IF;

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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_ad` AFTER DELETE ON `ingrediente` FOR EACH ROW BEGIN
  DECLARE v_evento_id BIGINT;

  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente', OLD.id_ingrediente, 'DELETE', @usuario_app);
  SET v_evento_id = LAST_INSERT_ID();

  INSERT INTO auditoria_detalle(id_evento, nombre_campo, valor_anterior, valor_nuevo) VALUES
    (v_evento_id,'id_ingrediente',OLD.id_ingrediente,NULL),
    (v_evento_id,'id_unidad_base',OLD.id_unidad_base,NULL),
    (v_evento_id,'id_categoria_ingrediente',OLD.id_categoria_ingrediente,NULL),
    (v_evento_id,'nombre_ingrediente',OLD.nombre_ingrediente,NULL),
    (v_evento_id,'activo',OLD.activo,NULL),
    (v_evento_id,'trazabilidad',OLD.trazabilidad,NULL),
    (v_evento_id,'fecha_creacion',OLD.fecha_creacion,NULL),
    (v_evento_id,'fecha_modificacion',OLD.fecha_modificacion,NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingrediente_costo`
--

DROP TABLE IF EXISTS `ingrediente_costo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingrediente_costo` (
  `id_costo` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `id_unidad` int NOT NULL,
  `costo_unitario` decimal(10,2) NOT NULL,
  `fecha_vigencia` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_costo`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `ingrediente_costo_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ingrediente_costo_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de costos por unidad de cada ingrediente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente_costo`
--

LOCK TABLES `ingrediente_costo` WRITE;
/*!40000 ALTER TABLE `ingrediente_costo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingrediente_costo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_costo_ai` AFTER INSERT ON `ingrediente_costo` FOR EACH ROW BEGIN
  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente_costo', NEW.id_costo, 'INSERT', @usuario_app);
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_costo_au` AFTER UPDATE ON `ingrediente_costo` FOR EACH ROW BEGIN
  DECLARE v_evento_id BIGINT;

  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente_costo', NEW.id_costo, 'UPDATE', @usuario_app);
  SET v_evento_id = LAST_INSERT_ID();

  IF NOT (OLD.id_ingrediente <=> NEW.id_ingrediente) THEN
    INSERT INTO auditoria_detalle(id_evento,nombre_campo,valor_anterior,valor_nuevo)
    VALUES (v_evento_id,'id_ingrediente',OLD.id_ingrediente,NEW.id_ingrediente);
  END IF;

  IF NOT (OLD.id_unidad <=> NEW.id_unidad) THEN
    INSERT INTO auditoria_detalle(id_evento,nombre_campo,valor_anterior,valor_nuevo)
    VALUES (v_evento_id,'id_unidad',OLD.id_unidad,NEW.id_unidad);
  END IF;

  IF NOT (OLD.costo_unitario <=> NEW.costo_unitario) THEN
    INSERT INTO auditoria_detalle(id_evento,nombre_campo,valor_anterior,valor_nuevo)
    VALUES (v_evento_id,'costo_unitario',OLD.costo_unitario,NEW.costo_unitario);
  END IF;

  IF NOT (OLD.fecha_vigencia <=> NEW.fecha_vigencia) THEN
    INSERT INTO auditoria_detalle(id_evento,nombre_campo,valor_anterior,valor_nuevo)
    VALUES (v_evento_id,'fecha_vigencia',OLD.fecha_vigencia,NEW.fecha_vigencia);
  END IF;

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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ingrediente_costo_ad` AFTER DELETE ON `ingrediente_costo` FOR EACH ROW BEGIN
  DECLARE v_evento_id BIGINT;

  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('ingrediente_costo', OLD.id_costo, 'DELETE', @usuario_app);
  SET v_evento_id = LAST_INSERT_ID();

  INSERT INTO auditoria_detalle(id_evento,nombre_campo,valor_anterior,valor_nuevo) VALUES
    (v_evento_id,'id_costo',OLD.id_costo,NULL),
    (v_evento_id,'id_ingrediente',OLD.id_ingrediente,NULL),
    (v_evento_id,'id_unidad',OLD.id_unidad,NULL),
    (v_evento_id,'costo_unitario',OLD.costo_unitario,NULL),
    (v_evento_id,'fecha_vigencia',OLD.fecha_vigencia,NULL);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `cantidad_disponible` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_minimo` decimal(10,2) DEFAULT '0.00' COMMENT 'Umbral m├¡nimo de cantidad para alertar por bajas existencias.',
  `stock_maximo` decimal(10,2) DEFAULT NULL COMMENT 'Umbral m├íximo recomendado de cantidad para evitar exceso de inventario.',
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inventario`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventario actual de ingredientes disponibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_inventario_ai` AFTER INSERT ON `inventario` FOR EACH ROW BEGIN
  INSERT INTO auditoria_evento(nombre_tabla, pk_valor, tipo_operacion, id_usuario)
  VALUES ('inventario', NEW.id_inventario, 'INSERT', @usuario_app);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `lote_ingrediente`
--

DROP TABLE IF EXISTS `lote_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote_ingrediente` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `codigo_lote` varchar(50) NOT NULL,
  `fecha_fabricacion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `rendimiento` decimal(5,2) DEFAULT '100.00',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_lote`),
  UNIQUE KEY `id_ingrediente` (`id_ingrediente`,`codigo_lote`),
  CONSTRAINT `lote_ingrediente_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lotes y rendimientos asociados a ingredientes seleccionados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote_ingrediente`
--

LOCK TABLES `lote_ingrediente` WRITE;
/*!40000 ALTER TABLE `lote_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca_ingrediente`
--

DROP TABLE IF EXISTS `marca_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca_ingrediente` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre_marca` (`nombre_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca_ingrediente`
--

LOCK TABLES `marca_ingrediente` WRITE;
/*!40000 ALTER TABLE `marca_ingrediente` DISABLE KEYS */;
INSERT INTO `marca_ingrediente` VALUES (1,'Dos Pinos','Líder en lácteos (leche, queso, yogur, etc.) y jugos.',1,'2025-12-08 18:32:26',NULL),(2,'Sigma Alimentos (Zaragoza/Cinta Azul)','Marcas de embutidos y carnes procesadas para comedores.',1,'2025-12-08 18:32:26',NULL),(3,'Pollo Rey','Marca líder de productos avícolas (pollo y pavo).',1,'2025-12-08 18:32:26',NULL),(4,'Tío Pelón','Marca costarricense de granos básicos como arroz y frijoles.',1,'2025-12-08 18:32:26',NULL),(5,'Fábesco','Marca de especias, condimentos y sazonadores para la industria de alimentos.',1,'2025-12-08 18:32:26',NULL),(6,'Productos Suprema','Marca de especias y condimentos costarricense.',1,'2025-12-08 18:32:26',NULL),(7,'Ingenio Taboga','Marca de azúcar y edulcorantes.',1,'2025-12-08 18:32:26',NULL),(8,'Banquete','Marca de salsas, mayonesas, mostazas y aderezos (de Kraft Heinz).',1,'2025-12-08 18:32:26',NULL),(9,'Del Monte','Marca de frutas enlatadas, vegetales y jugos.',1,'2025-12-08 18:32:26',NULL),(10,'La Granja','Marca de productos de cerdo (chuletas, tocino, etc.).',1,'2025-12-08 18:32:26',NULL),(11,'Nacional de Chocolates (Choco Listo)','Productos de cacao, chocolates y bebidas instantáneas.',1,'2025-12-08 18:32:26',NULL),(12,'Kimby','Marca de embutidos y congelados enfocada en el segmento de buen precio.',1,'2025-12-08 18:32:26',NULL),(13,'California','Marca popular de aceites comestibles (soya, canola).',1,'2025-12-08 18:32:26',NULL),(14,'Maizena','Marca de almidón de maíz, atoles y mezclas para repostería (de Unilever).',1,'2025-12-08 18:32:26',NULL),(15,'Maggi','Marca de Nestlé, enfo cada en caldos, sopas, cremas y sazonadores.',1,'2025-11-09 04:48:38',NULL),(16,'Maseca','Marca líder de harina de maíz nixtamalizado para tortillas, atoles y otros productos de maíz.',1,'2025-11-09 04:48:38',NULL),(17,'Coronado','Marca de productos lácteos, principalmente leche en polvo y evaporada.',1,'2025-11-09 04:48:38',NULL),(18,'Pozuelo','Marca líder de galletas, repostería y bocadillos dulces y salados en Centroamérica.',1,'2025-11-09 04:48:38',NULL),(19,'Nestlé','Marca global con productos variados como leche condensada, dulce de leche, chocolates y cereales.',1,'2025-11-09 04:48:38',NULL),(20,'El Angel','Marca popular de dulces de leche, jaleas y conservas.',1,'2025-11-09 04:48:38',NULL),(21,'Ujarras','Marca reconocida de jaleas, mermeladas y conservas.',1,'2025-11-09 04:48:38',NULL),(22,'Richly','Marca de vegetales y conservas enlatadas (hongos, maíz dulce, etc.).',1,'2025-11-09 04:48:38',NULL),(23,'Lizano','Marca líder de salsas y aderezos tradicionales, incluyendo la popular Salsa Inglesa.',1,'2025-11-09 04:48:38',NULL),(24,'Zafran','Marca de salsas, condimentos y especias especializadas (ej. salsa para pizza).',1,'2025-11-09 04:48:38',NULL),(25,'Bimbo','Marca global líder en panadería, tortillas y productos de bollería.',1,'2025-11-09 04:48:38',NULL),(26,'Del Chef','Marca de aderezos, salsas y condimentos preparados.',1,'2025-11-09 04:48:38',NULL),(27,'Ancla','Marca de edulcorantes y endulzantes artificiales (Sacarina).',1,'2025-11-09 04:48:38',NULL),(28,'Vigui','Marca de bebidas instantáneas, refrescos y horchatas.',1,'2025-11-09 04:48:38',NULL),(29,'Sweetwell','Marca de edulcorantes naturales o artificiales bajos en calorías.',1,'2025-11-09 04:48:38',NULL),(30,'Roland','Marca de alimentos especiales o importados, como leche de coco o conservas exóticas.',1,'2025-11-09 04:48:38',NULL),(31,'Kellogg\'s','Marca global de cereales de desayuno y snacks (Choco Krispis, Zucaritas, Froot Loops, Komplete).',1,'2025-12-08 18:32:50',NULL);
/*!40000 ALTER TABLE `marca_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_diario`
--

DROP TABLE IF EXISTS `menu_diario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_diario` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `id_menu_padre` int DEFAULT NULL COMMENT 'ID del primer men├║ creado en el ciclo para trazar el historial.',
  `id_tiempo` int NOT NULL,
  `nombre_menu` varchar(150) NOT NULL,
  `version` int NOT NULL DEFAULT '1' COMMENT 'N├║mero de versi├│n de este men├║.',
  `descripcion` text,
  `fecha_menu` date NOT NULL,
  `porciones_asignadas` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  KEY `id_tiempo` (`id_tiempo`),
  KEY `menu_diario_ibfk_4` (`id_menu_padre`),
  CONSTRAINT `menu_diario_ibfk_2` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_ibfk_3` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_ibfk_4` FOREIGN KEY (`id_menu_padre`) REFERENCES `menu_diario` (`id_menu`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Planificaci├│n de men├║s diarios con recetas asignadas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_diario`
--

LOCK TABLES `menu_diario` WRITE;
/*!40000 ALTER TABLE `menu_diario` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_menu_version_insert` AFTER INSERT ON `menu_diario` FOR EACH ROW BEGIN
    INSERT INTO menu_diario_historico(
        id_menu_activa,
        version,
        estado_version,
        motivo_cambio,
        id_tiempo,
        nombre_menu,
        descripcion,
        fecha_menu,
        porciones_asignadas,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_menu,
        NEW.version,
        'aprobada',
        'Versión inicial',
        NEW.id_tiempo,
        NEW.nombre_menu,
        NEW.descripcion,
        NEW.fecha_menu,
        NEW.porciones_asignadas,
        NEW.id_usuario_creacion
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_menu_version_update` AFTER UPDATE ON `menu_diario` FOR EACH ROW BEGIN
    DECLARE v_version INT;

    SELECT COALESCE(MAX(version),0)
    INTO v_version
    FROM menu_diario_historico
    WHERE id_menu_activa = NEW.id_menu;

    INSERT INTO menu_diario_historico(
        id_menu_activa,
        version,
        estado_version,
        motivo_cambio,
        id_tiempo,
        nombre_menu,
        descripcion,
        fecha_menu,
        porciones_asignadas,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_menu,
        v_version + 1,
        'aprobada',
        'Actualización de menú',
        NEW.id_tiempo,
        NEW.nombre_menu,
        NEW.descripcion,
        NEW.fecha_menu,
        NEW.porciones_asignadas,
        NEW.id_usuario_creacion
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_diario_ajuste`
--

DROP TABLE IF EXISTS `menu_diario_ajuste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_diario_ajuste` (
  `id_ajuste` int NOT NULL AUTO_INCREMENT,
  `id_menu` int NOT NULL,
  `id_receta_anterior` int DEFAULT NULL,
  `id_receta_nueva` int DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `fecha_ajuste` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `motivo` varchar(255) NOT NULL,
  `tipo_ajuste` enum('cambio_receta','cambio_porciones','otro') DEFAULT 'otro',
  PRIMARY KEY (`id_ajuste`),
  KEY `id_menu` (`id_menu`),
  KEY `id_receta_anterior` (`id_receta_anterior`),
  KEY `id_receta_nueva` (`id_receta_nueva`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `menu_diario_ajuste_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_ajuste_ibfk_2` FOREIGN KEY (`id_receta_anterior`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_ajuste_ibfk_3` FOREIGN KEY (`id_receta_nueva`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_ajuste_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra ajustes y cambios en men├║s diarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_diario_ajuste`
--

LOCK TABLES `menu_diario_ajuste` WRITE;
/*!40000 ALTER TABLE `menu_diario_ajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_ajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_diario_ajuste_detalle`
--

DROP TABLE IF EXISTS `menu_diario_ajuste_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_diario_ajuste_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_ajuste` int NOT NULL,
  `nombre_campo` varchar(100) NOT NULL,
  `valor_anterior` text,
  `valor_nuevo` text,
  PRIMARY KEY (`id_detalle`),
  KEY `id_ajuste` (`id_ajuste`),
  CONSTRAINT `menu_diario_ajuste_detalle_ibfk_1` FOREIGN KEY (`id_ajuste`) REFERENCES `menu_diario_ajuste` (`id_ajuste`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de campos modificados durante un ajuste de men├║ diario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_diario_ajuste_detalle`
--

LOCK TABLES `menu_diario_ajuste_detalle` WRITE;
/*!40000 ALTER TABLE `menu_diario_ajuste_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_ajuste_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_diario_historico`
--

DROP TABLE IF EXISTS `menu_diario_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_diario_historico` (
  `id_menu_historico` int NOT NULL AUTO_INCREMENT,
  `id_menu_activa` int NOT NULL COMMENT 'ID del men├║ activo al que pertenece esta versi├│n.',
  `version` int NOT NULL,
  `estado_version` enum('aprobada','deprecada','inactiva') DEFAULT 'aprobada',
  `motivo_cambio` varchar(255) DEFAULT NULL,
  `id_tiempo` int NOT NULL,
  `nombre_menu` varchar(150) NOT NULL,
  `descripcion` text,
  `fecha_menu` date NOT NULL,
  `porciones_asignadas` int DEFAULT NULL,
  `fecha_versionado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_versionado` int DEFAULT NULL,
  PRIMARY KEY (`id_menu_historico`),
  UNIQUE KEY `uk_menu_version` (`id_menu_activa`,`version`),
  KEY `menu_diario_historico_ibfk_2` (`id_tiempo`),
  KEY `menu_diario_historico_ibfk_3` (`id_usuario_versionado`),
  CONSTRAINT `menu_diario_historico_ibfk_1` FOREIGN KEY (`id_menu_activa`) REFERENCES `menu_diario` (`id_menu`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `menu_diario_historico_ibfk_2` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_diario_historico_ibfk_3` FOREIGN KEY (`id_usuario_versionado`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de versiones de men├║s diarios aprobados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_diario_historico`
--

LOCK TABLES `menu_diario_historico` WRITE;
/*!40000 ALTER TABLE `menu_diario_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_receta`
--

DROP TABLE IF EXISTS `menu_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_receta` (
  `id_menu` int NOT NULL,
  `id_receta` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_receta`),
  KEY `id_receta` (`id_receta`),
  CONSTRAINT `menu_receta_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_receta_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaci├│n N:M entre men├║s diarios y recetas incluidas en cada tiempo de comida';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_receta`
--

LOCK TABLES `menu_receta` WRITE;
/*!40000 ALTER TABLE `menu_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_receta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_menu_receta_versionado` AFTER INSERT ON `menu_receta` FOR EACH ROW BEGIN
    INSERT INTO menu_receta_historico (id_menu_historico, id_receta_historico)
    SELECT mh.id_menu_historico, rh.id_receta_historico
    FROM menu_diario_historico mh
    JOIN receta_historico rh
      ON rh.id_receta_activa = NEW.id_receta
    WHERE mh.id_menu_activa = NEW.id_menu
    ORDER BY mh.version DESC, rh.version DESC
    LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `menu_receta_historico`
--

DROP TABLE IF EXISTS `menu_receta_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_receta_historico` (
  `id_menu_historico` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n congelada de la receta utilizada.',
  PRIMARY KEY (`id_menu_historico`,`id_receta_historico`),
  KEY `menu_receta_historico_ibfk_2` (`id_receta_historico`),
  CONSTRAINT `menu_receta_historico_ibfk_1` FOREIGN KEY (`id_menu_historico`) REFERENCES `menu_diario_historico` (`id_menu_historico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_receta_historico_ibfk_2` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaci├│n entre men├║ hist├│rico y la versi├│n de la receta que se us├│.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_receta_historico`
--

LOCK TABLES `menu_receta_historico` WRITE;
/*!40000 ALTER TABLE `menu_receta_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_receta_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(50) NOT NULL,
  `requiere_terminal` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_metodo`),
  UNIQUE KEY `nombre_metodo` (`nombre_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cat├ílogo de tipos de pago aceptados (Tarjeta, Tiquete, Mixto).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Tarjeta',1,1),(2,'Tiquete/Vale',0,1),(3,'Mixto',0,1);
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mov_inventario`
--

DROP TABLE IF EXISTS `mov_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mov_inventario` (
  `id_mov` int NOT NULL AUTO_INCREMENT,
  `id_inventario` int NOT NULL,
  `id_lote` int DEFAULT NULL,
  `id_detalle_pedido` int DEFAULT NULL,
  `tipo_movimiento` enum('entrada','salida','ajuste') NOT NULL,
  `id_area_destino` int DEFAULT NULL COMMENT 'FK al ├írea de trabajo que solicita o recibe el recurso (ej. Cocina Caliente).',
  `cantidad` decimal(10,2) NOT NULL,
  `fecha_movimiento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `observacion` varchar(255) DEFAULT NULL,
  `id_usuario_registro` int DEFAULT NULL,
  `id_usuario_receptor` int DEFAULT NULL COMMENT 'FK al usuario responsable que se lleva el recurso de bodega.',
  PRIMARY KEY (`id_mov`),
  KEY `id_inventario` (`id_inventario`),
  KEY `id_usuario_registro` (`id_usuario_registro`),
  KEY `id_lote` (`id_lote`),
  KEY `mov_inventario_ibfk_4` (`id_detalle_pedido`),
  KEY `mov_inventario_ibfk_area` (`id_area_destino`),
  KEY `mov_inventario_ibfk_receptor` (`id_usuario_receptor`),
  CONSTRAINT `mov_inventario_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mov_inventario_ibfk_2` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mov_inventario_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lote_ingrediente` (`id_lote`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mov_inventario_ibfk_4` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `pedido_detalle` (`id_detalle`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `mov_inventario_ibfk_area` FOREIGN KEY (`id_area_destino`) REFERENCES `area_trabajo` (`id_area`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `mov_inventario_ibfk_receptor` FOREIGN KEY (`id_usuario_receptor`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro hist├│rico de movimientos del inventario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mov_inventario`
--

LOCK TABLES `mov_inventario` WRITE;
/*!40000 ALTER TABLE `mov_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro_institucional`
--

DROP TABLE IF EXISTS `parametro_institucional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro_institucional` (
  `clave` varchar(50) NOT NULL COMMENT 'Nombre ├║nico del par├ímetro (ej. TASA_IVA, NOMBRE_EMPRESA).',
  `valor` text COMMENT 'Valor del par├ímetro (ej. 0.13, "Comedor Institucional TEC").',
  `tipo_dato` enum('string','decimal','boolean','date') DEFAULT 'string',
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_modificacion` int DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `id_usuario_modificacion` (`id_usuario_modificacion`),
  CONSTRAINT `parametro_institucional_ibfk_1` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Configuraci├│n institucional, fiscal y par├ímetros de negocio.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro_institucional`
--

LOCK TABLES `parametro_institucional` WRITE;
/*!40000 ALTER TABLE `parametro_institucional` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametro_institucional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `codigo_pedido` varchar(50) NOT NULL,
  `id_proveedor` int NOT NULL,
  `fecha_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_entrega_estimada` date DEFAULT NULL,
  `fecha_entrega_real` date DEFAULT NULL,
  `estado` enum('pendiente','aprobado','entregado','cancelado') DEFAULT 'pendiente',
  `id_usuario_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario_registro` (`id_usuario_registro`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Pedidos de ingredientes o materiales registrados por usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_detalle`
--

DROP TABLE IF EXISTS `pedido_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `cantidad_recibida` decimal(10,2) DEFAULT '0.00' COMMENT 'Cantidad de ingrediente realmente aceptada y recibida.',
  `estado_recepcion` enum('pendiente','aceptado','rechazado') DEFAULT 'pendiente',
  `id_usuario_recepcion` int DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `motivo_recepcion` varchar(255) DEFAULT NULL COMMENT 'Motivo de rechazo o comentario general asociado a la recepci├│n del art├¡culo.',
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_usuario_recepcion` (`id_usuario_recepcion`),
  CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedido_detalle_ibfk_3` FOREIGN KEY (`id_usuario_recepcion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de ingredientes y cantidades incluidas en cada pedido';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion_detalle`
--

DROP TABLE IF EXISTS `produccion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_detalle` (
  `id_detalle_produccion` int NOT NULL AUTO_INCREMENT,
  `id_produccion_diaria` int NOT NULL COMMENT 'FK al encabezado de la orden de producci├│n del d├¡a.',
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n congelada de la receta utilizada.',
  `porciones_producidas` int NOT NULL COMMENT 'N├║mero real de porciones que se lograron de esta receta.',
  `fecha_produccion` date NOT NULL COMMENT 'Fecha en que se termin├│ de producir (para auditor├¡a).',
  `id_usuario_produccion` int DEFAULT NULL,
  PRIMARY KEY (`id_detalle_produccion`),
  UNIQUE KEY `uk_produccion_receta` (`id_produccion_diaria`,`id_receta_historico`),
  KEY `id_receta_historico` (`id_receta_historico`),
  KEY `id_produccion_diaria` (`id_produccion_diaria`),
  KEY `produccion_detalle_ibfk_3` (`id_usuario_produccion`),
  CONSTRAINT `produccion_detalle_ibfk_1` FOREIGN KEY (`id_produccion_diaria`) REFERENCES `produccion_diaria` (`id_produccion_diaria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produccion_detalle_ibfk_2` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produccion_detalle_ibfk_3` FOREIGN KEY (`id_usuario_produccion`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de recetas producidas en una orden diaria.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_detalle`
--

LOCK TABLES `produccion_detalle` WRITE;
/*!40000 ALTER TABLE `produccion_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion_diaria`
--

DROP TABLE IF EXISTS `produccion_diaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion_diaria` (
  `id_produccion_diaria` int NOT NULL AUTO_INCREMENT,
  `id_menu` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n congelada de la receta que se plane├│ producir en esta orden.',
  `id_receta` int NOT NULL,
  `cantidad_producida` decimal(10,2) NOT NULL,
  `porciones_disponibles` int NOT NULL DEFAULT '0',
  `fecha_inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_finalizacion` timestamp NULL DEFAULT NULL,
  `estado` enum('planificada','en_proceso','terminada','entregada') DEFAULT 'planificada',
  `id_usuario_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_produccion_diaria`),
  KEY `id_usuario_registro` (`id_usuario_registro`),
  KEY `id_menu` (`id_menu`),
  KEY `id_receta` (`id_receta`),
  KEY `produccion_diaria_ibfk_receta_hist` (`id_receta_historico`),
  CONSTRAINT `produccion_diaria_ibfk_2` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `produccion_diaria_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produccion_diaria_ibfk_receta_hist` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de la producci├│n diaria por men├║';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion_diaria`
--

LOCK TABLES `produccion_diaria` WRITE;
/*!40000 ALTER TABLE `produccion_diaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_diaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Proveedores que abastecen los ingredientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'DOS PINOS','85100181','centrodecontactos@dospinos.com','Oficinas Centrales, Alajuela','2025-12-09 00:22:17'),(2,'INNOVO','24518300','info@innovocr.com','Naranjo, Alajuela, San Antonio de la Cueva','2025-12-09 00:22:17'),(3,'CARNE SANCHEZ','60835201',NULL,NULL,'2025-12-09 00:22:17'),(4,'POLLO MATAMOROS','83771368',NULL,'Maquiladora de Pollo Matamoros, La Tigra, San Carlos','2025-12-09 00:22:17'),(5,'SALQUI','70764524','info@adm.salqui.com','Nuevo CEDI: 800m este estación pesaje, Ochomogo, Cartago','2025-12-09 00:22:17'),(6,'JRAMIREZ','71015268','info@jramirezdistribuidora.com','Cartago, El Carmen, 1.5 Km al Este del puente Bailey','2025-12-09 00:22:17'),(7,'AR COSTA RICA','61474184',NULL,'Avenida Escazú, Torre 205 (Asociado a AR Holdings)','2025-12-09 00:22:17'),(8,'BLUE FLAME','64893825','info@blueflameworldwide.com','San José, Santa Ana, Pozos: 200m Norte de Condominio Urban Flats','2025-12-09 00:22:17'),(9,'PESCADO','88289616','mrfishcostarica@gmail.com','25m oeste y 25m norte del Banco Popular de San Pedro Montes de Oca','2025-12-09 00:22:17'),(10,'PULPAS','87426327','info@pulpascanon.com','Carretera Interamericana Sur Km 58, Cañón del Guarco, Cartago','2025-12-09 00:22:17'),(11,'CIAMESSA','64900493','info@ciamesa.com','San José, Costa Rica','2025-12-09 00:22:17'),(12,'DOS PINOS','85100181','centrodecontactos@dospinos.com','Oficinas Centrales, Alajuela','2025-12-09 01:59:21'),(13,'INNOVO','24518300','info@innovocr.com','Naranjo, Alajuela, San Antonio de la Cueva','2025-12-09 01:59:21'),(14,'CARNE SANCHEZ','60835201',NULL,NULL,'2025-12-09 01:59:21'),(15,'POLLO MATAMOROS','83771368',NULL,'Maquiladora de Pollo Matamoros, La Tigra, San Carlos','2025-12-09 01:59:21'),(16,'SALQUI','70764524','info@adm.salqui.com','Nuevo CEDI: 800m este estación pesaje, Ochomogo, Cartago','2025-12-09 01:59:21'),(17,'JRAMIREZ','71015268','info@jramirezdistribuidora.com','Cartago, El Carmen, 1.5 Km al Este del puente Bailey','2025-12-09 01:59:21'),(18,'AR COSTA RICA','61474184',NULL,'Avenida Escazú, Torre 205 (Asociado a AR Holdings)','2025-12-09 01:59:21'),(19,'BLUE FLAME','64893825','info@blueflameworldwide.com','San José, Santa Ana, Pozos: 200m Norte de Condominio Urban Flats','2025-12-09 01:59:21'),(20,'PESCADO','88289616','mrfishcostarica@gmail.com','25m oeste y 25m norte del Banco Popular de San Pedro Montes de Oca','2025-12-09 01:59:21'),(21,'PULPAS','87426327','info@pulpascanon.com','Carretera Interamericana Sur Km 58, Cañón del Guarco, Cartago','2025-12-09 01:59:21'),(22,'CIAMESSA','64900493','info@ciamesa.com','San José, Costa Rica','2025-12-09 01:59:21');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_receta_padre` int DEFAULT NULL COMMENT 'ID de la primera versi├│n de la receta para trazar el historial.',
  `id_categoria_receta` int NOT NULL,
  `nombre_receta` varchar(150) NOT NULL,
  `version` int NOT NULL DEFAULT '1' COMMENT 'N├║mero de versi├│n de esta receta (1, 2, 3...).',
  `preparacion` text,
  `porciones` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `id_categoria_receta` (`id_categoria_receta`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  KEY `receta_ibfk_3` (`id_receta_padre`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_categoria_receta`) REFERENCES `categoria_receta` (`id_categoria_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `receta_ibfk_3` FOREIGN KEY (`id_receta_padre`) REFERENCES `receta` (`id_receta`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recetas con su categor├¡a y descripci├│n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
INSERT INTO `receta` VALUES (1,NULL,1,'Leche sola en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(2,NULL,1,'Leche sola en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(3,NULL,1,'Aguadulce en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(4,NULL,1,'Chocolate eingredientexrecetan taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(5,NULL,1,'Aguadulce con leche en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(6,NULL,1,'Aguadulce con leche en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(7,NULL,1,'Té negro en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(8,NULL,1,'Té negro con leche en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(9,NULL,1,'Té manzanilla en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(10,NULL,1,'Café negro en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(11,NULL,1,'Café con leche en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(12,NULL,1,'Café negro en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(13,NULL,1,'Chocolate en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(14,NULL,1,'Aguadulce en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(15,NULL,1,'Café con leche en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(16,NULL,1,'Té negro con leche en taza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(17,NULL,1,'Té manzanilla en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(18,NULL,1,'Té negro en vaso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(19,NULL,2,'Chuleta a la plancha',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(20,NULL,2,'Cerdo en salsa agridulce',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(21,NULL,2,'Frijoles tiernos con cerdo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(22,NULL,2,'Pozol',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(23,NULL,3,'Arroz con pollo',1,'1. Cocinar las pechugas en agua con sal y especias.\n2. Desmenuzar las pechugas de pollo.\n3. Reservar el caldo de pollo para agregarlo al arroz con el resto de ingredientes.\n4. En el sartén, sofreír los olores (vegetales). Seguidamente, agregar vainica, zanahoria y el pollo. Mezclar junto con el arroz. Tapar y cocinar a fuego medio. Revisar y mezclar el arroz cada vez que lo crea necesario.\n5. Servir porción de 6 onzas.',NULL,'2025-12-09 00:21:42',NULL,1),(24,NULL,4,'Arepas con miel',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(25,NULL,4,'Gallo de salchichón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(26,NULL,4,'Tostada con queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(27,NULL,4,'Tostada con especias',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(28,NULL,4,'Queso en tajada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(29,NULL,4,'Prensada de queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(30,NULL,4,'Picadillo de papa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(31,NULL,4,'Palitos de queso y especias',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(32,NULL,4,'Natilla',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(33,NULL,4,'Mortadela en tajada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(34,NULL,4,'Jamón en tajada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(35,NULL,4,'Granola con leche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(36,NULL,4,'Granola sola',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(37,NULL,4,'Gallo Pinto',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(38,NULL,4,'Gallo de Chorizo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(39,NULL,4,'Chorizo corriente',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(40,NULL,4,'Huevos con salchicha',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(41,NULL,4,'Salchicha sola',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(42,NULL,4,'Salchicha en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(43,NULL,5,'Frijoles',1,'1. Escoger los frijoles para retirar elementos extraños.\n2. Colocar los frijoles en el sartén reclinable y agregar agua hasta cubrir. Cocinar a fuego máximo (400°C) por 4 a 4.5 horas hasta que estén suaves.\n3. Una vez suaves, remover, agregar la sal y cocinar por unos 10 minutos más.\n4. Después, servir en bandejas completas (full).',NULL,'2025-12-09 00:21:42',NULL,1),(44,NULL,6,'Cubitos de res en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(45,NULL,8,'Ensalada Reserva',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(46,NULL,4,'Omelette',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(47,NULL,4,'Huevo frito',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(48,NULL,4,'Huevo con cebollino',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(49,NULL,4,'Huevo con jamón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(51,NULL,4,'Palitos con queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(52,NULL,4,'Picadillo de arracache',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(53,NULL,4,'Palitos con especias',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(54,NULL,3,'Pollo frito en cuartos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(55,NULL,4,'Plátano maduro',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(56,NULL,4,'Tostadas con miel',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(57,NULL,4,'Tostada con jalea',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(58,NULL,4,'Arepas de banano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(59,NULL,4,'Chorreada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(60,NULL,4,'Cereal con leche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(61,NULL,4,'Cereal sin leche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(63,NULL,4,'Pan en rebanadas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(64,NULL,7,'Porción Melón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(65,NULL,7,'Porción de papaya',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(66,NULL,7,'Porción de piña',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(67,NULL,7,'Porción de sandía',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(68,NULL,8,'Pico de Gallo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(69,NULL,8,'Ensalada Carta blanca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(70,NULL,8,'Ensalada Caracolitos con olores',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(71,NULL,8,'Ensalada Costa Rica',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(72,NULL,8,'Ensalada China',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(73,NULL,8,'Ensalada Caracolitos con atún',1,'1. Cocinar la pasta en agua hirviendo con un poquito de sal, hasta que esté al dente, dejar enfriar.\n2. Lavar, picar los olores y tener listos para adicionar a la pasta con el atún.\n3. Mezclar la pasta con olores, mayonesa y el atún.\n4. Sazonar con sal y pimienta, y probar antes de servir.\n5. Servir en frío.',NULL,'2025-12-09 00:21:42',NULL,1),(74,NULL,8,'Ensalada de Lechuga y tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(75,NULL,8,'Multicolor',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(76,NULL,8,'Escabeche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(77,NULL,8,'Papa con atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(78,NULL,8,'Primaveral',1,'1. Lavar, pelar o picar los ingredientes.\n2. Mezclar todos los ingredientes ya procesados hasta que queden bien homogéneos.\n3. Agregar jugo de limón, sal y pimienta. Probar antes de servir.',NULL,'2025-12-09 00:21:42',NULL,1),(79,NULL,8,'Repollo, tomate y culantro',1,'1. Lavar, desinfectar y procesar los vegetales.\n2. Mezclar repollo, tomate, culantro y adicionar limón.\n3. Sazonar con sal y pimienta, y probar antes de servir en tacitas.',NULL,'2025-12-09 00:21:42',NULL,1),(80,NULL,8,'Salpicón de pepino',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(81,NULL,8,'Tricolor',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(82,NULL,7,'Banano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(83,NULL,8,'Ensalada Mixta Natural',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(84,NULL,3,'Alita de pollo frita',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(85,NULL,3,'Chop suey seco con pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(86,NULL,3,'Cuarto de pollo con salsa Caribeña',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(87,NULL,3,'Frijoles blancos con pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(88,NULL,3,'Muslo de pollo deshuesado a la plancha',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(89,NULL,3,'Muslo deshuesado con salsa naranja',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(90,NULL,3,'Muslo deshuesado al ajillo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(91,NULL,3,'Pollo a la antonieta',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(92,NULL,3,'Pollo a la stroganoff',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(93,NULL,3,'Pollo Costra Mostaza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(94,NULL,3,'Espagueti con pollo en Salsa blanca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(95,NULL,3,'Vegetales Salteados con pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(96,NULL,9,'Suave de pescado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(97,NULL,9,'Arroz con atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(98,NULL,9,'Arroz con mariscos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(99,NULL,9,'Arroz con camarones',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(100,NULL,9,'Pescado a la Meuniere',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(101,NULL,9,'Pescado al horno y olores',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(102,NULL,9,'Espagueti con salsa, queso y atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(103,NULL,9,'Suflé de atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(104,NULL,9,'Tilapia al horno',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(105,NULL,6,'Molde de carne',1,'1. En un sartén pero sin calor, mezclar mitad de carne de res y mitad de cerdo. Remover para ir soltando la carne, agregar huevos, Salsa Lizano, tomate, chile, cebolla, ajo, maíz, pimienta negra, consomés y al final la harina.\n2. Hacer una torta de prueba para evaluar el sabor y corregir si es necesario.\n3. Alistar las bandejas de 1/4 pequeña con 2 palas metálicas (la pequeña), aplanar y cubrir toda la bandeja hasta la mitad (10 bandejas para llenar el carro del Rational).\n4. Precalentar el Rational en modo \"carne en masa\", a 80°C con dorado (más del medio) durante aproximadamente 30 minutos, hasta asegurarse de que se alcance los 80°C. Colocar la sonda.\n5. Sacar el carro y precalentar el Rational en modo \"dorado final\" por 5 minutos (en dorado más del medio). Al sonar, introducir el carro para completar el dorado.\n6. Porcionar en 18 porciones (3x6).',18,'2025-12-09 00:21:42',NULL,1),(106,NULL,6,'Ternero a la crema',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(107,NULL,6,'Arroz con carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(108,NULL,6,'Carne China',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(109,NULL,6,'Papas con carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(110,NULL,6,'Carne estilo oriental',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(111,NULL,6,'Carne sudada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(112,44,6,'Cubitos de res en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(113,NULL,6,'Cubitos de res con hongos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(114,NULL,6,'Espagueti a la boloñesa',1,'1. Sofreír 5 ingredientes (olores), harina, pasta. Agregar tomate licuado y darle cocción hasta que hierva.\n2. Añadir 1 kg de azúcar o menos para bajar la acidez, sal, pimienta, ajo en polvo, consomé de res. Añadir la carne molida.',NULL,'2025-12-09 00:21:42',NULL,1),(115,NULL,6,'Estofado de Carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(116,NULL,6,'Ternero en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(117,NULL,10,'Crema de espinacas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(118,NULL,10,'Picadillo de chayote con maíz',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(119,NULL,10,'Picadillo de Chayote',1,'1. Cocinar el chayote en el Rational por 20 minutos en modo vegetales al vapor.\n2. Derretir 5 barras de margarina con achiote y sofreír el chile y la cebolla hasta cristalizar.\n3. Añadir sal, consomé, ajo, pimienta negra y salsa inglesa. Mover por 2 minutos con la temperatura al máximo (400°C).\n4. Bajar a 300°C y añadir el chayote y el perejil. Mezclar hasta que quede homogéneo durante 5 minutos y luego retirar.',NULL,'2025-12-09 00:21:42',NULL,1),(120,NULL,10,'Berenjena con tomate y queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(121,NULL,10,'Brócoli con maíz',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(122,NULL,10,'Brócoli con coliflor',1,'1. Calentar aceite, derretir margarina, aceite de ajo. Sofreír ajo, cebolla y chile dulce. Agregar la harina y formar un roux.\n2. Agregar un caldo de verdura, agua o leche al roux y darle el punto de textura.\n3. Pre-cocinar el brócoli y coliflor por 15 minutos en el Rational en modo vapor.\n4. Agregar los vegetales al roux, mezclar y rectificar la sazón.',NULL,'2025-12-09 00:21:42',NULL,1),(123,NULL,10,'Cazuela de hortalizas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(124,NULL,10,'Crema de brócoli',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(125,NULL,10,'Picadillo de papa con zanahoria',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(126,NULL,10,'Vainica y zanahoria',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(127,NULL,10,'Picadillo de plátano verde',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(128,NULL,10,'Zanahoria glaseada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(129,NULL,10,'Picadillo de papaya verde',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(130,NULL,10,'Zucchini y maíz dulce',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(131,130,10,'Zucchini con maíz dulce',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(132,NULL,10,'Verduritas en salsa china',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(133,NULL,10,'Vegetales al ajillo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(134,NULL,10,'Vainica con coliflor con salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(135,NULL,10,'Picadillo de papa, vainica y zanahoria',1,'1. Lavar y procesar los vegetales.\n2. Hacer un precocinado de los vegetales en el Rational al vapor.\n3. Agregar aceite de ajo al sartén, adicionar vegetales y condimentar al gusto.\n4. Mezclar y probar el platillo antes de sacarlo a la barra de atención.',NULL,'2025-12-09 00:21:42',NULL,1),(136,NULL,10,'Coliflor salteada',1,'1. Cocinar Coliflor en Rational por 15 minutos en función vapor.\n2. Sofreír en aceite, margarina, chile, y cebolla. Agregar sal, ajo, pimienta. Dejar sofreír bien y añadir 1 L de agua.\n3. Agregar coliflor y mezclar bien. Dejar 10 minutos de reposo y servir.',NULL,'2025-12-09 00:21:42',NULL,1),(137,NULL,10,'Crema de ayote sazón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(138,NULL,10,'Guiso de ayote tierno en leche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(139,NULL,10,'Guiso de ayote tierno',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(140,NULL,8,'Ensalada Alemana',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(141,NULL,8,'Ceviche de plátano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(142,NULL,9,'Tilapia en Salsa Tártara',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(143,NULL,9,'Pasta con camarones',1,'Salsa Criolla: Llevar los \"fondos\" del tomate con el chile dulce, la cebolla, el ajo, el tomillo, el orégano, el laurel y reservar.\nCocinar la pasta: Llenar sartén a 3/4 con 0.5 kg de sal y 3 L de aceite. Dejar hervir y agregar 20 kg de pasta.\nSofrito: Blanquear el camarón (sumergir en agua hirviendo con consomé de marisco hasta que cambie de color). Sacar en 10 a 15 minutos.\nEn aceite de ajo y margarina con laurel, sofreír cebolla y chile para perfumar más la salsa criolla. Agregar camarones, la pasta corta suelta y rectificar sabor.\nAl final, agregar cebollino.',NULL,'2025-12-09 00:21:42',NULL,1),(144,NULL,2,'Chuleta ahumada hawaiana',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(145,NULL,6,'Lomo saltado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(146,NULL,6,'Carne Diana',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(147,NULL,6,'Pasta con brócoli y jamón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(148,NULL,6,'Chop Suey mixto',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(149,NULL,6,'Carne con papa y yuca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(150,NULL,6,'Carne con papas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(151,NULL,6,'Papas con chorizo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(152,NULL,3,'Pollo achiotado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(153,NULL,3,'Muslo de pollo deshuesado a la mostaza',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(154,NULL,3,'Muslito de pollo frito',1,'1. Marinar el día anterior con sal, marinador, ajo, pimienta y agua hasta cubrir (2 a 2.5 baldes).\n2. Escurrir el pollo y pasarlo por el empanizador.\n3. Freír 20 piezas por canasta durante 20 minutos a 180°C.',NULL,'2025-12-09 00:21:42',NULL,1),(155,NULL,3,'Muslito de pollo agridulce',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(156,NULL,3,'Muslito de pollo cacciatore',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(157,NULL,3,'Pollo escabechado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(158,44,6,'Cubitos de res en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(159,NULL,10,'Sopa negra con huevo',1,'1. Lavar y procesar tomates con los demás olores.\n2. Cocinar los frijoles, agregar sal al final.\n3. Licuar los frijoles con los olores.\n4. Colocar la mezcla anterior en cocción hasta hervir y adicionar el tomate troceado en cubitos pequeños.\n5. Agregar los huevos crudos uno a uno en la mezcla anterior.\n6. Sazonar con sal y pimienta, y rectificar sabor con especias.\n7. Al final, agregar culantro picado para servir.',NULL,'2025-12-09 00:21:42',NULL,1),(160,NULL,6,'Curry de carne con vegetales',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(161,NULL,4,'Dados de queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(162,NULL,6,'Lentejas con res',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(163,NULL,11,'Arroz con palmito',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(164,NULL,12,'Crepas de dulce y banano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(165,NULL,2,'Garbanzos con cerdo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(166,NULL,12,'Yuca frita',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(167,NULL,11,'Pasta con pesto',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(168,NULL,10,'Suflé de espinaca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(169,NULL,4,'Arepas con miel (Premezcla)',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(170,37,4,'Gallo Pinto 2020',1,'1. Agregar el aceite al sartén reclinable, sofreír el chile y la cebolla picados hasta cristalizar.\n2. Añadir las bandejas de frijoles, luego el consomé de pollo, la pimienta, el ajo en polvo y la salsa inglesa. Dejar que se cocinen bien hasta que hiervan y se sequen los frijoles.\n3. Adicionar las costras de arroz y el arroz blanco e inmediatamente el culantro picado. Mezclar bien y dejar secar a 300°C.',NULL,'2025-12-09 00:21:42',NULL,1),(171,NULL,4,'Torta de huevo con olores',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(172,NULL,10,'Brócoli con maíz 2020',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(173,NULL,11,'Pasta con vegetales',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(174,173,11,'Pasta con vegetales',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(175,NULL,11,'Lentejas con ayote',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(176,NULL,11,'Pastel de palmito',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(177,NULL,11,'Pasta con salsa blanca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(178,NULL,11,'Tortilla de espinaca y hongos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(179,NULL,11,'Arroz con verduras',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(180,NULL,11,'Lentejas con zanahorias y vainica',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(181,NULL,11,'Risotto de zapallo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(182,NULL,11,'Sopa Minestrone',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(183,NULL,11,'Paella de verduras',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(184,NULL,11,'Pasta con vegetales y salsa de piña',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(185,NULL,11,'Sopa de Garbanzos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(186,NULL,11,'Arroz con lentejas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(187,NULL,11,'Garbanzos en salsa de tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(188,NULL,11,'Pasta Napolitana',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(189,NULL,1,'Batido Verde',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(190,NULL,13,'Emparedado de Pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(191,NULL,9,'Barquitos de Zucchini',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(192,NULL,6,'Lasaña de Carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(193,NULL,13,'Emparedado de Aguacate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(194,NULL,6,'Canelones de carne y queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(195,NULL,11,'Salsa de tomate natural',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(196,NULL,6,'Mondongo en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(197,NULL,13,'Emparedado de Jamón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(198,NULL,13,'Salsa rosada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(199,NULL,8,'Ensalada campesina',1,'1. Antes de procesar la materia prima, revisar detenidamente el estado en que se encuentren los productos.\n2. Seguidamente, lavar y desinfectar.\n3. Procesar el repollo blanco y picarlo finamente, al igual que el repollo morado. Procesar el tomate en cuadros, la cebolla en Brunoise, el culantro fino y los chiles dulces en tiras Brunoise. Exprimir los limones para obtener su jugo.\n4. Agregar sal al gusto.',NULL,'2025-12-09 00:21:42',NULL,1),(200,NULL,8,'Ensalada de Lechuga y Manzana',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(201,NULL,8,'Ensalada Pico de Gallo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(202,NULL,8,'Repollo con piña',1,'1. Revisar el producto antes de lavar y procesar.\n2. Lavar y desinfectar los alimentos antes de procesar.\n3. Procesar los alimentos: repollo picado finamente y blanquear para quitarle dureza y gases.\n4. Piña en cuadritos, cebolla en agua de azúcar o vinagre para suavizar, y cortada en julianas muy delgadas.\n5. Agregar azúcar, sal y mayonesa al gusto.',NULL,'2025-12-09 00:21:42',NULL,1),(203,NULL,8,'Ensalada Otoño',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(204,NULL,8,'Ensalada rusa',1,'1. Revisar que el producto esté en buen estado.\n2. Lavar y desinfectar.\n3. Procesar y luego cocinar papa, huevos y remolacha.\n4. Procesar ingredientes cocinados en cuadritos.\n5. Incorporar todos los ingredientes, agregar mayonesa, sal y pimienta al gusto.',NULL,'2025-12-09 00:21:42',NULL,1),(205,NULL,13,'Emparedado de Atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(206,NULL,8,'Ensalada Taras',1,'1. Revisar que el producto se encuentre en óptimas condiciones.\n2. Lavar y desinfectar la materia prima.\n3. Procesar el repollo blanco picado finamente, el tomate en cuadros, la cebolla morada en cuadros finos o julianas. Picar el culantro finamente, exprimir los limones. Agregar sal y pimienta al gusto.\n4. Incorporar todos los ingredientes, dependiendo de la técnica que se utilice con el repollo para que no pierda el líquido. Revolver y probar el gusto con nutricionista.',NULL,'2025-12-09 00:21:42',NULL,1),(207,NULL,8,'Ceviche de Mango 2020',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(208,NULL,8,'Ensalada Julio',1,'1. Antes de procesar, revise el producto.\n2. Lavar la materia prima con el sanitizante.\n3. Procesar en cuadros pequeños el tomate, pepino, mango, apio, cebolla. Exprimir los limones, agregar agua, azúcar, sal y pimienta al gusto.',NULL,'2025-12-09 00:21:42',NULL,1),(209,NULL,8,'Ensalada 31 de Julio',1,'1. Lechuga deshojada, lavada y picada.\n2. Zanahoria pelada, rallada o en rodajas.\n3. Rábano picado o en rodajas.\nAderezo: Agregar mostaza, azúcar y limones en un tazón. Mezclar todos los ingredientes y agregar a la ensalada.',NULL,'2025-12-09 00:21:42',NULL,1),(210,NULL,12,'Pan de Elote',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(211,NULL,12,'Tamal de Maicena',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(213,NULL,5,'Arroz Rational hervido',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(214,NULL,4,'Torta de Plátano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(215,NULL,8,'Ensalada Rosa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(216,NULL,8,'Ensalada de Otoño',1,'1. Revisar producto, lavar y desinfectar como es debido.\n2. Procesar el tomate en gajos. Rallar o cortar el queso en cuadros para adornar por encima. Picar o rallar el repollo. Alfalfa para adornar y sal al gusto.',NULL,'2025-12-09 00:21:42',NULL,1),(217,NULL,8,'Ensalada Criolla',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(218,NULL,8,'Repollo, piña y hongos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(219,NULL,8,'Vinagreta de Pepino',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(220,NULL,8,'Pasta con atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(221,NULL,8,'Ensalada Kale',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(222,NULL,8,'Mayonesa para ensaladas',1,'1. Colocar vinagre, huevos y sal en el frasco de la licuadora. Licuar por 30 segundos e incorporar el aceite en hilo.',NULL,'2025-12-09 00:21:42',NULL,1),(223,NULL,8,'Ensalada K-soda',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(224,NULL,8,'Ensalada de Vainica con huevo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(225,NULL,8,'Repollo en Escabeche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(226,NULL,13,'Emparedado de Carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(227,NULL,8,'Pepino, tomate y cebolla',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(228,NULL,8,'Otoño sin repollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(229,NULL,3,'Pollo al ajillo (en cuartos)',1,'1. Marinar el pollo el día anterior.\n2. Escurrir el pollo.\n3. Elaborar el aceite de especias y reservarlo para el día siguiente.\n4. Barnizar con la mezcla del aceite y olores.\n5. Colocar en parrillas 30 minutos en el Rational en modo parrilla.',NULL,'2025-12-09 00:21:42',NULL,1),(230,141,8,'Ceviche de plátano 2020',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(231,NULL,8,'Ensalada Kale y olores',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(232,NULL,13,'Emparedado de Frijol y Queso Amarillo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(233,NULL,13,'Emparedado Choripán',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(234,NULL,4,'Tortas de yuca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(235,NULL,6,'Lomo Fingido',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(236,NULL,13,'Emparedado de Salchichón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(237,NULL,13,'Emparedado de Torta de Huevo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(238,NULL,9,'Pastel de atún y papa 21',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(239,NULL,14,'Cheesecake tricolor',1,'1. Disolver la gelatina (medida para cada paquete) en 3 L de agua hirviendo y 0.5 L de agua fría. Refrigerar por 2 horas. Cortar los dos colores de gelatina en cuadritos y reservarlos en una bandeja.\n2. Colocar 5 cucharadas de gelatina Dietex en una taza con agua fría y reservar.\n3. Licuar crema dulce, queso crema y leche condensada.\n4. Calentar el Dietex en el microondas por un minuto o hasta que esté líquido, y agregarlo al licuado.\n5. Agregar esta mezcla sobre los cuadritos de gelatina de colores y refrigerar por 12 horas.\n6. Porcionar y servir.',NULL,'2025-12-09 00:21:42',NULL,1),(240,NULL,12,'Tamal de Vitamaíz',1,'1. Poner a hervir la leche con el azúcar.\n2. Licuar huevos, un poquito de leche (1/2 taza), Vitamaíz, leche condensada y canela en polvo.\n3. Cuando la leche esté hirviendo, agregar lo licuado y mezclar sin detenerse hasta que vuelva a hervir.\n4. Luego de hervir, retirar del fuego, agregar la mantequilla y el coco (opcional) y mezclar bien. Colocar en bandeja.\n5. Hornear a fuego lento por 1 hora o hasta que dore.',NULL,'2025-12-09 00:21:42',NULL,1),(241,NULL,12,'Queque Veteado',1,'1. En la batidora, mezclar todos los ingredientes de vainilla y luego los de chocolate por separado por 5 minutos.\n2. Colocar en la bandeja primero la mezcla de vainilla y encima la de chocolate. Con un tenedor, apenas mezclar un poquito y hornear.',NULL,'2025-12-09 00:21:42',NULL,1),(242,NULL,14,'Tres leches',1,'1. Tamizar la harina junto con el polvo de hornear y reservar.\n2. Separar las claras de las yemas de huevo.\n3. Batir las claras a punto de nieve. Cuando estén, agregar las yemas una a una y luego el azúcar en forma de lluvia.\n4. Retirar de la batidora y agregar los polvos previamente cernidos en forma envolvente.\n5. Agregar en bandeja y hornear.\n6. Cuando aún esté caliente, punzar con el tenedor y agregar la mezcla de leches. Refrigerar 12 horas.\n7. Luego de este tiempo, decorar con Chantilly.\nMezcla de leches: Licuar leche condensada, leche evaporada, crema dulce y leche.\nChantilly: 12 horas antes, refrigerar 1 L de crema dulce bien fría. Agregar a la batidora y cuando esté en forma de picos, añadir poco a poco azúcar al gusto y vainilla si se desea. Luego decorar.',NULL,'2025-12-09 00:21:42',NULL,1),(243,NULL,9,'Cordon Bleu de Atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(244,NULL,13,'Emparedado de Espinaca y Aguacate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(245,NULL,6,'Pastel de Zucchini',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(246,NULL,6,'Lasaña de Berenjena y carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(247,NULL,3,'Pollo con zucchini y zanahoria',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(248,NULL,8,'Ensalada de lechuga variada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(249,NULL,8,'Ensalada de Lechuga y palmito',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(250,NULL,8,'Tomate, Zanahoria, Repollo y Mayonesa',1,'Lechuga procesada en cama o integrada. Palmito en trozos. Culantro finamente picado. Mayonesa puede ser integrada con todos los ingredientes o al finalizar la preparación.',NULL,'2025-12-09 00:21:42',NULL,1),(251,NULL,12,'Pancito de queso',1,'1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar el queso, la natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n3. Hacer bolitas de pan de 100 g en una bandeja engrasada con spray y enharinada.\n4. Llevar al horno por 45 minutos, aproximadamente a 350°C.',NULL,'2025-12-09 00:21:42',NULL,1),(252,NULL,12,'Pancito con especies',1,'1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Agregar cebolla, chile, culantro, etc., picado finamente.\n3. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n4. Hacer bolitas de la masa de 100 g en una bandeja engrasada con spray y harina.\n5. Llevar al horno por 45 minutos, aproximadamente a 350°C.',NULL,'2025-12-09 00:21:42',NULL,1),(253,NULL,8,'Ensalada Mixta Casera',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(254,NULL,6,'Sofrito de ternero',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(255,NULL,13,'Emparedado de frijol y Queso Blanco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(256,NULL,12,'Empanadas de frijol',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(257,NULL,12,'Queque de zanahoria',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(258,NULL,12,'Hamburguesa de res',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(259,NULL,6,'Chalupa de Carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(260,NULL,3,'Chalupa de Pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(261,NULL,6,'Frijoles blancos con chorizo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(262,NULL,3,'Sopa Azteca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(263,NULL,3,'Muslito de pollo a las hierbas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(264,NULL,14,'Crema de limón con granola',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(265,NULL,6,'Sopa de Mondongo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(266,NULL,14,'Cajetas de Leche Pinito y maní',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(267,NULL,9,'Ceviche de Pescado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(268,NULL,12,'Tamal Dulce con coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(269,NULL,1,'Horchata',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(270,NULL,1,'Agua de sapo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(271,NULL,1,'Zanahoria con limón',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(272,NULL,3,'Garbanzos con pollo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(273,NULL,11,'Pasta a la primavera',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(274,NULL,3,'Cuartos de pollo BBQ',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(275,NULL,12,'Costilla de Jalea',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(276,NULL,2,'Arroz con cerdo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(277,NULL,6,'Espagueti Supremo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(278,NULL,9,'Pescado Napolitano',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(279,NULL,2,'Cerdo en salsa BBQ',1,'1. Adobar el cerdo con aceite de ajo, sal, ajo en polvo, pimienta y clavo de olor.\n2. Cocinar cerdo al Rational en modo plancha por 20 minutos por tanda, bandeja no muy cargada para cocción uniforme.\n3. Sofreír el chile y la cebolla en el sartén volteable con aceite y margarina. Reservar unos minutos.\n4. En el mismo sartén, elaborar el roux: añadir aceite y margarina y agregar la harina hasta crear una pasta homogénea a temp 250°C. Después, agregar líquido base BBQ y Salsa T. BBQ (agua o caldo) para darle su punto deseado.\n5. Agregar al cerdo cocido el chile y la cebolla. Mezclar muy bien.',NULL,'2025-12-09 00:21:42',NULL,1),(281,NULL,12,'Arreglados',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(282,NULL,13,'Emparedado de Queso Crema con Jalea',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(283,NULL,13,'Emparedado de Mortadela',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(284,NULL,6,'Carne molida arreglada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(285,NULL,6,'Frijoles blancos con salchicha',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(286,NULL,6,'Sopa de carne con verduras',1,'1. Lavar y procesar los vegetales.\n2. Cocinar la carne hasta que esté suave y luego adicionar la sal.\n3. Reservar el fondo de la carne para adicionar luego.\n4. Cocinar vegetales en el fondo oscuro. Después, adicionar la carne con los olores licuados previamente.\n5. Adicionar condimentos y especias.\n6. Rectificar sal y servir caliente.',NULL,'2025-12-09 00:21:42',NULL,1),(287,NULL,12,'Minipizzas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(288,NULL,10,'Crema de frijoles',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(290,NULL,4,'Tostada con margarina',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(291,NULL,2,'Chuleta al horno',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(292,NULL,12,'Cangrejos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(293,NULL,12,'Budín',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(294,NULL,12,'Perros Calientes',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(295,NULL,8,'Ensalada Febrero 24',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(296,NULL,12,'Galleta de mantequilla',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(297,NULL,11,'Pastel de plátano maduro',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(298,NULL,9,'Mariscada',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(299,NULL,3,'Huevo ranchero',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(300,NULL,12,'Pastel de Elote',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(301,NULL,3,'Muslo de Pollo con salsa de tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(302,NULL,10,'Chayote con zanahoria',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(303,NULL,3,'Alita de pollo BBQ',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(304,NULL,6,'Carne en salsa 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(305,NULL,6,'Garbanzos con res',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(306,NULL,2,'Garbanzos con cerdo 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(307,NULL,1,'Batido verde 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(309,NULL,3,'Papas con pollo 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(310,NULL,12,'Tacos con salsa verde',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(311,NULL,4,'Arepa de ayote 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(312,NULL,9,'Torta de papa y pescado 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(313,NULL,5,'Bandeja de Arroz 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(314,NULL,5,'Bandeja de Frijol 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(315,37,4,'Bandeja de Gallo Pinto 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(316,NULL,5,'Arroz Blanco 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(317,NULL,5,'Frijoles rojos 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(318,37,4,'Gallo Pinto 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(319,NULL,12,'Tostadas Italianas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(320,NULL,10,'Papa, garbanzos, espinaca y hongos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(321,NULL,3,'Chilasquila de pollo con Salsa de Tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(322,NULL,10,'Brócoli con salsa Holandesa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(323,NULL,6,'Chili con Carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(324,NULL,2,'Cerdo con verduritas 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(325,NULL,3,'Lasaña de pollo 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(326,NULL,14,'Cheesecake de coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(327,NULL,14,'Churchill Cheesecake',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(328,NULL,6,'Albóndiga en salsa de tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(329,NULL,14,'Flan de coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(330,NULL,14,'Tamal de coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(331,NULL,14,'Tamal de Vitamaíz',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(332,NULL,10,'Crema de zapallo 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(333,NULL,11,'Chop suey con salsa Teriyaki',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(334,NULL,6,'Chiles rellenos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(335,NULL,6,'Torta de carne',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(336,NULL,14,'Cocadas 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(337,NULL,12,'Rollos de canela',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(338,NULL,14,'Arroz con leche',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(339,NULL,3,'Pollo tropical',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(340,NULL,10,'Tomate, queso y espinaca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(341,NULL,12,'Tortilla con Queso 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(342,NULL,11,'Pasta con salsa de queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(343,NULL,10,'Crema de espárrago y palmito',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(344,NULL,12,'Pan casero',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(345,NULL,1,'Fresco de Maracuyá',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(346,NULL,6,'Pastel de papa con carne 2023',1,'1. Lavar y procesar la papa, seguidamente cocinarla.\n2. Cocinar la carne molida, sofreír olores y adicionar.\n3. Realizar puré de papas con margarina y sal.\n4. Colocar en bandejas una capa de puré, seguidamente una capa de carne molida, otra de puré de papa y al final queso mozzarella.\n5. Colocar en el Rational y hornear.',NULL,'2025-12-09 00:21:42',NULL,1),(347,NULL,4,'Huevo picado 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(348,NULL,1,'Pulpa de Mango 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(349,NULL,1,'Pulpa de Tamarindo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(350,NULL,4,'Salchichón en salsa',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(351,NULL,6,'Frijoles blancos con res 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(352,NULL,9,'Cazuela de Pescado',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(353,NULL,3,'Pollo en salsa de hongos 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(354,NULL,5,'Rice and Beans 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(355,NULL,12,'Crepas de frutas, mantequilla de maní 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(356,NULL,8,'Ensalada 8 de setiembre',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(357,NULL,12,'Paty 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(358,NULL,14,'Cajeta de Leche Pinito con Jalea',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(359,NULL,14,'Cajeta de pasas',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(360,NULL,14,'Cajeta de café y coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(361,NULL,14,'Cocadas Semana Cívica',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(362,NULL,6,'Rondón 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(363,NULL,6,'Carne mechada 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(364,NULL,2,'Vigorón 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(365,NULL,3,'Sopa Azteca 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(366,163,11,'Arroz con palmito 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(367,NULL,6,'Olla de carne 2023',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(368,NULL,9,'Pastel de papa con atún 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(369,NULL,6,'Lasaña de Carne 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(370,NULL,4,'Reposado de Avena y Yogurt',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(371,NULL,12,'Burrito de frijol y queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(372,NULL,2,'Frijoles blancos con costilla de cerdo',1,'1. Lavar y procesar las verduras y olores.\n2. Cocinar previamente la costilla de cerdo y adicionar sal al final.\n3. Dejar los frijoles blancos en agua. Al día siguiente, desechar el agua y cocinar con ajo y especias. Adicionar las verduras y la costilla de cerdo a los frijoles.\n4. Condimentar con especias y olores.\n5. Probar y rectificar sabor antes de servir.',NULL,'2025-12-09 00:21:42',NULL,1),(373,NULL,3,'Sopa Azteca',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(374,373,3,'Sopa Azteca 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(375,163,11,'Arroz con palmito 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(376,NULL,10,'Guiso de palmito con zanahoria',1,'1. Lavar y procesar zanahoria.\n2. Abrir latas de palmito y escurrir el líquido.\n3. Sofreír olores con margarina y aceite de ajo.\n4. Cocinar zanahoria al vapor en Rational.\n5. Agregar a los olores la zanahoria y el palmito. Mezclar y condimentar al gusto con sal y pimienta, entre otros.\n6. Al final, adicionar el perejil.',NULL,'2025-12-09 00:21:42',NULL,1),(377,NULL,3,'Nuggets de pollo en Salsa China',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(378,NULL,6,'Frijoles blancos con carne y queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(379,NULL,9,'Pasta con atún en salsa de tomate',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(380,NULL,2,'Pozol 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(381,204,8,'Ensalada rusa 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(382,NULL,11,'Garbanzos con tomate 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(383,NULL,4,'Tostada con aceite de oliva, ajo y especias 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(384,NULL,8,'Ensalada 8 de abril 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(385,NULL,8,'Garbanzos con atún',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(386,NULL,2,'Papas con costilla de cerdo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(387,NULL,4,'Dos rebanadas de tomate (porción)',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(388,NULL,12,'Lápiz de carne mechada 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(389,NULL,12,'Burrito de carne, frijol y queso',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(390,NULL,6,'Pasta Suprema 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(391,NULL,2,'Frijoles tiernos con costilla de cerdo 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(392,NULL,6,'Mano de piedra en salsa 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(393,NULL,2,'Costilla de cerdo BBQ 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(394,NULL,1,'Aguadulce - Rectoría',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(395,NULL,6,'Fajitas de res 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(396,NULL,1,'Horchata 2024',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(397,NULL,6,'Lentejas con chorizo',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(398,NULL,4,'Arepa de manzana, avena y yogurt',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(399,NULL,4,'Tostada pizzera 2025',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(400,NULL,2,'Garbanzos con costilla de cerdo 2025',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(401,NULL,6,'Mano de pirecetaingredienteedra en Salsa de hongos',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(402,NULL,9,'Pastel de papa y atún 2025',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1),(403,NULL,4,'Chocoarepa con pasas y coco',1,NULL,NULL,'2025-12-09 00:21:42',NULL,1);
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_receta_version_insert` AFTER INSERT ON `receta` FOR EACH ROW BEGIN
    INSERT INTO receta_historico(
        id_receta_activa,
        version,
        estado_version,
        motivo_cambio,
        id_categoria_receta,
        nombre_receta,
        preparacion,
        porciones,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_receta,
        NEW.version,
        'aprobada',
        'Versión inicial',
        NEW.id_categoria_receta,
        NEW.nombre_receta,
        NEW.preparacion,
        NEW.porciones,
        NEW.id_usuario_creacion
    );
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
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_receta_version_update` AFTER UPDATE ON `receta` FOR EACH ROW BEGIN
    DECLARE v_version INT;

    SELECT COALESCE(MAX(version),0)
    INTO v_version
    FROM receta_historico
    WHERE id_receta_activa = NEW.id_receta;

    INSERT INTO receta_historico(
        id_receta_activa,
        version,
        estado_version,
        motivo_cambio,
        id_categoria_receta,
        nombre_receta,
        preparacion,
        porciones,
        id_usuario_versionado
    )
    VALUES(
        NEW.id_receta,
        v_version + 1,
        'aprobada',
        'Actualización de receta',
        NEW.id_categoria_receta,
        NEW.nombre_receta,
        NEW.preparacion,
        NEW.porciones,
        NEW.id_usuario_creacion
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `receta_historico`
--

DROP TABLE IF EXISTS `receta_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_historico` (
  `id_receta_historico` int NOT NULL AUTO_INCREMENT,
  `id_receta_activa` int NOT NULL COMMENT 'ID de la receta activa (original) a la que pertenece esta versi├│n.',
  `version` int NOT NULL COMMENT 'N├║mero de versi├│n congelada.',
  `estado_version` enum('aprobada','deprecada','inactiva') DEFAULT 'aprobada',
  `motivo_cambio` varchar(255) DEFAULT NULL,
  `id_categoria_receta` int NOT NULL,
  `nombre_receta` varchar(150) NOT NULL,
  `preparacion` text,
  `porciones` int DEFAULT NULL,
  `fecha_versionado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_versionado` int DEFAULT NULL,
  PRIMARY KEY (`id_receta_historico`),
  UNIQUE KEY `uk_receta_version` (`id_receta_activa`,`version`),
  KEY `id_categoria_receta` (`id_categoria_receta`),
  KEY `id_usuario_versionado` (`id_usuario_versionado`),
  CONSTRAINT `receta_historico_ibfk_1` FOREIGN KEY (`id_receta_activa`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `receta_historico_ibfk_2` FOREIGN KEY (`id_usuario_versionado`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de versiones de recetas aprobadas para producci├│n.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_historico`
--

LOCK TABLES `receta_historico` WRITE;
/*!40000 ALTER TABLE `receta_historico` DISABLE KEYS */;
INSERT INTO `receta_historico` VALUES (1,1,1,'aprobada','Versión inicial',1,'Leche sola en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(2,2,1,'aprobada','Versión inicial',1,'Leche sola en taza',NULL,NULL,'2025-12-09 00:21:42',1),(3,3,1,'aprobada','Versión inicial',1,'Aguadulce en taza',NULL,NULL,'2025-12-09 00:21:42',1),(4,4,1,'aprobada','Versión inicial',1,'Chocolate eingredientexrecetan taza',NULL,NULL,'2025-12-09 00:21:42',1),(5,5,1,'aprobada','Versión inicial',1,'Aguadulce con leche en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(6,6,1,'aprobada','Versión inicial',1,'Aguadulce con leche en taza',NULL,NULL,'2025-12-09 00:21:42',1),(7,7,1,'aprobada','Versión inicial',1,'Té negro en taza',NULL,NULL,'2025-12-09 00:21:42',1),(8,8,1,'aprobada','Versión inicial',1,'Té negro con leche en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(9,9,1,'aprobada','Versión inicial',1,'Té manzanilla en taza',NULL,NULL,'2025-12-09 00:21:42',1),(10,10,1,'aprobada','Versión inicial',1,'Café negro en taza',NULL,NULL,'2025-12-09 00:21:42',1),(11,11,1,'aprobada','Versión inicial',1,'Café con leche en taza',NULL,NULL,'2025-12-09 00:21:42',1),(12,12,1,'aprobada','Versión inicial',1,'Café negro en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(13,13,1,'aprobada','Versión inicial',1,'Chocolate en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(14,14,1,'aprobada','Versión inicial',1,'Aguadulce en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(15,15,1,'aprobada','Versión inicial',1,'Café con leche en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(16,16,1,'aprobada','Versión inicial',1,'Té negro con leche en taza',NULL,NULL,'2025-12-09 00:21:42',1),(17,17,1,'aprobada','Versión inicial',1,'Té manzanilla en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(18,18,1,'aprobada','Versión inicial',1,'Té negro en vaso',NULL,NULL,'2025-12-09 00:21:42',1),(19,19,1,'aprobada','Versión inicial',2,'Chuleta a la plancha',NULL,NULL,'2025-12-09 00:21:42',1),(20,20,1,'aprobada','Versión inicial',2,'Cerdo en salsa agridulce',NULL,NULL,'2025-12-09 00:21:42',1),(21,21,1,'aprobada','Versión inicial',2,'Frijoles tiernos con cerdo',NULL,NULL,'2025-12-09 00:21:42',1),(22,22,1,'aprobada','Versión inicial',2,'Pozol',NULL,NULL,'2025-12-09 00:21:42',1),(23,23,1,'aprobada','Versión inicial',3,'Arroz con pollo','1. Cocinar las pechugas en agua con sal y especias.\n2. Desmenuzar las pechugas de pollo.\n3. Reservar el caldo de pollo para agregarlo al arroz con el resto de ingredientes.\n4. En el sartén, sofreír los olores (vegetales). Seguidamente, agregar vainica, zanahoria y el pollo. Mezclar junto con el arroz. Tapar y cocinar a fuego medio. Revisar y mezclar el arroz cada vez que lo crea necesario.\n5. Servir porción de 6 onzas.',NULL,'2025-12-09 00:21:42',1),(24,24,1,'aprobada','Versión inicial',4,'Arepas con miel',NULL,NULL,'2025-12-09 00:21:42',1),(25,25,1,'aprobada','Versión inicial',4,'Gallo de salchichón',NULL,NULL,'2025-12-09 00:21:42',1),(26,26,1,'aprobada','Versión inicial',4,'Tostada con queso',NULL,NULL,'2025-12-09 00:21:42',1),(27,27,1,'aprobada','Versión inicial',4,'Tostada con especias',NULL,NULL,'2025-12-09 00:21:42',1),(28,28,1,'aprobada','Versión inicial',4,'Queso en tajada',NULL,NULL,'2025-12-09 00:21:42',1),(29,29,1,'aprobada','Versión inicial',4,'Prensada de queso',NULL,NULL,'2025-12-09 00:21:42',1),(30,30,1,'aprobada','Versión inicial',4,'Picadillo de papa',NULL,NULL,'2025-12-09 00:21:42',1),(31,31,1,'aprobada','Versión inicial',4,'Palitos de queso y especias',NULL,NULL,'2025-12-09 00:21:42',1),(32,32,1,'aprobada','Versión inicial',4,'Natilla',NULL,NULL,'2025-12-09 00:21:42',1),(33,33,1,'aprobada','Versión inicial',4,'Mortadela en tajada',NULL,NULL,'2025-12-09 00:21:42',1),(34,34,1,'aprobada','Versión inicial',4,'Jamón en tajada',NULL,NULL,'2025-12-09 00:21:42',1),(35,35,1,'aprobada','Versión inicial',4,'Granola con leche',NULL,NULL,'2025-12-09 00:21:42',1),(36,36,1,'aprobada','Versión inicial',4,'Granola sola',NULL,NULL,'2025-12-09 00:21:42',1),(37,37,1,'aprobada','Versión inicial',4,'Gallo Pinto',NULL,NULL,'2025-12-09 00:21:42',1),(38,38,1,'aprobada','Versión inicial',4,'Gallo de Chorizo',NULL,NULL,'2025-12-09 00:21:42',1),(39,39,1,'aprobada','Versión inicial',4,'Chorizo corriente',NULL,NULL,'2025-12-09 00:21:42',1),(40,40,1,'aprobada','Versión inicial',4,'Huevos con salchicha',NULL,NULL,'2025-12-09 00:21:42',1),(41,41,1,'aprobada','Versión inicial',4,'Salchicha sola',NULL,NULL,'2025-12-09 00:21:42',1),(42,42,1,'aprobada','Versión inicial',4,'Salchicha en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(43,43,1,'aprobada','Versión inicial',5,'Frijoles','1. Escoger los frijoles para retirar elementos extraños.\n2. Colocar los frijoles en el sartén reclinable y agregar agua hasta cubrir. Cocinar a fuego máximo (400°C) por 4 a 4.5 horas hasta que estén suaves.\n3. Una vez suaves, remover, agregar la sal y cocinar por unos 10 minutos más.\n4. Después, servir en bandejas completas (full).',NULL,'2025-12-09 00:21:42',1),(44,44,1,'aprobada','Versión inicial',6,'Cubitos de res en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(45,45,1,'aprobada','Versión inicial',8,'Ensalada Reserva',NULL,NULL,'2025-12-09 00:21:42',1),(46,46,1,'aprobada','Versión inicial',4,'Omelette',NULL,NULL,'2025-12-09 00:21:42',1),(47,47,1,'aprobada','Versión inicial',4,'Huevo frito',NULL,NULL,'2025-12-09 00:21:42',1),(48,48,1,'aprobada','Versión inicial',4,'Huevo con cebollino',NULL,NULL,'2025-12-09 00:21:42',1),(49,49,1,'aprobada','Versión inicial',4,'Huevo con jamón',NULL,NULL,'2025-12-09 00:21:42',1),(50,51,1,'aprobada','Versión inicial',4,'Palitos con queso',NULL,NULL,'2025-12-09 00:21:42',1),(51,52,1,'aprobada','Versión inicial',4,'Picadillo de arracache',NULL,NULL,'2025-12-09 00:21:42',1),(52,53,1,'aprobada','Versión inicial',4,'Palitos con especias',NULL,NULL,'2025-12-09 00:21:42',1),(53,54,1,'aprobada','Versión inicial',3,'Pollo frito en cuartos',NULL,NULL,'2025-12-09 00:21:42',1),(54,55,1,'aprobada','Versión inicial',4,'Plátano maduro',NULL,NULL,'2025-12-09 00:21:42',1),(55,56,1,'aprobada','Versión inicial',4,'Tostadas con miel',NULL,NULL,'2025-12-09 00:21:42',1),(56,57,1,'aprobada','Versión inicial',4,'Tostada con jalea',NULL,NULL,'2025-12-09 00:21:42',1),(57,58,1,'aprobada','Versión inicial',4,'Arepas de banano',NULL,NULL,'2025-12-09 00:21:42',1),(58,59,1,'aprobada','Versión inicial',4,'Chorreada',NULL,NULL,'2025-12-09 00:21:42',1),(59,60,1,'aprobada','Versión inicial',4,'Cereal con leche',NULL,NULL,'2025-12-09 00:21:42',1),(60,61,1,'aprobada','Versión inicial',4,'Cereal sin leche',NULL,NULL,'2025-12-09 00:21:42',1),(61,63,1,'aprobada','Versión inicial',4,'Pan en rebanadas',NULL,NULL,'2025-12-09 00:21:42',1),(62,64,1,'aprobada','Versión inicial',7,'Porción Melón',NULL,NULL,'2025-12-09 00:21:42',1),(63,65,1,'aprobada','Versión inicial',7,'Porción de papaya',NULL,NULL,'2025-12-09 00:21:42',1),(64,66,1,'aprobada','Versión inicial',7,'Porción de piña',NULL,NULL,'2025-12-09 00:21:42',1),(65,67,1,'aprobada','Versión inicial',7,'Porción de sandía',NULL,NULL,'2025-12-09 00:21:42',1),(66,68,1,'aprobada','Versión inicial',8,'Pico de Gallo',NULL,NULL,'2025-12-09 00:21:42',1),(67,69,1,'aprobada','Versión inicial',8,'Ensalada Carta blanca',NULL,NULL,'2025-12-09 00:21:42',1),(68,70,1,'aprobada','Versión inicial',8,'Ensalada Caracolitos con olores',NULL,NULL,'2025-12-09 00:21:42',1),(69,71,1,'aprobada','Versión inicial',8,'Ensalada Costa Rica',NULL,NULL,'2025-12-09 00:21:42',1),(70,72,1,'aprobada','Versión inicial',8,'Ensalada China',NULL,NULL,'2025-12-09 00:21:42',1),(71,73,1,'aprobada','Versión inicial',8,'Ensalada Caracolitos con atún','1. Cocinar la pasta en agua hirviendo con un poquito de sal, hasta que esté al dente, dejar enfriar.\n2. Lavar, picar los olores y tener listos para adicionar a la pasta con el atún.\n3. Mezclar la pasta con olores, mayonesa y el atún.\n4. Sazonar con sal y pimienta, y probar antes de servir.\n5. Servir en frío.',NULL,'2025-12-09 00:21:42',1),(72,74,1,'aprobada','Versión inicial',8,'Ensalada de Lechuga y tomate',NULL,NULL,'2025-12-09 00:21:42',1),(73,75,1,'aprobada','Versión inicial',8,'Multicolor',NULL,NULL,'2025-12-09 00:21:42',1),(74,76,1,'aprobada','Versión inicial',8,'Escabeche',NULL,NULL,'2025-12-09 00:21:42',1),(75,77,1,'aprobada','Versión inicial',8,'Papa con atún',NULL,NULL,'2025-12-09 00:21:42',1),(76,78,1,'aprobada','Versión inicial',8,'Primaveral','1. Lavar, pelar o picar los ingredientes.\n2. Mezclar todos los ingredientes ya procesados hasta que queden bien homogéneos.\n3. Agregar jugo de limón, sal y pimienta. Probar antes de servir.',NULL,'2025-12-09 00:21:42',1),(77,79,1,'aprobada','Versión inicial',8,'Repollo, tomate y culantro','1. Lavar, desinfectar y procesar los vegetales.\n2. Mezclar repollo, tomate, culantro y adicionar limón.\n3. Sazonar con sal y pimienta, y probar antes de servir en tacitas.',NULL,'2025-12-09 00:21:42',1),(78,80,1,'aprobada','Versión inicial',8,'Salpicón de pepino',NULL,NULL,'2025-12-09 00:21:42',1),(79,81,1,'aprobada','Versión inicial',8,'Tricolor',NULL,NULL,'2025-12-09 00:21:42',1),(80,82,1,'aprobada','Versión inicial',7,'Banano',NULL,NULL,'2025-12-09 00:21:42',1),(81,83,1,'aprobada','Versión inicial',8,'Ensalada Mixta Natural',NULL,NULL,'2025-12-09 00:21:42',1),(82,84,1,'aprobada','Versión inicial',3,'Alita de pollo frita',NULL,NULL,'2025-12-09 00:21:42',1),(83,85,1,'aprobada','Versión inicial',3,'Chop suey seco con pollo',NULL,NULL,'2025-12-09 00:21:42',1),(84,86,1,'aprobada','Versión inicial',3,'Cuarto de pollo con salsa Caribeña',NULL,NULL,'2025-12-09 00:21:42',1),(85,87,1,'aprobada','Versión inicial',3,'Frijoles blancos con pollo',NULL,NULL,'2025-12-09 00:21:42',1),(86,88,1,'aprobada','Versión inicial',3,'Muslo de pollo deshuesado a la plancha',NULL,NULL,'2025-12-09 00:21:42',1),(87,89,1,'aprobada','Versión inicial',3,'Muslo deshuesado con salsa naranja',NULL,NULL,'2025-12-09 00:21:42',1),(88,90,1,'aprobada','Versión inicial',3,'Muslo deshuesado al ajillo',NULL,NULL,'2025-12-09 00:21:42',1),(89,91,1,'aprobada','Versión inicial',3,'Pollo a la antonieta',NULL,NULL,'2025-12-09 00:21:42',1),(90,92,1,'aprobada','Versión inicial',3,'Pollo a la stroganoff',NULL,NULL,'2025-12-09 00:21:42',1),(91,93,1,'aprobada','Versión inicial',3,'Pollo Costra Mostaza',NULL,NULL,'2025-12-09 00:21:42',1),(92,94,1,'aprobada','Versión inicial',3,'Espagueti con pollo en Salsa blanca',NULL,NULL,'2025-12-09 00:21:42',1),(93,95,1,'aprobada','Versión inicial',3,'Vegetales Salteados con pollo',NULL,NULL,'2025-12-09 00:21:42',1),(94,96,1,'aprobada','Versión inicial',9,'Suave de pescado',NULL,NULL,'2025-12-09 00:21:42',1),(95,97,1,'aprobada','Versión inicial',9,'Arroz con atún',NULL,NULL,'2025-12-09 00:21:42',1),(96,98,1,'aprobada','Versión inicial',9,'Arroz con mariscos',NULL,NULL,'2025-12-09 00:21:42',1),(97,99,1,'aprobada','Versión inicial',9,'Arroz con camarones',NULL,NULL,'2025-12-09 00:21:42',1),(98,100,1,'aprobada','Versión inicial',9,'Pescado a la Meuniere',NULL,NULL,'2025-12-09 00:21:42',1),(99,101,1,'aprobada','Versión inicial',9,'Pescado al horno y olores',NULL,NULL,'2025-12-09 00:21:42',1),(100,102,1,'aprobada','Versión inicial',9,'Espagueti con salsa, queso y atún',NULL,NULL,'2025-12-09 00:21:42',1),(101,103,1,'aprobada','Versión inicial',9,'Suflé de atún',NULL,NULL,'2025-12-09 00:21:42',1),(102,104,1,'aprobada','Versión inicial',9,'Tilapia al horno',NULL,NULL,'2025-12-09 00:21:42',1),(103,105,1,'aprobada','Versión inicial',6,'Molde de carne','1. En un sartén pero sin calor, mezclar mitad de carne de res y mitad de cerdo. Remover para ir soltando la carne, agregar huevos, Salsa Lizano, tomate, chile, cebolla, ajo, maíz, pimienta negra, consomés y al final la harina.\n2. Hacer una torta de prueba para evaluar el sabor y corregir si es necesario.\n3. Alistar las bandejas de 1/4 pequeña con 2 palas metálicas (la pequeña), aplanar y cubrir toda la bandeja hasta la mitad (10 bandejas para llenar el carro del Rational).\n4. Precalentar el Rational en modo \"carne en masa\", a 80°C con dorado (más del medio) durante aproximadamente 30 minutos, hasta asegurarse de que se alcance los 80°C. Colocar la sonda.\n5. Sacar el carro y precalentar el Rational en modo \"dorado final\" por 5 minutos (en dorado más del medio). Al sonar, introducir el carro para completar el dorado.\n6. Porcionar en 18 porciones (3x6).',18,'2025-12-09 00:21:42',1),(104,106,1,'aprobada','Versión inicial',6,'Ternero a la crema',NULL,NULL,'2025-12-09 00:21:42',1),(105,107,1,'aprobada','Versión inicial',6,'Arroz con carne',NULL,NULL,'2025-12-09 00:21:42',1),(106,108,1,'aprobada','Versión inicial',6,'Carne China',NULL,NULL,'2025-12-09 00:21:42',1),(107,109,1,'aprobada','Versión inicial',6,'Papas con carne',NULL,NULL,'2025-12-09 00:21:42',1),(108,110,1,'aprobada','Versión inicial',6,'Carne estilo oriental',NULL,NULL,'2025-12-09 00:21:42',1),(109,111,1,'aprobada','Versión inicial',6,'Carne sudada',NULL,NULL,'2025-12-09 00:21:42',1),(110,112,1,'aprobada','Versión inicial',6,'Cubitos de res en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(111,113,1,'aprobada','Versión inicial',6,'Cubitos de res con hongos',NULL,NULL,'2025-12-09 00:21:42',1),(112,114,1,'aprobada','Versión inicial',6,'Espagueti a la boloñesa','1. Sofreír 5 ingredientes (olores), harina, pasta. Agregar tomate licuado y darle cocción hasta que hierva.\n2. Añadir 1 kg de azúcar o menos para bajar la acidez, sal, pimienta, ajo en polvo, consomé de res. Añadir la carne molida.',NULL,'2025-12-09 00:21:42',1),(113,115,1,'aprobada','Versión inicial',6,'Estofado de Carne',NULL,NULL,'2025-12-09 00:21:42',1),(114,116,1,'aprobada','Versión inicial',6,'Ternero en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(115,117,1,'aprobada','Versión inicial',10,'Crema de espinacas',NULL,NULL,'2025-12-09 00:21:42',1),(116,118,1,'aprobada','Versión inicial',10,'Picadillo de chayote con maíz',NULL,NULL,'2025-12-09 00:21:42',1),(117,119,1,'aprobada','Versión inicial',10,'Picadillo de Chayote','1. Cocinar el chayote en el Rational por 20 minutos en modo vegetales al vapor.\n2. Derretir 5 barras de margarina con achiote y sofreír el chile y la cebolla hasta cristalizar.\n3. Añadir sal, consomé, ajo, pimienta negra y salsa inglesa. Mover por 2 minutos con la temperatura al máximo (400°C).\n4. Bajar a 300°C y añadir el chayote y el perejil. Mezclar hasta que quede homogéneo durante 5 minutos y luego retirar.',NULL,'2025-12-09 00:21:42',1),(118,120,1,'aprobada','Versión inicial',10,'Berenjena con tomate y queso',NULL,NULL,'2025-12-09 00:21:42',1),(119,121,1,'aprobada','Versión inicial',10,'Brócoli con maíz',NULL,NULL,'2025-12-09 00:21:42',1),(120,122,1,'aprobada','Versión inicial',10,'Brócoli con coliflor','1. Calentar aceite, derretir margarina, aceite de ajo. Sofreír ajo, cebolla y chile dulce. Agregar la harina y formar un roux.\n2. Agregar un caldo de verdura, agua o leche al roux y darle el punto de textura.\n3. Pre-cocinar el brócoli y coliflor por 15 minutos en el Rational en modo vapor.\n4. Agregar los vegetales al roux, mezclar y rectificar la sazón.',NULL,'2025-12-09 00:21:42',1),(121,123,1,'aprobada','Versión inicial',10,'Cazuela de hortalizas',NULL,NULL,'2025-12-09 00:21:42',1),(122,124,1,'aprobada','Versión inicial',10,'Crema de brócoli',NULL,NULL,'2025-12-09 00:21:42',1),(123,125,1,'aprobada','Versión inicial',10,'Picadillo de papa con zanahoria',NULL,NULL,'2025-12-09 00:21:42',1),(124,126,1,'aprobada','Versión inicial',10,'Vainica y zanahoria',NULL,NULL,'2025-12-09 00:21:42',1),(125,127,1,'aprobada','Versión inicial',10,'Picadillo de plátano verde',NULL,NULL,'2025-12-09 00:21:42',1),(126,128,1,'aprobada','Versión inicial',10,'Zanahoria glaseada',NULL,NULL,'2025-12-09 00:21:42',1),(127,129,1,'aprobada','Versión inicial',10,'Picadillo de papaya verde',NULL,NULL,'2025-12-09 00:21:42',1),(128,130,1,'aprobada','Versión inicial',10,'Zucchini y maíz dulce',NULL,NULL,'2025-12-09 00:21:42',1),(129,131,1,'aprobada','Versión inicial',10,'Zucchini con maíz dulce',NULL,NULL,'2025-12-09 00:21:42',1),(130,132,1,'aprobada','Versión inicial',10,'Verduritas en salsa china',NULL,NULL,'2025-12-09 00:21:42',1),(131,133,1,'aprobada','Versión inicial',10,'Vegetales al ajillo',NULL,NULL,'2025-12-09 00:21:42',1),(132,134,1,'aprobada','Versión inicial',10,'Vainica con coliflor con salsa',NULL,NULL,'2025-12-09 00:21:42',1),(133,135,1,'aprobada','Versión inicial',10,'Picadillo de papa, vainica y zanahoria','1. Lavar y procesar los vegetales.\n2. Hacer un precocinado de los vegetales en el Rational al vapor.\n3. Agregar aceite de ajo al sartén, adicionar vegetales y condimentar al gusto.\n4. Mezclar y probar el platillo antes de sacarlo a la barra de atención.',NULL,'2025-12-09 00:21:42',1),(134,136,1,'aprobada','Versión inicial',10,'Coliflor salteada','1. Cocinar Coliflor en Rational por 15 minutos en función vapor.\n2. Sofreír en aceite, margarina, chile, y cebolla. Agregar sal, ajo, pimienta. Dejar sofreír bien y añadir 1 L de agua.\n3. Agregar coliflor y mezclar bien. Dejar 10 minutos de reposo y servir.',NULL,'2025-12-09 00:21:42',1),(135,137,1,'aprobada','Versión inicial',10,'Crema de ayote sazón',NULL,NULL,'2025-12-09 00:21:42',1),(136,138,1,'aprobada','Versión inicial',10,'Guiso de ayote tierno en leche',NULL,NULL,'2025-12-09 00:21:42',1),(137,139,1,'aprobada','Versión inicial',10,'Guiso de ayote tierno',NULL,NULL,'2025-12-09 00:21:42',1),(138,140,1,'aprobada','Versión inicial',8,'Ensalada Alemana',NULL,NULL,'2025-12-09 00:21:42',1),(139,141,1,'aprobada','Versión inicial',8,'Ceviche de plátano',NULL,NULL,'2025-12-09 00:21:42',1),(140,142,1,'aprobada','Versión inicial',9,'Tilapia en Salsa Tártara',NULL,NULL,'2025-12-09 00:21:42',1),(141,143,1,'aprobada','Versión inicial',9,'Pasta con camarones','Salsa Criolla: Llevar los \"fondos\" del tomate con el chile dulce, la cebolla, el ajo, el tomillo, el orégano, el laurel y reservar.\nCocinar la pasta: Llenar sartén a 3/4 con 0.5 kg de sal y 3 L de aceite. Dejar hervir y agregar 20 kg de pasta.\nSofrito: Blanquear el camarón (sumergir en agua hirviendo con consomé de marisco hasta que cambie de color). Sacar en 10 a 15 minutos.\nEn aceite de ajo y margarina con laurel, sofreír cebolla y chile para perfumar más la salsa criolla. Agregar camarones, la pasta corta suelta y rectificar sabor.\nAl final, agregar cebollino.',NULL,'2025-12-09 00:21:42',1),(142,144,1,'aprobada','Versión inicial',2,'Chuleta ahumada hawaiana',NULL,NULL,'2025-12-09 00:21:42',1),(143,145,1,'aprobada','Versión inicial',6,'Lomo saltado',NULL,NULL,'2025-12-09 00:21:42',1),(144,146,1,'aprobada','Versión inicial',6,'Carne Diana',NULL,NULL,'2025-12-09 00:21:42',1),(145,147,1,'aprobada','Versión inicial',6,'Pasta con brócoli y jamón',NULL,NULL,'2025-12-09 00:21:42',1),(146,148,1,'aprobada','Versión inicial',6,'Chop Suey mixto',NULL,NULL,'2025-12-09 00:21:42',1),(147,149,1,'aprobada','Versión inicial',6,'Carne con papa y yuca',NULL,NULL,'2025-12-09 00:21:42',1),(148,150,1,'aprobada','Versión inicial',6,'Carne con papas',NULL,NULL,'2025-12-09 00:21:42',1),(149,151,1,'aprobada','Versión inicial',6,'Papas con chorizo',NULL,NULL,'2025-12-09 00:21:42',1),(150,152,1,'aprobada','Versión inicial',3,'Pollo achiotado',NULL,NULL,'2025-12-09 00:21:42',1),(151,153,1,'aprobada','Versión inicial',3,'Muslo de pollo deshuesado a la mostaza',NULL,NULL,'2025-12-09 00:21:42',1),(152,154,1,'aprobada','Versión inicial',3,'Muslito de pollo frito','1. Marinar el día anterior con sal, marinador, ajo, pimienta y agua hasta cubrir (2 a 2.5 baldes).\n2. Escurrir el pollo y pasarlo por el empanizador.\n3. Freír 20 piezas por canasta durante 20 minutos a 180°C.',NULL,'2025-12-09 00:21:42',1),(153,155,1,'aprobada','Versión inicial',3,'Muslito de pollo agridulce',NULL,NULL,'2025-12-09 00:21:42',1),(154,156,1,'aprobada','Versión inicial',3,'Muslito de pollo cacciatore',NULL,NULL,'2025-12-09 00:21:42',1),(155,157,1,'aprobada','Versión inicial',3,'Pollo escabechado',NULL,NULL,'2025-12-09 00:21:42',1),(156,158,1,'aprobada','Versión inicial',6,'Cubitos de res en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(157,159,1,'aprobada','Versión inicial',10,'Sopa negra con huevo','1. Lavar y procesar tomates con los demás olores.\n2. Cocinar los frijoles, agregar sal al final.\n3. Licuar los frijoles con los olores.\n4. Colocar la mezcla anterior en cocción hasta hervir y adicionar el tomate troceado en cubitos pequeños.\n5. Agregar los huevos crudos uno a uno en la mezcla anterior.\n6. Sazonar con sal y pimienta, y rectificar sabor con especias.\n7. Al final, agregar culantro picado para servir.',NULL,'2025-12-09 00:21:42',1),(158,160,1,'aprobada','Versión inicial',6,'Curry de carne con vegetales',NULL,NULL,'2025-12-09 00:21:42',1),(159,161,1,'aprobada','Versión inicial',4,'Dados de queso',NULL,NULL,'2025-12-09 00:21:42',1),(160,162,1,'aprobada','Versión inicial',6,'Lentejas con res',NULL,NULL,'2025-12-09 00:21:42',1),(161,163,1,'aprobada','Versión inicial',11,'Arroz con palmito',NULL,NULL,'2025-12-09 00:21:42',1),(162,164,1,'aprobada','Versión inicial',12,'Crepas de dulce y banano',NULL,NULL,'2025-12-09 00:21:42',1),(163,165,1,'aprobada','Versión inicial',2,'Garbanzos con cerdo',NULL,NULL,'2025-12-09 00:21:42',1),(164,166,1,'aprobada','Versión inicial',12,'Yuca frita',NULL,NULL,'2025-12-09 00:21:42',1),(165,167,1,'aprobada','Versión inicial',11,'Pasta con pesto',NULL,NULL,'2025-12-09 00:21:42',1),(166,168,1,'aprobada','Versión inicial',10,'Suflé de espinaca',NULL,NULL,'2025-12-09 00:21:42',1),(167,169,1,'aprobada','Versión inicial',4,'Arepas con miel (Premezcla)',NULL,NULL,'2025-12-09 00:21:42',1),(168,170,1,'aprobada','Versión inicial',4,'Gallo Pinto 2020','1. Agregar el aceite al sartén reclinable, sofreír el chile y la cebolla picados hasta cristalizar.\n2. Añadir las bandejas de frijoles, luego el consomé de pollo, la pimienta, el ajo en polvo y la salsa inglesa. Dejar que se cocinen bien hasta que hiervan y se sequen los frijoles.\n3. Adicionar las costras de arroz y el arroz blanco e inmediatamente el culantro picado. Mezclar bien y dejar secar a 300°C.',NULL,'2025-12-09 00:21:42',1),(169,171,1,'aprobada','Versión inicial',4,'Torta de huevo con olores',NULL,NULL,'2025-12-09 00:21:42',1),(170,172,1,'aprobada','Versión inicial',10,'Brócoli con maíz 2020',NULL,NULL,'2025-12-09 00:21:42',1),(171,173,1,'aprobada','Versión inicial',11,'Pasta con vegetales',NULL,NULL,'2025-12-09 00:21:42',1),(172,174,1,'aprobada','Versión inicial',11,'Pasta con vegetales',NULL,NULL,'2025-12-09 00:21:42',1),(173,175,1,'aprobada','Versión inicial',11,'Lentejas con ayote',NULL,NULL,'2025-12-09 00:21:42',1),(174,176,1,'aprobada','Versión inicial',11,'Pastel de palmito',NULL,NULL,'2025-12-09 00:21:42',1),(175,177,1,'aprobada','Versión inicial',11,'Pasta con salsa blanca',NULL,NULL,'2025-12-09 00:21:42',1),(176,178,1,'aprobada','Versión inicial',11,'Tortilla de espinaca y hongos',NULL,NULL,'2025-12-09 00:21:42',1),(177,179,1,'aprobada','Versión inicial',11,'Arroz con verduras',NULL,NULL,'2025-12-09 00:21:42',1),(178,180,1,'aprobada','Versión inicial',11,'Lentejas con zanahorias y vainica',NULL,NULL,'2025-12-09 00:21:42',1),(179,181,1,'aprobada','Versión inicial',11,'Risotto de zapallo',NULL,NULL,'2025-12-09 00:21:42',1),(180,182,1,'aprobada','Versión inicial',11,'Sopa Minestrone',NULL,NULL,'2025-12-09 00:21:42',1),(181,183,1,'aprobada','Versión inicial',11,'Paella de verduras',NULL,NULL,'2025-12-09 00:21:42',1),(182,184,1,'aprobada','Versión inicial',11,'Pasta con vegetales y salsa de piña',NULL,NULL,'2025-12-09 00:21:42',1),(183,185,1,'aprobada','Versión inicial',11,'Sopa de Garbanzos',NULL,NULL,'2025-12-09 00:21:42',1),(184,186,1,'aprobada','Versión inicial',11,'Arroz con lentejas',NULL,NULL,'2025-12-09 00:21:42',1),(185,187,1,'aprobada','Versión inicial',11,'Garbanzos en salsa de tomate',NULL,NULL,'2025-12-09 00:21:42',1),(186,188,1,'aprobada','Versión inicial',11,'Pasta Napolitana',NULL,NULL,'2025-12-09 00:21:42',1),(187,189,1,'aprobada','Versión inicial',1,'Batido Verde',NULL,NULL,'2025-12-09 00:21:42',1),(188,190,1,'aprobada','Versión inicial',13,'Emparedado de Pollo',NULL,NULL,'2025-12-09 00:21:42',1),(189,191,1,'aprobada','Versión inicial',9,'Barquitos de Zucchini',NULL,NULL,'2025-12-09 00:21:42',1),(190,192,1,'aprobada','Versión inicial',6,'Lasaña de Carne',NULL,NULL,'2025-12-09 00:21:42',1),(191,193,1,'aprobada','Versión inicial',13,'Emparedado de Aguacate',NULL,NULL,'2025-12-09 00:21:42',1),(192,194,1,'aprobada','Versión inicial',6,'Canelones de carne y queso',NULL,NULL,'2025-12-09 00:21:42',1),(193,195,1,'aprobada','Versión inicial',11,'Salsa de tomate natural',NULL,NULL,'2025-12-09 00:21:42',1),(194,196,1,'aprobada','Versión inicial',6,'Mondongo en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(195,197,1,'aprobada','Versión inicial',13,'Emparedado de Jamón',NULL,NULL,'2025-12-09 00:21:42',1),(196,198,1,'aprobada','Versión inicial',13,'Salsa rosada',NULL,NULL,'2025-12-09 00:21:42',1),(197,199,1,'aprobada','Versión inicial',8,'Ensalada campesina','1. Antes de procesar la materia prima, revisar detenidamente el estado en que se encuentren los productos.\n2. Seguidamente, lavar y desinfectar.\n3. Procesar el repollo blanco y picarlo finamente, al igual que el repollo morado. Procesar el tomate en cuadros, la cebolla en Brunoise, el culantro fino y los chiles dulces en tiras Brunoise. Exprimir los limones para obtener su jugo.\n4. Agregar sal al gusto.',NULL,'2025-12-09 00:21:42',1),(198,200,1,'aprobada','Versión inicial',8,'Ensalada de Lechuga y Manzana',NULL,NULL,'2025-12-09 00:21:42',1),(199,201,1,'aprobada','Versión inicial',8,'Ensalada Pico de Gallo',NULL,NULL,'2025-12-09 00:21:42',1),(200,202,1,'aprobada','Versión inicial',8,'Repollo con piña','1. Revisar el producto antes de lavar y procesar.\n2. Lavar y desinfectar los alimentos antes de procesar.\n3. Procesar los alimentos: repollo picado finamente y blanquear para quitarle dureza y gases.\n4. Piña en cuadritos, cebolla en agua de azúcar o vinagre para suavizar, y cortada en julianas muy delgadas.\n5. Agregar azúcar, sal y mayonesa al gusto.',NULL,'2025-12-09 00:21:42',1),(201,203,1,'aprobada','Versión inicial',8,'Ensalada Otoño',NULL,NULL,'2025-12-09 00:21:42',1),(202,204,1,'aprobada','Versión inicial',8,'Ensalada rusa','1. Revisar que el producto esté en buen estado.\n2. Lavar y desinfectar.\n3. Procesar y luego cocinar papa, huevos y remolacha.\n4. Procesar ingredientes cocinados en cuadritos.\n5. Incorporar todos los ingredientes, agregar mayonesa, sal y pimienta al gusto.',NULL,'2025-12-09 00:21:42',1),(203,205,1,'aprobada','Versión inicial',13,'Emparedado de Atún',NULL,NULL,'2025-12-09 00:21:42',1),(204,206,1,'aprobada','Versión inicial',8,'Ensalada Taras','1. Revisar que el producto se encuentre en óptimas condiciones.\n2. Lavar y desinfectar la materia prima.\n3. Procesar el repollo blanco picado finamente, el tomate en cuadros, la cebolla morada en cuadros finos o julianas. Picar el culantro finamente, exprimir los limones. Agregar sal y pimienta al gusto.\n4. Incorporar todos los ingredientes, dependiendo de la técnica que se utilice con el repollo para que no pierda el líquido. Revolver y probar el gusto con nutricionista.',NULL,'2025-12-09 00:21:42',1),(205,207,1,'aprobada','Versión inicial',8,'Ceviche de Mango 2020',NULL,NULL,'2025-12-09 00:21:42',1),(206,208,1,'aprobada','Versión inicial',8,'Ensalada Julio','1. Antes de procesar, revise el producto.\n2. Lavar la materia prima con el sanitizante.\n3. Procesar en cuadros pequeños el tomate, pepino, mango, apio, cebolla. Exprimir los limones, agregar agua, azúcar, sal y pimienta al gusto.',NULL,'2025-12-09 00:21:42',1),(207,209,1,'aprobada','Versión inicial',8,'Ensalada 31 de Julio','1. Lechuga deshojada, lavada y picada.\n2. Zanahoria pelada, rallada o en rodajas.\n3. Rábano picado o en rodajas.\nAderezo: Agregar mostaza, azúcar y limones en un tazón. Mezclar todos los ingredientes y agregar a la ensalada.',NULL,'2025-12-09 00:21:42',1),(208,210,1,'aprobada','Versión inicial',12,'Pan de Elote',NULL,NULL,'2025-12-09 00:21:42',1),(209,211,1,'aprobada','Versión inicial',12,'Tamal de Maicena',NULL,NULL,'2025-12-09 00:21:42',1),(210,213,1,'aprobada','Versión inicial',5,'Arroz Rational hervido',NULL,NULL,'2025-12-09 00:21:42',1),(211,214,1,'aprobada','Versión inicial',4,'Torta de Plátano',NULL,NULL,'2025-12-09 00:21:42',1),(212,215,1,'aprobada','Versión inicial',8,'Ensalada Rosa',NULL,NULL,'2025-12-09 00:21:42',1),(213,216,1,'aprobada','Versión inicial',8,'Ensalada de Otoño','1. Revisar producto, lavar y desinfectar como es debido.\n2. Procesar el tomate en gajos. Rallar o cortar el queso en cuadros para adornar por encima. Picar o rallar el repollo. Alfalfa para adornar y sal al gusto.',NULL,'2025-12-09 00:21:42',1),(214,217,1,'aprobada','Versión inicial',8,'Ensalada Criolla',NULL,NULL,'2025-12-09 00:21:42',1),(215,218,1,'aprobada','Versión inicial',8,'Repollo, piña y hongos',NULL,NULL,'2025-12-09 00:21:42',1),(216,219,1,'aprobada','Versión inicial',8,'Vinagreta de Pepino',NULL,NULL,'2025-12-09 00:21:42',1),(217,220,1,'aprobada','Versión inicial',8,'Pasta con atún',NULL,NULL,'2025-12-09 00:21:42',1),(218,221,1,'aprobada','Versión inicial',8,'Ensalada Kale',NULL,NULL,'2025-12-09 00:21:42',1),(219,222,1,'aprobada','Versión inicial',8,'Mayonesa para ensaladas','1. Colocar vinagre, huevos y sal en el frasco de la licuadora. Licuar por 30 segundos e incorporar el aceite en hilo.',NULL,'2025-12-09 00:21:42',1),(220,223,1,'aprobada','Versión inicial',8,'Ensalada K-soda',NULL,NULL,'2025-12-09 00:21:42',1),(221,224,1,'aprobada','Versión inicial',8,'Ensalada de Vainica con huevo',NULL,NULL,'2025-12-09 00:21:42',1),(222,225,1,'aprobada','Versión inicial',8,'Repollo en Escabeche',NULL,NULL,'2025-12-09 00:21:42',1),(223,226,1,'aprobada','Versión inicial',13,'Emparedado de Carne',NULL,NULL,'2025-12-09 00:21:42',1),(224,227,1,'aprobada','Versión inicial',8,'Pepino, tomate y cebolla',NULL,NULL,'2025-12-09 00:21:42',1),(225,228,1,'aprobada','Versión inicial',8,'Otoño sin repollo',NULL,NULL,'2025-12-09 00:21:42',1),(226,229,1,'aprobada','Versión inicial',3,'Pollo al ajillo (en cuartos)','1. Marinar el pollo el día anterior.\n2. Escurrir el pollo.\n3. Elaborar el aceite de especias y reservarlo para el día siguiente.\n4. Barnizar con la mezcla del aceite y olores.\n5. Colocar en parrillas 30 minutos en el Rational en modo parrilla.',NULL,'2025-12-09 00:21:42',1),(227,230,1,'aprobada','Versión inicial',8,'Ceviche de plátano 2020',NULL,NULL,'2025-12-09 00:21:42',1),(228,231,1,'aprobada','Versión inicial',8,'Ensalada Kale y olores',NULL,NULL,'2025-12-09 00:21:42',1),(229,232,1,'aprobada','Versión inicial',13,'Emparedado de Frijol y Queso Amarillo',NULL,NULL,'2025-12-09 00:21:42',1),(230,233,1,'aprobada','Versión inicial',13,'Emparedado Choripán',NULL,NULL,'2025-12-09 00:21:42',1),(231,234,1,'aprobada','Versión inicial',4,'Tortas de yuca',NULL,NULL,'2025-12-09 00:21:42',1),(232,235,1,'aprobada','Versión inicial',6,'Lomo Fingido',NULL,NULL,'2025-12-09 00:21:42',1),(233,236,1,'aprobada','Versión inicial',13,'Emparedado de Salchichón',NULL,NULL,'2025-12-09 00:21:42',1),(234,237,1,'aprobada','Versión inicial',13,'Emparedado de Torta de Huevo',NULL,NULL,'2025-12-09 00:21:42',1),(235,238,1,'aprobada','Versión inicial',9,'Pastel de atún y papa 21',NULL,NULL,'2025-12-09 00:21:42',1),(236,239,1,'aprobada','Versión inicial',14,'Cheesecake tricolor','1. Disolver la gelatina (medida para cada paquete) en 3 L de agua hirviendo y 0.5 L de agua fría. Refrigerar por 2 horas. Cortar los dos colores de gelatina en cuadritos y reservarlos en una bandeja.\n2. Colocar 5 cucharadas de gelatina Dietex en una taza con agua fría y reservar.\n3. Licuar crema dulce, queso crema y leche condensada.\n4. Calentar el Dietex en el microondas por un minuto o hasta que esté líquido, y agregarlo al licuado.\n5. Agregar esta mezcla sobre los cuadritos de gelatina de colores y refrigerar por 12 horas.\n6. Porcionar y servir.',NULL,'2025-12-09 00:21:42',1),(237,240,1,'aprobada','Versión inicial',12,'Tamal de Vitamaíz','1. Poner a hervir la leche con el azúcar.\n2. Licuar huevos, un poquito de leche (1/2 taza), Vitamaíz, leche condensada y canela en polvo.\n3. Cuando la leche esté hirviendo, agregar lo licuado y mezclar sin detenerse hasta que vuelva a hervir.\n4. Luego de hervir, retirar del fuego, agregar la mantequilla y el coco (opcional) y mezclar bien. Colocar en bandeja.\n5. Hornear a fuego lento por 1 hora o hasta que dore.',NULL,'2025-12-09 00:21:42',1),(238,241,1,'aprobada','Versión inicial',12,'Queque Veteado','1. En la batidora, mezclar todos los ingredientes de vainilla y luego los de chocolate por separado por 5 minutos.\n2. Colocar en la bandeja primero la mezcla de vainilla y encima la de chocolate. Con un tenedor, apenas mezclar un poquito y hornear.',NULL,'2025-12-09 00:21:42',1),(239,242,1,'aprobada','Versión inicial',14,'Tres leches','1. Tamizar la harina junto con el polvo de hornear y reservar.\n2. Separar las claras de las yemas de huevo.\n3. Batir las claras a punto de nieve. Cuando estén, agregar las yemas una a una y luego el azúcar en forma de lluvia.\n4. Retirar de la batidora y agregar los polvos previamente cernidos en forma envolvente.\n5. Agregar en bandeja y hornear.\n6. Cuando aún esté caliente, punzar con el tenedor y agregar la mezcla de leches. Refrigerar 12 horas.\n7. Luego de este tiempo, decorar con Chantilly.\nMezcla de leches: Licuar leche condensada, leche evaporada, crema dulce y leche.\nChantilly: 12 horas antes, refrigerar 1 L de crema dulce bien fría. Agregar a la batidora y cuando esté en forma de picos, añadir poco a poco azúcar al gusto y vainilla si se desea. Luego decorar.',NULL,'2025-12-09 00:21:42',1),(240,243,1,'aprobada','Versión inicial',9,'Cordon Bleu de Atún',NULL,NULL,'2025-12-09 00:21:42',1),(241,244,1,'aprobada','Versión inicial',13,'Emparedado de Espinaca y Aguacate',NULL,NULL,'2025-12-09 00:21:42',1),(242,245,1,'aprobada','Versión inicial',6,'Pastel de Zucchini',NULL,NULL,'2025-12-09 00:21:42',1),(243,246,1,'aprobada','Versión inicial',6,'Lasaña de Berenjena y carne',NULL,NULL,'2025-12-09 00:21:42',1),(244,247,1,'aprobada','Versión inicial',3,'Pollo con zucchini y zanahoria',NULL,NULL,'2025-12-09 00:21:42',1),(245,248,1,'aprobada','Versión inicial',8,'Ensalada de lechuga variada',NULL,NULL,'2025-12-09 00:21:42',1),(246,249,1,'aprobada','Versión inicial',8,'Ensalada de Lechuga y palmito',NULL,NULL,'2025-12-09 00:21:42',1),(247,250,1,'aprobada','Versión inicial',8,'Tomate, Zanahoria, Repollo y Mayonesa','Lechuga procesada en cama o integrada. Palmito en trozos. Culantro finamente picado. Mayonesa puede ser integrada con todos los ingredientes o al finalizar la preparación.',NULL,'2025-12-09 00:21:42',1),(248,251,1,'aprobada','Versión inicial',12,'Pancito de queso','1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar el queso, la natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n3. Hacer bolitas de pan de 100 g en una bandeja engrasada con spray y enharinada.\n4. Llevar al horno por 45 minutos, aproximadamente a 350°C.',NULL,'2025-12-09 00:21:42',1),(249,252,1,'aprobada','Versión inicial',12,'Pancito con especies','1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Agregar cebolla, chile, culantro, etc., picado finamente.\n3. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n4. Hacer bolitas de la masa de 100 g en una bandeja engrasada con spray y harina.\n5. Llevar al horno por 45 minutos, aproximadamente a 350°C.',NULL,'2025-12-09 00:21:42',1),(250,253,1,'aprobada','Versión inicial',8,'Ensalada Mixta Casera',NULL,NULL,'2025-12-09 00:21:42',1),(251,254,1,'aprobada','Versión inicial',6,'Sofrito de ternero',NULL,NULL,'2025-12-09 00:21:42',1),(252,255,1,'aprobada','Versión inicial',13,'Emparedado de frijol y Queso Blanco',NULL,NULL,'2025-12-09 00:21:42',1),(253,256,1,'aprobada','Versión inicial',12,'Empanadas de frijol',NULL,NULL,'2025-12-09 00:21:42',1),(254,257,1,'aprobada','Versión inicial',12,'Queque de zanahoria',NULL,NULL,'2025-12-09 00:21:42',1),(255,258,1,'aprobada','Versión inicial',12,'Hamburguesa de res',NULL,NULL,'2025-12-09 00:21:42',1),(256,259,1,'aprobada','Versión inicial',6,'Chalupa de Carne',NULL,NULL,'2025-12-09 00:21:42',1),(257,260,1,'aprobada','Versión inicial',3,'Chalupa de Pollo',NULL,NULL,'2025-12-09 00:21:42',1),(258,261,1,'aprobada','Versión inicial',6,'Frijoles blancos con chorizo',NULL,NULL,'2025-12-09 00:21:42',1),(259,262,1,'aprobada','Versión inicial',3,'Sopa Azteca',NULL,NULL,'2025-12-09 00:21:42',1),(260,263,1,'aprobada','Versión inicial',3,'Muslito de pollo a las hierbas',NULL,NULL,'2025-12-09 00:21:42',1),(261,264,1,'aprobada','Versión inicial',14,'Crema de limón con granola',NULL,NULL,'2025-12-09 00:21:42',1),(262,265,1,'aprobada','Versión inicial',6,'Sopa de Mondongo',NULL,NULL,'2025-12-09 00:21:42',1),(263,266,1,'aprobada','Versión inicial',14,'Cajetas de Leche Pinito y maní',NULL,NULL,'2025-12-09 00:21:42',1),(264,267,1,'aprobada','Versión inicial',9,'Ceviche de Pescado',NULL,NULL,'2025-12-09 00:21:42',1),(265,268,1,'aprobada','Versión inicial',12,'Tamal Dulce con coco',NULL,NULL,'2025-12-09 00:21:42',1),(266,269,1,'aprobada','Versión inicial',1,'Horchata',NULL,NULL,'2025-12-09 00:21:42',1),(267,270,1,'aprobada','Versión inicial',1,'Agua de sapo',NULL,NULL,'2025-12-09 00:21:42',1),(268,271,1,'aprobada','Versión inicial',1,'Zanahoria con limón',NULL,NULL,'2025-12-09 00:21:42',1),(269,272,1,'aprobada','Versión inicial',3,'Garbanzos con pollo',NULL,NULL,'2025-12-09 00:21:42',1),(270,273,1,'aprobada','Versión inicial',11,'Pasta a la primavera',NULL,NULL,'2025-12-09 00:21:42',1),(271,274,1,'aprobada','Versión inicial',3,'Cuartos de pollo BBQ',NULL,NULL,'2025-12-09 00:21:42',1),(272,275,1,'aprobada','Versión inicial',12,'Costilla de Jalea',NULL,NULL,'2025-12-09 00:21:42',1),(273,276,1,'aprobada','Versión inicial',2,'Arroz con cerdo',NULL,NULL,'2025-12-09 00:21:42',1),(274,277,1,'aprobada','Versión inicial',6,'Espagueti Supremo',NULL,NULL,'2025-12-09 00:21:42',1),(275,278,1,'aprobada','Versión inicial',9,'Pescado Napolitano',NULL,NULL,'2025-12-09 00:21:42',1),(276,279,1,'aprobada','Versión inicial',2,'Cerdo en salsa BBQ','1. Adobar el cerdo con aceite de ajo, sal, ajo en polvo, pimienta y clavo de olor.\n2. Cocinar cerdo al Rational en modo plancha por 20 minutos por tanda, bandeja no muy cargada para cocción uniforme.\n3. Sofreír el chile y la cebolla en el sartén volteable con aceite y margarina. Reservar unos minutos.\n4. En el mismo sartén, elaborar el roux: añadir aceite y margarina y agregar la harina hasta crear una pasta homogénea a temp 250°C. Después, agregar líquido base BBQ y Salsa T. BBQ (agua o caldo) para darle su punto deseado.\n5. Agregar al cerdo cocido el chile y la cebolla. Mezclar muy bien.',NULL,'2025-12-09 00:21:42',1),(277,281,1,'aprobada','Versión inicial',12,'Arreglados',NULL,NULL,'2025-12-09 00:21:42',1),(278,282,1,'aprobada','Versión inicial',13,'Emparedado de Queso Crema con Jalea',NULL,NULL,'2025-12-09 00:21:42',1),(279,283,1,'aprobada','Versión inicial',13,'Emparedado de Mortadela',NULL,NULL,'2025-12-09 00:21:42',1),(280,284,1,'aprobada','Versión inicial',6,'Carne molida arreglada',NULL,NULL,'2025-12-09 00:21:42',1),(281,285,1,'aprobada','Versión inicial',6,'Frijoles blancos con salchicha',NULL,NULL,'2025-12-09 00:21:42',1),(282,286,1,'aprobada','Versión inicial',6,'Sopa de carne con verduras','1. Lavar y procesar los vegetales.\n2. Cocinar la carne hasta que esté suave y luego adicionar la sal.\n3. Reservar el fondo de la carne para adicionar luego.\n4. Cocinar vegetales en el fondo oscuro. Después, adicionar la carne con los olores licuados previamente.\n5. Adicionar condimentos y especias.\n6. Rectificar sal y servir caliente.',NULL,'2025-12-09 00:21:42',1),(283,287,1,'aprobada','Versión inicial',12,'Minipizzas',NULL,NULL,'2025-12-09 00:21:42',1),(284,288,1,'aprobada','Versión inicial',10,'Crema de frijoles',NULL,NULL,'2025-12-09 00:21:42',1),(285,290,1,'aprobada','Versión inicial',4,'Tostada con margarina',NULL,NULL,'2025-12-09 00:21:42',1),(286,291,1,'aprobada','Versión inicial',2,'Chuleta al horno',NULL,NULL,'2025-12-09 00:21:42',1),(287,292,1,'aprobada','Versión inicial',12,'Cangrejos',NULL,NULL,'2025-12-09 00:21:42',1),(288,293,1,'aprobada','Versión inicial',12,'Budín',NULL,NULL,'2025-12-09 00:21:42',1),(289,294,1,'aprobada','Versión inicial',12,'Perros Calientes',NULL,NULL,'2025-12-09 00:21:42',1),(290,295,1,'aprobada','Versión inicial',8,'Ensalada Febrero 24',NULL,NULL,'2025-12-09 00:21:42',1),(291,296,1,'aprobada','Versión inicial',12,'Galleta de mantequilla',NULL,NULL,'2025-12-09 00:21:42',1),(292,297,1,'aprobada','Versión inicial',11,'Pastel de plátano maduro',NULL,NULL,'2025-12-09 00:21:42',1),(293,298,1,'aprobada','Versión inicial',9,'Mariscada',NULL,NULL,'2025-12-09 00:21:42',1),(294,299,1,'aprobada','Versión inicial',3,'Huevo ranchero',NULL,NULL,'2025-12-09 00:21:42',1),(295,300,1,'aprobada','Versión inicial',12,'Pastel de Elote',NULL,NULL,'2025-12-09 00:21:42',1),(296,301,1,'aprobada','Versión inicial',3,'Muslo de Pollo con salsa de tomate',NULL,NULL,'2025-12-09 00:21:42',1),(297,302,1,'aprobada','Versión inicial',10,'Chayote con zanahoria',NULL,NULL,'2025-12-09 00:21:42',1),(298,303,1,'aprobada','Versión inicial',3,'Alita de pollo BBQ',NULL,NULL,'2025-12-09 00:21:42',1),(299,304,1,'aprobada','Versión inicial',6,'Carne en salsa 2023',NULL,NULL,'2025-12-09 00:21:42',1),(300,305,1,'aprobada','Versión inicial',6,'Garbanzos con res',NULL,NULL,'2025-12-09 00:21:42',1),(301,306,1,'aprobada','Versión inicial',2,'Garbanzos con cerdo 2023',NULL,NULL,'2025-12-09 00:21:42',1),(302,307,1,'aprobada','Versión inicial',1,'Batido verde 2023',NULL,NULL,'2025-12-09 00:21:42',1),(303,309,1,'aprobada','Versión inicial',3,'Papas con pollo 2023',NULL,NULL,'2025-12-09 00:21:42',1),(304,310,1,'aprobada','Versión inicial',12,'Tacos con salsa verde',NULL,NULL,'2025-12-09 00:21:42',1),(305,311,1,'aprobada','Versión inicial',4,'Arepa de ayote 2023',NULL,NULL,'2025-12-09 00:21:42',1),(306,312,1,'aprobada','Versión inicial',9,'Torta de papa y pescado 2023',NULL,NULL,'2025-12-09 00:21:42',1),(307,313,1,'aprobada','Versión inicial',5,'Bandeja de Arroz 2023',NULL,NULL,'2025-12-09 00:21:42',1),(308,314,1,'aprobada','Versión inicial',5,'Bandeja de Frijol 2023',NULL,NULL,'2025-12-09 00:21:42',1),(309,315,1,'aprobada','Versión inicial',4,'Bandeja de Gallo Pinto 2023',NULL,NULL,'2025-12-09 00:21:42',1),(310,316,1,'aprobada','Versión inicial',5,'Arroz Blanco 2023',NULL,NULL,'2025-12-09 00:21:42',1),(311,317,1,'aprobada','Versión inicial',5,'Frijoles rojos 2023',NULL,NULL,'2025-12-09 00:21:42',1),(312,318,1,'aprobada','Versión inicial',4,'Gallo Pinto 2023',NULL,NULL,'2025-12-09 00:21:42',1),(313,319,1,'aprobada','Versión inicial',12,'Tostadas Italianas',NULL,NULL,'2025-12-09 00:21:42',1),(314,320,1,'aprobada','Versión inicial',10,'Papa, garbanzos, espinaca y hongos',NULL,NULL,'2025-12-09 00:21:42',1),(315,321,1,'aprobada','Versión inicial',3,'Chilasquila de pollo con Salsa de Tomate',NULL,NULL,'2025-12-09 00:21:42',1),(316,322,1,'aprobada','Versión inicial',10,'Brócoli con salsa Holandesa',NULL,NULL,'2025-12-09 00:21:42',1),(317,323,1,'aprobada','Versión inicial',6,'Chili con Carne',NULL,NULL,'2025-12-09 00:21:42',1),(318,324,1,'aprobada','Versión inicial',2,'Cerdo con verduritas 2023',NULL,NULL,'2025-12-09 00:21:42',1),(319,325,1,'aprobada','Versión inicial',3,'Lasaña de pollo 2023',NULL,NULL,'2025-12-09 00:21:42',1),(320,326,1,'aprobada','Versión inicial',14,'Cheesecake de coco',NULL,NULL,'2025-12-09 00:21:42',1),(321,327,1,'aprobada','Versión inicial',14,'Churchill Cheesecake',NULL,NULL,'2025-12-09 00:21:42',1),(322,328,1,'aprobada','Versión inicial',6,'Albóndiga en salsa de tomate',NULL,NULL,'2025-12-09 00:21:42',1),(323,329,1,'aprobada','Versión inicial',14,'Flan de coco',NULL,NULL,'2025-12-09 00:21:42',1),(324,330,1,'aprobada','Versión inicial',14,'Tamal de coco',NULL,NULL,'2025-12-09 00:21:42',1),(325,331,1,'aprobada','Versión inicial',14,'Tamal de Vitamaíz',NULL,NULL,'2025-12-09 00:21:42',1),(326,332,1,'aprobada','Versión inicial',10,'Crema de zapallo 2023',NULL,NULL,'2025-12-09 00:21:42',1),(327,333,1,'aprobada','Versión inicial',11,'Chop suey con salsa Teriyaki',NULL,NULL,'2025-12-09 00:21:42',1),(328,334,1,'aprobada','Versión inicial',6,'Chiles rellenos',NULL,NULL,'2025-12-09 00:21:42',1),(329,335,1,'aprobada','Versión inicial',6,'Torta de carne',NULL,NULL,'2025-12-09 00:21:42',1),(330,336,1,'aprobada','Versión inicial',14,'Cocadas 2023',NULL,NULL,'2025-12-09 00:21:42',1),(331,337,1,'aprobada','Versión inicial',12,'Rollos de canela',NULL,NULL,'2025-12-09 00:21:42',1),(332,338,1,'aprobada','Versión inicial',14,'Arroz con leche',NULL,NULL,'2025-12-09 00:21:42',1),(333,339,1,'aprobada','Versión inicial',3,'Pollo tropical',NULL,NULL,'2025-12-09 00:21:42',1),(334,340,1,'aprobada','Versión inicial',10,'Tomate, queso y espinaca',NULL,NULL,'2025-12-09 00:21:42',1),(335,341,1,'aprobada','Versión inicial',12,'Tortilla con Queso 2023',NULL,NULL,'2025-12-09 00:21:42',1),(336,342,1,'aprobada','Versión inicial',11,'Pasta con salsa de queso',NULL,NULL,'2025-12-09 00:21:42',1),(337,343,1,'aprobada','Versión inicial',10,'Crema de espárrago y palmito',NULL,NULL,'2025-12-09 00:21:42',1),(338,344,1,'aprobada','Versión inicial',12,'Pan casero',NULL,NULL,'2025-12-09 00:21:42',1),(339,345,1,'aprobada','Versión inicial',1,'Fresco de Maracuyá',NULL,NULL,'2025-12-09 00:21:42',1),(340,346,1,'aprobada','Versión inicial',6,'Pastel de papa con carne 2023','1. Lavar y procesar la papa, seguidamente cocinarla.\n2. Cocinar la carne molida, sofreír olores y adicionar.\n3. Realizar puré de papas con margarina y sal.\n4. Colocar en bandejas una capa de puré, seguidamente una capa de carne molida, otra de puré de papa y al final queso mozzarella.\n5. Colocar en el Rational y hornear.',NULL,'2025-12-09 00:21:42',1),(341,347,1,'aprobada','Versión inicial',4,'Huevo picado 2023',NULL,NULL,'2025-12-09 00:21:42',1),(342,348,1,'aprobada','Versión inicial',1,'Pulpa de Mango 2023',NULL,NULL,'2025-12-09 00:21:42',1),(343,349,1,'aprobada','Versión inicial',1,'Pulpa de Tamarindo',NULL,NULL,'2025-12-09 00:21:42',1),(344,350,1,'aprobada','Versión inicial',4,'Salchichón en salsa',NULL,NULL,'2025-12-09 00:21:42',1),(345,351,1,'aprobada','Versión inicial',6,'Frijoles blancos con res 2023',NULL,NULL,'2025-12-09 00:21:42',1),(346,352,1,'aprobada','Versión inicial',9,'Cazuela de Pescado',NULL,NULL,'2025-12-09 00:21:42',1),(347,353,1,'aprobada','Versión inicial',3,'Pollo en salsa de hongos 2023',NULL,NULL,'2025-12-09 00:21:42',1),(348,354,1,'aprobada','Versión inicial',5,'Rice and Beans 2023',NULL,NULL,'2025-12-09 00:21:42',1),(349,355,1,'aprobada','Versión inicial',12,'Crepas de frutas, mantequilla de maní 2023',NULL,NULL,'2025-12-09 00:21:42',1),(350,356,1,'aprobada','Versión inicial',8,'Ensalada 8 de setiembre',NULL,NULL,'2025-12-09 00:21:42',1),(351,357,1,'aprobada','Versión inicial',12,'Paty 2023',NULL,NULL,'2025-12-09 00:21:42',1),(352,358,1,'aprobada','Versión inicial',14,'Cajeta de Leche Pinito con Jalea',NULL,NULL,'2025-12-09 00:21:42',1),(353,359,1,'aprobada','Versión inicial',14,'Cajeta de pasas',NULL,NULL,'2025-12-09 00:21:42',1),(354,360,1,'aprobada','Versión inicial',14,'Cajeta de café y coco',NULL,NULL,'2025-12-09 00:21:42',1),(355,361,1,'aprobada','Versión inicial',14,'Cocadas Semana Cívica',NULL,NULL,'2025-12-09 00:21:42',1),(356,362,1,'aprobada','Versión inicial',6,'Rondón 2023',NULL,NULL,'2025-12-09 00:21:42',1),(357,363,1,'aprobada','Versión inicial',6,'Carne mechada 2023',NULL,NULL,'2025-12-09 00:21:42',1),(358,364,1,'aprobada','Versión inicial',2,'Vigorón 2023',NULL,NULL,'2025-12-09 00:21:42',1),(359,365,1,'aprobada','Versión inicial',3,'Sopa Azteca 2023',NULL,NULL,'2025-12-09 00:21:42',1),(360,366,1,'aprobada','Versión inicial',11,'Arroz con palmito 2023',NULL,NULL,'2025-12-09 00:21:42',1),(361,367,1,'aprobada','Versión inicial',6,'Olla de carne 2023',NULL,NULL,'2025-12-09 00:21:42',1),(362,368,1,'aprobada','Versión inicial',9,'Pastel de papa con atún 2024',NULL,NULL,'2025-12-09 00:21:42',1),(363,369,1,'aprobada','Versión inicial',6,'Lasaña de Carne 2024',NULL,NULL,'2025-12-09 00:21:42',1),(364,370,1,'aprobada','Versión inicial',4,'Reposado de Avena y Yogurt',NULL,NULL,'2025-12-09 00:21:42',1),(365,371,1,'aprobada','Versión inicial',12,'Burrito de frijol y queso',NULL,NULL,'2025-12-09 00:21:42',1),(366,372,1,'aprobada','Versión inicial',2,'Frijoles blancos con costilla de cerdo','1. Lavar y procesar las verduras y olores.\n2. Cocinar previamente la costilla de cerdo y adicionar sal al final.\n3. Dejar los frijoles blancos en agua. Al día siguiente, desechar el agua y cocinar con ajo y especias. Adicionar las verduras y la costilla de cerdo a los frijoles.\n4. Condimentar con especias y olores.\n5. Probar y rectificar sabor antes de servir.',NULL,'2025-12-09 00:21:42',1),(367,373,1,'aprobada','Versión inicial',3,'Sopa Azteca',NULL,NULL,'2025-12-09 00:21:42',1),(368,374,1,'aprobada','Versión inicial',3,'Sopa Azteca 2024',NULL,NULL,'2025-12-09 00:21:42',1),(369,375,1,'aprobada','Versión inicial',11,'Arroz con palmito 2024',NULL,NULL,'2025-12-09 00:21:42',1),(370,376,1,'aprobada','Versión inicial',10,'Guiso de palmito con zanahoria','1. Lavar y procesar zanahoria.\n2. Abrir latas de palmito y escurrir el líquido.\n3. Sofreír olores con margarina y aceite de ajo.\n4. Cocinar zanahoria al vapor en Rational.\n5. Agregar a los olores la zanahoria y el palmito. Mezclar y condimentar al gusto con sal y pimienta, entre otros.\n6. Al final, adicionar el perejil.',NULL,'2025-12-09 00:21:42',1),(371,377,1,'aprobada','Versión inicial',3,'Nuggets de pollo en Salsa China',NULL,NULL,'2025-12-09 00:21:42',1),(372,378,1,'aprobada','Versión inicial',6,'Frijoles blancos con carne y queso',NULL,NULL,'2025-12-09 00:21:42',1),(373,379,1,'aprobada','Versión inicial',9,'Pasta con atún en salsa de tomate',NULL,NULL,'2025-12-09 00:21:42',1),(374,380,1,'aprobada','Versión inicial',2,'Pozol 2024',NULL,NULL,'2025-12-09 00:21:42',1),(375,381,1,'aprobada','Versión inicial',8,'Ensalada rusa 2024',NULL,NULL,'2025-12-09 00:21:42',1),(376,382,1,'aprobada','Versión inicial',11,'Garbanzos con tomate 2024',NULL,NULL,'2025-12-09 00:21:42',1),(377,383,1,'aprobada','Versión inicial',4,'Tostada con aceite de oliva, ajo y especias 2024',NULL,NULL,'2025-12-09 00:21:42',1),(378,384,1,'aprobada','Versión inicial',8,'Ensalada 8 de abril 2024',NULL,NULL,'2025-12-09 00:21:42',1),(379,385,1,'aprobada','Versión inicial',8,'Garbanzos con atún',NULL,NULL,'2025-12-09 00:21:42',1),(380,386,1,'aprobada','Versión inicial',2,'Papas con costilla de cerdo',NULL,NULL,'2025-12-09 00:21:42',1),(381,387,1,'aprobada','Versión inicial',4,'Dos rebanadas de tomate (porción)',NULL,NULL,'2025-12-09 00:21:42',1),(382,388,1,'aprobada','Versión inicial',12,'Lápiz de carne mechada 2024',NULL,NULL,'2025-12-09 00:21:42',1),(383,389,1,'aprobada','Versión inicial',12,'Burrito de carne, frijol y queso',NULL,NULL,'2025-12-09 00:21:42',1),(384,390,1,'aprobada','Versión inicial',6,'Pasta Suprema 2024',NULL,NULL,'2025-12-09 00:21:42',1),(385,391,1,'aprobada','Versión inicial',2,'Frijoles tiernos con costilla de cerdo 2024',NULL,NULL,'2025-12-09 00:21:42',1),(386,392,1,'aprobada','Versión inicial',6,'Mano de piedra en salsa 2024',NULL,NULL,'2025-12-09 00:21:42',1),(387,393,1,'aprobada','Versión inicial',2,'Costilla de cerdo BBQ 2024',NULL,NULL,'2025-12-09 00:21:42',1),(388,394,1,'aprobada','Versión inicial',1,'Aguadulce - Rectoría',NULL,NULL,'2025-12-09 00:21:42',1),(389,395,1,'aprobada','Versión inicial',6,'Fajitas de res 2024',NULL,NULL,'2025-12-09 00:21:42',1),(390,396,1,'aprobada','Versión inicial',1,'Horchata 2024',NULL,NULL,'2025-12-09 00:21:42',1),(391,397,1,'aprobada','Versión inicial',6,'Lentejas con chorizo',NULL,NULL,'2025-12-09 00:21:42',1),(392,398,1,'aprobada','Versión inicial',4,'Arepa de manzana, avena y yogurt',NULL,NULL,'2025-12-09 00:21:42',1),(393,399,1,'aprobada','Versión inicial',4,'Tostada pizzera 2025',NULL,NULL,'2025-12-09 00:21:42',1),(394,400,1,'aprobada','Versión inicial',2,'Garbanzos con costilla de cerdo 2025',NULL,NULL,'2025-12-09 00:21:42',1),(395,401,1,'aprobada','Versión inicial',6,'Mano de pirecetaingredienteedra en Salsa de hongos',NULL,NULL,'2025-12-09 00:21:42',1),(396,402,1,'aprobada','Versión inicial',9,'Pastel de papa y atún 2025',NULL,NULL,'2025-12-09 00:21:42',1),(397,403,1,'aprobada','Versión inicial',4,'Chocoarepa con pasas y coco',NULL,NULL,'2025-12-09 00:21:42',1);
/*!40000 ALTER TABLE `receta_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingredientes`
--

DROP TABLE IF EXISTS `receta_ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingredientes` (
  `id_receta_ingrediente` int NOT NULL AUTO_INCREMENT,
  `id_receta` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `id_unidad` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_receta_ingrediente`),
  KEY `id_receta` (`id_receta`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `receta_ingredientes_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `receta_ingredientes_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `receta_ingredientes_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaci├│n entre recetas e ingredientes con sus cantidades y unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingredientes`
--

LOCK TABLES `receta_ingredientes` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes` DISABLE KEYS */;
INSERT INTO `receta_ingredientes` VALUES (3,7,161,11,1.00),(4,7,12,3,5.00),(1060,10,17,1,0.01),(1061,10,12,3,5.00),(1062,6,9,1,0.03),(1063,6,1,2,0.30),(1064,5,9,1,0.04),(1065,5,1,2,0.33),(1066,11,12,3,5.00),(1067,11,17,1,0.01),(1068,11,1,2,0.24),(1069,3,9,1,0.03),(1070,2,1,2,0.30),(1071,1,1,2,0.33),(1072,14,9,1,0.04),(1073,9,12,3,5.00),(1074,9,160,11,1.00),(1075,17,115,9,3.00),(1076,17,12,3,5.00),(1077,16,12,3,5.00),(1078,16,1,2,0.30),(1079,16,161,11,1.00),(1080,18,12,3,5.00),(1081,18,161,11,3.00),(1082,20,38,1,0.00),(1083,20,76,1,0.01),(1084,20,77,4,0.01),(1085,20,80,9,0.04),(1086,20,215,1,0.00),(1087,20,22,1,0.00),(1088,20,55,1,0.25),(1089,20,46,1,0.00),(1090,20,15,1,0.02),(1091,20,26,2,0.00),(1092,19,114,2,0.00),(1093,19,53,1,0.25),(1094,19,46,1,0.00),(1095,19,195,1,0.00),(1096,21,76,1,0.02),(1097,21,77,4,0.03),(1098,21,80,9,0.05),(1099,21,64,1,0.13),(1100,21,215,1,0.00),(1101,21,83,9,0.05),(1102,21,102,1,0.03),(1103,21,106,1,0.02),(1104,21,216,1,0.09),(1105,24,114,2,0.02),(1106,24,38,1,0.01),(1107,24,42,1,0.02),(1108,24,66,1,0.01),(1109,24,1,2,0.03),(1110,24,120,1,0.01),(1111,24,32,1,0.00),(1112,24,154,2,0.00),(1113,26,13,1,0.01),(1114,26,109,10,0.12),(1115,26,5,1,0.05),(1116,22,71,1,0.00),(1117,22,76,1,0.00),(1118,22,80,9,0.03),(1119,22,84,4,0.04),(1120,22,89,1,0.08),(1121,22,195,1,0.00),(1122,22,46,1,0.00),(1123,22,103,4,0.03),(1124,22,55,1,0.06),(1125,22,217,1,0.00),(1126,29,114,2,0.01),(1127,29,5,1,0.06),(1128,29,219,9,0.20),(1129,30,14,1,0.00),(1130,30,76,1,0.01),(1131,30,80,9,0.04),(1132,30,215,1,0.00),(1133,30,83,9,0.01),(1134,30,13,1,0.01),(1135,30,220,1,0.25),(1136,30,116,2,0.00),(1137,32,2,1,0.12),(1138,33,205,1,0.02),(1139,34,206,1,0.02),(1140,37,114,2,0.01),(1142,37,76,1,0.02),(1143,37,80,9,0.10),(1144,37,215,1,0.00),(1145,37,83,9,0.04),(1147,37,49,2,0.00),(1148,37,116,2,0.00),(1149,44,76,1,0.01),(1150,44,80,9,0.03),(1151,44,48,1,0.01),(1152,44,77,4,0.01),(1153,44,46,1,0.00),(1154,44,143,1,0.00),(1155,44,62,1,0.20),(1156,46,114,2,0.01),(1157,46,76,1,0.01),(1158,46,80,9,0.05),(1159,46,48,1,0.02),(1160,46,66,1,0.09),(1161,46,206,1,0.01),(1162,46,195,1,0.00),(1163,46,5,1,0.01),(1164,46,46,1,0.00),(1165,47,114,2,0.01),(1166,47,66,1,0.07),(1167,48,114,2,0.01),(1168,48,77,4,0.04),(1169,48,66,1,0.14),(1170,48,1,2,0.01),(1171,48,46,1,0.00),(1172,48,13,1,0.00),(1173,51,39,1,0.04),(1174,51,5,1,0.04),(1175,51,46,1,0.00),(1176,51,215,1,0.00),(1177,52,114,2,0.01),(1178,52,14,1,0.00),(1179,52,182,1,0.00),(1180,52,72,1,0.12),(1181,52,76,1,0.01),(1182,52,80,9,0.15),(1183,52,83,9,0.02),(1184,52,13,1,0.01),(1185,52,195,1,0.00),(1186,52,46,1,0.00),(1187,52,116,2,0.00),(1188,53,76,1,0.01),(1189,53,80,9,0.06),(1190,53,215,1,0.00),(1191,53,83,9,0.01),(1192,53,39,1,0.07),(1193,53,192,1,0.00),(1194,53,195,1,0.00),(1195,53,46,1,0.00),(1196,54,182,1,0.00),(1197,54,227,1,0.00),(1198,54,215,1,0.00),(1199,54,190,1,0.01),(1200,54,191,1,0.00),(1201,54,195,1,0.00),(1202,54,46,1,0.00),(1203,54,226,1,0.25),(1204,55,96,9,0.72),(1205,55,114,2,0.05),(1206,56,13,1,0.01),(1207,56,120,1,0.02),(1208,56,109,10,0.10),(1209,57,170,1,0.03),(1210,57,13,1,0.01),(1211,57,109,10,0.20),(1212,58,114,2,0.01),(1213,58,38,1,0.01),(1214,58,73,9,0.10),(1215,58,184,1,0.00),(1216,58,186,1,0.00),(1217,58,42,1,0.02),(1218,58,66,1,0.01),(1219,58,135,1,0.01),(1220,58,45,2,0.02),(1221,58,1,2,0.03),(1222,58,13,1,0.00),(1223,58,13,1,0.00),(1224,58,159,2,0.02),(1225,58,32,1,0.00),(1226,59,114,2,0.00),(1227,59,38,1,0.01),(1228,59,42,1,0.03),(1229,59,135,1,0.01),(1230,59,1,2,0.04),(1231,59,52,1,0.03),(1232,59,114,2,0.00),(1233,59,38,1,0.01),(1234,59,42,1,0.03),(1235,59,135,1,0.01),(1236,59,1,2,0.04),(1237,59,52,1,0.03),(1238,59,46,1,0.00),(1239,60,12,3,3.00),(1240,60,213,1,0.06),(1241,60,1,2,0.25),(1242,61,213,1,0.06),(1243,63,109,10,0.07),(1244,64,228,1,0.17),(1245,65,92,1,0.20),(1246,66,95,9,0.20),(1247,67,100,1,0.25),(1248,69,86,9,0.18),(1249,69,52,1,0.00),(1250,69,98,9,0.00),(1251,69,102,1,0.01),(1252,69,106,1,0.01),(1253,70,76,1,0.01),(1254,70,80,9,0.05),(1255,70,83,9,0.00);
/*!40000 ALTER TABLE `receta_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_ingredientes_historico`
--

DROP TABLE IF EXISTS `receta_ingredientes_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_ingredientes_historico` (
  `id_receta_ingrediente_historico` int NOT NULL AUTO_INCREMENT,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n de receta congelada.',
  `id_ingrediente` int NOT NULL,
  `id_unidad` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_receta_ingrediente_historico`),
  KEY `id_receta_historico` (`id_receta_historico`),
  KEY `receta_ingredientes_historico_ibfk_2` (`id_ingrediente`),
  KEY `receta_ingredientes_historico_ibfk_3` (`id_unidad`),
  CONSTRAINT `receta_ingredientes_historico_ibfk_1` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receta_ingredientes_historico_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `receta_ingredientes_historico_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ingredientes congelados para una versi├│n espec├¡fica de la receta.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingredientes_historico`
--

LOCK TABLES `receta_ingredientes_historico` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_ingredientes_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_afluencia`
--

DROP TABLE IF EXISTS `registro_afluencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_afluencia` (
  `id_registro_afluencia` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tiempo` int DEFAULT NULL COMMENT 'Almuerzo, Cena, etc.',
  `conteo` int NOT NULL DEFAULT '1' COMMENT 'N├║mero de personas que ingresaron o fueron contadas.',
  `tipo_registro` enum('manual','automatico') DEFAULT 'manual',
  `id_usuario_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_registro_afluencia`),
  KEY `id_tiempo` (`id_tiempo`),
  KEY `registro_afluencia_ibfk_2` (`id_usuario_registro`),
  CONSTRAINT `registro_afluencia_ibfk_1` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `registro_afluencia_ibfk_2` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro del conteo de personas que ingresan al comedor.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_afluencia`
--

LOCK TABLES `registro_afluencia` WRITE;
/*!40000 ALTER TABLE `registro_afluencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_afluencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Roles del sistema (admin, chef, asistente, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administración','Gestión total de usuarios, roles, módulos, reportes consolidados y aprobaciones finales (Módulos 1, 2, 3, 4, 5, 6, 7).'),(2,'Nutrición','Creación y aprobación de menús, recetas, porciones y análisis nutricional (Módulos 3, 4, 5, 6).'),(3,'Bodeguero','Registro de ingresos y egresos de inventario, ajustes y recepción de pedidos (Módulos 2, 4).'),(4,'Cocineros','Registro de producción diaria, consulta de recetas y disponibilidad de insumos (Módulos 2, 3, 4, 5).'),(5,'Asistente administrativo','Apoyo en reportes de inventario, ventas, carga de datos y solicitudes de soporte (Módulos 1, 2, 3, 4, 6, 7).'),(6,'Cajeras','Registro de ventas, cierres de turno y manejo de punto de venta (Módulos 4, 7).'),(7,'Personal de servicio','Consulta del menú del día y registro de cantidad servida (Módulos 3, 5, 7).');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiempo_comida`
--

DROP TABLE IF EXISTS `tiempo_comida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiempo_comida` (
  `id_tiempo` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('Desayuno','Almuerzo','Caf├®','Cena') DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tiempo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define los tiempos de comida del d├¡a';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiempo_comida`
--

LOCK TABLES `tiempo_comida` WRITE;
/*!40000 ALTER TABLE `tiempo_comida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo_comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `nombre_unidad` varchar(50) NOT NULL,
  `abreviatura` varchar(10) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  `tipo` enum('PESO','VOLUMEN','CONTEO','PEQUENA') NOT NULL COMMENT 'Categoría de la unidad (ej: PESO).',
  `activo` tinyint(1) DEFAULT '1' COMMENT 'Indica si la unidad de medida está activa en el sistema.',
  PRIMARY KEY (`id_unidad`),
  UNIQUE KEY `uk_nombre_unidad` (`nombre_unidad`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `unidad_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Unidades de medida (gramos, litros, unidades, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
INSERT INTO `unidad` VALUES (1,'Kilogramo','KG','2025-12-09 00:20:15',1,'PESO',1),(2,'Gramo','G','2025-12-09 00:20:15',1,'PESO',1),(3,'Libra','LB','2025-12-09 00:20:15',1,'PESO',1),(4,'Litro','L','2025-12-09 00:20:15',1,'VOLUMEN',1),(5,'Mililitro','ML','2025-12-09 00:20:15',1,'VOLUMEN',1),(6,'Galón','GAL','2025-12-09 00:20:15',1,'VOLUMEN',1),(7,'Unidad','UND','2025-12-09 00:20:15',1,'CONTEO',1),(8,'Docena','DOC','2025-12-09 00:20:15',1,'CONTEO',1),(9,'Caja','CJ','2025-12-09 00:20:15',1,'CONTEO',1),(10,'Taza','TZA','2025-12-09 00:20:15',1,'VOLUMEN',1),(11,'Cucharada','CDA','2025-12-09 00:20:15',1,'VOLUMEN',1),(12,'Cucharadita','CDITA','2025-12-09 00:20:15',1,'VOLUMEN',1);
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `clave_hash` varchar(255) NOT NULL COMMENT 'Hash de la contraseña del usuario (bcrypt recomendado).',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del sistema con su rol asignado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','Usuario','Administrador','admin@comedor.com',1,'2025-12-09 00:18:36','3b2d163787852a9e127b321a5c8160e8c20f066bcb1485d25e2bca3a1992d5c3');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_rol` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaci├│n N:M entre usuarios y roles del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) DEFAULT '0.00',
  `id_usuario` int NOT NULL,
  `id_usuario_cajero` int DEFAULT NULL,
  `id_tiempo` int DEFAULT NULL,
  `tipo_cliente` enum('interno','externo') DEFAULT 'interno',
  PRIMARY KEY (`id_venta`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_cajero` (`id_usuario_cajero`),
  KEY `id_tiempo` (`id_tiempo`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_usuario_cajero`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Venta de platos o productos al consumidor final';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_produccion_diaria` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versi├│n congelada de la receta vendida, asegurando el costo original.',
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_produccion_diaria` (`id_produccion_diaria`),
  KEY `venta_detalle_ibfk_receta_hist` (`id_receta_historico`),
  CONSTRAINT `venta_detalle_historico_fk` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `venta_detalle_ibfk_receta_hist` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Platos vendidos en punto de venta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_pago`
--

DROP TABLE IF EXISTS `venta_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL COMMENT 'FK a la venta a la que se aplic├│ el pago.',
  `id_metodo` int NOT NULL COMMENT 'FK al m├®todo de pago usado.',
  `monto_pagado` decimal(10,2) NOT NULL COMMENT 'Monto cubierto con este m├®todo de pago.',
  `referencia` varchar(100) DEFAULT NULL COMMENT 'Referencia de la transacci├│n (ej. No. de tiquete o terminal).',
  PRIMARY KEY (`id_pago`),
  KEY `id_venta` (`id_venta`),
  KEY `id_metodo` (`id_metodo`),
  CONSTRAINT `venta_pago_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venta_pago_ibfk_2` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de c├│mo se pag├│ cada venta (soporta pagos mixtos).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_pago`
--

LOCK TABLES `venta_pago` WRITE;
/*!40000 ALTER TABLE `venta_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificacion_ingreso_calidad`
--

DROP TABLE IF EXISTS `verificacion_ingreso_calidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificacion_ingreso_calidad` (
  `id_verificacion` int NOT NULL AUTO_INCREMENT,
  `id_detalle_pedido` int NOT NULL COMMENT 'FK al art├¡culo del pedido que se est├í verificando',
  `id_usuario_verificador` int NOT NULL COMMENT 'FK al usuario encargado de bodega que realiza la verificaci├│n',
  `fecha_verificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `criterio_temperatura` enum('OK','NO_CUMPLE','NO_APLICA') DEFAULT 'OK' COMMENT 'Cumple con el rango de temperatura.',
  `criterio_empaque` enum('OK','NO_CUMPLE') DEFAULT 'OK' COMMENT 'Empaque y presentaci├│n en buen estado.',
  `criterio_vencimiento` enum('OK','NO_CUMPLE') DEFAULT 'OK' COMMENT 'Fecha de vencimiento es aceptable.',
  `comentarios_generales` text COMMENT 'Comentarios adicionales del verificador.',
  PRIMARY KEY (`id_verificacion`),
  KEY `id_detalle_pedido` (`id_detalle_pedido`),
  KEY `id_usuario_verificador` (`id_usuario_verificador`),
  CONSTRAINT `verificacion_ingreso_calidad_ibfk_1` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `pedido_detalle` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `verificacion_ingreso_calidad_ibfk_2` FOREIGN KEY (`id_usuario_verificador`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de los puntos de control de calidad para el ingreso de cada art├¡culo de pedido, por parte del encargado de bodega.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificacion_ingreso_calidad`
--

LOCK TABLES `verificacion_ingreso_calidad` WRITE;
/*!40000 ALTER TABLE `verificacion_ingreso_calidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `verificacion_ingreso_calidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'proyecto_recetas'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_inventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_inventario`(
    IN p_id_ingrediente INT,
    IN p_cantidad DECIMAL(10,2)
)
BEGIN
    DECLARE v_existencias DECIMAL(10,2) DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;

    
    SELECT COUNT(*) INTO v_count
    FROM ingrediente
    WHERE id_ingrediente = p_id_ingrediente;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El ingrediente no existe';
    END IF;

    
    SELECT existencias INTO v_existencias
    FROM inventario
    WHERE id_ingrediente = p_id_ingrediente
    FOR UPDATE;

    
    UPDATE inventario
    SET existencias = v_existencias + p_cantidad,
        fecha_actualizacion = NOW()
    WHERE id_ingrediente = p_id_ingrediente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `asignar_receta_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `asignar_receta_menu`(
    IN p_id_menu INT,
    IN p_id_receta INT,
    IN p_id_usuario INT,
    IN p_motivo VARCHAR(255)
)
BEGIN
    DECLARE v INT DEFAULT 0;

    START TRANSACTION;

    
    SELECT COUNT(*) INTO v FROM menu_diario WHERE id_menu = p_id_menu;
    IF v = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menú no existe'; END IF;

    
    SELECT COUNT(*) INTO v FROM receta WHERE id_receta = p_id_receta;
    IF v = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La receta no existe'; END IF;

    
    SELECT COUNT(*) INTO v
    FROM menu_receta
    WHERE id_menu = p_id_menu AND id_receta = p_id_receta;

    IF v > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La receta ya está asociada al menú';
    END IF;

    INSERT INTO menu_receta (id_menu, id_receta)
    VALUES (p_id_menu, p_id_receta);

    INSERT INTO menu_diario_ajuste (
        id_menu, id_receta_anterior, id_receta_nueva,
        id_usuario, motivo, tipo_ajuste
    )
    VALUES (p_id_menu, NULL, p_id_receta, p_id_usuario, p_motivo, 'asignacion_receta');

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `crear_menu_diario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crear_menu_diario`(
    IN p_nombre_menu VARCHAR(100),
    IN p_descripcion VARCHAR(255),
    IN p_fecha DATE,
    IN p_porciones INT,
    IN p_id_tiempo INT,
    IN p_id_usuario INT,
    OUT p_id_menu INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    
    SELECT COUNT(*) INTO v_count
    FROM menu_diario
    WHERE fecha_menu = p_fecha
      AND id_tiempo = p_id_tiempo;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe un menú registrado para esa fecha y tiempo';
    END IF;

    INSERT INTO menu_diario (
        nombre_menu,
        descripcion,
        fecha_menu,
        porciones_asignadas,
        id_tiempo,
        version,
        id_usuario_creacion
    )
    VALUES (
        p_nombre_menu,
        p_descripcion,
        p_fecha,
        p_porciones,
        p_id_tiempo,
        1,
        p_id_usuario
    );

    SET p_id_menu = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_factura_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_factura_proveedor`(
    IN p_id_pedido INT,
    IN p_numero_factura VARCHAR(50),
    IN p_monto DECIMAL(10,2),
    OUT p_id_factura INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    SELECT COUNT(*) INTO v_count
    FROM pedido
    WHERE id_pedido = p_id_pedido;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El pedido no existe';
    END IF;

    INSERT INTO factura_proveedor (id_pedido, numero_factura, monto_factura)
    VALUES (p_id_pedido, p_numero_factura, p_monto);

    SET p_id_factura = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_pedido`(
    IN p_id_proveedor INT,
    IN p_fecha DATE,
    IN p_total DECIMAL(10,2),
    OUT p_id_pedido INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    
    SELECT COUNT(*) INTO v_count
    FROM proveedor
    WHERE id_proveedor = p_id_proveedor;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El proveedor no existe';
    END IF;

    INSERT INTO pedido (id_proveedor, fecha_pedido, total_pedido)
    VALUES (p_id_proveedor, p_fecha, p_total);

    SET p_id_pedido = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_produccion_diaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_produccion_diaria`(
    IN p_id_menu INT,
    IN p_fecha DATE,
    IN p_porciones_producidas INT,
    IN p_id_usuario INT,
    OUT p_id_produccion INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    
    SELECT COUNT(*) INTO v_count
    FROM menu_diario
    WHERE id_menu = p_id_menu
      AND fecha_menu = p_fecha;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El menú no existe para la fecha indicada';
    END IF;

    
    SELECT COUNT(*) INTO v_count
    FROM produccion_diaria
    WHERE id_menu = p_id_menu
      AND fecha_produccion = p_fecha;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe una producción registrada para este menú y fecha';
    END IF;

    
    INSERT INTO produccion_diaria (
        id_menu,
        fecha_produccion,
        porciones_producidas,
        id_usuario_registro
    )
    VALUES (
        p_id_menu,
        p_fecha,
        p_porciones_producidas,
        p_id_usuario
    );

    SET p_id_produccion = LAST_INSERT_ID();

    
    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remover_receta_menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `remover_receta_menu`(
    IN p_id_menu INT,
    IN p_id_receta INT,
    IN p_id_usuario INT,
    IN p_motivo VARCHAR(255)
)
BEGIN
    DECLARE v INT DEFAULT 0;

    START TRANSACTION;

    
    SELECT COUNT(*) INTO v
    FROM menu_receta
    WHERE id_menu = p_id_menu AND id_receta = p_id_receta;

    IF v = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La receta no está asociada al menú';
    END IF;

    DELETE FROM menu_receta
    WHERE id_menu = p_id_menu AND id_receta = p_id_receta;

    INSERT INTO menu_diario_ajuste (
        id_menu, id_receta_anterior, id_receta_nueva,
        id_usuario, motivo, tipo_ajuste
    )
    VALUES (p_id_menu, p_id_receta, NULL, p_id_usuario, p_motivo, 'remocion_receta');

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_ingrediente_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_ingrediente_actualizar`(
    IN p_id_categoria INT,
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE categoria_ingrediente
    SET nombre_categoria = p_nombre_categoria,
        descripcion = p_descripcion
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_ingrediente_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_ingrediente_crear`(
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO categoria_ingrediente(nombre_categoria, descripcion)
    VALUES (p_nombre_categoria, p_descripcion);
    
    SELECT LAST_INSERT_ID() AS id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_ingrediente_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_ingrediente_eliminar`(
    IN p_id_categoria INT
)
BEGIN
    DELETE FROM categoria_ingrediente
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_ingrediente_leer_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_ingrediente_leer_por_id`(
    IN p_id_categoria INT
)
BEGIN
    SELECT id_categoria, nombre_categoria, descripcion
    FROM categoria_ingrediente
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_ingrediente_leer_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_ingrediente_leer_todos`()
BEGIN
    SELECT id_categoria, nombre_categoria, descripcion
    FROM categoria_ingrediente
    ORDER BY nombre_categoria ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_receta_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_receta_actualizar`(
    IN p_id_categoria INT,
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_costo_max DECIMAL(10,2)
)
BEGIN
    UPDATE categoria_receta
    SET nombre = p_nombre_categoria,
        descripcion = p_descripcion,
        costo_max = p_costo_max
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_receta_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_receta_crear`(
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_costo_max DECIMAL(10,2)
)
BEGIN
    INSERT INTO categoria_receta(nombre, descripcion, costo_max)
    VALUES (p_nombre_categoria, p_descripcion, p_costo_max);

    SELECT LAST_INSERT_ID() AS id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_receta_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_receta_eliminar`(
    IN p_id_categoria INT
)
BEGIN
    DELETE FROM categoria_receta
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_receta_leer_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_receta_leer_por_id`(
    IN p_id_categoria INT
)
BEGIN
    SELECT id_categoria, nombre, descripcion, costo_max
    FROM categoria_receta
    WHERE id_categoria = p_id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_categoria_receta_leer_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_receta_leer_todos`()
BEGIN
    SELECT id_categoria, nombre, descripcion, costo_max
    FROM categoria_receta
    ORDER BY nombre ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rol_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rol_actualizar`(
    IN p_id_rol INT,
    IN p_nombre_rol VARCHAR(50),
    IN p_descripcion VARCHAR(150)
)
BEGIN
    UPDATE rol 
    SET nombre_rol = p_nombre_rol,
        descripcion = p_descripcion
    WHERE id_rol = p_id_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rol_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rol_crear`(
    IN p_nombre_rol VARCHAR(50),
    IN p_descripcion VARCHAR(150)
)
BEGIN
    INSERT INTO rol (nombre_rol, descripcion)
    VALUES (p_nombre_rol, p_descripcion);
    
    SELECT LAST_INSERT_ID() as id_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rol_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rol_eliminar`(
    IN p_id_rol INT,
    OUT p_resultado VARCHAR(255)
)
BEGIN
    DECLARE v_usuarios_asignados INT DEFAULT 0;
    
    
    SELECT COUNT(*) INTO v_usuarios_asignados 
    FROM usuario_rol 
    WHERE id_rol = p_id_rol;
    
    IF v_usuarios_asignados > 0 THEN
        SET p_resultado = 'ERROR: El rol está asignado a usuarios. No se puede eliminar.';
    ELSE
        DELETE FROM rol WHERE id_rol = p_id_rol;
        SET p_resultado = 'OK: Rol eliminado correctamente.';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rol_leer_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rol_leer_por_id`(
    IN p_id_rol INT
)
BEGIN
    SELECT id_rol, nombre_rol, descripcion 
    FROM rol 
    WHERE id_rol = p_id_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rol_leer_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rol_leer_todos`()
BEGIN
    SELECT id_rol, nombre_rol, descripcion 
    FROM rol 
    ORDER BY nombre_rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_actualizar`(
    IN p_id_unidad INT,
    IN p_nombre_unidad VARCHAR(50)
)
BEGIN
    UPDATE unidad
    SET nombre_unidad = p_nombre_unidad
    WHERE id_unidad = p_id_unidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_crear`(
    IN p_nombre_unidad VARCHAR(50)
)
BEGIN
    INSERT INTO unidad(nombre_unidad)
    VALUES (p_nombre_unidad);
    
    SELECT LAST_INSERT_ID() AS id_unidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_eliminar`(
    IN p_id_unidad INT
)
BEGIN
    DELETE FROM unidad
    WHERE id_unidad = p_id_unidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_leer_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_leer_por_id`(
    IN p_id_unidad INT
)
BEGIN
    SELECT id_unidad, nombre_unidad
    FROM unidad
    WHERE id_unidad = p_id_unidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_leer_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_leer_todos`()
BEGIN
    SELECT id_unidad, nombre_unidad
    FROM unidad
    ORDER BY nombre_unidad ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_activar`(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuario 
    SET activo = 1 
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_actualizar`(
    IN p_id_usuario INT,
    IN p_nombre_usuario VARCHAR(50),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_activo TINYINT(1)
)
BEGIN
    UPDATE usuario 
    SET nombre_usuario = p_nombre_usuario,
        nombre = p_nombre,
        apellido = p_apellido,
        correo = p_correo,
        activo = p_activo
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_asignar_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_asignar_roles`(
    IN p_id_usuario INT,
    IN p_roles_json JSON
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_rol_id INT;
    DECLARE v_roles_count INT;
    
    
    DELETE FROM usuario_rol WHERE id_usuario = p_id_usuario;
    
    
    SET v_roles_count = JSON_LENGTH(p_roles_json);
    
    WHILE i < v_roles_count DO
        SET v_rol_id = JSON_EXTRACT(p_roles_json, CONCAT('$[', i, ']'));
        INSERT INTO usuario_rol (id_usuario, id_rol) VALUES (p_id_usuario, v_rol_id);
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_crear`(
    IN p_nombre_usuario VARCHAR(50),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_activo TINYINT(1)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    
    START TRANSACTION;
    
    
    INSERT INTO usuario (nombre_usuario, nombre, apellido, correo, activo)
    VALUES (p_nombre_usuario, p_nombre, p_apellido, p_correo, p_activo);
    
    SELECT LAST_INSERT_ID() as id_usuario;
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_desactivar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_desactivar`(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuario 
    SET activo = 0 
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_leer_por_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_leer_por_id`(
    IN p_id_usuario INT
)
BEGIN
    SELECT 
        u.id_usuario,
        u.nombre_usuario,
        u.nombre,
        u.apellido,
        u.correo,
        u.activo,
        u.fecha_creacion,
        GROUP_CONCAT(r.id_rol) as roles_ids,
        GROUP_CONCAT(r.nombre_rol) as roles_nombres
    FROM usuario u
    LEFT JOIN usuario_rol ur ON u.id_usuario = ur.id_usuario
    LEFT JOIN rol r ON ur.id_rol = r.id_rol
    WHERE u.id_usuario = p_id_usuario
    GROUP BY u.id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_leer_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_leer_todos`()
BEGIN
    SELECT 
        u.id_usuario,
        u.nombre_usuario,
        u.nombre,
        u.apellido,
        u.correo,
        u.activo,
        u.fecha_creacion,
        GROUP_CONCAT(r.id_rol) as roles_ids,
        GROUP_CONCAT(r.nombre_rol) as roles_nombres
    FROM usuario u
    LEFT JOIN usuario_rol ur ON u.id_usuario = ur.id_usuario
    LEFT JOIN rol r ON ur.id_rol = r.id_rol
    GROUP BY u.id_usuario
    ORDER BY u.fecha_creacion DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario_verificar_existencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_verificar_existencia`(
    IN p_nombre_usuario VARCHAR(50),
    IN p_id_usuario_excluir INT,
    OUT p_existe TINYINT(1)
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    
    IF p_id_usuario_excluir IS NULL THEN
        SELECT COUNT(*) INTO v_count 
        FROM usuario 
        WHERE nombre_usuario = p_nombre_usuario;
    ELSE
        SELECT COUNT(*) INTO v_count 
        FROM usuario 
        WHERE nombre_usuario = p_nombre_usuario 
        AND id_usuario != p_id_usuario_excluir;
    END IF;
    
    SET p_existe = (v_count > 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-08 19:59:56
