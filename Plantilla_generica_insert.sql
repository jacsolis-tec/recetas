DELIMITER $$

CREATE TRIGGER trg_<tabla>_ai
AFTER INSERT ON <tabla>
FOR EACH ROW
BEGIN
  DECLARE v_id_evento BIGINT;

  -- 1) Encabezado de auditoría
  INSERT INTO auditoria_evento (
    nombre_tabla,
    pk_valor,
    tipo_operacion,
    id_usuario,
    comentario
  ) VALUES (
    '<tabla>',                           -- Nombre de la tabla auditada
    CAST(NEW.<nombre_pk> AS CHAR),       -- PK convertida a texto
    'INSERT',                            -- Tipo de operación
    @current_user_id,                    -- Usuario actual (variable de sesión)
    NULL                                 -- Comentario opcional
  );

  SET v_id_evento = LAST_INSERT_ID();

  -- 2) Detalle: un registro por cada columna de la tabla
  --   AQUÍ reemplazamos col1, col2, col3 por los nombres reales de las columnas
  INSERT INTO auditoria_detalle (id_evento, nombre_campo, valor_anterior, valor_nuevo)
  VALUES
    (v_id_evento, 'col1', NULL, CAST(NEW.col1 AS CHAR)),
    (v_id_evento, 'col2', NULL, CAST(NEW.col2 AS CHAR)),
    (v_id_evento, 'col3', NULL, CAST(NEW.col3 AS CHAR));
    -- Agregar más líneas según columnas...
END$$

DELIMITER ;
