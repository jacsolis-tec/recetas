INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'Administración', 'Gestión total de usuarios, roles, módulos, reportes consolidados y aprobaciones finales (Módulos 1, 2, 3, 4, 5, 6, 7).'),
(2, 'Nutrición', 'Creación y aprobación de menús, recetas, porciones y análisis nutricional (Módulos 3, 4, 5, 6).'),
(3, 'Bodeguero', 'Registro de ingresos y egresos de inventario, ajustes y recepción de pedidos (Módulos 2, 4).'),
(4, 'Cocineros', 'Registro de producción diaria, consulta de recetas y disponibilidad de insumos (Módulos 2, 3, 4, 5).'),
(5, 'Asistente administrativo', 'Apoyo en reportes de inventario, ventas, carga de datos y solicitudes de soporte (Módulos 1, 2, 3, 4, 6, 7).'),
(6, 'Cajeras', 'Registro de ventas, cierres de turno y manejo de punto de venta (Módulos 4, 7).'),
(7, 'Personal de servicio', 'Consulta del menú del día y registro de cantidad servida (Módulos 3, 5, 7).');


-- Agregar contraseña Hash
ALTER TABLE `usuario` ADD COLUMN `clave_hash` VARCHAR(255) NOT NULL COMMENT 'Hash de la contraseña del usuario (bcrypt recomendado).';
INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `nombre`, `apellido`, `correo`, `activo`, `clave_hash`) VALUES
(1, 'admin', 'Usuario', 'Administrador', 'admin@comedor.com', 1, SHA2('nutri123', 256));
INSERT INTO `usuario_rol` (`id_usuario`, `id_rol`) VALUES(1, 1);


INSERT INTO `marca_ingrediente` (`nombre_marca`, `descripcion`, `activo`) VALUES
('Dos Pinos', 'Líder en lácteos (leche, queso, yogur, etc.) y jugos.', 1),
('Sigma Alimentos (Zaragoza/Cinta Azul)', 'Marcas de embutidos y carnes procesadas para comedores.', 1),
('Pollo Rey', 'Marca líder de productos avícolas (pollo y pavo).', 1),
('Tío Pelón', 'Marca costarricense de granos básicos como arroz y frijoles.', 1),
('Fábesco', 'Marca de especias, condimentos y sazonadores para la industria de alimentos.', 1),
('Productos Suprema', 'Marca de especias y condimentos costarricense.', 1),
('Ingenio Taboga', 'Marca de azúcar y edulcorantes.', 1),
('Banquete', 'Marca de salsas, mayonesas, mostazas y aderezos (de Kraft Heinz).', 1),
('Del Monte', 'Marca de frutas enlatadas, vegetales y jugos.', 1),
('La Granja', 'Marca de productos de cerdo (chuletas, tocino, etc.).', 1),
('Nacional de Chocolates (Choco Listo)', 'Productos de cacao, chocolates y bebidas instantáneas.', 1),
('Kimby', 'Marca de embutidos y congelados enfocada en el segmento de buen precio.', 1),
('California', 'Marca popular de aceites comestibles (soya, canola).', 1),
('Maizena', 'Marca de almidón de maíz, atoles y mezclas para repostería (de Unilever).', 1);

INSERT INTO `marca_ingrediente` (`id_marca`, `nombre_marca`, `descripcion`, `activo`, `fecha_creacion`, `id_usuario_creacion`) VALUES
(15, 'Maggi', 'Marca de Nestlé, enfocada en caldos, sopas, cremas y sazonadores.', 1, '2025-11-09 04:48:38', NULL),
(16, 'Maseca', 'Marca líder de harina de maíz nixtamalizado para tortillas, atoles y otros productos de maíz.', 1, '2025-11-09 04:48:38', NULL),
(17, 'Coronado', 'Marca de productos lácteos, principalmente leche en polvo y evaporada.', 1, '2025-11-09 04:48:38', NULL),
(18, 'Pozuelo', 'Marca líder de galletas, repostería y bocadillos dulces y salados en Centroamérica.', 1, '2025-11-09 04:48:38', NULL),
(19, 'Nestlé', 'Marca global con productos variados como leche condensada, dulce de leche, chocolates y cereales.', 1, '2025-11-09 04:48:38', NULL),
(20, 'El Angel', 'Marca popular de dulces de leche, jaleas y conservas.', 1, '2025-11-09 04:48:38', NULL),
(21, 'Ujarras', 'Marca reconocida de jaleas, mermeladas y conservas.', 1, '2025-11-09 04:48:38', NULL),
(22, 'Richly', 'Marca de vegetales y conservas enlatadas (hongos, maíz dulce, etc.).', 1, '2025-11-09 04:48:38', NULL),
(23, 'Lizano', 'Marca líder de salsas y aderezos tradicionales, incluyendo la popular Salsa Inglesa.', 1, '2025-11-09 04:48:38', NULL),
(24, 'Zafran', 'Marca de salsas, condimentos y especias especializadas (ej. salsa para pizza).', 1, '2025-11-09 04:48:38', NULL),
(25, 'Bimbo', 'Marca global líder en panadería, tortillas y productos de bollería.', 1, '2025-11-09 04:48:38', NULL),
(26, 'Del Chef', 'Marca de aderezos, salsas y condimentos preparados.', 1, '2025-11-09 04:48:38', NULL),
(27, 'Ancla', 'Marca de edulcorantes y endulzantes artificiales (Sacarina).', 1, '2025-11-09 04:48:38', NULL),
(28, 'Vigui', 'Marca de bebidas instantáneas, refrescos y horchatas.', 1, '2025-11-09 04:48:38', NULL),
(29, 'Sweetwell', 'Marca de edulcorantes naturales o artificiales bajos en calorías.', 1, '2025-11-09 04:48:38', NULL),
(30, 'Roland', 'Marca de alimentos especiales o importados, como leche de coco o conservas exóticas.', 1, '2025-11-09 04:48:38', NULL);


INSERT INTO `marca_ingrediente` (`id_marca`, `nombre_marca`, `descripcion`, `activo`, `fecha_creacion`, `id_usuario_creacion`) VALUES
(31, 'Kellogg\'s', 'Marca global de cereales de desayuno y snacks (Choco Krispis, Zucaritas, Froot Loops, Komplete).', 1, CURRENT_TIMESTAMP, NULL);
marca_ingrediente

INSERT INTO `area_trabajo` (`id_area`, `nombre_area`, `descripcion`, `activo`) VALUES
(1, 'Bodega Principal', 'Área de Inventario y Almacén para registro de entradas y salidas de materia prima.', 1),
(2, 'Cocina Caliente', 'Área de Producción y Preparación de platos fuertes y calientes.', 1),
(3, 'Cocina Fría/Panadería', 'Área de preparación de ensaladas, postres, bebidas y panadería.', 1),
(4, 'Línea de Servicio', 'Área donde el Personal de Servicio entrega las porciones de alimentos al cliente.', 1),
(5, 'Punto de Venta (POS)', 'Área de registro de ventas, pagos de Cajeras y cierres de caja.', 1);



INSERT INTO `categoria_ingrediente` (`id_categoria_ingrediente`, `nombre_categoria`, `descripcion`, `id_usuario_creacion`) VALUES
(1, 'Proteína Animal', 'Carnes rojas, pollo, cerdo, pescado y otros productos cárnicos.', 1),
(2, 'Lácteos y Derivados', 'Leche, quesos, yogures, mantequilla y cremas.', 1),
(3, 'Granos y Leguminosas', 'Arroz, frijoles, lentejas, garbanzos, pasta y granos secos.', 1),
(4, 'Frutas y Verduras', 'Vegetales frescos o congelados, hortalizas y frutas para consumo directo o preparación.', 1),
(5, 'Tubérculos y Almidones', 'Papas, yuca, plátanos, camote y otros ingredientes ricos en almidón.', 1),
(6, 'Aceites y Grasas', 'Aceites de cocina (vegetal, oliva), mantecas y margarinas.', 1),
(7, 'Especias y Condimentos', 'Sal, pimienta, orégano, comino, hierbas secas y otros sazonadores.', 1),
(8, 'Salsas y Aderezos', 'Salsas de tomate, mayonesa, mostaza, vinagretas y bases para guisos.', 1),
(9, 'Bebidacategoriarecetas e Infusiones', 'Café, té, bases para refrescos y jugos en polvo/concentrados.', 1),
(10, 'Insumos de Panadería/Reposteria', 'Harinas, azúcares, levaduras, polvos de hornear y jarabes.', 1),
(11, 'Enlatados y Conservas', 'Atúcategoria_recetan enlatado, vegetales encurtidos y otros productos con larga vida útil.', 1),
(12, 'Limpieza y Desinfección', 'Insumos no comestibles necesarios para la operación del comedor.', 1),
(13, 'Empaques y Desechables', 'Platos, vasos, cubiertos, servilletas y otros materiales de servicio no comestibles.', 1);




-- ASUNCIÓN: Se utiliza una columna 'valor_referencia' para almacenar el valor numérico asociado a la categoría.
categoria_receta
INSERT INTO `categoria_receta` (`id_categoria_receta`, `nombre_categoria`, `valor_referencia`, `id_usuario_creacion`) VALUES
(1, 'Bebidas', 600, 1),
(2, 'Carne de cerdo', 1500, 1),
(3, 'Carne de pollo', 1500, 1),
(4, 'Desayuno', 15000, 1),
(5, 'Arroz y frijoles', 10000, 1),
(6, 'Carne de res y embutidos', 1500, 1),
(7, 'Frutas', 600, 1),
(8, 'Ensaladas', 1000, 1),
(9, 'Carne atún y pescado', 3000, 1),
(10, 'Guarnición', 1000, 1),
(11, 'Vegetarianas', 1500, 1),
(12, 'Recetas de la tarde', 1500, 1),
(13, 'Emparedados', 1500, 1),
(14, 'Postres', 1500, 1);




-- 2. Agregar la columna de CLASIFICACIÓN (ENUM) para permitir conversiones lógicas
ALTER TABLE `unidad`
ADD COLUMN `tipo` ENUM('PESO', 'VOLUMEN', 'CONTEO', 'PEQUENA') NOT NULL COMMENT 'Categoría de la unidad (ej: PESO).',
ADD UNIQUE KEY `uk_nombre_unidad` (`nombre_unidad`); -- Agregar restricción de unicidad para la unidad

-- 3. Agregar la columna de estado
ALTER TABLE `unidad`
ADD COLUMN `activo` TINYINT(1) DEFAULT 1 COMMENT 'Indica si la unidad de medida está activa en el sistema.';

-- ASUNCIÓN: id_usuario_creacion = 1 (Admin)

INSERT INTO `unidad` (`id_unidad`, `nombre_unidad`, `abreviatura`, `tipo`, `activo`, `id_usuario_creacion`) VALUES
-- Peso
(1, 'Kilogramo', 'KG', 'PESO', 1, 1),
(2, 'Gramo', 'G', 'PESO', 1, 1),
(3, 'Libra', 'LB', 'PESO', 1, 1),

-- Volumen
(4, 'Litro', 'L', 'VOLUMEN', 1, 1),
(5, 'Mililitro', 'ML', 'VOLUMEN', 1, 1),
(6, 'Galón', 'GAL', 'VOLUMEN', 1, 1),

-- Conteo/Unidades
(7, 'Unidad', 'UND', 'CONTEO', 1, 1),
(8, 'Docena', 'DOC', 'CONTEO', 1, 1),
(9, 'Caja', 'CJ', 'CONTEO', 1, 1),

-- Recetas (Volumen/Peso Pequeño)
(10, 'Taza', 'TZA', 'VOLUMEN', 1, 1),
(11, 'Cucharada', 'CDA', 'VOLUMEN', 1, 1),
(12, 'Cucharadita', 'CDITA', 'VOLUMEN', 1, 1);

unidadINSERT INTO `factor_conversion` (`id_unidad_origen`, `id_unidad_destino`, `factor`, `activo`) VALUES
-- Conversiones de Peso (ID 1, 2, 3)
(1, 2, 1000.0000000000, 1),       -- KG a G
(2, 1, 0.0010000000, 1),         -- G a KG
(1, 3, 2.2046226218, 1),         -- KG a LB
(3, 1, 0.4535923700, 1),         -- LB a KG
(3, 2, 453.5923700000, 1),       -- LB a G

-- Conversiones de Volumen (ID 4, 5, 6)
(4, 5, 1000.0000000000, 1),       -- L a ML
(5, 4, 0.0010000000, 1),         -- ML a L
(6, 4, 3.7854100000, 1),         -- GAL a L

-- Conversiones de Recetas a Volumen Base (ID 10, 11, 12 a 5)
(10, 5, 240.0000000000, 1),       -- TZA a ML (240ml es el estándar)
(11, 5, 15.0000000000, 1),        -- CDA a ML
(12, 5, 5.0000000000, 1);         -- CDITA a ML


INSERT INTO `metodo_pago` (`id_metodo`, `nombre_metodo`, `requiere_terminal`, `activo`) VALUES
(1, 'Tarjeta', 1, 1),       -- Requiere terminal POS para procesar la transacción
(2, 'Tiquete/Vale', 0, 1),  -- No requiere terminal, ya que el pago es con vale o tiquete
(3, 'Mixto', 0, 1);          -- Es una combinación de métodos; no requiere terminal por sí mismo


ingrediente

INSERT INTO `ingrediente` (`id_ingrediente`, `id_unidad_base`, `id_categoria_ingrediente`, `nombre_ingrediente`, `activo`, `trazabilidad`, `id_marca`) VALUES
(1, 2, 1, 'Leche Fluida 2% Grasa (Genérica)', 1, 0, NULL),
(2, 1, 1, 'Natilla (Genérica)', 1, 0, NULL),
(3, 1, 1, 'Yogurt Natural (Genérico)', 1, 0, NULL),
(4, 1, 1, 'Queso Amarillo en Bloque/Rebanado (Genérico)', 1, 0, NULL),
(5, 1, 1, 'Queso Turrialba (Genérico)', 1, 0, NULL),
(6, 2, 1, 'Queso Crema (Genérico)', 1, 0, NULL),
(7, 2, 11, 'Jugo de Naranja (Natural/Marca Desconocida)', 1, 0, NULL),
(8, 1, 11, 'Cocoa Dulce en Polvo (Genérica)', 1, 0, NULL),
(9, 1, 11, 'Dulce T (Tipo Leche en Polvo Azucarada)', 1, 0, NULL),
(10, 1, 11, 'Avena en Hojuela (Genérica)', 1, 0, NULL),
(11, 5, 11, 'Sirope Sabor Kola (Concentrado)', 1, 0, NULL),
(12, 5, 3, 'Azúcar Blanco en Sobres (Genérico)', 1, 0, NULL),
(13, 1, 7, 'Margarina Industrial/Genérica', 1, 0, NULL),
(14, 1, 7, 'Achiote en Pasta/Aceite (Genérico)', 1, 0, NULL),
(15, 1, 13, 'Salsa de Tomate Banquete', 1, 0, 8),
(16, 5, 13, 'Mostaza Banquete', 1, 0, 8),
(17, 1, 11, 'Café Urbano (Genérico)', 1, 0, NULL),
(18, 1, 4, 'Crema de Tomate Maggi (Instantánea)', 1, 0, 15),
(19, 1, 4, 'Sopa Maggi Olla de Carne (Instantánea)', 1, 0, 15),
(20, 1, 4, 'Crema de Hongos Maggi (Instantánea)', 1, 0, 15),
(21, 1, 4, 'Leche Condensada Nestlé (Lata/Caja)', 1, 0, 19),
(22, 1, 4, 'Almidón de Maíz Maizena', 1, 0, 14),
(24, 1, 4, 'Dulce de Leche El Angel (Lata/Pote)', 1, 0, 20),
(25, 1, 4, 'Arroz Blanco Tío Pelón', 1, 0, 4),
(26, 2, 4, 'Vinagre Claro (Genérico)', 1, 0, NULL),
(27, 1, 4, 'Frijol Rojo Seco (Genérico)', 1, 0, NULL),
(28, 1, 4, 'Jalea de Frutas Ujarras', 1, 0, 21),
(29, 1, 6, 'Garbanzos en Lata Del Monte', 1, 0, 9),
(30, 1, 4, 'Lentejas Secas Tío Pelón', 1, 0, 4),
(31, 1, 7, 'Aceite en Spray (Genérico)', 1, 0, NULL),
(32, 1, 4, 'Polvo de Hornear (Genérico)', 1, 0, NULL),
(33, 1, 4, 'Sopa de Pollo c/ Fideos Maggi (Instantánea)', 1, 0, 15),
(34, 1, 8, 'Cereal Komplete Almendra Kellogg\'s', 1, 0, 31),
(35, 1, 8, 'Cereal Choco Krispis Kellogg\'s', 1, 0, 31),
(36, 1, 8, 'Cereal Zucaritas Kellogg\'s', 1, 0, 31),
(37, 4, 14, 'Plástico Adhesivo/Film (Insumo)', 1, 0, NULL),
(38, 1, 4, 'Azúcar Blanco Ingenio Taboga', 1, 0, 7),
(39, 1, 4, 'Harina de Maíz Maseca', 1, 0, 16),
(40, 4, 14, 'Papel de Aluminio (Insumo)', 1, 0, NULL),
(42, 1, 4, 'Harina de Trigo (Genérica)', 1, 0, NULL),
(43, 1, 6, 'Palmito Cortado en Lata/Frasco (Genérico)', 1, 0, NULL),
(44, 1, 4, 'Crema de Espinaca (Instantánea/Genérica)', 1, 0, NULL),
(45, 2, 6, 'Leche Evaporada Nestlé (Lata)', 1, 0, 19),
(46, 1, 10, 'Sal Refinada (Genérica)', 1, 0, NULL),
(47, 2, 6, 'Leche de Coco Roland (Lata)', 1, 0, 30),
(48, 1, 6, 'Hongos Champiñones Richly (Enlatados)', 1, 0, 22),
(49, 2, 13, 'Salsa China Taiwan (Genérica)', 1, 0, NULL),
(50, 1, 5, 'Atún en Aceite (Genérico)', 1, 0, NULL),
(51, 1, 6, 'Petit Pois/Arvejas Verdes Del Monte (Enlatadas)', 1, 0, 9),
(52, 1, 6, 'Maíz Dulce Richly (Enlatado)', 1, 0, 22),
(53, 1, 5, 'Chuleta Riñonada de Cerdo La Granja', 1, 0, 10),
(54, 1, 5, 'Tilapia Nacional (Filete)', 1, 0, NULL),
(55, 1, 5, 'Trocitos de Cerdo La Granja', 1, 0, 10),
(56, 1, 5, 'Mezcla de Mariscos (Congelada)', 1, 0, NULL),
(57, 1, 5, 'Mondongo en Trocitos (Genérico)', 1, 0, NULL),
(58, 1, 5, 'Cubitos de Res (Carne)', 1, 0, NULL),
(59, 1, 5, 'Carne Molida de Res (Genérica)', 1, 0, NULL),
(60, 1, 5, 'Carne Molida de Cerdo La Granja', 1, 0, 10),
(61, 1, 5, 'Mano de Piedra de Res (Corte)', 1, 0, NULL),
(62, 1, 5, 'Trocitos de Res (Genérico)', 1, 0, NULL),
(63, 1, 5, 'Bistec de Cerdo La Granja', 1, 0, 10),
(64, 1, 5, 'Chuleta Ahumada de Cerdo La Granja', 1, 0, 10),
(65, 1, 5, 'Carne de Res Quititeña (Corte)', 1, 0, NULL),
(66, 1, 5, 'Huevo de Gallina (Unidad/Genérico)', 1, 0, NULL),
(67, 1, 5, 'Muslito de Pollo Pollo Rey', 1, 0, 3),
(68, 1, 4, 'Pre-Mezcla Chop Suey (Genérica)', 1, 0, NULL),
(69, 9, 12, 'Arreglados de Hojaldre (Panadería)', 1, 0, NULL),
(70, 10, 12, 'Pan Baguette (Panadería)', 1, 0, NULL),
(71, 1, 3, 'Apio Fresco', 1, 0, NULL),
(72, 1, 3, 'Arracache Fresco', 1, 0, NULL),
(73, 9, 2, 'Banano Maduro', 1, 0, NULL),
(74, 1, 2, 'Fruta Cas (Genérica)', 1, 0, NULL),
(75, 1, 3, 'Cebolla Morada Fresca', 1, 0, NULL),
(76, 1, 3, 'Cebolla Blanca Fresca', 1, 0, NULL),
(77, 4, 3, 'Cebollino Fresco', 1, 0, NULL),
(78, 9, 3, 'Chayote Tierno (Grande)', 1, 0, NULL),
(79, 1, 3, 'Chile Panameño Fresco', 1, 0, NULL),
(80, 9, 3, 'Chile Dulce/Pimiento Fresco', 1, 0, NULL),
(81, 9, 2, 'Coco Fresco', 1, 0, NULL),
(82, 9, 3, 'Coliflor Fresca', 1, 0, NULL),
(83, 9, 3, 'Culantro Corriente Fresco', 1, 0, NULL),
(84, 4, 3, 'Culantro Coyote Fresco', 1, 0, NULL),
(85, 1, 3, 'Jengibre Fresco', 1, 0, NULL),
(86, 9, 3, 'Lechuga Boston/Genérica', 1, 0, NULL),
(87, 9, 2, 'Limón Mandarina', 1, 0, NULL),
(88, 9, 2, 'Limón Mesino/Ácido', 1, 0, NULL),
(89, 1, 3, 'Maíz Cascado (Genérico)', 1, 0, NULL),
(90, 1, 3, 'Ñame Fresco', 1, 0, NULL),
(91, 4, 3, 'Orégano Fresco', 1, 0, NULL),
(92, 1, 2, 'Papaya Híbrida', 1, 0, NULL),
(93, 1, 2, 'Papaya Verde', 1, 0, NULL),
(94, 1, 3, 'Pepino Fresco', 1, 0, NULL),
(95, 9, 2, 'Piña Primera (Calidad)', 1, 0, NULL),
(96, 9, 3, 'Plátano Maduro', 1, 0, NULL),
(97, 9, 3, 'Plátano Verde', 1, 0, NULL),
(98, 9, 3, 'Remolacha Fresca', 1, 0, NULL),
(99, 1, 3, 'Repollo Verde Fresco', 1, 0, NULL),
(100, 1, 2, 'Sandía Fresca', 1, 0, NULL),
(101, 1, 3, 'Tiquisque Fresco', 1, 0, NULL),
(102, 1, 3, 'Tomate Primera (Calidad)', 1, 0, NULL),
(103, 4, 3, 'Tomillo Fresco', 1, 0, NULL),
(104, 1, 3, 'Vainica Fresca', 1, 0, NULL),
(105, 1, 3, 'Yuca Fresca', 1, 0, NULL),
(106, 1, 3, 'Zanahoria Fresca', 1, 0, NULL),
(107, 9, 12, 'Pan para Hamburguesa (Panadería)', 1, 0, NULL),
(108, 10, 12, 'Pan Lápiz Bimbo', 1, 0, 25),
(109, 10, 12, 'Pan Español (Panadería)', 1, 0, NULL),
(110, 9, 12, 'Pan Cena (Panadería)', 1, 0, NULL),
(111, 9, 12, 'Pan para Perro Caliente (Panadería)', 1, 0, NULL),
(112, 9, 12, 'Cangrejo Surimi sin Relleno', 1, 0, NULL),
(113, 1, 12, 'Pan Molido (Genérico)', 1, 0, NULL),
(114, 2, 7, 'Aceite de Soya California', 1, 0, 13),
(115, 9, 11, 'Té de Manzanilla (Bolsitas)', 1, 0, NULL),
(116, 2, 13, 'Salsa Inglesa Lizano', 1, 0, 23),
(117, 1, 13, 'Salsa Sabor a Ostiones (Genérica)', 1, 0, NULL),
(118, 2, 4, 'Vinagre de Manzana Banquete', 1, 0, 8),
(119, 1, 6, 'Vegetales Mixtos Del Monte (Enlatados)', 1, 0, 9),
(120, 1, 4, 'Miel de Abeja (Genérica)', 1, 0, NULL),
(121, 1, 4, 'Arroz Precocido Tío Pelón', 1, 0, 4),
(122, 1, 4, 'Frijol Negro Seco Tío Pelón', 1, 0, 4),
(123, 1, 4, 'Frijol Blanco Seco Tío Pelón', 1, 0, 4),
(124, 1, 4, 'Garbanzo Seco en Paquete Tío Pelón', 1, 0, 4),
(125, 1, 4, 'Masa para Empanadas Maseca', 1, 0, 16),
(126, 1, 4, 'Vitamaíz (Harina de Maíz fortificada)', 1, 0, NULL),
(127, 1, 4, 'Levadura (Seca/Fresca)', 1, 0, NULL),
(128, 1, 4, 'Cereal Choco Krispis Kellogg\'s', 1, 0, 31),
(129, 1, 4, 'Cereal Froot Loops Kellogg\'s', 1, 0, 31),
(130, 1, 4, 'Cereal Komplete Regular Kellogg\'s', 1, 0, 31),
(131, 1, 4, 'Cereal Choco Zucaritas Kellogg\'s', 1, 0, 31),
(132, 1, 4, 'Cereal Zucaritas Kellogg\'s', 1, 0, 31),
(133, 1, 6, 'Atún con Vegetales (Enlatado/Genérico)', 1, 0, NULL),
(134, 1, 6, 'Coctel de Frutas Del Monte (Enlatado)', 1, 0, 9),
(135, 1, 6, 'Leche Condensada Nestlé (Lata/Caja)', 1, 0, 19),
(136, 1, 6, 'Melocotón Rebanado Del Monte (Enlatado)', 1, 0, 9),
(137, 1, 13, 'Pasta de Tomate Banquete', 1, 0, 8),
(138, 1, 4, 'Dulce de Leche Nestlé (Lata/Pote)', 1, 0, 19),
(140, 8, 6, 'Vegetal Mixto Del Monte (Enlatado)', 1, 0, 9),
(141, 2, 4, 'Vinagre Balsámico Banquete', 1, 0, 8),
(142, 2, 4, 'Vino Blanco para Cocinar (Genérico)', 1, 0, NULL),
(143, 1, 4, 'Cola de Res (Corte)', 1, 0, NULL),
(144, 1, 10, 'Consomé de Mariscos Maggi', 1, 0, 15),
(145, 1, 4, 'Crema de Espárragos Maggi (Instantánea)', 1, 0, 15),
(146, 1, 4, 'Crema de Mariscos Maggi (Instantánea)', 1, 0, 15),
(147, 1, 4, 'Crema de Brócoli Maggi (Instantánea)', 1, 0, 15),
(148, 1, 13, 'Mostaza Preparada Banquete', 1, 0, 8),
(149, 1, 13, 'Salsa BBQ Banquete', 1, 0, 8),
(150, 1, 4, 'Sopa Knorr Frijol Negro (Instantánea)', 1, 0, NULL),
(151, 5, 13, 'Salsa para Pizza Zafran', 1, 0, 24),
(152, 1, 4, 'Sopa de Pollo Maggi (Instantánea)', 1, 0, 15),
(153, 1, 4, 'Sopa Olla de Carne Maggi (Instantánea)', 1, 0, 15),
(154, 2, 4, 'Vainilla (Esencia)', 1, 0, NULL),
(155, 2, 7, 'Aceite de Oliva Extra Virgen California', 1, 0, 13),
(156, 2, 7, 'Aceite para Freidor Pichinga California', 1, 0, 13),
(157, 2, 7, 'Aceite de Ajonjolí California', 1, 0, 13),
(158, 6, 11, 'Sirope (Azucarado/Saborizado)', 1, 0, NULL),
(159, 2, 4, 'Sirope de Maple/Pancake (Genérico)', 1, 0, NULL),
(160, 11, 11, 'Té de Manzanilla (Bolsitas)', 1, 0, NULL),
(161, 11, 11, 'Té Negro (Bolsitas)', 1, 0, NULL),
(162, 1, 11, 'Salvado de Avena (Genérico)', 1, 0, NULL),
(163, 1, 11, 'Horchata en Polvo Vigui', 1, 0, 28),
(164, 1, 4, 'Flan de Coco (Pre-Mezcla/Instantáneo)', 1, 0, NULL),
(165, 1, 4, 'Flan de Vainilla (Pre-Mezcla/Instantáneo)', 1, 0, NULL),
(166, 1, 4, 'Gelatina de Frambuesa (Pre-Mezcla)', 1, 0, NULL),
(167, 1, 4, 'Gelatina de Fresa (Pre-Mezcla)', 1, 0, NULL),
(168, 1, 4, 'Gelatina de Limón (Pre-Mezcla)', 1, 0, NULL),
(169, 1, 4, 'Gelatina de Uva (Pre-Mezcla)', 1, 0, NULL),
(170, 1, 4, 'Jalea de Guayaba Ujarras', 1, 0, 21),
(172, 1, 4, 'Jalea de Fresa Ujarras', 1, 0, 21),
(173, 1, 4, 'Pre Mezcla de Chocolate Nacional de Chocolates (Choco Listo)', 1, 0, 11),
(174, 1, 4, 'Pre Mezcla Queque de Vainilla (Genérica)', 1, 0, NULL),
(175, 1, 4, 'Pre Mezcla para Chorreadas Maseca', 1, 0, 16),
(176, 1, 4, 'Pasas (Uvas Secas)', 1, 0, NULL),
(177, 1, 4, 'Coco Rallado Seco (Genérico)', 1, 0, NULL),
(178, 1, 4, 'Leche en Polvo Entera Coronado', 1, 0, 17),
(179, 9, 14, 'Bolsa Polipak (Insumo)', 1, 0, NULL),
(180, 1, 10, 'Achiote en Polvo Productos Suprema', 1, 0, 6),
(181, 1, 10, 'Albahaca Molida Fábesco', 1, 0, 5),
(182, 1, 10, 'Ajo en Polvo Productos Suprema', 1, 0, 6),
(183, 1, 10, 'Base para Salsa Barbacoa Banquete', 1, 0, 8),
(184, 1, 10, 'Canela Molida Fábesco', 1, 0, 5),
(185, 1, 10, 'Canela en Astilla Fábesco', 1, 0, 5),
(186, 1, 10, 'Clavo de Olor Entero/Molido Fábesco', 1, 0, 5),
(187, 1, 10, 'Curry en Polvo Fábesco', 1, 0, 5),
(188, 1, 10, 'Laurel en Hoja Productos Suprema', 1, 0, 6),
(190, 1, 10, 'Empanizador para Pollo Rey (Saco 10kg)', 1, 0, 3),
(191, 1, 10, 'Marinador para Pollo Pollo Rey', 1, 0, 3),
(192, 1, 10, 'Orégano Molido Productos Suprema', 1, 0, 6),
(193, 1, 10, 'Páprika (Pimentón) Productos Suprema', 1, 0, 6),
(194, 1, 10, 'Perejil Seco Productos Suprema', 1, 0, 6),
(195, 1, 10, 'Pimienta Negra Molida Productos Suprema', 1, 0, 6),
(196, 1, 10, 'Pimienta Negra en Grano Productos Suprema', 1, 0, 6),
(197, 1, 10, 'Romero Seco Productos Suprema', 1, 0, 6),
(198, 1, 4, 'Pasta Plumas (Genérica)', 1, 0, NULL),
(199, 1, 4, 'Pasta Cabitos (Genérica)', 1, 0, NULL),
(200, 1, 4, 'Pasta Tornillos (Genérica)', 1, 0, NULL),
(201, 1, 4, 'Pasta Caracolitos (Genérica)', 1, 0, NULL),
(202, 1, 4, 'Pasta Coditos (Genérica)', 1, 0, NULL),
(203, 1, 4, 'Pasta Espagueti (Genérica)', 1, 0, NULL),
(204, 1, 4, 'Pasta Lasaña (Genérica)', 1, 0, NULL),
(205, 1, 5, 'Mortadela (Genérica) Sigma Alimentos', 1, 0, 2),
(206, 1, 5, 'Mortadela Mixta Sigma Alimentos', 1, 0, 2),
(207, 1, 5, 'Salchichón (Genérico) Sigma Alimentos', 1, 0, 2),
(208, 1, 5, 'Chorizo Precocido Sigma Alimentos', 1, 0, 2),
(209, 1, 5, 'Salchicha Económica Kimby', 1, 0, 12),
(210, 1, 5, 'Tocineta Ahumada La Granja', 1, 0, 10),
(211, 2, 1, 'Crema Dulce Dos Pinos', 1, 0, 1),
(212, 1, 8, 'Cereal Froot Loops Kellogg\'s', 1, 0, 31),
(213, 1, 8, 'Cereal Choco Zucaritas Kellogg\'s', 1, 0, 31),
(214, 1, 5, 'Atún con Vegetales (Enlatado/Genérico)', 1, 0, NULL),
(215, 1, 10, 'Consomé de Pollo Maggi', 1, 0, 15),
(216, 1, 3, 'Frijol Tierno Fresco', 1, 0, NULL),
(217, 1, 3, 'Ajo Fresco', 1, 0, NULL),
(218, 1, 5, 'Pechuga de Pollo a Granel Pollo Rey', 1, 0, 3),
(219, 9, 12, 'Tortillas de Maíz Maseca', 1, 0, 16),
(220, 1, 3, 'Papa Amarilla Fresca', 1, 0, NULL),
(221, 1, 4, 'Granola (Genérica)', 1, 0, NULL),
(222, 13, 4, 'Arroz para Gallo Pinto Tío Pelón', 1, 0, 4),
(223, 13, 4, 'Frijoles para Gallo Pinto Tío Pelón', 1, 0, 4),
(224, 13, 13, 'Salsa Rosada Banquete', 1, 0, 8),
(225, 1, 7, 'Aceite de Ajo California', 1, 0, 13),
(226, 1, 5, 'Cuartos de Muslo de Pollo Pollo Rey', 1, 0, 3),
(227, 1, 10, 'Comino Molido Productos Suprema', 1, 0, 6),
(228, 1, 2, 'Melón Fresco', 1, 0, NULL),
(229, 13, 13, 'Mayonesa Banquete', 1, 0, 8),
(230, 1, 3, 'Brócoli Fresco', 1, 0, NULL),
(231, 1, 3, 'Repollo Morado Fresco', 1, 0, NULL),
(232, 4, 3, 'Rábano Fresco', 1, 0, NULL),
(233, 9, 3, 'Zucchini Fresco', 1, 0, NULL),
(234, 1, 3, 'Tomate Verde (Genérico)', 1, 0, NULL),
(235, 1, 3, 'Ayote Sazón (Genérico)', 1, 0, NULL),
(236, 1, 3, 'Camote Fresco', 1, 0, NULL),
(237, 9, 3, 'Elote Fresco (Maíz)', 1, 0, NULL),
(238, 9, 2, 'Naranja Dulce (Genérica)', 1, 0, NULL),
(239, 1, 3, 'Ñampi Fresco', 1, 0, NULL),
(240, 4, 3, 'Espinaca Fresca', 1, 0, NULL),
(241, 1, 5, 'Muslo Deshuesado de Pollo Pollo Rey', 1, 0, 3),
(242, 1, 5, 'Nuggets de Pollo Pollo Rey', 1, 0, 3),
(243, 1, 3, 'Alfalfa (Genérica)', 1, 0, NULL),
(244, 4, 3, 'Perejil Fresco', 1, 0, NULL),
(245, 1, 2, 'Fresas Frescas', 1, 0, NULL),
(246, 1, 5, 'Ala de Pollo Pollo Rey', 1, 0, 3),
(247, 4, 3, 'Albahaca Fresca', 1, 0, NULL),
(248, 1, 10, 'Consomé de Res Maggi', 1, 0, 15),
(249, 4, 3, 'Romero Fresco', 1, 0, NULL),
(250, 13, 13, 'Salsa Tártara Banquete', 1, 0, 8),
(251, 1, 5, 'Calamar (Congelado)', 1, 0, NULL),
(252, 1, 5, 'Mejillón Entero (Congelado)', 1, 0, NULL),
(253, 1, 5, 'Camarón Pink (Congelado/Pelado)', 1, 0, NULL),
(254, 1, 5, 'Mariscada Mixta (Congelada)', 1, 0, NULL),
(255, 1, 5, 'Ternero (Carne de Res)', 1, 0, NULL),
(256, 9, 3, 'Puerro Fresco', 1, 0, NULL),
(257, 1, 3, 'Papa Mini Semilla', 1, 0, NULL),
(258, 9, 3, 'Berenjena Fresca', 1, 0, NULL),
(259, 9, 3, 'Ayote Tierno/Zapallo', 1, 0, NULL),
(260, 9, 2, 'Manzana Roja (Genérica)', 1, 0, NULL),
(261, 9, 12, 'Tortilla de Trigo para Wrap Bimbo', 1, 0, 25),
(262, 1, 4, 'Maní (Cacahuate)', 1, 0, NULL),
(263, 9, 2, 'Manzana Verde (Genérica)', 1, 0, NULL),
(264, 9, 2, 'Kiwi Fresco', 1, 0, NULL),
(265, 1, 5, 'Jamón Prensado Sigma Alimentos', 1, 0, 2),
(266, 1, 5, 'Mortadela Bologna Sigma Alimentos', 1, 0, 2),
(267, 1, 5, 'Mortadela Especial Sigma Alimentos', 1, 0, 2),
(268, 1, 5, 'Salchicha Ahumada Sigma Alimentos', 1, 0, 2),
(269, 1, 5, 'Paté Sigma Alimentos', 1, 0, 2),
(270, 1, 5, 'Salchichón sin Tocino Sigma Alimentos', 1, 0, 2),
(271, 1, 5, 'Salchichón Criollo Sigma Alimentos', 1, 0, 2),
(272, 1, 5, 'Salchichón Parrillero Sigma Alimentos', 1, 0, 2),
(273, 9, 3, 'Aguacate Fresco', 1, 0, NULL),
(274, 1, 13, 'Mayonesa en Galón Banquete', 1, 0, 8),
(275, 1, 4, 'Pasta Canelones (Genérica)', 1, 0, NULL),
(276, 13, 13, 'Salsa de Tomate Natural en Bandeja Banquete', 1, 0, 8),
(277, 1, 5, 'Chorizo Parrillero Sigma Alimentos', 1, 0, 2),
(278, 1, 5, 'Jamón de Pavo Sigma Alimentos', 1, 0, 2),
(279, 1, 5, 'Salchicha de Pollo Pollo Rey', 1, 0, 3),
(280, 1, 13, 'Salsa Rosada para Emparedado Banquete', 1, 0, 8),
(281, 9, 2, 'Mango Fresco', 1, 0, NULL),
(282, 9, 3, 'Kale Fresco', 1, 0, NULL),
(283, 1, 13, 'Mayonesa para Ensalada Banquete', 1, 0, 8),
(284, 1, 4, 'Gelatina Dietex Sweetwell (Baja en Calorías)', 1, 0, 29),
(285, 9, 12, 'Pan Integral de Molde Bimbo', 1, 0, 25),
(286, 1, 5, 'Tocineta (Genérica)', 1, 0, 10),
(287, 1, 5, 'Pechuga Deshuesada de Pollo Pollo Rey', 1, 0, 3),
(288, 1, 1, 'Queso Pizzero (Genérico)', 1, 0, NULL),
(289, 1, 10, 'Cebolla en Polvo Productos Suprema', 1, 0, 6),
(290, 1, 10, 'Nuez Moscada Molida Fábesco', 1, 0, 5),
(291, 2, 13, 'Aderezo Mil Islas Del Chef', 1, 0, 26),
(292, 1, 13, 'Salsa Sandwich Mc Cormick (Banquete)', 1, 0, 8),
(293, 1, 4, 'Azúcar Molida (Pulverizada) Ingenio Taboga', 1, 0, 7),
(294, 1, 4, 'Azúcar Moreno Ingenio Taboga', 1, 0, 7),
(295, 1, 8, 'Cereal de Hojuela (Genérico)', 1, 0, NULL),
(296, 1, 8, 'Cereal All Inklusive (Marca Desconocida)', 1, 0, NULL),
(297, 13, 4, 'Sacarina Ancla (Endulzante Artificial)', 1, 0, 27),
(298, 1, 5, 'Costilla de Cerdo La Granja', 1, 0, 10),
(299, 1, 5, 'Fajitas de Cerdo La Granja', 1, 0, 10),
(300, 1, 5, 'Lomo de Cerdo La Granja', 1, 0, 10),
(301, 1, 5, 'Bistec de Res (Genérico)', 1, 0, NULL),
(302, 1, 5, 'Fajitas de Res (Genérico)', 1, 0, NULL),
(303, 1, 5, 'Jarrete de Res (Corte)', 1, 0, NULL),
(304, 1, 5, 'Fajitas de Pollo Pollo Rey', 1, 0, 3),
(305, 1, 8, 'Cereal Komplete Pasas Kellogg\'s', 1, 0, 31),
(306, 4, 3, 'Berros Frescos', 1, 0, NULL),
(307, 9, 3, 'Zapallito Fresco', 1, 0, NULL),
(309, 1, 2, 'Mora Fresca', 1, 0, NULL),
(310, 4, 3, 'Hierba Buena Fresca', 1, 0, NULL),
(311, 9, 2, 'Mandarina Nacional', 1, 0, NULL),
(312, 3, 3, 'Chayote Cocoro (Genérico)', 1, 0, NULL),
(313, 9, 2, 'Naranja Importada (Genérica)', 1, 0, NULL),
(314, 1, 3, 'Chayote Tierno Pequeño', 1, 0, NULL),
(315, 1, 4, 'Mezcla para Panqueques Maizena', 1, 0, 14),
(316, 1, 3, 'Chile Jalapeño Fresco', 1, 0, NULL),
(317, 4, 3, 'Arúgula Fresca', 1, 0, NULL),
(318, 9, 3, 'Lechuga Lolo Rosa', 1, 0, NULL),
(319, 5, 11, 'Pulpa de Frutas Dos Pinos', 1, 0, 1),
(320, 5, 11, 'Pulpa de Guanábana Dos Pinos', 1, 0, 1),
(321, 5, 11, 'Pulpa de Mango Dos Pinos', 1, 0, 1),
(322, 5, 11, 'Pulpa de Maracuyá Dos Pinos', 1, 0, 1),
(323, 1, 2, 'Maracuyá Fresca', 1, 0, NULL),
(324, 9, 5, 'Tamal de Cerdo La Granja', 1, 0, 10),
(325, 5, 11, 'Pulpa de Piña Dos Pinos', 1, 0, 1),
(326, 5, 11, 'Pulpa de Piña Colada Dos Pinos', 1, 0, 1),
(327, 5, 11, 'Pulpa de Tamarindo Dos Pinos', 1, 0, 1),
(328, 1, 3, 'Arvejas Frescas (Genéricas)', 1, 0, NULL),
(329, 1, 3, 'Tomate Cherry Fresco', 1, 0, NULL),
(330, 9, 3, 'Lechuga Romana Fresca', 1, 0, NULL),
(331, 5, 13, 'Salsa Tabasco (Genérica)', 1, 0, NULL),
(332, 9, 12, 'Tortilla de Maíz Mediana Maseca', 1, 0, 16),
(333, 2, 9, 'Pulpa de Maracuyá Dos Pinos (Concentrado)', 1, 0, 1),
(334, 2, 9, 'Pulpa de Mango Dos Pinos (Concentrado)', 1, 0, 1),
(335, 2, 9, 'Frutas Tropicales Dos Pinos (Concentrado)', 1, 0, 1),
(336, 2, 9, 'Carambola Dos Pinos (Concentrado)', 1, 0, 1),
(337, 2, 9, 'Pulpa de Piña Dos Pinos (Concentrado)', 1, 0, 1),
(338, 2, 9, 'Pulpa de Guanábana Dos Pinos (Concentrado)', 1, 0, 1),
(339, 13, 11, 'Pulpa de Fruta c/ Edulcorante Dos Pinos (Concentrado)', 1, 0, 1),
(340, 2, 9, 'Pulpa de Tamarindo Dos Pinos (Concentrado)', 1, 0, 1),
(341, 1, 10, 'Nuez Moscada Entera Fábesco', 1, 0, 5),
(342, 1, 11, 'Té Frío de Melocotón Dos Pinos', 1, 0, 1),
(343, 1, 11, 'Té Frío Sabor a Limón Dos Pinos', 1, 0, 1),
(344, 1, 4, 'Mayonesa Heinz (Banquete)', 1, 0, 8),
(345, 13, 4, 'Salsa Rosada Del Chef', 1, 0, 26),
(346, 1, 10, 'Tomillo Triturado Fábesco', 1, 0, 5),
(347, 1, 10, 'Albahaca en Hojuela Fábesco', 1, 0, 5),
(348, 1, 10, 'Romero en Hojuela Fábesco', 1, 0, 5),
(349, 1, 10, 'Tomillo en Polvo Fábesco', 1, 0, 5),
(350, 1, 5, 'Posta de Cerdo en Cubitos La Granja', 1, 0, 10),
(351, 9, 12, 'Pan Cuadrado Integral Bimbo', 1, 0, 25),
(352, 1, 5, 'Mortadela de Pollo Pollo Rey', 1, 0, 3),
(353, 9, 2, 'Manzana Gala Fresca', 1, 0, NULL),
(354, 9, 2, 'Granadilla Fresca', 1, 0, NULL),
(355, 9, 2, 'Mandarina Importada (Genérica)', 1, 0, NULL),
(356, 9, 4, 'Tapa de Dulce (Ingenio Taboga)', 1, 0, 7),
(357, 1, 11, 'Horchata en Polvo Vigui', 1, 0, 28),
(358, 1, 11, 'Crema Dos Pinos', 1, 0, 1),
(359, 9, 5, 'Torta/Hamburguesa de Pollo Pollo Rey', 1, 0, 3),
(360, 1, 10, 'Orégano Granulado Productos Suprema', 1, 0, 6),
(361, 1, 3, 'Tomate Segunda (Calidad)', 1, 0, NULL),
(362, 4, 3, 'Eneldo Molido Fábesco', 1, 0, 5),
(363, 1, 4, 'Pasta Corbata Lazo (Genérica)', 1, 0, NULL),
(364, 1, 4, 'Pasta Cabello de Ángel (Genérica)', 1, 0, NULL),
(366, 1, 10, 'Cúrcuma Molida Fábesco', 1, 0, 5),
(367, 1, 10, 'Culantro en Polvo Fábesco', 1, 0, 5),
(368, 1, 5, 'Cecina de Res (Carne Seca)', 1, 0, NULL),
(369, 1, 5, 'Costilla de Res (Corte)', 1, 0, NULL),
(370, 1, 5, 'Hígado en Bistec o Fajitas de Res', 1, 0, NULL),
(375, 1, 5, 'Rabo de Res (Corte)', 1, 0, NULL),
(376, 9, 5, 'Torta/Hamburguesa de Res (Genérica)', 1, 0, NULL),
(377, 1, 5, 'Chicharrón de Concha Picado La Granja', 1, 0, 10),
(379, 1, 5, 'Cabeza de Pescado (Genérica)', 1, 0, NULL),
(380, 1, 5, 'Atún Fresco (Filete/Lomo)', 1, 0, NULL),
(381, 1, 5, 'Filete de Marlín Blanco', 1, 0, NULL),
(382, 1, 5, 'Macarela (Pescado)', 1, 0, NULL),
(383, 1, 5, 'Camarón Blanco Pelado (Congelado)', 1, 0, NULL),
(384, 1, 4, 'Tallarines de Arroz (Genérico)', 1, 0, NULL),
(385, 1, 4, 'Pasta Corbata Lazo (Genérica)', 1, 0, NULL),
(386, 1, 12, 'Pan Fresco Salado (Panadería)', 1, 0, NULL),
(387, 1, 10, 'Pimienta Blanca Molida Productos Suprema', 1, 0, 6),
(388, 1, 11, 'Limonada Dos Pinos (Concentrado)', 1, 0, 1),
(389, 1, 4, 'Jalea de Piña Ujarras', 1, 0, 21),
(390, 2, 11, 'Té Frío de Melocotón Dos Pinos (Concentrado)', 1, 0, 1),
(391, 2, 11, 'Té Frío Limón Dos Pinos (Concentrado)', 1, 0, 1),
(392, 1, 4, 'Galleta de Avena c/ Arándanos Pozuelo', 1, 0, 18),
(393, 3, 4, 'Galleta Club Extra Bokitas Pozuelo', 1, 0, 18),
(394, 3, 4, 'Galleta Soda Pozuelo', 1, 0, 18),
(395, 9, 11, 'Té de Frutas Mixtas (Bolsitas)', 1, 0, NULL),
(396, 9, 11, 'Té de Menta (Bolsitas)', 1, 0, NULL),
(397, 11, 4, 'Endulzante Artificial Sweetwell (Sobres/Polvo)', 1, 0, 29);







INSERT INTO `ingrediente_costo` (`id_ingrediente`, `id_unidad`, `costo_unitario`, `fecha_vigencia`) VALUES
/* Lácteos y Bebidas (Unidad Base: L o kg) */
(1, 2, 660.00, '2025-11-09 18:09:18'),
(2, 1, 1686.45, '2025-11-09 18:09:18'),
(3, 1, 2924.20, '2025-11-09 18:09:18'),
(4, 1, 5608.01, '2025-11-09 18:09:18'),
(5, 1, 3357.00, '2025-11-09 18:09:18'),
(6, 2, 3582.76, '2025-11-09 18:09:18'),
(7, 2, 1073.27, '2025-11-09 18:09:18'),
(11, 5, 3331.42, '2025-11-09 18:09:18'),
(211, 2, 3654.42, '2025-11-09 18:09:18'),
(21, 1, 2374.00, '2025-11-09 18:09:18'), /* Leche Condensada */

/* Azúcares, Cereales y Misc. (Unidad Base: Paq, kg, Botella) */
(12, 3, 5.00, '2025-11-09 18:09:18'), /* Azúcar sobre (costo por Paq) */
(17, 1, 3547.89, '2025-11-09 18:09:18'),
(158, 6, 569.83, '2025-11-09 18:09:18'),
(159, 2, 2913.00, '2025-11-09 18:09:18'),
(163, 1, 2300.00, '2025-11-09 18:09:18'),

/* Cereales */
(35, 1, 6117.00, '2025-11-09 18:09:18'),
(36, 1, 4831.35, '2025-11-09 18:09:18'),
(128, 1, 5493.10, '2025-11-09 18:09:18'),
(129, 1, 6240.00, '2025-11-09 18:09:18'),
(130, 1, 6951.00, '2025-11-09 18:09:18'),
(131, 1, 4978.00, '2025-11-09 18:09:18'),
(132, 1, 4266.12, '2025-11-09 18:09:18'),
(212, 1, 5974.00, '2025-11-09 18:09:18'),
(213, 1, 4978.00, '2025-11-09 18:09:18'),
(295, 1, 5198.00, '2025-11-09 18:09:18'),
(296, 1, 5158.00, '2025-11-09 18:09:18'),
(305, 1, 5836.00, '2025-11-09 18:09:18'),

/* Salsas y Aderezos (Unidad Base: kg, L, Gal) */
(15, 1, 1102.50, '2025-11-09 18:09:18'),
(16, 5, 1597.23, '2025-11-09 18:09:18'),
(49, 2, 1062.42, '2025-11-09 18:09:18'),
(116, 2, 2427.70, '2025-11-09 18:09:18'),
(137, 1, 1741.00, '2025-11-09 18:09:18'),
(148, 1, 1380.10, '2025-11-09 18:09:18'),
(149, 1, 1230.00, '2025-11-09 18:09:18'),
(151, 5, 4400.18, '2025-11-09 18:09:18'),
(229, 13, 11988.80, '2025-11-09 18:09:18'), /* Mayonesa Banquete (Base Bandeja) */
(250, 13, 23126.00, '2025-11-09 18:09:18'), /* Salsa Tártara (Base Bandeja) */
(274, 1, 1664.30, '2025-11-09 18:09:18'),
(276, 13, 200.00, '2025-11-09 18:09:18'),
(280, 13, 1304.00, '2025-11-09 18:09:18'),
(283, 1, 7300.00, '2025-11-09 18:09:18'),
(291, 2, 1793.45, '2025-11-09 18:09:18'),
(292, 1, 5118.30, '2025-11-09 18:09:18'),
(331, 5, 7169.22, '2025-11-09 18:09:18'),

/* Aceites y Jaleas */
(155, 2, 3978.92, '2025-11-09 18:09:18'),
(156, 2, 1035.44, '2025-11-09 18:09:18'),
(28, 1, 1506.00, '2025-11-09 18:09:18'),

/* Sopas y Consome */
(18, 1, 8118.00, '2025-11-09 18:09:18'),
(19, 1, 7975.00, '2025-11-09 18:09:18'),
(20, 1, 9775.00, '2025-11-09 18:09:18'),

/* Pulpa de Frutas (Unidad Base: Gal) */
(319, 5, 3850.00, '2025-11-09 18:09:18'),
(320, 5, 4400.00, '2025-11-09 18:09:18'),
(321, 5, 3850.00, '2025-11-09 18:09:18'),
(322, 5, 5000.00, '2025-11-09 18:09:18'),
(325, 5, 3850.00, '2025-11-09 18:09:18'),
(326, 5, 3850.00, '2025-11-09 18:09:18'),
(327, 5, 3850.00, '2025-11-09 18:09:18'),
(333, 2, 938.00, '2025-11-09 18:09:18'), /* Pulpa Maracuyá 23 (Base L) */
(388, 1, 4000.00, '2025-11-09 18:09:18'),

/* Tés Fríos (Unidad Base: L) */
(390, 2, 382.00, '2025-11-09 18:09:18'),
(391, 2, 382.00, '2025-11-09 18:09:18'),

/* Cárnicos y Preparados (Unidad Base: kg o unidad) */
(205, 1, 2080.00, '2025-11-09 18:09:18'),
(209, 1, 1524.00, '2025-11-09 18:09:18'),
(210, 1, 9500.00, '2025-11-09 18:09:18'),
(324, 9, 514.70, '2025-11-09 18:09:18'),
(359, 9, 585.00, '2025-11-09 18:09:18'),
(376, 9, 433.50, '2025-11-09 18:09:18'),

/* Insumos/Empaques (Unidad Base: Rollo, unidad) */
(37, 4, 9543.48, '2025-11-09 18:09:18'),
(40, 4, 3117.50, '2025-11-09 18:09:18'),
(179, 9, 4.48, '2025-11-09 18:09:18'),

/* Panadería y Tortillas (Unidad Base: unidad) */
(107, 9, 95.00, '2025-11-09 18:09:18'),
(219, 9, 60.00, '2025-11-09 18:09:18'),
(261, 9, 105.10, '2025-11-09 18:09:18'),
(332, 9, 25.00, '2025-11-09 18:09:18'),
(351, 9, 95.00, '2025-11-09 18:09:18'),

/* Latas/Enlatados (Unidad Base: Lata) */
(140, 8, 746.00, '2025-11-09 18:09:18'),
/* Tés y Endulzante (Nuevos) */
(115, 9, 33.28, '2025-11-09 18:09:18'), /* Te manzanilla (Base unidad) */
(160, 11, 30.19, '2025-11-09 18:09:18'), /* Té de manzanilla (Base Sobresito) */
(395, 9, 142.00, '2025-11-09 18:09:18'), /* Te frutas mixtas (Base unidad) */
(396, 9, 54.00, '2025-11-09 18:09:18'), /* Té de Menta (Base unidad) */
(397, 11, 18.61, '2025-11-09 18:09:18'); /* Endulzante (Base Sobresito) */


INSERT INTO `categoria_receta` (`id_categoria_receta`, `nombre`, `costo_max`, `id_usuario_creacion`) VALUES
(1, 'Bebidas', 600.00, 1),
(2, 'Carne de cerdo', 1500.00, 1),
(3, 'Carne de pollo', 1500.00, 1),
(4, 'Desayuno', 15000.00, 1),
(5, 'Arroz y frijoles', 10000.00, 1),
(6, 'Carne de res y embutidos', 1500.00, 1),
(7, 'Frutas', 600.00, 1),
(8, 'Ensaladas', 1000.00, 1),
(9, 'Carne atún y pescado', 3000.00, 1),
(10, 'Guarnición', 1000.00, 1),
(11, 'Vegetarianas', 1500.00, 1),
(12, 'Recetas de la tarde', 1500.00, 1),
(13, 'Emparedados', 1500.00, 1),
(14, 'Postres', 1500.00, 1)


INSERT INTO `receta` (`id_receta`, `id_receta_padre`, `id_categoria_receta`, `nombre_receta`, `version`, `preparacion`, `porciones`, `id_usuario_creacion`) VALUES
(1, NULL, 1, 'Leche sola en vaso', 1, NULL, NULL, 1),
(2, NULL, 1, 'Leche sola en taza', 1, NULL, NULL, 1),
(3, NULL, 1, 'Aguadulce en taza', 1, NULL, NULL, 1),
(4, NULL, 1, 'Chocolate eingredientexrecetan taza', 1, NULL, NULL, 1),
(5, NULL, 1, 'Aguadulce con leche en vaso', 1, NULL, NULL, 1),
(6, NULL, 1, 'Aguadulce con leche en taza', 1, NULL, NULL, 1),
(7, NULL, 1, 'Té negro en taza', 1, NULL, NULL, 1),
(8, NULL, 1, 'Té negro con leche en vaso', 1, NULL, NULL, 1),
(9, NULL, 1, 'Té manzanilla en taza', 1, NULL, NULL, 1),
(10, NULL, 1, 'Café negro en taza', 1, NULL, NULL, 1),
(11, NULL, 1, 'Café con leche en taza', 1, NULL, NULL, 1),
(12, NULL, 1, 'Café negro en vaso', 1, NULL, NULL, 1),
(13, NULL, 1, 'Chocolate en vaso', 1, NULL, NULL, 1),
(14, NULL, 1, 'Aguadulce en vaso', 1, NULL, NULL, 1),
(15, NULL, 1, 'Café con leche en vaso', 1, NULL, NULL, 1),
(16, NULL, 1, 'Té negro con leche en taza', 1, NULL, NULL, 1),
(17, NULL, 1, 'Té manzanilla en vaso', 1, NULL, NULL, 1),
(18, NULL, 1, 'Té negro en vaso', 1, NULL, NULL, 1),
(19, NULL, 2, 'Chuleta a la plancha', 1, NULL, NULL, 1),
(20, NULL, 2, 'Cerdo en salsa agridulce', 1, NULL, NULL, 1),
(21, NULL, 2, 'Frijoles tiernos con cerdo', 1, NULL, NULL, 1),
(22, NULL, 2, 'Pozol', 1, NULL, NULL, 1),
(23, NULL, 3, 'Arroz con pollo', 1, '1. Cocinar las pechugas en agua con sal y especias.\n2. Desmenuzar las pechugas de pollo.\n3. Reservar el caldo de pollo para agregarlo al arroz con el resto de ingredientes.\n4. En el sartén, sofreír los olores (vegetales). Seguidamente, agregar vainica, zanahoria y el pollo. Mezclar junto con el arroz. Tapar y cocinar a fuego medio. Revisar y mezclar el arroz cada vez que lo crea necesario.\n5. Servir porción de 6 onzas.', NULL, 1),
(24, NULL, 4, 'Arepas con miel', 1, NULL, NULL, 1),
(25, NULL, 4, 'Gallo de salchichón', 1, NULL, NULL, 1),
(26, NULL, 4, 'Tostada con queso', 1, NULL, NULL, 1),
(27, NULL, 4, 'Tostada con especias', 1, NULL, NULL, 1),
(28, NULL, 4, 'Queso en tajada', 1, NULL, NULL, 1),
(29, NULL, 4, 'Prensada de queso', 1, NULL, NULL, 1),
(30, NULL, 4, 'Picadillo de papa', 1, NULL, NULL, 1),
(31, NULL, 4, 'Palitos de queso y especias', 1, NULL, NULL, 1),
(32, NULL, 4, 'Natilla', 1, NULL, NULL, 1),
(33, NULL, 4, 'Mortadela en tajada', 1, NULL, NULL, 1),
(34, NULL, 4, 'Jamón en tajada', 1, NULL, NULL, 1),
(35, NULL, 4, 'Granola con leche', 1, NULL, NULL, 1),
(36, NULL, 4, 'Granola sola', 1, NULL, NULL, 1),
(37, NULL, 4, 'Gallo Pinto', 1, NULL, NULL, 1),
(38, NULL, 4, 'Gallo de Chorizo', 1, NULL, NULL, 1),
(39, NULL, 4, 'Chorizo corriente', 1, NULL, NULL, 1),
(40, NULL, 4, 'Huevos con salchicha', 1, NULL, NULL, 1),
(41, NULL, 4, 'Salchicha sola', 1, NULL, NULL, 1),
(42, NULL, 4, 'Salchicha en salsa', 1, NULL, NULL, 1),
(43, NULL, 5, 'Frijoles', 1, '1. Escoger los frijoles para retirar elementos extraños.\n2. Colocar los frijoles en el sartén reclinable y agregar agua hasta cubrir. Cocinar a fuego máximo (400°C) por 4 a 4.5 horas hasta que estén suaves.\n3. Una vez suaves, remover, agregar la sal y cocinar por unos 10 minutos más.\n4. Después, servir en bandejas completas (full).', NULL, 1),
(44, NULL, 6, 'Cubitos de res en salsa', 1, NULL, NULL, 1),
(45, NULL, 8, 'Ensalada Reserva', 1, NULL, NULL, 1),
(46, NULL, 4, 'Omelette', 1, NULL, NULL, 1),
(47, NULL, 4, 'Huevo frito', 1, NULL, NULL, 1),
(48, NULL, 4, 'Huevo con cebollino', 1, NULL, NULL, 1),
(49, NULL, 4, 'Huevo con jamón', 1, NULL, NULL, 1),
(51, NULL, 4, 'Palitos con queso', 1, NULL, NULL, 1),
(52, NULL, 4, 'Picadillo de arracache', 1, NULL, NULL, 1),
(53, NULL, 4, 'Palitos con especias', 1, NULL, NULL, 1),
(54, NULL, 3, 'Pollo frito en cuartos', 1, NULL, NULL, 1),
(55, NULL, 4, 'Plátano maduro', 1, NULL, NULL, 1),
(56, NULL, 4, 'Tostadas con miel', 1, NULL, NULL, 1),
(57, NULL, 4, 'Tostada con jalea', 1, NULL, NULL, 1),
(58, NULL, 4, 'Arepas de banano', 1, NULL, NULL, 1),
(59, NULL, 4, 'Chorreada', 1, NULL, NULL, 1),
(60, NULL, 4, 'Cereal con leche', 1, NULL, NULL, 1),
(61, NULL, 4, 'Cereal sin leche', 1, NULL, NULL, 1),
(63, NULL, 4, 'Pan en rebanadas', 1, NULL, NULL, 1),
(64, NULL, 7, 'Porción Melón', 1, NULL, NULL, 1),
(65, NULL, 7, 'Porción de papaya', 1, NULL, NULL, 1),
(66, NULL, 7, 'Porción de piña', 1, NULL, NULL, 1),
(67, NULL, 7, 'Porción de sandía', 1, NULL, NULL, 1),
(68, NULL, 8, 'Pico de Gallo', 1, NULL, NULL, 1),
(69, NULL, 8, 'Ensalada Carta blanca', 1, NULL, NULL, 1),
(70, NULL, 8, 'Ensalada Caracolitos con olores', 1, NULL, NULL, 1),
(71, NULL, 8, 'Ensalada Costa Rica', 1, NULL, NULL, 1),
(72, NULL, 8, 'Ensalada China', 1, NULL, NULL, 1),
(73, NULL, 8, 'Ensalada Caracolitos con atún', 1, '1. Cocinar la pasta en agua hirviendo con un poquito de sal, hasta que esté al dente, dejar enfriar.\n2. Lavar, picar los olores y tener listos para adicionar a la pasta con el atún.\n3. Mezclar la pasta con olores, mayonesa y el atún.\n4. Sazonar con sal y pimienta, y probar antes de servir.\n5. Servir en frío.', NULL, 1),
(74, NULL, 8, 'Ensalada de Lechuga y tomate', 1, NULL, NULL, 1),
(75, NULL, 8, 'Multicolor', 1, NULL, NULL, 1),
(76, NULL, 8, 'Escabeche', 1, NULL, NULL, 1),
(77, NULL, 8, 'Papa con atún', 1, NULL, NULL, 1),
(78, NULL, 8, 'Primaveral', 1, '1. Lavar, pelar o picar los ingredientes.\n2. Mezclar todos los ingredientes ya procesados hasta que queden bien homogéneos.\n3. Agregar jugo de limón, sal y pimienta. Probar antes de servir.', NULL, 1),
(79, NULL, 8, 'Repollo, tomate y culantro', 1, '1. Lavar, desinfectar y procesar los vegetales.\n2. Mezclar repollo, tomate, culantro y adicionar limón.\n3. Sazonar con sal y pimienta, y probar antes de servir en tacitas.', NULL, 1),
(80, NULL, 8, 'Salpicón de pepino', 1, NULL, NULL, 1),
(81, NULL, 8, 'Tricolor', 1, NULL, NULL, 1),
(82, NULL, 7, 'Banano', 1, NULL, NULL, 1),
(83, NULL, 8, 'Ensalada Mixta Natural', 1, NULL, NULL, 1),
(84, NULL, 3, 'Alita de pollo frita', 1, NULL, NULL, 1),
(85, NULL, 3, 'Chop suey seco con pollo', 1, NULL, NULL, 1),
(86, NULL, 3, 'Cuarto de pollo con salsa Caribeña', 1, NULL, NULL, 1),
(87, NULL, 3, 'Frijoles blancos con pollo', 1, NULL, NULL, 1),
(88, NULL, 3, 'Muslo de pollo deshuesado a la plancha', 1, NULL, NULL, 1),
(89, NULL, 3, 'Muslo deshuesado con salsa naranja', 1, NULL, NULL, 1),
(90, NULL, 3, 'Muslo deshuesado al ajillo', 1, NULL, NULL, 1),
(91, NULL, 3, 'Pollo a la antonieta', 1, NULL, NULL, 1),
(92, NULL, 3, 'Pollo a la stroganoff', 1, NULL, NULL, 1),
(93, NULL, 3, 'Pollo Costra Mostaza', 1, NULL, NULL, 1),
(94, NULL, 3, 'Espagueti con pollo en Salsa blanca', 1, NULL, NULL, 1),
(95, NULL, 3, 'Vegetales Salteados con pollo', 1, NULL, NULL, 1),
(96, NULL, 9, 'Suave de pescado', 1, NULL, NULL, 1),
(97, NULL, 9, 'Arroz con atún', 1, NULL, NULL, 1),
(98, NULL, 9, 'Arroz con mariscos', 1, NULL, NULL, 1),
(99, NULL, 9, 'Arroz con camarones', 1, NULL, NULL, 1),
(100, NULL, 9, 'Pescado a la Meuniere', 1, NULL, NULL, 1),
(101, NULL, 9, 'Pescado al horno y olores', 1, NULL, NULL, 1),
(102, NULL, 9, 'Espagueti con salsa, queso y atún', 1, NULL, NULL, 1),
(103, NULL, 9, 'Suflé de atún', 1, NULL, NULL, 1),
(104, NULL, 9, 'Tilapia al horno', 1, NULL, NULL, 1),
(105, NULL, 6, 'Molde de carne', 1, '1. En un sartén pero sin calor, mezclar mitad de carne de res y mitad de cerdo. Remover para ir soltando la carne, agregar huevos, Salsa Lizano, tomate, chile, cebolla, ajo, maíz, pimienta negra, consomés y al final la harina.\n2. Hacer una torta de prueba para evaluar el sabor y corregir si es necesario.\n3. Alistar las bandejas de 1/4 pequeña con 2 palas metálicas (la pequeña), aplanar y cubrir toda la bandeja hasta la mitad (10 bandejas para llenar el carro del Rational).\n4. Precalentar el Rational en modo "carne en masa", a 80°C con dorado (más del medio) durante aproximadamente 30 minutos, hasta asegurarse de que se alcance los 80°C. Colocar la sonda.\n5. Sacar el carro y precalentar el Rational en modo "dorado final" por 5 minutos (en dorado más del medio). Al sonar, introducir el carro para completar el dorado.\n6. Porcionar en 18 porciones (3x6).', 18, 1),
(106, NULL, 6, 'Ternero a la crema', 1, NULL, NULL, 1),
(107, NULL, 6, 'Arroz con carne', 1, NULL, NULL, 1),
(108, NULL, 6, 'Carne China', 1, NULL, NULL, 1),
(109, NULL, 6, 'Papas con carne', 1, NULL, NULL, 1),
(110, NULL, 6, 'Carne estilo oriental', 1, NULL, NULL, 1),
(111, NULL, 6, 'Carne sudada', 1, NULL, NULL, 1),
(112, 44, 6, 'Cubitos de res en salsa', 1, NULL, NULL, 1),
(113, NULL, 6, 'Cubitos de res con hongos', 1, NULL, NULL, 1),
(114, NULL, 6, 'Espagueti a la boloñesa', 1, '1. Sofreír 5 ingredientes (olores), harina, pasta. Agregar tomate licuado y darle cocción hasta que hierva.\n2. Añadir 1 kg de azúcar o menos para bajar la acidez, sal, pimienta, ajo en polvo, consomé de res. Añadir la carne molida.', NULL, 1),
(115, NULL, 6, 'Estofado de Carne', 1, NULL, NULL, 1),
(116, NULL, 6, 'Ternero en salsa', 1, NULL, NULL, 1),
(117, NULL, 10, 'Crema de espinacas', 1, NULL, NULL, 1),
(118, NULL, 10, 'Picadillo de chayote con maíz', 1, NULL, NULL, 1),
(119, NULL, 10, 'Picadillo de Chayote', 1, '1. Cocinar el chayote en el Rational por 20 minutos en modo vegetales al vapor.\n2. Derretir 5 barras de margarina con achiote y sofreír el chile y la cebolla hasta cristalizar.\n3. Añadir sal, consomé, ajo, pimienta negra y salsa inglesa. Mover por 2 minutos con la temperatura al máximo (400°C).\n4. Bajar a 300°C y añadir el chayote y el perejil. Mezclar hasta que quede homogéneo durante 5 minutos y luego retirar.', NULL, 1),
(120, NULL, 10, 'Berenjena con tomate y queso', 1, NULL, NULL, 1),
(121, NULL, 10, 'Brócoli con maíz', 1, NULL, NULL, 1),
(122, NULL, 10, 'Brócoli con coliflor', 1, '1. Calentar aceite, derretir margarina, aceite de ajo. Sofreír ajo, cebolla y chile dulce. Agregar la harina y formar un roux.\n2. Agregar un caldo de verdura, agua o leche al roux y darle el punto de textura.\n3. Pre-cocinar el brócoli y coliflor por 15 minutos en el Rational en modo vapor.\n4. Agregar los vegetales al roux, mezclar y rectificar la sazón.', NULL, 1),
(123, NULL, 10, 'Cazuela de hortalizas', 1, NULL, NULL, 1),
(124, NULL, 10, 'Crema de brócoli', 1, NULL, NULL, 1),
(125, NULL, 10, 'Picadillo de papa con zanahoria', 1, NULL, NULL, 1),
(126, NULL, 10, 'Vainica y zanahoria', 1, NULL, NULL, 1),
(127, NULL, 10, 'Picadillo de plátano verde', 1, NULL, NULL, 1),
(128, NULL, 10, 'Zanahoria glaseada', 1, NULL, NULL, 1),
(129, NULL, 10, 'Picadillo de papaya verde', 1, NULL, NULL, 1),
(130, NULL, 10, 'Zucchini y maíz dulce', 1, NULL, NULL, 1),
(131, 130, 10, 'Zucchini con maíz dulce', 1, NULL, NULL, 1),
(132, NULL, 10, 'Verduritas en salsa china', 1, NULL, NULL, 1),
(133, NULL, 10, 'Vegetales al ajillo', 1, NULL, NULL, 1),
(134, NULL, 10, 'Vainica con coliflor con salsa', 1, NULL, NULL, 1),
(135, NULL, 10, 'Picadillo de papa, vainica y zanahoria', 1, '1. Lavar y procesar los vegetales.\n2. Hacer un precocinado de los vegetales en el Rational al vapor.\n3. Agregar aceite de ajo al sartén, adicionar vegetales y condimentar al gusto.\n4. Mezclar y probar el platillo antes de sacarlo a la barra de atención.', NULL, 1),
(136, NULL, 10, 'Coliflor salteada', 1, '1. Cocinar Coliflor en Rational por 15 minutos en función vapor.\n2. Sofreír en aceite, margarina, chile, y cebolla. Agregar sal, ajo, pimienta. Dejar sofreír bien y añadir 1 L de agua.\n3. Agregar coliflor y mezclar bien. Dejar 10 minutos de reposo y servir.', NULL, 1),
(137, NULL, 10, 'Crema de ayote sazón', 1, NULL, NULL, 1),
(138, NULL, 10, 'Guiso de ayote tierno en leche', 1, NULL, NULL, 1),
(139, NULL, 10, 'Guiso de ayote tierno', 1, NULL, NULL, 1),
(140, NULL, 8, 'Ensalada Alemana', 1, NULL, NULL, 1),
(141, NULL, 8, 'Ceviche de plátano', 1, NULL, NULL, 1),
(142, NULL, 9, 'Tilapia en Salsa Tártara', 1, NULL, NULL, 1),
(143, NULL, 9, 'Pasta con camarones', 1, 'Salsa Criolla: Llevar los "fondos" del tomate con el chile dulce, la cebolla, el ajo, el tomillo, el orégano, el laurel y reservar.\nCocinar la pasta: Llenar sartén a 3/4 con 0.5 kg de sal y 3 L de aceite. Dejar hervir y agregar 20 kg de pasta.\nSofrito: Blanquear el camarón (sumergir en agua hirviendo con consomé de marisco hasta que cambie de color). Sacar en 10 a 15 minutos.\nEn aceite de ajo y margarina con laurel, sofreír cebolla y chile para perfumar más la salsa criolla. Agregar camarones, la pasta corta suelta y rectificar sabor.\nAl final, agregar cebollino.', NULL, 1),
(144, NULL, 2, 'Chuleta ahumada hawaiana', 1, NULL, NULL, 1),
(145, NULL, 6, 'Lomo saltado', 1, NULL, NULL, 1),
(146, NULL, 6, 'Carne Diana', 1, NULL, NULL, 1),
(147, NULL, 6, 'Pasta con brócoli y jamón', 1, NULL, NULL, 1),
(148, NULL, 6, 'Chop Suey mixto', 1, NULL, NULL, 1),
(149, NULL, 6, 'Carne con papa y yuca', 1, NULL, NULL, 1),
(150, NULL, 6, 'Carne con papas', 1, NULL, NULL, 1),
(151, NULL, 6, 'Papas con chorizo', 1, NULL, NULL, 1),
(152, NULL, 3, 'Pollo achiotado', 1, NULL, NULL, 1),
(153, NULL, 3, 'Muslo de pollo deshuesado a la mostaza', 1, NULL, NULL, 1),
(154, NULL, 3, 'Muslito de pollo frito', 1, '1. Marinar el día anterior con sal, marinador, ajo, pimienta y agua hasta cubrir (2 a 2.5 baldes).\n2. Escurrir el pollo y pasarlo por el empanizador.\n3. Freír 20 piezas por canasta durante 20 minutos a 180°C.', NULL, 1),
(155, NULL, 3, 'Muslito de pollo agridulce', 1, NULL, NULL, 1),
(156, NULL, 3, 'Muslito de pollo cacciatore', 1, NULL, NULL, 1),
(157, NULL, 3, 'Pollo escabechado', 1, NULL, NULL, 1),
(158, 44, 6, 'Cubitos de res en salsa', 1, NULL, NULL, 1),
(159, NULL, 10, 'Sopa negra con huevo', 1, '1. Lavar y procesar tomates con los demás olores.\n2. Cocinar los frijoles, agregar sal al final.\n3. Licuar los frijoles con los olores.\n4. Colocar la mezcla anterior en cocción hasta hervir y adicionar el tomate troceado en cubitos pequeños.\n5. Agregar los huevos crudos uno a uno en la mezcla anterior.\n6. Sazonar con sal y pimienta, y rectificar sabor con especias.\n7. Al final, agregar culantro picado para servir.', NULL, 1),
(160, NULL, 6, 'Curry de carne con vegetales', 1, NULL, NULL, 1),
(161, NULL, 4, 'Dados de queso', 1, NULL, NULL, 1),
(162, NULL, 6, 'Lentejas con res', 1, NULL, NULL, 1),
(163, NULL, 11, 'Arroz con palmito', 1, NULL, NULL, 1),
(164, NULL, 12, 'Crepas de dulce y banano', 1, NULL, NULL, 1),
(165, NULL, 2, 'Garbanzos con cerdo', 1, NULL, NULL, 1),
(166, NULL, 12, 'Yuca frita', 1, NULL, NULL, 1),
(167, NULL, 11, 'Pasta con pesto', 1, NULL, NULL, 1),
(168, NULL, 10, 'Suflé de espinaca', 1, NULL, NULL, 1),
(169, NULL, 4, 'Arepas con miel (Premezcla)', 1, NULL, NULL, 1),
(170, 37, 4, 'Gallo Pinto 2020', 1, '1. Agregar el aceite al sartén reclinable, sofreír el chile y la cebolla picados hasta cristalizar.\n2. Añadir las bandejas de frijoles, luego el consomé de pollo, la pimienta, el ajo en polvo y la salsa inglesa. Dejar que se cocinen bien hasta que hiervan y se sequen los frijoles.\n3. Adicionar las costras de arroz y el arroz blanco e inmediatamente el culantro picado. Mezclar bien y dejar secar a 300°C.', NULL, 1),
(171, NULL, 4, 'Torta de huevo con olores', 1, NULL, NULL, 1),
(172, NULL, 10, 'Brócoli con maíz 2020', 1, NULL, NULL, 1),
(173, NULL, 11, 'Pasta con vegetales', 1, NULL, NULL, 1),
(174, 173, 11, 'Pasta con vegetales', 1, NULL, NULL, 1),
(175, NULL, 11, 'Lentejas con ayote', 1, NULL, NULL, 1),
(176, NULL, 11, 'Pastel de palmito', 1, NULL, NULL, 1),
(177, NULL, 11, 'Pasta con salsa blanca', 1, NULL, NULL, 1),
(178, NULL, 11, 'Tortilla de espinaca y hongos', 1, NULL, NULL, 1),
(179, NULL, 11, 'Arroz con verduras', 1, NULL, NULL, 1),
(180, NULL, 11, 'Lentejas con zanahorias y vainica', 1, NULL, NULL, 1),
(181, NULL, 11, 'Risotto de zapallo', 1, NULL, NULL, 1),
(182, NULL, 11, 'Sopa Minestrone', 1, NULL, NULL, 1),
(183, NULL, 11, 'Paella de verduras', 1, NULL, NULL, 1),
(184, NULL, 11, 'Pasta con vegetales y salsa de piña', 1, NULL, NULL, 1),
(185, NULL, 11, 'Sopa de Garbanzos', 1, NULL, NULL, 1),
(186, NULL, 11, 'Arroz con lentejas', 1, NULL, NULL, 1),
(187, NULL, 11, 'Garbanzos en salsa de tomate', 1, NULL, NULL, 1),
(188, NULL, 11, 'Pasta Napolitana', 1, NULL, NULL, 1),
(189, NULL, 1, 'Batido Verde', 1, NULL, NULL, 1),
(190, NULL, 13, 'Emparedado de Pollo', 1, NULL, NULL, 1),
(191, NULL, 9, 'Barquitos de Zucchini', 1, NULL, NULL, 1),
(192, NULL, 6, 'Lasaña de Carne', 1, NULL, NULL, 1),
(193, NULL, 13, 'Emparedado de Aguacate', 1, NULL, NULL, 1),
(194, NULL, 6, 'Canelones de carne y queso', 1, NULL, NULL, 1),
(195, NULL, 11, 'Salsa de tomate natural', 1, NULL, NULL, 1),
(196, NULL, 6, 'Mondongo en salsa', 1, NULL, NULL, 1),
(197, NULL, 13, 'Emparedado de Jamón', 1, NULL, NULL, 1),
(198, NULL, 13, 'Salsa rosada', 1, NULL, NULL, 1),
(199, NULL, 8, 'Ensalada campesina', 1, '1. Antes de procesar la materia prima, revisar detenidamente el estado en que se encuentren los productos.\n2. Seguidamente, lavar y desinfectar.\n3. Procesar el repollo blanco y picarlo finamente, al igual que el repollo morado. Procesar el tomate en cuadros, la cebolla en Brunoise, el culantro fino y los chiles dulces en tiras Brunoise. Exprimir los limones para obtener su jugo.\n4. Agregar sal al gusto.', NULL, 1),
(200, NULL, 8, 'Ensalada de Lechuga y Manzana', 1, NULL, NULL, 1),
(201, NULL, 8, 'Ensalada Pico de Gallo', 1, NULL, NULL, 1),
(202, NULL, 8, 'Repollo con piña', 1, '1. Revisar el producto antes de lavar y procesar.\n2. Lavar y desinfectar los alimentos antes de procesar.\n3. Procesar los alimentos: repollo picado finamente y blanquear para quitarle dureza y gases.\n4. Piña en cuadritos, cebolla en agua de azúcar o vinagre para suavizar, y cortada en julianas muy delgadas.\n5. Agregar azúcar, sal y mayonesa al gusto.', NULL, 1),
(203, NULL, 8, 'Ensalada Otoño', 1, NULL, NULL, 1),
(204, NULL, 8, 'Ensalada rusa', 1, '1. Revisar que el producto esté en buen estado.\n2. Lavar y desinfectar.\n3. Procesar y luego cocinar papa, huevos y remolacha.\n4. Procesar ingredientes cocinados en cuadritos.\n5. Incorporar todos los ingredientes, agregar mayonesa, sal y pimienta al gusto.', NULL, 1),
(205, NULL, 13, 'Emparedado de Atún', 1, NULL, NULL, 1),
(206, NULL, 8, 'Ensalada Taras', 1, '1. Revisar que el producto se encuentre en óptimas condiciones.\n2. Lavar y desinfectar la materia prima.\n3. Procesar el repollo blanco picado finamente, el tomate en cuadros, la cebolla morada en cuadros finos o julianas. Picar el culantro finamente, exprimir los limones. Agregar sal y pimienta al gusto.\n4. Incorporar todos los ingredientes, dependiendo de la técnica que se utilice con el repollo para que no pierda el líquido. Revolver y probar el gusto con nutricionista.', NULL, 1),
(207, NULL, 8, 'Ceviche de Mango 2020', 1, NULL, NULL, 1),
(208, NULL, 8, 'Ensalada Julio', 1, '1. Antes de procesar, revise el producto.\n2. Lavar la materia prima con el sanitizante.\n3. Procesar en cuadros pequeños el tomate, pepino, mango, apio, cebolla. Exprimir los limones, agregar agua, azúcar, sal y pimienta al gusto.', NULL, 1),
(209, NULL, 8, 'Ensalada 31 de Julio', 1, '1. Lechuga deshojada, lavada y picada.\n2. Zanahoria pelada, rallada o en rodajas.\n3. Rábano picado o en rodajas.\nAderezo: Agregar mostaza, azúcar y limones en un tazón. Mezclar todos los ingredientes y agregar a la ensalada.', NULL, 1),
(210, NULL, 12, 'Pan de Elote', 1, NULL, NULL, 1),
(211, NULL, 12, 'Tamal de Maicena', 1, NULL, NULL, 1),
(213, NULL, 5, 'Arroz Rational hervido', 1, NULL, NULL, 1),
(214, NULL, 4, 'Torta de Plátano', 1, NULL, NULL, 1),
(215, NULL, 8, 'Ensalada Rosa', 1, NULL, NULL, 1),
(216, NULL, 8, 'Ensalada de Otoño', 1, '1. Revisar producto, lavar y desinfectar como es debido.\n2. Procesar el tomate en gajos. Rallar o cortar el queso en cuadros para adornar por encima. Picar o rallar el repollo. Alfalfa para adornar y sal al gusto.', NULL, 1),
(217, NULL, 8, 'Ensalada Criolla', 1, NULL, NULL, 1),
(218, NULL, 8, 'Repollo, piña y hongos', 1, NULL, NULL, 1),
(219, NULL, 8, 'Vinagreta de Pepino', 1, NULL, NULL, 1),
(220, NULL, 8, 'Pasta con atún', 1, NULL, NULL, 1),
(221, NULL, 8, 'Ensalada Kale', 1, NULL, NULL, 1),
(222, NULL, 8, 'Mayonesa para ensaladas', 1, '1. Colocar vinagre, huevos y sal en el frasco de la licuadora. Licuar por 30 segundos e incorporar el aceite en hilo.', NULL, 1),
(223, NULL, 8, 'Ensalada K-soda', 1, NULL, NULL, 1),
(224, NULL, 8, 'Ensalada de Vainica con huevo', 1, NULL, NULL, 1),
(225, NULL, 8, 'Repollo en Escabeche', 1, NULL, NULL, 1),
(226, NULL, 13, 'Emparedado de Carne', 1, NULL, NULL, 1),
(227, NULL, 8, 'Pepino, tomate y cebolla', 1, NULL, NULL, 1),
(228, NULL, 8, 'Otoño sin repollo', 1, NULL, NULL, 1),
(229, NULL, 3, 'Pollo al ajillo (en cuartos)', 1, '1. Marinar el pollo el día anterior.\n2. Escurrir el pollo.\n3. Elaborar el aceite de especias y reservarlo para el día siguiente.\n4. Barnizar con la mezcla del aceite y olores.\n5. Colocar en parrillas 30 minutos en el Rational en modo parrilla.', NULL, 1),
(230, 141, 8, 'Ceviche de plátano 2020', 1, NULL, NULL, 1),
(231, NULL, 8, 'Ensalada Kale y olores', 1, NULL, NULL, 1),
(232, NULL, 13, 'Emparedado de Frijol y Queso Amarillo', 1, NULL, NULL, 1),
(233, NULL, 13, 'Emparedado Choripán', 1, NULL, NULL, 1),
(234, NULL, 4, 'Tortas de yuca', 1, NULL, NULL, 1),
(235, NULL, 6, 'Lomo Fingido', 1, NULL, NULL, 1),
(236, NULL, 13, 'Emparedado de Salchichón', 1, NULL, NULL, 1),
(237, NULL, 13, 'Emparedado de Torta de Huevo', 1, NULL, NULL, 1),
(238, NULL, 9, 'Pastel de atún y papa 21', 1, NULL, NULL, 1),
(239, NULL, 14, 'Cheesecake tricolor', 1, '1. Disolver la gelatina (medida para cada paquete) en 3 L de agua hirviendo y 0.5 L de agua fría. Refrigerar por 2 horas. Cortar los dos colores de gelatina en cuadritos y reservarlos en una bandeja.\n2. Colocar 5 cucharadas de gelatina Dietex en una taza con agua fría y reservar.\n3. Licuar crema dulce, queso crema y leche condensada.\n4. Calentar el Dietex en el microondas por un minuto o hasta que esté líquido, y agregarlo al licuado.\n5. Agregar esta mezcla sobre los cuadritos de gelatina de colores y refrigerar por 12 horas.\n6. Porcionar y servir.', NULL, 1),
(240, NULL, 12, 'Tamal de Vitamaíz', 1, '1. Poner a hervir la leche con el azúcar.\n2. Licuar huevos, un poquito de leche (1/2 taza), Vitamaíz, leche condensada y canela en polvo.\n3. Cuando la leche esté hirviendo, agregar lo licuado y mezclar sin detenerse hasta que vuelva a hervir.\n4. Luego de hervir, retirar del fuego, agregar la mantequilla y el coco (opcional) y mezclar bien. Colocar en bandeja.\n5. Hornear a fuego lento por 1 hora o hasta que dore.', NULL, 1),
(241, NULL, 12, 'Queque Veteado', 1, '1. En la batidora, mezclar todos los ingredientes de vainilla y luego los de chocolate por separado por 5 minutos.\n2. Colocar en la bandeja primero la mezcla de vainilla y encima la de chocolate. Con un tenedor, apenas mezclar un poquito y hornear.', NULL, 1),
(242, NULL, 14, 'Tres leches', 1, '1. Tamizar la harina junto con el polvo de hornear y reservar.\n2. Separar las claras de las yemas de huevo.\n3. Batir las claras a punto de nieve. Cuando estén, agregar las yemas una a una y luego el azúcar en forma de lluvia.\n4. Retirar de la batidora y agregar los polvos previamente cernidos en forma envolvente.\n5. Agregar en bandeja y hornear.\n6. Cuando aún esté caliente, punzar con el tenedor y agregar la mezcla de leches. Refrigerar 12 horas.\n7. Luego de este tiempo, decorar con Chantilly.\nMezcla de leches: Licuar leche condensada, leche evaporada, crema dulce y leche.\nChantilly: 12 horas antes, refrigerar 1 L de crema dulce bien fría. Agregar a la batidora y cuando esté en forma de picos, añadir poco a poco azúcar al gusto y vainilla si se desea. Luego decorar.', NULL, 1),
(243, NULL, 9, 'Cordon Bleu de Atún', 1, NULL, NULL, 1),
(244, NULL, 13, 'Emparedado de Espinaca y Aguacate', 1, NULL, NULL, 1),
(245, NULL, 6, 'Pastel de Zucchini', 1, NULL, NULL, 1),
(246, NULL, 6, 'Lasaña de Berenjena y carne', 1, NULL, NULL, 1),
(247, NULL, 3, 'Pollo con zucchini y zanahoria', 1, NULL, NULL, 1),
(248, NULL, 8, 'Ensalada de lechuga variada', 1, NULL, NULL, 1),
(249, NULL, 8, 'Ensalada de Lechuga y palmito', 1, NULL, NULL, 1),
(250, NULL, 8, 'Tomate, Zanahoria, Repollo y Mayonesa', 1, 'Lechuga procesada en cama o integrada. Palmito en trozos. Culantro finamente picado. Mayonesa puede ser integrada con todos los ingredientes o al finalizar la preparación.', NULL, 1),
(251, NULL, 12, 'Pancito de queso', 1, '1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar el queso, la natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n3. Hacer bolitas de pan de 100 g en una bandeja engrasada con spray y enharinada.\n4. Llevar al horno por 45 minutos, aproximadamente a 350°C.', NULL, 1),
(252, NULL, 12, 'Pancito con especies', 1, '1. En un bowl, colar la harina y el polvo de hornear (Royal).\n2. Agregar cebolla, chile, culantro, etc., picado finamente.\n3. Derretir las barras de margarina en un sartén e incorporarlas al bowl con la harina y el Royal. Además, agregar natilla, huevos y sal. Empezar a amasar con las manos hasta tener una pasta homogénea.\n4. Hacer bolitas de la masa de 100 g en una bandeja engrasada con spray y harina.\n5. Llevar al horno por 45 minutos, aproximadamente a 350°C.', NULL, 1),
(253, NULL, 8, 'Ensalada Mixta Casera', 1, NULL, NULL, 1),
(254, NULL, 6, 'Sofrito de ternero', 1, NULL, NULL, 1),
(255, NULL, 13, 'Emparedado de frijol y Queso Blanco', 1, NULL, NULL, 1),
(256, NULL, 12, 'Empanadas de frijol', 1, NULL, NULL, 1),
(257, NULL, 12, 'Queque de zanahoria', 1, NULL, NULL, 1),
(258, NULL, 12, 'Hamburguesa de res', 1, NULL, NULL, 1),
(259, NULL, 6, 'Chalupa de Carne', 1, NULL, NULL, 1),
(260, NULL, 3, 'Chalupa de Pollo', 1, NULL, NULL, 1),
(261, NULL, 6, 'Frijoles blancos con chorizo', 1, NULL, NULL, 1),
(262, NULL, 3, 'Sopa Azteca', 1, NULL, NULL, 1),
(263, NULL, 3, 'Muslito de pollo a las hierbas', 1, NULL, NULL, 1),
(264, NULL, 14, 'Crema de limón con granola', 1, NULL, NULL, 1),
(265, NULL, 6, 'Sopa de Mondongo', 1, NULL, NULL, 1),
(266, NULL, 14, 'Cajetas de Leche Pinito y maní', 1, NULL, NULL, 1),
(267, NULL, 9, 'Ceviche de Pescado', 1, NULL, NULL, 1),
(268, NULL, 12, 'Tamal Dulce con coco', 1, NULL, NULL, 1),
(269, NULL, 1, 'Horchata', 1, NULL, NULL, 1),
(270, NULL, 1, 'Agua de sapo', 1, NULL, NULL, 1),
(271, NULL, 1, 'Zanahoria con limón', 1, NULL, NULL, 1),
(272, NULL, 3, 'Garbanzos con pollo', 1, NULL, NULL, 1),
(273, NULL, 11, 'Pasta a la primavera', 1, NULL, NULL, 1),
(274, NULL, 3, 'Cuartos de pollo BBQ', 1, NULL, NULL, 1),
(275, NULL, 12, 'Costilla de Jalea', 1, NULL, NULL, 1),
(276, NULL, 2, 'Arroz con cerdo', 1, NULL, NULL, 1),
(277, NULL, 6, 'Espagueti Supremo', 1, NULL, NULL, 1),
(278, NULL, 9, 'Pescado Napolitano', 1, NULL, NULL, 1),
(279, NULL, 2, 'Cerdo en salsa BBQ', 1, '1. Adobar el cerdo con aceite de ajo, sal, ajo en polvo, pimienta y clavo de olor.\n2. Cocinar cerdo al Rational en modo plancha por 20 minutos por tanda, bandeja no muy cargada para cocción uniforme.\n3. Sofreír el chile y la cebolla en el sartén volteable con aceite y margarina. Reservar unos minutos.\n4. En el mismo sartén, elaborar el roux: añadir aceite y margarina y agregar la harina hasta crear una pasta homogénea a temp 250°C. Después, agregar líquido base BBQ y Salsa T. BBQ (agua o caldo) para darle su punto deseado.\n5. Agregar al cerdo cocido el chile y la cebolla. Mezclar muy bien.', NULL, 1),
(281, NULL, 12, 'Arreglados', 1, NULL, NULL, 1),
(282, NULL, 13, 'Emparedado de Queso Crema con Jalea', 1, NULL, NULL, 1),
(283, NULL, 13, 'Emparedado de Mortadela', 1, NULL, NULL, 1),
(284, NULL, 6, 'Carne molida arreglada', 1, NULL, NULL, 1),
(285, NULL, 6, 'Frijoles blancos con salchicha', 1, NULL, NULL, 1),
(286, NULL, 6, 'Sopa de carne con verduras', 1, '1. Lavar y procesar los vegetales.\n2. Cocinar la carne hasta que esté suave y luego adicionar la sal.\n3. Reservar el fondo de la carne para adicionar luego.\n4. Cocinar vegetales en el fondo oscuro. Después, adicionar la carne con los olores licuados previamente.\n5. Adicionar condimentos y especias.\n6. Rectificar sal y servir caliente.', NULL, 1),
(287, NULL, 12, 'Minipizzas', 1, NULL, NULL, 1),
(288, NULL, 10, 'Crema de frijoles', 1, NULL, NULL, 1),
(290, NULL, 4, 'Tostada con margarina', 1, NULL, NULL, 1),
(291, NULL, 2, 'Chuleta al horno', 1, NULL, NULL, 1),
(292, NULL, 12, 'Cangrejos', 1, NULL, NULL, 1),
(293, NULL, 12, 'Budín', 1, NULL, NULL, 1),
(294, NULL, 12, 'Perros Calientes', 1, NULL, NULL, 1),
(295, NULL, 8, 'Ensalada Febrero 24', 1, NULL, NULL, 1),
(296, NULL, 12, 'Galleta de mantequilla', 1, NULL, NULL, 1),
(297, NULL, 11, 'Pastel de plátano maduro', 1, NULL, NULL, 1),
(298, NULL, 9, 'Mariscada', 1, NULL, NULL, 1),
(299, NULL, 3, 'Huevo ranchero', 1, NULL, NULL, 1),
(300, NULL, 12, 'Pastel de Elote', 1, NULL, NULL, 1),
(301, NULL, 3, 'Muslo de Pollo con salsa de tomate', 1, NULL, NULL, 1),
(302, NULL, 10, 'Chayote con zanahoria', 1, NULL, NULL, 1),
(303, NULL, 3, 'Alita de pollo BBQ', 1, NULL, NULL, 1),
(304, NULL, 6, 'Carne en salsa 2023', 1, NULL, NULL, 1),
(305, NULL, 6, 'Garbanzos con res', 1, NULL, NULL, 1),
(306, NULL, 2, 'Garbanzos con cerdo 2023', 1, NULL, NULL, 1),
(307, NULL, 1, 'Batido verde 2023', 1, NULL, NULL, 1),
(309, NULL, 3, 'Papas con pollo 2023', 1, NULL, NULL, 1),
(310, NULL, 12, 'Tacos con salsa verde', 1, NULL, NULL, 1),
(311, NULL, 4, 'Arepa de ayote 2023', 1, NULL, NULL, 1),
(312, NULL, 9, 'Torta de papa y pescado 2023', 1, NULL, NULL, 1),
(313, NULL, 5, 'Bandeja de Arroz 2023', 1, NULL, NULL, 1),
(314, NULL, 5, 'Bandeja de Frijol 2023', 1, NULL, NULL, 1),
(315, 37, 4, 'Bandeja de Gallo Pinto 2023', 1, NULL, NULL, 1),
(316, NULL, 5, 'Arroz Blanco 2023', 1, NULL, NULL, 1),
(317, NULL, 5, 'Frijoles rojos 2023', 1, NULL, NULL, 1),
(318, 37, 4, 'Gallo Pinto 2023', 1, NULL, NULL, 1),
(319, NULL, 12, 'Tostadas Italianas', 1, NULL, NULL, 1),
(320, NULL, 10, 'Papa, garbanzos, espinaca y hongos', 1, NULL, NULL, 1),
(321, NULL, 3, 'Chilasquila de pollo con Salsa de Tomate', 1, NULL, NULL, 1),
(322, NULL, 10, 'Brócoli con salsa Holandesa', 1, NULL, NULL, 1),
(323, NULL, 6, 'Chili con Carne', 1, NULL, NULL, 1),
(324, NULL, 2, 'Cerdo con verduritas 2023', 1, NULL, NULL, 1),
(325, NULL, 3, 'Lasaña de pollo 2023', 1, NULL, NULL, 1),
(326, NULL, 14, 'Cheesecake de coco', 1, NULL, NULL, 1),
(327, NULL, 14, 'Churchill Cheesecake', 1, NULL, NULL, 1),
(328, NULL, 6, 'Albóndiga en salsa de tomate', 1, NULL, NULL, 1),
(329, NULL, 14, 'Flan de coco', 1, NULL, NULL, 1),
(330, NULL, 14, 'Tamal de coco', 1, NULL, NULL, 1),
(331, NULL, 14, 'Tamal de Vitamaíz', 1, NULL, NULL, 1),
(332, NULL, 10, 'Crema de zapallo 2023', 1, NULL, NULL, 1),
(333, NULL, 11, 'Chop suey con salsa Teriyaki', 1, NULL, NULL, 1),
(334, NULL, 6, 'Chiles rellenos', 1, NULL, NULL, 1),
(335, NULL, 6, 'Torta de carne', 1, NULL, NULL, 1),
(336, NULL, 14, 'Cocadas 2023', 1, NULL, NULL, 1),
(337, NULL, 12, 'Rollos de canela', 1, NULL, NULL, 1),
(338, NULL, 14, 'Arroz con leche', 1, NULL, NULL, 1),
(339, NULL, 3, 'Pollo tropical', 1, NULL, NULL, 1),
(340, NULL, 10, 'Tomate, queso y espinaca', 1, NULL, NULL, 1),
(341, NULL, 12, 'Tortilla con Queso 2023', 1, NULL, NULL, 1),
(342, NULL, 11, 'Pasta con salsa de queso', 1, NULL, NULL, 1),
(343, NULL, 10, 'Crema de espárrago y palmito', 1, NULL, NULL, 1),
(344, NULL, 12, 'Pan casero', 1, NULL, NULL, 1),
(345, NULL, 1, 'Fresco de Maracuyá', 1, NULL, NULL, 1),
(346, NULL, 6, 'Pastel de papa con carne 2023', 1, '1. Lavar y procesar la papa, seguidamente cocinarla.\n2. Cocinar la carne molida, sofreír olores y adicionar.\n3. Realizar puré de papas con margarina y sal.\n4. Colocar en bandejas una capa de puré, seguidamente una capa de carne molida, otra de puré de papa y al final queso mozzarella.\n5. Colocar en el Rational y hornear.', NULL, 1),
(347, NULL, 4, 'Huevo picado 2023', 1, NULL, NULL, 1),
(348, NULL, 1, 'Pulpa de Mango 2023', 1, NULL, NULL, 1),
(349, NULL, 1, 'Pulpa de Tamarindo', 1, NULL, NULL, 1),
(350, NULL, 4, 'Salchichón en salsa', 1, NULL, NULL, 1),
(351, NULL, 6, 'Frijoles blancos con res 2023', 1, NULL, NULL, 1),
(352, NULL, 9, 'Cazuela de Pescado', 1, NULL, NULL, 1),
(353, NULL, 3, 'Pollo en salsa de hongos 2023', 1, NULL, NULL, 1),
(354, NULL, 5, 'Rice and Beans 2023', 1, NULL, NULL, 1),
(355, NULL, 12, 'Crepas de frutas, mantequilla de maní 2023', 1, NULL, NULL, 1),
(356, NULL, 8, 'Ensalada 8 de setiembre', 1, NULL, NULL, 1),
(357, NULL, 12, 'Paty 2023', 1, NULL, NULL, 1),
(358, NULL, 14, 'Cajeta de Leche Pinito con Jalea', 1, NULL, NULL, 1),
(359, NULL, 14, 'Cajeta de pasas', 1, NULL, NULL, 1),
(360, NULL, 14, 'Cajeta de café y coco', 1, NULL, NULL, 1),
(361, NULL, 14, 'Cocadas Semana Cívica', 1, NULL, NULL, 1),
(362, NULL, 6, 'Rondón 2023', 1, NULL, NULL, 1),
(363, NULL, 6, 'Carne mechada 2023', 1, NULL, NULL, 1),
(364, NULL, 2, 'Vigorón 2023', 1, NULL, NULL, 1),
(365, NULL, 3, 'Sopa Azteca 2023', 1, NULL, NULL, 1),
(366, 163, 11, 'Arroz con palmito 2023', 1, NULL, NULL, 1),
(367, NULL, 6, 'Olla de carne 2023', 1, NULL, NULL, 1),
(368, NULL, 9, 'Pastel de papa con atún 2024', 1, NULL, NULL, 1),
(369, NULL, 6, 'Lasaña de Carne 2024', 1, NULL, NULL, 1),
(370, NULL, 4, 'Reposado de Avena y Yogurt', 1, NULL, NULL, 1),
(371, NULL, 12, 'Burrito de frijol y queso', 1, NULL, NULL, 1),
(372, NULL, 2, 'Frijoles blancos con costilla de cerdo', 1, '1. Lavar y procesar las verduras y olores.\n2. Cocinar previamente la costilla de cerdo y adicionar sal al final.\n3. Dejar los frijoles blancos en agua. Al día siguiente, desechar el agua y cocinar con ajo y especias. Adicionar las verduras y la costilla de cerdo a los frijoles.\n4. Condimentar con especias y olores.\n5. Probar y rectificar sabor antes de servir.', NULL, 1),
(373, NULL, 3, 'Sopa Azteca', 1, NULL, NULL, 1),
(374, 373, 3, 'Sopa Azteca 2024', 1, NULL, NULL, 1),
(375, 163, 11, 'Arroz con palmito 2024', 1, NULL, NULL, 1),
(376, NULL, 10, 'Guiso de palmito con zanahoria', 1, '1. Lavar y procesar zanahoria.\n2. Abrir latas de palmito y escurrir el líquido.\n3. Sofreír olores con margarina y aceite de ajo.\n4. Cocinar zanahoria al vapor en Rational.\n5. Agregar a los olores la zanahoria y el palmito. Mezclar y condimentar al gusto con sal y pimienta, entre otros.\n6. Al final, adicionar el perejil.', NULL, 1),
(377, NULL, 3, 'Nuggets de pollo en Salsa China', 1, NULL, NULL, 1),
(378, NULL, 6, 'Frijoles blancos con carne y queso', 1, NULL, NULL, 1),
(379, NULL, 9, 'Pasta con atún en salsa de tomate', 1, NULL, NULL, 1),
(380, NULL, 2, 'Pozol 2024', 1, NULL, NULL, 1),
(381, 204, 8, 'Ensalada rusa 2024', 1, NULL, NULL, 1),
(382, NULL, 11, 'Garbanzos con tomate 2024', 1, NULL, NULL, 1),
(383, NULL, 4, 'Tostada con aceite de oliva, ajo y especias 2024', 1, NULL, NULL, 1),
(384, NULL, 8, 'Ensalada 8 de abril 2024', 1, NULL, NULL, 1),
(385, NULL, 8, 'Garbanzos con atún', 1, NULL, NULL, 1),
(386, NULL, 2, 'Papas con costilla de cerdo', 1, NULL, NULL, 1),
(387, NULL, 4, 'Dos rebanadas de tomate (porción)', 1, NULL, NULL, 1),
(388, NULL, 12, 'Lápiz de carne mechada 2024', 1, NULL, NULL, 1),
(389, NULL, 12, 'Burrito de carne, frijol y queso', 1, NULL, NULL, 1),
(390, NULL, 6, 'Pasta Suprema 2024', 1, NULL, NULL, 1),
(391, NULL, 2, 'Frijoles tiernos con costilla de cerdo 2024', 1, NULL, NULL, 1),
(392, NULL, 6, 'Mano de piedra en salsa 2024', 1, NULL, NULL, 1),
(393, NULL, 2, 'Costilla de cerdo BBQ 2024', 1, NULL, NULL, 1),
(394, NULL, 1, 'Aguadulce - Rectoría', 1, NULL, NULL, 1),
(395, NULL, 6, 'Fajitas de res 2024', 1, NULL, NULL, 1),
(396, NULL, 1, 'Horchata 2024', 1, NULL, NULL, 1),
(397, NULL, 6, 'Lentejas con chorizo', 1, NULL, NULL, 1),
(398, NULL, 4, 'Arepa de manzana, avena y yogurt', 1, NULL, NULL, 1),
(399, NULL, 4, 'Tostada pizzera 2025', 1, NULL, NULL, 1),
(400, NULL, 2, 'Garbanzos con costilla de cerdo 2025', 1, NULL, NULL, 1),
(401, NULL, 6, 'Mano de pirecetaingredienteedra en Salsa de hongos', 1, NULL, NULL, 1),
(402, NULL, 9, 'Pastel de papa y atún 2025', 1, NULL, NULL, 1),
(403, NULL, 4, 'Chocoarepa con pasas y coco', 1, NULL, NULL, 1);


-- truncate solucion.receta_ingredientes;
-- Hay pérdidas por los ingredientes con valores nulos
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (7.0, 161.0, 11.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (7.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (10.0, 17.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (10.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (6.0, 9.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (6.0, 1.0, 2.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (5.0, 9.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (5.0, 1.0, 2.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (11.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (11.0, 17.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (11.0, 1.0, 2.0, 0.24);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (3.0, 9.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (2.0, 1.0, 2.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (1.0, 1.0, 2.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (14.0, 9.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (9.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (9.0, 160.0, 11.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (17.0, 115.0, 9.0, 3.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (17.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (16.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (16.0, 1.0, 2.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (16.0, 161.0, 11.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (18.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (18.0, 161.0, 11.0, 3.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 55.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 15.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (20.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (19.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (19.0, 53.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (19.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (19.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 77.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 64.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 83.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (21.0, 216.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 114.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 42.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 120.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (24.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (26.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (26.0, 109.0, 10.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (26.0, 5.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 84.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 89.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 103.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 55.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (22.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (29.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (29.0, 5.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (29.0, 219.0, 9.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 220.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (30.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (32.0, 2.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (33.0, 205.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (34.0, 206.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 80.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 83.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 223.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (37.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (44.0, 62.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 66.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 206.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (46.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (47.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (47.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 77.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 66.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (48.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (51.0, 39.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (51.0, 5.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (51.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (51.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 72.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 80.0, 9.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (52.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 39.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (53.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 190.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (54.0, 226.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (55.0, 96.0, 9.0, 0.72);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (55.0, 114.0, 2.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (56.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (56.0, 120.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (56.0, 109.0, 10.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (57.0, 170.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (57.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (57.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 73.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 184.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 186.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 42.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 135.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 45.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 159.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (58.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 42.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 135.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 52.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (59.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (60.0, 12.0, 3.0, 3.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (60.0, 213.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (60.0, 1.0, 2.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (61.0, 213.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (63.0, 109.0, 10.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (64.0, 228.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (65.0, 92.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (66.0, 95.0, 9.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (67.0, 100.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (69.0, 86.0, 9.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (69.0, 52.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (69.0, 98.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (69.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (69.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingredxsiente, id_unidad, cantidad) VALUES (70.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 229.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (70.0, 201.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (74.0, 86.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (74.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (75.0, 86.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (75.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (75.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (75.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 50.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 229.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 220.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (77.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 87.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 94.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (80.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (81.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (81.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (81.0, 86.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (81.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (81.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (82.0, 73.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 243.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 86.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (72.0, 244.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 43.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 231.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (71.0, 244.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (83.0, 240.0, 4.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (83.0, 245.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (83.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (83.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 82.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 142.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 106.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (76.0, 230.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 114.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 246.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 247.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 190.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (84.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 230.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 78.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 68.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 218.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 106.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (85.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 123.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 241.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 149.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 102.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (87.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (88.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (88.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (88.0, 241.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (88.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (88.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 7.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 120.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 241.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (89.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (90.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (90.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (90.0, 241.0, 1.0, 0.19);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (90.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 20.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 241.0, 1.0, 0.19);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 51.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 46.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (91.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 241.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 15.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (92.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 229.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 148.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 113.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (93.0, 218.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 80.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 20.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 1.0, 2.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 22.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 203.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 218.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (94.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 25.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 76.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 77.0, 4.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 218.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (95.0, 106.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 121.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 251.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 54.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 252.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (98.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 253.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 77.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (99.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 114.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 50.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 203.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (102.0, 102.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 50.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 66.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (103.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 26.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (104.0, 54.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 20.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 255.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (106.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 77.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 58.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 149.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 104.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (107.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 230.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 58.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 78.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 49.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (108.0, 233.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 62.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 220.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (109.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 58.0, 1.0, 0.19);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 77.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 85.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 120.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (110.0, 142.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 71.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 76.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 220.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 58.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 99.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (111.0, 106.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 58.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (112.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 58.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (113.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 155.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 247.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 58.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 244.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (115.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 20.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 240.0, 4.0, 0.29);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 1.0, 2.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (117.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (118.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (118.0, 78.0, 9.0, 0.89);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (118.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (118.0, 52.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (118.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 230.0, 1.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 52.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (121.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 258.0, 9.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 233.0, 9.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 102.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (123.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (124.0, 230.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (124.0, 145.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (124.0, 1.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 220.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 83.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 106.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (125.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (126.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (126.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (126.0, 104.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (126.0, 106.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 97.0, 9.0, 0.60);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 102.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (127.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 106.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (128.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 93.0, 1.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 80.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (129.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 52.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (131.0, 233.0, 9.0, 0.44);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 82.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 104.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 106.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 233.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 256.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (132.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 76.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 102.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 233.0, 9.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 52.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (133.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 82.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 104.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (134.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (137.0, 235.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (137.0, 1.0, 2.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (137.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (137.0, 22.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 259.0, 9.0, 0.31);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 80.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 1.0, 2.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (139.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 87.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 229.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 231.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 99.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (140.0, 260.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 97.0, 9.0, 0.67);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 15.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 26.0, 2.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (141.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (144.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (144.0, 64.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (144.0, 95.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 76.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 58.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (145.0, 26.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 62.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 48.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 148.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (146.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 230.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 2.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 52.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 206.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 200.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (147.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 230.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 82.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 62.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 242.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 68.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 22.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (148.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 62.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 105.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 220.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (149.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 62.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 257.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (150.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 226.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (152.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 241.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (153.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 67.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 7.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 87.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 120.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (155.0, 238.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 67.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 6.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (156.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 226.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (157.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 62.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (158.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (15.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (15.0, 1.0, 2.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (15.0, 17.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (12.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (12.0, 17.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (8.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (8.0, 161.0, 11.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (8.0, 1.0, 2.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 114.0, 2.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 77.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 80.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (116.0, 255.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 58.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 187.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 138.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 104.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 230.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (160.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (161.0, 5.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (161.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (161.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (161.0, 156.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (161.0, 113.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 259.0, 9.0, 0.31);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 80.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 1.0, 2.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (138.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 52.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (130.0, 233.0, 9.0, 0.44);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 30.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 62.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (162.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (164.0, 7.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (164.0, 73.0, 9.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (164.0, 261.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (164.0, 24.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 124.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 55.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (165.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 105.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 156.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 148.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (166.0, 229.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 198.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 247.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 262.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (167.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 240.0, 4.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (168.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 174.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 9.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 159.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (169.0, 31.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (171.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 230.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 7.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 52.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (172.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 198.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 233.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 258.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (173.0, 52.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 203.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 233.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 258.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (174.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 25.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 43.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 1.0, 2.0, 0.35);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (176.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 203.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 46.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 195.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (177.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 240.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 220.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 66.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (178.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 259.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 83.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 30.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (175.0, 66.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 25.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 66.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (179.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 30.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (180.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 233.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 25.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 142.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (181.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 25.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 234.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (183.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 43.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 6.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (163.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 258.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 203.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 95.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (184.0, 233.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 78.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 124.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 220.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 198.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 103.0, 4.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (185.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 29.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 233.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (187.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 200.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 258.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 233.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (188.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 201.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 123.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 220.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 256.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (182.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 25.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 30.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 96.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (186.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 95.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 263.0, 9.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 73.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (189.0, 264.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 50.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 233.0, 9.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (191.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 18.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 204.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 59.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 142.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 52.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (192.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 70.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 273.0, 9.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 87.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (193.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 151.0, 5.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (195.0, 29.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (196.0, 57.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (196.0, 46.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (196.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (196.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (196.0, 276.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (194.0, 275.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (194.0, 59.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (194.0, 276.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (194.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (198.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (198.0, 274.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (198.0, 7.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (198.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (200.0, 274.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (200.0, 263.0, 9.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (200.0, 52.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (200.0, 86.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 102.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 87.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 75.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (201.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 102.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 243.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (203.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 94.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 87.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (45.0, 232.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (207.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (207.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (207.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (207.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (207.0, 281.0, 9.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 175.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (210.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 21.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 2.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 1.0, 2.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 22.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 38.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (211.0, 13.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (217.0, 99.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (217.0, 87.0, 9.0, 0.34);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (217.0, 102.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (217.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (217.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 95.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 99.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (218.0, 48.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (219.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (219.0, 94.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (219.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (219.0, 232.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (219.0, 87.0, 9.0, 0.63);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (220.0, 198.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (220.0, 50.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (220.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (220.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (220.0, 274.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 283.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 99.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (223.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 282.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 87.0, 9.0, 0.35);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 232.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (221.0, 273.0, 9.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 104.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 274.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 75.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (224.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 99.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (225.0, 12.0, 3.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 86.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 87.0, 9.0, 0.39);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 232.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 102.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (215.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (227.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (227.0, 94.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (227.0, 75.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (227.0, 87.0, 9.0, 0.23);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (227.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 7.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 86.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 238.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 176.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (228.0, 141.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 96.0, 9.0, 0.86);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 5.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 184.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (214.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 97.0, 9.0, 0.23);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 87.0, 9.0, 0.38);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (230.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 282.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 106.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 87.0, 9.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 232.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 273.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (231.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 27.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 4.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 86.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (232.0, 102.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 105.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 220.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (234.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 222.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 39.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 59.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 206.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 4.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 106.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (235.0, 40.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (28.0, 5.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 66.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (237.0, 280.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 220.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 66.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 50.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 233.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (238.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 50.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 206.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 113.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (243.0, 4.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 273.0, 9.0, 0.40);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 285.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 87.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 240.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (244.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 233.0, 9.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 286.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 278.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (245.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 258.0, 9.0, 0.42);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 59.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 5.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (246.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 241.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 233.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (247.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 86.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 231.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 106.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 5.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 94.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 87.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 120.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (248.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 211.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 284.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 167.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 168.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 21.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (239.0, 6.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 12.0, 3.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 1.0, 2.0, 0.39);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 21.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (240.0, 126.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (241.0, 114.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (241.0, 66.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (241.0, 173.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (241.0, 174.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 211.0, 2.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 42.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 21.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 45.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (242.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 86.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 87.0, 9.0, 0.32);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 232.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 102.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (209.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (249.0, 86.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (249.0, 43.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (249.0, 274.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (249.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 283.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 102.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (250.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 42.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 13.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 5.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (251.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 83.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 42.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 13.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (252.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 38.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 87.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 281.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 94.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (208.0, 102.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 86.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 120.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 238.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 176.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 231.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 99.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (216.0, 141.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 274.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 220.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 98.0, 9.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (204.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 75.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 87.0, 9.0, 0.41);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 99.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (206.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 274.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 95.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 99.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (202.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (222.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (222.0, 66.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (222.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (222.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (253.0, 66.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (253.0, 102.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (253.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (253.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (253.0, 86.0, 9.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 75.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 87.0, 9.0, 0.43);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 231.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 99.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (199.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 255.0, 1.0, 0.24);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 180.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (254.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 39.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 27.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 2.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 288.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (256.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 42.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 184.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (257.0, 38.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 86.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 59.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 206.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 107.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 4.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 280.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (258.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 65.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 86.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 219.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 102.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (259.0, 87.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 86.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 87.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 218.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 102.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 219.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (260.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 123.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 208.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (261.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 219.0, 9.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 218.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (262.0, 273.0, 9.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 226.0, 1.0, 0.23);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (263.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 211.0, 2.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 21.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 87.0, 9.0, 0.26);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 221.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 176.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (264.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 57.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 78.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 220.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 97.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (265.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (266.0, 178.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (266.0, 21.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (266.0, 262.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (266.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (266.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 54.0, 1.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 238.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 80.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (267.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 1.0, 2.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 87.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 2.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 39.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 38.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 81.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (268.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 25.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 185.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 184.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 186.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 290.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 1.0, 2.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 262.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (269.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (270.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (270.0, 87.0, 9.0, 0.77);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (270.0, 9.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (271.0, 87.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (271.0, 106.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (271.0, 38.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 218.0, 1.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 29.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 80.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 102.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (272.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 230.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 198.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (273.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 226.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 149.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (274.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (275.0, 42.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (275.0, 13.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (275.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (275.0, 28.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (275.0, 66.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (4.0, 12.0, 3.0, 4.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (4.0, 1.0, 2.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (4.0, 8.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (13.0, 1.0, 2.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (13.0, 12.0, 3.0, 5.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (13.0, 8.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (41.0, 209.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (213.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (213.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (213.0, 25.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 222.0, 13.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 55.0, 1.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (276.0, 157.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 203.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 206.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 209.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 208.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (277.0, 288.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 183.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 186.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 149.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 55.0, 1.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (279.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 226.0, 1.0, 0.23);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 244.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (229.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (282.0, 28.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (282.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (282.0, 6.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 149.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 280.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 102.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (190.0, 218.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (283.0, 86.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (283.0, 205.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (283.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (283.0, 280.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (283.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (233.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (233.0, 99.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (233.0, 280.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (233.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (233.0, 208.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (236.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (236.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (236.0, 207.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (236.0, 280.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (236.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 59.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 149.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (284.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 59.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 77.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 203.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 22.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 15.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (114.0, 102.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 59.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 20.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 52.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 60.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 113.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (105.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 247.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 253.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 77.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 56.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 256.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (143.0, 200.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 114.0, 2.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 190.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 67.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (154.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 76.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (170.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (43.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (43.0, 27.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (43.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 78.0, 9.0, 0.80);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 80.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 244.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (119.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 230.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 82.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (122.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 82.0, 9.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (136.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 83.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 123.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (285.0, 209.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 107.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 206.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 205.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 209.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 151.0, 5.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (287.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 223.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 150.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (288.0, 102.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (290.0, 109.0, 10.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (290.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 53.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 12.0, 3.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (291.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 39.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (31.0, 2.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 107.0, 9.0, 0.50);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (27.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (281.0, 69.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (281.0, 76.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (281.0, 206.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (281.0, 6.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (281.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (292.0, 112.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (292.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (292.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (292.0, 6.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (292.0, 206.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 38.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 66.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 1.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 21.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 47.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 45.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 13.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 32.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (293.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (294.0, 111.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (294.0, 99.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (294.0, 280.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (294.0, 209.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 114.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 247.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 258.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (120.0, 5.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 47.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (86.0, 226.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (49.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (49.0, 66.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (49.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (49.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (49.0, 206.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (40.0, 66.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (40.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (40.0, 2.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (40.0, 209.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 13.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 42.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 32.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (296.0, 28.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 223.0, 13.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 96.0, 9.0, 0.56);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (297.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 157.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 76.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 254.0, 1.0, 0.37);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 102.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (298.0, 331.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 211.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 52.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 42.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (300.0, 38.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 67.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (301.0, 276.0, 13.0, 0.60);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 78.0, 9.0, 0.49);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 106.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (302.0, 157.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (36.0, 221.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (35.0, 12.0, 3.0, 3.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (35.0, 1.0, 2.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (35.0, 221.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 246.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 149.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (303.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 58.0, 1.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 151.0, 5.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (304.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 220.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (305.0, 302.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 95.0, 9.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 73.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 310.0, 4.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 94.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 260.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 247.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (307.0, 240.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 218.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 220.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 249.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (309.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 59.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 83.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 288.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 234.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (310.0, 332.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 315.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (311.0, 235.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 54.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 220.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 113.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (312.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 182.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 222.0, 13.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 289.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 215.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 223.0, 13.0, 0.38);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 116.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 80.0, 9.0, 3.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 76.0, 1.0, 0.75);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (315.0, 195.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (314.0, 46.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (314.0, 27.0, 1.0, 4.50);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (313.0, 114.0, 2.0, 0.30);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (313.0, 25.0, 1.0, 4.32);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (313.0, 46.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (316.0, 25.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (316.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (316.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (317.0, 27.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (317.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 222.0, 13.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 223.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (318.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 137.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 288.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 247.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 114.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 249.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (319.0, 329.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 218.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 219.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 66.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 288.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (321.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 240.0, 4.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 29.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 220.0, 1.0, 0.21);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (320.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 230.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (322.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 223.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 59.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 77.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 249.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (323.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 299.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 230.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (324.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 247.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 87.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (100.0, 54.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 76.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 142.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (101.0, 54.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 114.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 217.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (278.0, 54.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 2.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 6.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 249.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 250.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 26.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 142.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (96.0, 54.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 114.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 80.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 190.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 66.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 191.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 94.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (142.0, 54.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 218.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 204.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 83.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 1.0, 2.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 20.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 51.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (325.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 211.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 45.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 1.0, 2.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 135.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 166.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (326.0, 138.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 211.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 166.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 284.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 45.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 178.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (327.0, 158.0, 6.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 86.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 4.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 280.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (226.0, 61.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 59.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 39.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (328.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (329.0, 164.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (329.0, 1.0, 2.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 39.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 2.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 12.0, 3.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 47.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 176.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (330.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 1.0, 2.0, 0.16);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 12.0, 3.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 66.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 126.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 135.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (331.0, 186.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (332.0, 1.0, 2.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (332.0, 46.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (332.0, 259.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 26.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 7.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 9.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 68.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 78.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 99.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (333.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 80.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 59.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 66.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 114.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (334.0, 276.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 59.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (335.0, 39.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (336.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (336.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (336.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (336.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 42.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 127.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 12.0, 3.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 185.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 6.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (337.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 25.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 38.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 185.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 135.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 45.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (338.0, 186.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 187.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 47.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 191.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 95.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (339.0, 226.0, 1.0, 0.25);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 102.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 240.0, 4.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 247.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 6.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (340.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 39.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 2.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 6.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (341.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 200.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 4.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 247.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 45.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 244.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (342.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (343.0, 1.0, 2.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (343.0, 43.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (343.0, 145.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (343.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (343.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 42.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 184.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 127.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (344.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (345.0, 333.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 66.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (347.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (348.0, 334.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (349.0, 340.0, 2.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 50.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 274.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (205.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 27.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 5.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (255.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 278.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 86.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 4.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 280.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 102.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (197.0, 109.0, 10.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (350.0, 207.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (350.0, 276.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 302.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 123.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 249.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 220.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (351.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 54.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 80.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 75.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 102.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 146.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (352.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 67.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 190.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 1.0, 2.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 20.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 22.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 48.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 45.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (353.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 47.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (354.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 50.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 144.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 66.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 51.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 119.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (97.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 71.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 75.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 87.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 94.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 195.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 99.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (356.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 59.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 187.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 42.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 188.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 13.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (357.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (358.0, 21.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (358.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (358.0, 178.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (358.0, 170.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (359.0, 21.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (359.0, 178.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (359.0, 176.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (359.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (359.0, 262.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (360.0, 21.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (360.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (360.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (360.0, 17.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (360.0, 178.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (361.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (361.0, 154.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (361.0, 66.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (361.0, 12.0, 3.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (364.0, 298.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (364.0, 105.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (364.0, 99.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 236.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 84.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 47.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 239.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 220.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 97.0, 9.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 65.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 105.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (362.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 65.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 102.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (363.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 218.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 102.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 273.0, 9.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 91.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 15.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (365.0, 219.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 222.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 43.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 48.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 119.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 104.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (366.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 58.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 105.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 236.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 78.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 237.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 235.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (367.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 181.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 52.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 290.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 220.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 51.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 288.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 197.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 346.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (368.0, 50.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (369.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (369.0, 204.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (369.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (369.0, 59.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (369.0, 276.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 10.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 221.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 177.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 176.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 3.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 245.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (370.0, 120.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 261.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 5.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 330.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (371.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 273.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 215.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 137.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 218.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 5.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 15.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 102.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (373.0, 219.0, 9.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 218.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 102.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 273.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 219.0, 9.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 9.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 215.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (374.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 211.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 1.0, 2.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 119.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 44.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 240.0, 4.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 187.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (375.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 87.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (68.0, 102.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 43.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 106.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 244.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (376.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (135.0, 225.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (135.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (135.0, 220.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (135.0, 104.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (135.0, 106.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 59.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 42.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 66.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 290.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 220.0, 1.0, 0.22);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 116.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (346.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 235.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 236.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 78.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 58.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 237.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 220.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 105.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (286.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 38.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 76.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 80.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 223.0, 13.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 148.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 116.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (159.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 87.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 99.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (79.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 86.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 87.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 94.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 231.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (78.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 78.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 80.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 227.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 298.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 123.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (372.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 242.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 346.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 233.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 117.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 157.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 85.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (377.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 214.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 83.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 229.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (73.0, 201.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 65.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 220.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 106.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 123.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 181.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 346.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (378.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (379.0, 198.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (379.0, 50.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (379.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 83.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 84.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 89.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 350.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 46.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (380.0, 103.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 25.0, 1.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 80.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 52.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 218.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 51.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 104.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (23.0, 106.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (39.0, 208.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (39.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 208.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 99.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 219.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (38.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (381.0, 98.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (381.0, 220.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (381.0, 66.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (381.0, 274.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (381.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 29.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 102.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (382.0, 347.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 80.0, 9.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 148.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 15.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (42.0, 268.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 87.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 99.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 207.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 102.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 219.0, 9.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (25.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 155.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 109.0, 10.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 197.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 346.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (383.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 86.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 94.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 75.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 106.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 99.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 231.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (384.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 86.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 234.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 75.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 232.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 87.0, 9.0, 0.17);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 155.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (295.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 14.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 71.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 77.0, 4.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 80.0, 9.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 208.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 220.0, 1.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (151.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 29.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 273.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 87.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (385.0, 50.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 220.0, 1.0, 0.33);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 298.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 80.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 76.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 149.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (386.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (387.0, 102.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (388.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (388.0, 86.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (388.0, 280.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (388.0, 65.0, 1.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (388.0, 108.0, 10.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (299.0, 66.0, 1.0, 0.07);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (299.0, 206.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (299.0, 276.0, 13.0, 0.66);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (299.0, 119.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 261.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 59.0, 1.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 223.0, 13.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 288.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 102.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 76.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (389.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 200.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 208.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 267.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (390.0, 77.0, 4.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 216.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 298.0, 1.0, 0.11);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 220.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (391.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 262.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 260.0, 9.0, 0.15);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 92.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 6.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 159.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (355.0, 261.0, 9.0, 1.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 61.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 211.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 217.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (392.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 298.0, 1.0, 0.14);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 149.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (393.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (394.0, 356.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (394.0, 185.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (394.0, 9.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 302.0, 1.0, 0.18);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 114.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 49.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 99.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 80.0, 9.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 76.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (395.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (396.0, 163.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (396.0, 1.0, 2.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (396.0, 38.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 225.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 289.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 208.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 248.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 18.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 30.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 97.0, 9.0, 0.06);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 102.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (397.0, 220.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 315.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 174.0, 1.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 10.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 3.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 159.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 66.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (398.0, 263.0, 9.0, 0.08);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 109.0, 10.0, 0.10);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 151.0, 5.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 5.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 15.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 80.0, 9.0, 0.03);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 181.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (399.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 298.0, 1.0, 0.13);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 29.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 106.0, 1.0, 0.04);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 105.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 193.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 346.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 347.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 348.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 360.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 80.0, 9.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (400.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 61.0, 1.0, 0.12);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 1.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 143.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 195.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 116.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 49.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 192.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 22.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 182.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (401.0, 48.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 220.0, 1.0, 0.20);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 50.0, 1.0, 0.05);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 288.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 13.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 290.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 215.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (402.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 173.0, 1.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 315.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 176.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 177.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 114.0, 2.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 31.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (403.0, 1.0, 2.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 76.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 80.0, 9.0, 0.02);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 79.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 215.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 83.0, 9.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 91.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 220.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 137.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 46.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 151.0, 5.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 15.0, 1.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 102.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 103.0, 4.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 55.0, 1.0, 0.09);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 26.0, 2.0, 0.00);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 106.0, 1.0, 0.01);
INSERT INTO receta_ingredientes (id_receta, id_ingrediente, id_unidad, cantidad) VALUES (306.0, 29.0, 1.0, 0.10);



INSERT INTO `proveedor` (`nombre`, `telefono`, `correo`, `direccion`) VALUES
('DOS PINOS', '85100181', 'centrodecontactos@dospinos.com', 'Oficinas Centrales, Alajuela'),
('INNOVO', '24518300', 'info@innovocr.com', 'Naranjo, Alajuela, San Antonio de la Cueva'),
('CARNE SANCHEZ', '60835201', NULL, NULL), -- Información no encontrada para este número
('POLLO MATAMOROS', '83771368', NULL, 'Maquiladora de Pollo Matamoros, La Tigra, San Carlos'), -- Correo no encontrado, solo se conserva la dirección previa
('SALQUI', '70764524', 'info@adm.salqui.com', 'Nuevo CEDI: 800m este estación pesaje, Ochomogo, Cartago'),
('JRAMIREZ', '71015268', 'info@jramirezdistribuidora.com', 'Cartago, El Carmen, 1.5 Km al Este del puente Bailey'),
('AR COSTA RICA', '61474184', NULL, 'Avenida Escazú, Torre 205 (Asociado a AR Holdings)'), -- Correo no encontrado
('BLUE FLAME', '64893825', 'info@blueflameworldwide.com', 'San José, Santa Ana, Pozos: 200m Norte de Condominio Urban Flats'),
('PESCADO', '88289616', 'mrfishcostarica@gmail.com', '25m oeste y 25m norte del Banco Popular de San Pedro Montes de Oca'), -- Datos encontrados al buscar por el teléfono
('PULPAS', '87426327', 'info@pulpascanon.com', 'Carretera Interamericana Sur Km 58, Cañón del Guarco, Cartago'),
('CIAMESSA', '64900493', 'info@ciamesa.com', 'San José, Costa Rica');

