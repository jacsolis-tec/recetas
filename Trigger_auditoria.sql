-- PLANTILLA DE UPDATE GENERICA
DELIMITER $$

CREATE TRIGGER trg_NOMBRETABLA_au
AFTER UPDATE ON NOMBRETABLA
FOR EACH ROW
BEGIN
  DECLARE v_id_evento BIGINT;
  DECLARE v_hay_cambios TINYINT DEFAULT 0;

  -- Marca si hubo cambios en alguna columna
  IF NOT (OLD.col1 <=> NEW.col1)
     OR NOT (OLD.col2 <=> NEW.col2)
     OR NOT (OLD.col3 <=> NEW.col3) THEN
    SET v_hay_cambios = 1;
  END IF;

  IF v_hay_cambios = 1 THEN
    INSERT INTO auditoria_evento (
      nombre_tabla,
      pk_valor,
      tipo_operacion,
      id_usuario,
      comentario
    ) VALUES (
      'NOMBRETABLA',
      CAST(NEW.id_pk AS CHAR),
      'UPDATE',
      @current_user_id,
      NULL
    );

    SET v_id_evento = LAST_INSERT_ID();

    -- Para cada columna que cambió:
    IF NOT (OLD.col1 <=> NEW.col1) THEN
      INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
      VALUES (v_id_evento, 'col1', CAST(OLD.col1 AS CHAR), CAST(NEW.col1 AS CHAR));
    END IF;

    IF NOT (OLD.col2 <=> NEW.col2) THEN
      INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
      VALUES (v_id_evento, 'col2', CAST(OLD.col2 AS CHAR), CAST(NEW.col2 AS CHAR));
    END IF;

    -- etc...
  END IF;
END$$

DELIMITER ;
