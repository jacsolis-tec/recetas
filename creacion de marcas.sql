
-- 1. Crear la tabla de Marcas
CREATE TABLE `marca_ingrediente` (
  `id_marca` INT NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria de la marca.',
  `nombre_marca` VARCHAR(100) NOT NULL COMMENT 'Nombre comercial de la marca.',
  `descripcion` VARCHAR(255) DEFAULT NULL,
  `activo` TINYINT(1) DEFAULT '1',
  `fecha_creacion` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_creacion` INT DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `nombre_marca` (`nombre_marca`),
  KEY `id_usuario_creacion` (`id_usuario_creacion`),
  CONSTRAINT `marca_ingrediente_ibfk_1` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuario` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de marcas comerciales para los ingredientes.';

-- 2. Modificar la tabla 'ingrediente' para agregar la columna de la marca (FK)
ALTER TABLE `ingrediente`
ADD COLUMN `id_marca` INT DEFAULT NULL COMMENT 'FK a la marca comercial del ingrediente.',
ADD KEY `id_marca` (`id_marca`);

-- 3. Agregar la restricción de clave foránea a la tabla 'ingrediente'
ALTER TABLE `ingrediente`
ADD CONSTRAINT `ingrediente_ibfk_3`
FOREIGN KEY (`id_marca`)
REFERENCES `marca_ingrediente` (`id_marca`)
ON DELETE RESTRICT
ON UPDATE RESTRICT;