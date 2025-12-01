DELIMITER $$

CREATE TRIGGER trg_receta_version_insert
AFTER INSERT ON receta
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_receta_version_update
AFTER UPDATE ON receta
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_menu_version_insert
AFTER INSERT ON menu_diario
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_menu_version_update
AFTER UPDATE ON menu_diario
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_ciclo_version_insert
AFTER INSERT ON ciclo_menu
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
DELIMITER $$

CREATE TRIGGER trg_ciclo_version_update
AFTER UPDATE ON ciclo_menu
FOR EACH ROW
BEGIN
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
END$$

DELIMITER ;
