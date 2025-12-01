DELIMITER $$

CREATE TRIGGER trg_<tabla>_ad
AFTER DELETE ON <tabla>
FOR EACH ROW
BEGIN
  DECLARE v_id_evento BIGINT;

  -- 1) Encabezado del evento de auditoría
  INSERT INTO auditoria_evento (
    nombre_tabla,
    pk_valor,
    tipo_operacion,
    id_usuario,
    comentario
  ) VALUES (
    '<tabla>',                         -- Nombre de la tabla auditada
    CAST(OLD.<nombre_pk> AS CHAR),     -- Valor de la PK borrada
    'DELETE',                          -- Tipo de operación
    @current_user_id,                  -- Usuario de app (variable de sesión)
    NULL                               -- Comentario opcional
  );

  SET v_id_evento = LAST_INSERT_ID();

  -- 2) Detalle: respaldo de todos los campos de la fila eliminada
  -- Sustituye col1, col2, col3 por columnas reales de la tabla
  INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
  VALUES
    (v_id_evento, 'col1', CAST(OLD.col1 AS CHAR), NULL),
    (v_id_evento, 'col2', CAST(OLD.col2 AS CHAR), NULL),
    (v_id_evento, 'col3', OLD.col3, NULL);
    -- Agrega más líneas según columnas de la tabla

END$$

DELIMITER ;
