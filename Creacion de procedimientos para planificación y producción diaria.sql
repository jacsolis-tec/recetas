DELIMITER $$

CREATE PROCEDURE crear_menu_diario (
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

    -- Verificar si ya existe menú para esa fecha y tiempo
    SELECT COUNT(*) INTO v_count
    FROM menu_diario
    WHERE fecha_menu = p_fecha
      AND id_tiempo = p_id_tiempo;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe un menú en esa fecha y tiempo';
    END IF;

    INSERT INTO menu_diario (
        nombre_menu, descripcion, fecha_menu, porciones_asignadas,
        id_tiempo, version, id_usuario_creacion
    )
    VALUES (
        p_nombre_menu, p_descripcion, p_fecha, p_porciones,
        p_id_tiempo, 1, p_id_usuario
    );

    SET p_id_menu = LAST_INSERT_ID();
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE registrar_produccion_diaria (
    IN p_id_menu INT,
    IN p_fecha DATE,
    IN p_porciones_producidas INT,
    IN p_id_usuario INT,
    OUT p_id_produccion INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    -- Validar menú existente
    SELECT COUNT(*) INTO v_count
    FROM menu_diario
    WHERE id_menu = p_id_menu AND fecha_menu = p_fecha;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El menú no existe para esa fecha';
    END IF;

    -- Validar producción no duplicada
    SELECT COUNT(*) INTO v_count
    FROM produccion_diaria
    WHERE id_menu = p_id_menu AND fecha_produccion = p_fecha;

    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Ya existe producción registrada';
    END IF;

    INSERT INTO produccion_diaria (
        id_menu, fecha_produccion, porciones_producidas, id_usuario_registro
    )
    VALUES (p_id_menu, p_fecha, p_porciones_producidas, p_id_usuario);

    SET p_id_produccion = LAST_INSERT_ID();
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE asignar_receta_menu (
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
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE remover_receta_menu (
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_menu_receta_versionado
AFTER INSERT ON menu_receta
FOR EACH ROW
BEGIN
    INSERT INTO menu_receta_historico (id_menu_historico, id_receta_historico)
    SELECT mh.id_menu_historico, rh.id_receta_historico
    FROM menu_diario_historico mh
    JOIN receta_historico rh
      ON rh.id_receta_activa = NEW.id_receta
    WHERE mh.id_menu_activa = NEW.id_menu
    ORDER BY mh.version DESC, rh.version DESC
    LIMIT 1;
END$$

DELIMITER ;
