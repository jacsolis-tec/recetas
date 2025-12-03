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
-- Dumping data for table `area_trabajo`
--

LOCK TABLES `area_trabajo` WRITE;
/*!40000 ALTER TABLE `area_trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auditoria_detalle`
--

LOCK TABLES `auditoria_detalle` WRITE;
/*!40000 ALTER TABLE `auditoria_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auditoria_evento`
--

LOCK TABLES `auditoria_evento` WRITE;
/*!40000 ALTER TABLE `auditoria_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria_ingrediente`
--

LOCK TABLES `categoria_ingrediente` WRITE;
/*!40000 ALTER TABLE `categoria_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categoria_receta`
--

LOCK TABLES `categoria_receta` WRITE;
/*!40000 ALTER TABLE `categoria_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_receta` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `ciclo_menu_detalle`
--

LOCK TABLES `ciclo_menu_detalle` WRITE;
/*!40000 ALTER TABLE `ciclo_menu_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_menu_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ciclo_menu_historico`
--

LOCK TABLES `ciclo_menu_historico` WRITE;
/*!40000 ALTER TABLE `ciclo_menu_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_menu_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cierre_caja`
--

LOCK TABLES `cierre_caja` WRITE;
/*!40000 ALTER TABLE `cierre_caja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierre_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demanda_no_atendida`
--

LOCK TABLES `demanda_no_atendida` WRITE;
/*!40000 ALTER TABLE `demanda_no_atendida` DISABLE KEYS */;
/*!40000 ALTER TABLE `demanda_no_atendida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `factor_conversion`
--

LOCK TABLES `factor_conversion` WRITE;
/*!40000 ALTER TABLE `factor_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `factor_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `factura_proveedor`
--

LOCK TABLES `factura_proveedor` WRITE;
/*!40000 ALTER TABLE `factura_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `lote_ingrediente`
--

LOCK TABLES `lote_ingrediente` WRITE;
/*!40000 ALTER TABLE `lote_ingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `menu_diario_ajuste`
--

LOCK TABLES `menu_diario_ajuste` WRITE;
/*!40000 ALTER TABLE `menu_diario_ajuste` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_ajuste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu_diario_ajuste_detalle`
--

LOCK TABLES `menu_diario_ajuste_detalle` WRITE;
/*!40000 ALTER TABLE `menu_diario_ajuste_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_ajuste_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `menu_diario_historico`
--

LOCK TABLES `menu_diario_historico` WRITE;
/*!40000 ALTER TABLE `menu_diario_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_diario_historico` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `menu_receta_historico`
--

LOCK TABLES `menu_receta_historico` WRITE;
/*!40000 ALTER TABLE `menu_receta_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_receta_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mov_inventario`
--

LOCK TABLES `mov_inventario` WRITE;
/*!40000 ALTER TABLE `mov_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parametro_institucional`
--

LOCK TABLES `parametro_institucional` WRITE;
/*!40000 ALTER TABLE `parametro_institucional` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametro_institucional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido_detalle`
--

LOCK TABLES `pedido_detalle` WRITE;
/*!40000 ALTER TABLE `pedido_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produccion_detalle`
--

LOCK TABLES `produccion_detalle` WRITE;
/*!40000 ALTER TABLE `produccion_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produccion_diaria`
--

LOCK TABLES `produccion_diaria` WRITE;
/*!40000 ALTER TABLE `produccion_diaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion_diaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `receta_historico`
--

LOCK TABLES `receta_historico` WRITE;
/*!40000 ALTER TABLE `receta_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `receta_ingredientes`
--

LOCK TABLES `receta_ingredientes` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `receta_ingredientes_historico`
--

LOCK TABLES `receta_ingredientes_historico` WRITE;
/*!40000 ALTER TABLE `receta_ingredientes_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_ingredientes_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `registro_afluencia`
--

LOCK TABLES `registro_afluencia` WRITE;
/*!40000 ALTER TABLE `registro_afluencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_afluencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Gerencia','Acceso total a todos los módulos'),(2,'Nutrición','Consulta y edición de menús y recetas'),(3,'Bodega','Registro de existencias y actualización de inventario'),(4,'Cocina','Consulta de recetas y registro de producción'),(5,'Ventas','Uso del módulo Punto de venta'),(6,'Administrador Técnico','Mantenimiento y despliegues');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tiempo_comida`
--

LOCK TABLES `tiempo_comida` WRITE;
/*!40000 ALTER TABLE `tiempo_comida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tiempo_comida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta_pago`
--

LOCK TABLES `venta_pago` WRITE;
/*!40000 ALTER TABLE `venta_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `verificacion_ingreso_calidad`
--

LOCK TABLES `verificacion_ingreso_calidad` WRITE;
/*!40000 ALTER TABLE `verificacion_ingreso_calidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `verificacion_ingreso_calidad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 22:05:37
