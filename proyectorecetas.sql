-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cat├ílogo de ├íreas f├¡sicas o estaciones de trabajo en el comedor.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_trabajo`
--

LOCK TABLES `area_trabajo` WRITE;
/*!40000 ALTER TABLE `area_trabajo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evento general de auditor├¡a por operaci├│n en una tabla';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_evento`
--

LOCK TABLES `auditoria_evento` WRITE;
/*!40000 ALTER TABLE `auditoria_evento` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categor├¡as generales de ingredientes (carnes, vegetales, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_ingrediente`
--

LOCK TABLES `categoria_ingrediente` WRITE;
/*!40000 ALTER TABLE `categoria_ingrediente` DISABLE KEYS */;
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
  PRIMARY KEY (`id_categoria_receta`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `categoria_receta_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categor├¡as de recetas (entrada, plato fuerte, postre, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_receta`
--

LOCK TABLES `categoria_receta` WRITE;
/*!40000 ALTER TABLE `categoria_receta` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Factores para convertir entre unidades compatibles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factor_conversion`
--

LOCK TABLES `factor_conversion` WRITE;
/*!40000 ALTER TABLE `factor_conversion` DISABLE KEYS */;
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
  PRIMARY KEY (`id_ingrediente`),
  KEY `id_unidad_base` (`id_unidad_base`),
  KEY `id_categoria_ingrediente` (`id_categoria_ingrediente`),
  CONSTRAINT `ingrediente_ibfk_1` FOREIGN KEY (`id_unidad_base`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ingrediente_ibfk_2` FOREIGN KEY (`id_categoria_ingrediente`) REFERENCES `categoria_ingrediente` (`id_categoria_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Lista de ingredientes disponibles en el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingrediente`
--

LOCK TABLES `ingrediente` WRITE;
/*!40000 ALTER TABLE `ingrediente` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de costos por unidad de cada ingrediente';
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cat├ílogo de tipos de pago aceptados (Tarjeta, Tiquete, Mixto).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Proveedores que abastecen los ingredientes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recetas con su categor├¡a y descripci├│n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Hist├│rico de versiones de recetas aprobadas para producci├│n.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_historico`
--

LOCK TABLES `receta_historico` WRITE;
/*!40000 ALTER TABLE `receta_historico` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relaci├│n entre recetas e ingredientes con sus cantidades y unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_ingredientes`
--

LOCK TABLES `receta_ingredientes` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Roles del sistema (admin, chef, asistente, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Gerencia','Acceso total a todos los módulos'),(2,'Nutrición','Consulta y edición de menús y recetas'),(3,'Bodega','Registro de existencias y actualización de inventario'),(4,'Cocina','Consulta de recetas y registro de producción'),(5,'Ventas','Uso del módulo Punto de venta'),(6,'Administrador Técnico','Mantenimiento y despliegues');
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
  PRIMARY KEY (`id_unidad`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `unidad_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Unidades de medida (gramos, litros, unidades, etc.)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
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
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Usuarios del sistema con su rol asignado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
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
-- Dumping routines for database 'proyecto'
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

    -- Validar ingrediente
    SELECT COUNT(*) INTO v_count
    FROM ingrediente
    WHERE id_ingrediente = p_id_ingrediente;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El ingrediente no existe';
    END IF;

    -- Cargar inventario actual
    SELECT existencias INTO v_existencias
    FROM inventario
    WHERE id_ingrediente = p_id_ingrediente
    FOR UPDATE;

    -- Actualizar existencias
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

    -- Menú existe
    SELECT COUNT(*) INTO v FROM menu_diario WHERE id_menu = p_id_menu;
    IF v = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El menú no existe'; END IF;

    -- Receta existe
    SELECT COUNT(*) INTO v FROM receta WHERE id_receta = p_id_receta;
    IF v = 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La receta no existe'; END IF;

    -- Evitar asignación duplicada
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

    -- Verificar si ya existe menú para ese tiempo y fecha
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

    -- Validar proveedor
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

    -- Validar que el menú exista
    SELECT COUNT(*) INTO v_count
    FROM menu_diario
    WHERE id_menu = p_id_menu
      AND fecha_menu = p_fecha;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El menú no existe para la fecha indicada';
    END IF;

    -- Validar que no exista registro previo
    SELECT COUNT(*) INTO v_count
    FROM produccion_diaria
    WHERE id_menu = p_id_menu
      AND fecha_produccion = p_fecha;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe una producción registrada para este menú y fecha';
    END IF;

    -- Registrar producción
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

    -- A partir de aquí podrías descontar inventario según recetas asignadas al menú
    -- Este bloque se deja listo para expandirse cuando tengas la tabla menu_receta

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

    -- Validar que exista la relación
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
    
    -- Verificar si el rol está asignado a algún usuario
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
    
    -- Eliminar roles actuales
    DELETE FROM usuario_rol WHERE id_usuario = p_id_usuario;
    
    -- Insertar nuevos roles
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
    
    -- Insertar usuario
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

-- Dump completed on 2025-12-02 22:14:49
