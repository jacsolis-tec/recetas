
-- CRUD DE UNIDADES 


-- Crear unidad
DELIMITER $$
CREATE PROCEDURE sp_unidad_crear(
    IN p_nombre_unidad VARCHAR(50)
)
BEGIN
    INSERT INTO unidad(nombre_unidad)
    VALUES (p_nombre_unidad);
    
    SELECT LAST_INSERT_ID() AS id_unidad;
END$$
DELIMITER ;

-- Leer todas las unidades
DELIMITER $$
CREATE PROCEDURE sp_unidad_leer_todos()
BEGIN
    SELECT id_unidad, nombre_unidad
    FROM unidad
    ORDER BY nombre_unidad ASC;
END$$
DELIMITER ;

-- Leer unidad por ID
DELIMITER $$
CREATE PROCEDURE sp_unidad_leer_por_id(
    IN p_id_unidad INT
)
BEGIN
    SELECT id_unidad, nombre_unidad
    FROM unidad
    WHERE id_unidad = p_id_unidad;
END$$
DELIMITER ;

-- Actualizar unidad
DELIMITER $$
CREATE PROCEDURE sp_unidad_actualizar(
    IN p_id_unidad INT,
    IN p_nombre_unidad VARCHAR(50)
)
BEGIN
    UPDATE unidad
    SET nombre_unidad = p_nombre_unidad
    WHERE id_unidad = p_id_unidad;
END$$
DELIMITER ;

-- Eliminar unidad
DELIMITER $$
CREATE PROCEDURE sp_unidad_eliminar(
    IN p_id_unidad INT
)
BEGIN
    DELETE FROM unidad
    WHERE id_unidad = p_id_unidad;
END$$
DELIMITER ;


-- CRUD DE CATEGORIAS INGREDIENTE

-- Crear categoria_ingrediente
DELIMITER $$
CREATE PROCEDURE sp_categoria_ingrediente_crear(
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    INSERT INTO categoria_ingrediente(nombre_categoria, descripcion)
    VALUES (p_nombre_categoria, p_descripcion);
    
    SELECT LAST_INSERT_ID() AS id_categoria;
END$$
DELIMITER ;

-- Leer todas las categorias ingrediente
DELIMITER $$
CREATE PROCEDURE sp_categoria_ingrediente_leer_todos()
BEGIN
    SELECT id_categoria, nombre_categoria, descripcion
    FROM categoria_ingrediente
    ORDER BY nombre_categoria ASC;
END$$
DELIMITER ;

-- Leer categoria ingrediente por ID
DELIMITER $$
CREATE PROCEDURE sp_categoria_ingrediente_leer_por_id(
    IN p_id_categoria INT
)
BEGIN
    SELECT id_categoria, nombre_categoria, descripcion
    FROM categoria_ingrediente
    WHERE id_categoria = p_id_categoria;
END$$
DELIMITER ;

-- Actualizar categoria ingrediente
DELIMITER $$
CREATE PROCEDURE sp_categoria_ingrediente_actualizar(
    IN p_id_categoria INT,
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT
)
BEGIN
    UPDATE categoria_ingrediente
    SET nombre_categoria = p_nombre_categoria,
        descripcion = p_descripcion
    WHERE id_categoria = p_id_categoria;
END$$
DELIMITER ;

-- Eliminar categoria ingrediente
DELIMITER $$
CREATE PROCEDURE sp_categoria_ingrediente_eliminar(
    IN p_id_categoria INT
)
BEGIN
    DELETE FROM categoria_ingrediente
    WHERE id_categoria = p_id_categoria;
END$$
DELIMITER ;



-- CRUD DE CATEGORIAS RECETA


-- Crear categoria_receta
DELIMITER $$
CREATE PROCEDURE sp_categoria_receta_crear(
    IN p_nombre_categoria VARCHAR(50),
    IN p_descripcion TEXT,
    IN p_costo_max DECIMAL(10,2)
)
BEGIN
    INSERT INTO categoria_receta(nombre, descripcion, costo_max)
    VALUES (p_nombre_categoria, p_descripcion, p_costo_max);

    SELECT LAST_INSERT_ID() AS id_categoria;
END$$
DELIMITER ;

-- Leer todas las categorias receta
DELIMITER $$
CREATE PROCEDURE sp_categoria_receta_leer_todos()
BEGIN
    SELECT id_categoria, nombre, descripcion, costo_max
    FROM categoria_receta
    ORDER BY nombre ASC;
END$$
DELIMITER ;

-- Leer categoria receta por ID
DELIMITER $$
CREATE PROCEDURE sp_categoria_receta_leer_por_id(
    IN p_id_categoria INT
)
BEGIN
    SELECT id_categoria, nombre, descripcion, costo_max
    FROM categoria_receta
    WHERE id_categoria = p_id_categoria;
END$$
DELIMITER ;

-- Actualizar categoria receta
DELIMITER $$
CREATE PROCEDURE sp_categoria_receta_actualizar(
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
END$$
DELIMITER ;

-- Eliminar categoria receta
DELIMITER $$
CREATE PROCEDURE sp_categoria_receta_eliminar(
    IN p_id_categoria INT
)
BEGIN
    DELETE FROM categoria_receta
    WHERE id_categoria = p_id_categoria;
END$$
DELIMITER ;



































