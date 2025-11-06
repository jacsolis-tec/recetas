-- CREAR ROL
DELIMITER $$
CREATE PROCEDURE sp_rol_crear(
    IN p_nombre_rol VARCHAR(50),
    IN p_descripcion VARCHAR(150)
)
BEGIN
    INSERT INTO rol (nombre_rol, descripcion)
    VALUES (p_nombre_rol, p_descripcion);
    
    SELECT LAST_INSERT_ID() as id_rol;
END$$
DELIMITER ;

-- LEER TODOS LOS ROLES
DELIMITER $$
CREATE PROCEDURE sp_rol_leer_todos()
BEGIN
    SELECT id_rol, nombre_rol, descripcion 
    FROM rol 
    ORDER BY nombre_rol;
END$$
DELIMITER ;

-- LEER ROL POR ID
DELIMITER $$
CREATE PROCEDURE sp_rol_leer_por_id(
    IN p_id_rol INT
)
BEGIN
    SELECT id_rol, nombre_rol, descripcion 
    FROM rol 
    WHERE id_rol = p_id_rol;
END$$
DELIMITER ;

-- ACTUALIZAR ROL
DELIMITER $$
CREATE PROCEDURE sp_rol_actualizar(
    IN p_id_rol INT,
    IN p_nombre_rol VARCHAR(50),
    IN p_descripcion VARCHAR(150)
)
BEGIN
    UPDATE rol 
    SET nombre_rol = p_nombre_rol,
        descripcion = p_descripcion
    WHERE id_rol = p_id_rol;
END$$
DELIMITER ;

-- ELIMINAR ROL (con verificación de uso)
DELIMITER $$
CREATE PROCEDURE sp_rol_eliminar(
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
END$$
DELIMITER ;

-- CREAR USUARIO
DELIMITER $$
CREATE PROCEDURE sp_usuario_crear(
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
END$$
DELIMITER ;

-- ASIGNAR ROLES A USUARIO
DELIMITER $$
CREATE PROCEDURE sp_usuario_asignar_roles(
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
END$$
DELIMITER ;

-- LEER TODOS LOS USUARIOS CON SUS ROLES
DELIMITER $$
CREATE PROCEDURE sp_usuario_leer_todos()
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
END$$
DELIMITER ;

-- LEER USUARIO POR ID CON SUS ROLES
DELIMITER $$
CREATE PROCEDURE sp_usuario_leer_por_id(
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
END$$
DELIMITER ;

-- ACTUALIZAR USUARIO
DELIMITER $$
CREATE PROCEDURE sp_usuario_actualizar(
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
END$$
DELIMITER ;

-- ELIMINAR/USUARIO (DESACTIVAR)
DELIMITER $$
CREATE PROCEDURE sp_usuario_desactivar(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuario 
    SET activo = 0 
    WHERE id_usuario = p_id_usuario;
END$$
DELIMITER ;

-- ACTIVAR USUARIO
DELIMITER $$
CREATE PROCEDURE sp_usuario_activar(
    IN p_id_usuario INT
)
BEGIN
    UPDATE usuario 
    SET activo = 1 
    WHERE id_usuario = p_id_usuario;
END$$
DELIMITER ;

-- VERIFICAR SI NOMBRE DE USUARIO EXISTE
DELIMITER $$
CREATE PROCEDURE sp_usuario_verificar_existencia(
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
END$$
DELIMITER ;

-- CREAR USUARIO COMPLETO (CON ROLES)
DELIMITER $$
CREATE PROCEDURE sp_usuario_crear_completo(
    IN p_nombre_usuario VARCHAR(50),
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_activo TINYINT(1),
    IN p_roles_json JSON,
    OUT p_id_usuario INT,
    OUT p_mensaje VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_mensaje = 'ERROR: No se pudo crear el usuario.';
        SET p_id_usuario = NULL;
    END;
    
    DECLARE v_usuario_existe TINYINT(1) DEFAULT 0;
    
    -- Verificar si el usuario ya existe
    CALL sp_usuario_verificar_existencia(p_nombre_usuario, NULL, v_usuario_existe);
    
    IF v_usuario_existe = 1 THEN
        SET p_mensaje = 'ERROR: El nombre de usuario ya existe.';
        SET p_id_usuario = NULL;
    ELSE
        START TRANSACTION;
        
        -- Insertar usuario
        INSERT INTO usuario (nombre_usuario, nombre, apellido, correo, activo)
        VALUES (p_nombre_usuario, p_nombre, p_apellido, p_correo, p_activo);
        
        SET p_id_usuario = LAST_INSERT_ID();
        
        -- Asignar roles si se proporcionaron
        IF p_roles_json IS NOT NULL AND JSON_LENGTH(p_roles_json) > 0 THEN
            CALL sp_usuario_asignar_roles(p_id_usuario, p_roles_json);
        END IF;
        
        COMMIT;
        SET p_mensaje = 'OK: Usuario creado correctamente.';
    END IF;
END$$
DELIMITER ;
-- INSERTAR ROLES INICIALES
CALL sp_rol_crear('Gerencia', 'Acceso total a todos los módulos');
CALL sp_rol_crear('Nutrición', 'Consulta y edición de menús y recetas');
CALL sp_rol_crear('Bodega', 'Registro de existencias y actualización de inventario');
CALL sp_rol_crear('Cocina', 'Consulta de recetas y registro de producción');
CALL sp_rol_crear('Ventas', 'Uso del módulo Punto de venta');
CALL sp_rol_crear('Administrador Técnico', 'Mantenimiento y despliegues');

-- CREAR USUARIO CON ROLES
SET @roles_json = '[1, 2]'; -- Gerencia y Nutrición
CALL sp_usuario_crear_completo(
    'jperez', 
    'Juan', 
    'Pérez', 
    'juan@comedor.com', 
    1, 
    @roles_json, 
    @id_usuario, 
    @mensaje
);
SELECT @id_usuario, @mensaje;

-- CONSULTAR TODOS LOS USUARIOS
CALL sp_usuario_leer_todos();

-- CONSULTAR TODOS LOS ROLES
CALL sp_rol_leer_todos();

-- ELIMINAR ROL (si no está en uso)
CALL sp_rol_eliminar(6, @resultado);
SELECT @resultado;