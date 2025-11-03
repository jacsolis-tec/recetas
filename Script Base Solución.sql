
CREATE TABLE `area_trabajo` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_area`),
  UNIQUE KEY `nombre_area` (`nombre_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de áreas físicas o estaciones de trabajo en el comedor.';

CREATE TABLE `auditoria_detalle` (
  `id_detalle` bigint NOT NULL AUTO_INCREMENT,
  `id_evento` bigint NOT NULL,
  `nombre_campo` varchar(100) NOT NULL,
  `valor_anterior` text,
  `valor_nuevo` text,
  PRIMARY KEY (`id_detalle`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `auditoria_detalle_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `auditoria_evento` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de cambios de campo asociados a un evento de auditoría';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Evento general de auditoría por operación en una tabla';

CREATE TABLE `categoria_ingrediente` (
  `id_categoria_ingrediente` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_categoria_ingrediente`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `categoria_ingrediente_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categorías generales de ingredientes (carnes, vegetales, etc.)';

CREATE TABLE `categoria_receta` (
  `id_categoria_receta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `costo_max` decimal(10,2) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  PRIMARY KEY (`id_categoria_receta`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `categoria_receta_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Categorías de recetas (entrada, plato fuerte, postre, etc.)';

CREATE TABLE `ciclo_menu` (
  `id_ciclo` int NOT NULL AUTO_INCREMENT,
  `nombre_ciclo` varchar(100) NOT NULL,
  `duracion_dias` int DEFAULT NULL COMMENT 'Duración del ciclo en días (ej. 7, 14, 28).',
  `version` int NOT NULL DEFAULT '1' COMMENT 'Número de versión del ciclo de menú.',
  `id_ciclo_padre` int DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_ciclo`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  KEY `ciclo_menu_ibfk_2` (`id_ciclo_padre`),
  CONSTRAINT `ciclo_menu_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ciclo_menu_ibfk_2` FOREIGN KEY (`id_ciclo_padre`) REFERENCES `ciclo_menu` (`id_ciclo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Maestro de ciclos de menú para planificación a largo plazo.';

CREATE TABLE `ciclo_menu_detalle` (
  `id_ciclo` int NOT NULL,
  `id_menu` int NOT NULL COMMENT 'FK al menú diario o plantilla de menú.',
  `dia_ciclo` int NOT NULL COMMENT 'Día dentro del ciclo (1 a N).',
  PRIMARY KEY (`id_ciclo`,`id_menu`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `ciclo_menu_detalle_ibfk_1` FOREIGN KEY (`id_ciclo`) REFERENCES `ciclo_menu` (`id_ciclo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ciclo_menu_detalle_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Asociación de plantillas de menús al ciclo.';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Histórico de versiones de ciclos de menú.';

CREATE TABLE `cierre_caja` (
  `id_cierre` int NOT NULL AUTO_INCREMENT,
  `id_usuario_cajero` int NOT NULL COMMENT 'Cajero que realiza el corte (FK a usuario).',
  `fecha_cierre` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Momento en que se realiza el corte de caja.',
  `fecha_apertura` timestamp NULL DEFAULT NULL COMMENT 'Momento en que se abrió el turno/caja.',
  `total_ventas_sistema` decimal(10,2) NOT NULL,
  `total_pagos_sistema` decimal(10,2) NOT NULL,
  `total_anulaciones` decimal(10,2) DEFAULT '0.00',
  `monto_contado_efectivo` decimal(10,2) NOT NULL COMMENT 'Monto en efectivo físico contado por el cajero.',
  `diferencia_efectivo` decimal(10,2) NOT NULL COMMENT 'Diferencia entre total_ventas_sistema y monto_contado_efectivo.',
  `comentarios_cierre` text,
  PRIMARY KEY (`id_cierre`),
  KEY `id_usuario_cajero` (`id_usuario_cajero`),
  CONSTRAINT `cierre_caja_ibfk_1` FOREIGN KEY (`id_usuario_cajero`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de los cierres (cortes) diarios o por turno de caja.';

CREATE TABLE `demanda_no_atendida` (
  `id_demanda` int NOT NULL AUTO_INCREMENT,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión de receta que se agotó.',
  `fecha_demanda` date NOT NULL,
  `hora_demanda` time NOT NULL,
  `id_tiempo` int DEFAULT NULL COMMENT 'Almuerzo, Cena, etc.',
  `cantidad_perdida` int NOT NULL DEFAULT '1' COMMENT 'Número de porciones que se dejaron de vender en esta instancia.',
  `motivo` enum('agotado','problema_calidad','sistema_caido') DEFAULT 'agotado' COMMENT 'Razón por la que se perdió la venta.',
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

CREATE TABLE `factor_conversion` (
  `id_factor` int NOT NULL AUTO_INCREMENT,
  `id_unidad_origen` int NOT NULL COMMENT 'FK a la unidad que se va a convertir (ej: Kilogramo).',
  `id_unidad_destino` int NOT NULL COMMENT 'FK a la unidad a la que se desea convertir (ej: Gramo).',
  `factor` decimal(20,10) NOT NULL COMMENT 'El número por el cual se debe multiplicar la cantidad de origen para obtener la cantidad destino (ej: 1000 para KG -> GR).',
  `activo` tinyint(1) DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_factor`),
  UNIQUE KEY `uk_conversion` (`id_unidad_origen`,`id_unidad_destino`),
  KEY `factor_conversion_ibfk_2` (`id_unidad_destino`),
  CONSTRAINT `factor_conversion_ibfk_1` FOREIGN KEY (`id_unidad_origen`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `factor_conversion_ibfk_2` FOREIGN KEY (`id_unidad_destino`) REFERENCES `unidad` (`id_unidad`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Factores para convertir entre unidades compatibles.';

CREATE TABLE `factura_proveedor` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL COMMENT 'FK al pedido que originó esta factura.',
  `id_proveedor` int NOT NULL COMMENT 'FK al proveedor, redundante pero útil para consultas.',
  `numero_factura` varchar(100) NOT NULL COMMENT 'Número o código fiscal de la factura.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Histórico de costos por unidad de cada ingrediente';

CREATE TABLE `inventario` (
  `id_inventario` int NOT NULL AUTO_INCREMENT,
  `id_ingrediente` int NOT NULL,
  `cantidad_disponible` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_minimo` decimal(10,2) DEFAULT '0.00' COMMENT 'Umbral mínimo de cantidad para alertar por bajas existencias.',
  `stock_maximo` decimal(10,2) DEFAULT NULL COMMENT 'Umbral máximo recomendado de cantidad para evitar exceso de inventario.',
  `fecha_actualizacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inventario`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventario actual de ingredientes disponibles';

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

CREATE TABLE `menu_diario` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `id_menu_padre` int DEFAULT NULL COMMENT 'ID del primer menú creado en el ciclo para trazar el historial.',
  `id_tiempo` int NOT NULL,
  `nombre_menu` varchar(150) NOT NULL,
  `version` int NOT NULL DEFAULT '1' COMMENT 'Número de versión de este menú.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Planificación de menús diarios con recetas asignadas';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra ajustes y cambios en menús diarios';

CREATE TABLE `menu_diario_ajuste_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_ajuste` int NOT NULL,
  `nombre_campo` varchar(100) NOT NULL,
  `valor_anterior` text,
  `valor_nuevo` text,
  PRIMARY KEY (`id_detalle`),
  KEY `id_ajuste` (`id_ajuste`),
  CONSTRAINT `menu_diario_ajuste_detalle_ibfk_1` FOREIGN KEY (`id_ajuste`) REFERENCES `menu_diario_ajuste` (`id_ajuste`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de campos modificados durante un ajuste de menú diario';

CREATE TABLE `menu_diario_historico` (
  `id_menu_historico` int NOT NULL AUTO_INCREMENT,
  `id_menu_activa` int NOT NULL COMMENT 'ID del menú activo al que pertenece esta versión.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Histórico de versiones de menús diarios aprobados.';

CREATE TABLE `menu_receta` (
  `id_menu` int NOT NULL,
  `id_receta` int NOT NULL,
  PRIMARY KEY (`id_menu`,`id_receta`),
  KEY `id_receta` (`id_receta`),
  CONSTRAINT `menu_receta_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu_diario` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_receta_ibfk_2` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación N:M entre menús diarios y recetas incluidas en cada tiempo de comida';

CREATE TABLE `menu_receta_historico` (
  `id_menu_historico` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión congelada de la receta utilizada.',
  PRIMARY KEY (`id_menu_historico`,`id_receta_historico`),
  KEY `menu_receta_historico_ibfk_2` (`id_receta_historico`),
  CONSTRAINT `menu_receta_historico_ibfk_1` FOREIGN KEY (`id_menu_historico`) REFERENCES `menu_diario_historico` (`id_menu_historico`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_receta_historico_ibfk_2` FOREIGN KEY (`id_receta_historico`) REFERENCES `receta_historico` (`id_receta_historico`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación entre menú histórico y la versión de la receta que se usó.';

CREATE TABLE `metodo_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre_metodo` varchar(50) NOT NULL,
  `requiere_terminal` tinyint(1) DEFAULT '0',
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_metodo`),
  UNIQUE KEY `nombre_metodo` (`nombre_metodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de tipos de pago aceptados (Tarjeta, Tiquete, Mixto).';

CREATE TABLE `mov_inventario` (
  `id_mov` int NOT NULL AUTO_INCREMENT,
  `id_inventario` int NOT NULL,
  `id_lote` int DEFAULT NULL,
  `id_detalle_pedido` int DEFAULT NULL,
  `tipo_movimiento` enum('entrada','salida','ajuste') NOT NULL,
  `id_area_destino` int DEFAULT NULL COMMENT 'FK al área de trabajo que solicita o recibe el recurso (ej. Cocina Caliente).',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro histórico de movimientos del inventario';

CREATE TABLE `parametro_institucional` (
  `clave` varchar(50) NOT NULL COMMENT 'Nombre único del parámetro (ej. TASA_IVA, NOMBRE_EMPRESA).',
  `valor` text COMMENT 'Valor del parámetro (ej. 0.13, "Comedor Institucional TEC").',
  `tipo_dato` enum('string','decimal','boolean','date') DEFAULT 'string',
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario_modificacion` int DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `id_usuario_modificacion` (`id_usuario_modificacion`),
  CONSTRAINT `parametro_institucional_ibfk_1` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Configuración institucional, fiscal y parámetros de negocio.';

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

CREATE TABLE `pedido_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_ingrediente` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `cantidad_recibida` decimal(10,2) DEFAULT '0.00' COMMENT 'Cantidad de ingrediente realmente aceptada y recibida.',
  `estado_recepcion` enum('pendiente','aceptado','rechazado') DEFAULT 'pendiente',
  `id_usuario_recepcion` int DEFAULT NULL,
  `fecha_recepcion` date DEFAULT NULL,
  `motivo_recepcion` varchar(255) DEFAULT NULL COMMENT 'Motivo de rechazo o comentario general asociado a la recepción del artículo.',
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_ingrediente` (`id_ingrediente`),
  KEY `id_usuario_recepcion` (`id_usuario_recepcion`),
  CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pedido_detalle_ibfk_3` FOREIGN KEY (`id_usuario_recepcion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de ingredientes y cantidades incluidas en cada pedido';

CREATE TABLE `produccion_detalle` (
  `id_detalle_produccion` int NOT NULL AUTO_INCREMENT,
  `id_produccion_diaria` int NOT NULL COMMENT 'FK al encabezado de la orden de producción del día.',
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión congelada de la receta utilizada.',
  `porciones_producidas` int NOT NULL COMMENT 'Número real de porciones que se lograron de esta receta.',
  `fecha_produccion` date NOT NULL COMMENT 'Fecha en que se terminó de producir (para auditoría).',
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

CREATE TABLE `produccion_diaria` (
  `id_produccion_diaria` int NOT NULL AUTO_INCREMENT,
  `id_menu` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión congelada de la receta que se planeó producir en esta orden.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de la producción diaria por menú';

CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Proveedores que abastecen los ingredientes';

CREATE TABLE `receta` (
  `id_receta` int NOT NULL AUTO_INCREMENT,
  `id_receta_padre` int DEFAULT NULL COMMENT 'ID de la primera versión de la receta para trazar el historial.',
  `id_categoria_receta` int NOT NULL,
  `nombre_receta` varchar(150) NOT NULL,
  `version` int NOT NULL DEFAULT '1' COMMENT 'Número de versión de esta receta (1, 2, 3...).',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Recetas con su categoría y descripción';

CREATE TABLE `receta_historico` (
  `id_receta_historico` int NOT NULL AUTO_INCREMENT,
  `id_receta_activa` int NOT NULL COMMENT 'ID de la receta activa (original) a la que pertenece esta versión.',
  `version` int NOT NULL COMMENT 'Número de versión congelada.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Histórico de versiones de recetas aprobadas para producción.';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación entre recetas e ingredientes con sus cantidades y unidades';

CREATE TABLE `receta_ingredientes_historico` (
  `id_receta_ingrediente_historico` int NOT NULL AUTO_INCREMENT,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión de receta congelada.',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Ingredientes congelados para una versión específica de la receta.';

CREATE TABLE `registro_afluencia` (
  `id_registro_afluencia` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tiempo` int DEFAULT NULL COMMENT 'Almuerzo, Cena, etc.',
  `conteo` int NOT NULL DEFAULT '1' COMMENT 'Número de personas que ingresaron o fueron contadas.',
  `tipo_registro` enum('manual','automatico') DEFAULT 'manual',
  `id_usuario_registro` int DEFAULT NULL,
  PRIMARY KEY (`id_registro_afluencia`),
  KEY `id_tiempo` (`id_tiempo`),
  KEY `registro_afluencia_ibfk_2` (`id_usuario_registro`),
  CONSTRAINT `registro_afluencia_ibfk_1` FOREIGN KEY (`id_tiempo`) REFERENCES `tiempo_comida` (`id_tiempo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `registro_afluencia_ibfk_2` FOREIGN KEY (`id_usuario_registro`) REFERENCES `usuario` (`id_usuario`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro del conteo de personas que ingresan al comedor.';

CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Roles del sistema (admin, chef, asistente, etc.)';

CREATE TABLE `tiempo_comida` (
  `id_tiempo` int NOT NULL AUTO_INCREMENT,
  `nombre` enum('Desayuno','Almuerzo','Café','Cena') DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tiempo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define los tiempos de comida del día';

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

CREATE TABLE `usuario_rol` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Relación N:M entre usuarios y roles del sistema';

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

CREATE TABLE `venta_detalle` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_produccion_diaria` int NOT NULL,
  `id_receta_historico` int NOT NULL COMMENT 'FK a la versión congelada de la receta vendida, asegurando el costo original.',
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

CREATE TABLE `venta_pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL COMMENT 'FK a la venta a la que se aplicó el pago.',
  `id_metodo` int NOT NULL COMMENT 'FK al método de pago usado.',
  `monto_pagado` decimal(10,2) NOT NULL COMMENT 'Monto cubierto con este método de pago.',
  `referencia` varchar(100) DEFAULT NULL COMMENT 'Referencia de la transacción (ej. No. de tiquete o terminal).',
  PRIMARY KEY (`id_pago`),
  KEY `id_venta` (`id_venta`),
  KEY `id_metodo` (`id_metodo`),
  CONSTRAINT `venta_pago_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `venta_pago_ibfk_2` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detalle de cómo se pagó cada venta (soporta pagos mixtos).';

CREATE TABLE `verificacion_ingreso_calidad` (
  `id_verificacion` int NOT NULL AUTO_INCREMENT,
  `id_detalle_pedido` int NOT NULL COMMENT 'FK al artículo del pedido que se está verificando',
  `id_usuario_verificador` int NOT NULL COMMENT 'FK al usuario encargado de bodega que realiza la verificación',
  `fecha_verificacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `criterio_temperatura` enum('OK','NO_CUMPLE','NO_APLICA') DEFAULT 'OK' COMMENT 'Cumple con el rango de temperatura.',
  `criterio_empaque` enum('OK','NO_CUMPLE') DEFAULT 'OK' COMMENT 'Empaque y presentación en buen estado.',
  `criterio_vencimiento` enum('OK','NO_CUMPLE') DEFAULT 'OK' COMMENT 'Fecha de vencimiento es aceptable.',
  `comentarios_generales` text COMMENT 'Comentarios adicionales del verificador.',
  PRIMARY KEY (`id_verificacion`),
  KEY `id_detalle_pedido` (`id_detalle_pedido`),
  KEY `id_usuario_verificador` (`id_usuario_verificador`),
  CONSTRAINT `verificacion_ingreso_calidad_ibfk_1` FOREIGN KEY (`id_detalle_pedido`) REFERENCES `pedido_detalle` (`id_detalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `verificacion_ingreso_calidad_ibfk_2` FOREIGN KEY (`id_usuario_verificador`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro de los puntos de control de calidad para el ingreso de cada artículo de pedido, por parte del encargado de bodega.';
