DELIMITER $$

CREATE TRIGGER trg_<tabla>_au
AFTER UPDATE ON <tabla>
FOR EACH ROW
BEGIN
    DECLARE v_id_evento BIGINT;
    DECLARE v_cambios TINYINT DEFAULT 0;

    -- 1) Detectar si cambió algún campo de la tabla
    --    (reemplazar col1, col2, col3 ...)

    IF NOT (OLD.col1 <=> NEW.col1)
       OR NOT (OLD.col2 <=> NEW.col2)
       OR NOT (OLD.col3 <=> NEW.col3)
       -- agregar más columnas aquí
    THEN
        SET v_cambios = 1;
    END IF;

    -- Si NO hubo cambios, terminar aquí
    IF v_cambios = 0 THEN
        LEAVE BEGIN;
    END IF;

    -- 2) Registrar evento en auditoria_evento
    INSERT INTO auditoria_evento (
        nombre_tabla,
        pk_valor,
        tipo_operacion,
        id_usuario,
        comentario
    ) VALUES (
        '<tabla>',
        CAST(NEW.<pk> AS CHAR),
        'UPDATE',
        @current_user_id,
        NULL
    );

    SET v_id_evento = LAST_INSERT_ID();
    
    -- 3) Registrar detalle SOLO por cada campo cambiado

    IF NOT (OLD.col1 <=> NEW.col1) THEN
        INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
        VALUES (v_id_evento, 'col1',
                CAST(OLD.col1 AS CHAR),
                CAST(NEW.col1 AS CHAR));
    END IF;

    IF NOT (OLD.col2 <=> NEW.col2) THEN
        INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
        VALUES (v_id_evento, 'col2',
                CAST(OLD.col2 AS CHAR),
                CAST(NEW.col2 AS CHAR));
    END IF;

    IF NOT (OLD.col3 <=> NEW.col3) THEN
        INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
        VALUES (v_id_evento, 'col3',
                CAST(OLD.col3 AS CHAR),
                CAST(NEW.col3 AS CHAR));
    END IF;

    -- agregar N campos según la tabla real

END$$

DELIMITER ;
