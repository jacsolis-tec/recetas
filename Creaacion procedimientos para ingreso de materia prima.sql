DELIMITER $$

CREATE PROCEDURE registrar_pedido (
    IN p_id_proveedor INT,
    IN p_fecha DATE,
    IN p_total DECIMAL(10,2),
    OUT p_id_pedido INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    -- Validar proveedor
    SELECT COUNT(*) INTO v_count
    FROM proveedor
    WHERE id_proveedor = p_id_proveedor;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El proveedor no existe';
    END IF;

    INSERT INTO pedido (id_proveedor, fecha_pedido, total_pedido)
    VALUES (p_id_proveedor, p_fecha, p_total);

    SET p_id_pedido = LAST_INSERT_ID();
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE registrar_factura_proveedor (
    IN p_id_pedido INT,
    IN p_numero_factura VARCHAR(50),
    IN p_monto DECIMAL(10,2),
    OUT p_id_factura INT
)
BEGIN
    DECLARE v_count INT DEFAULT 0;

    SELECT COUNT(*) INTO v_count
    FROM pedido
    WHERE id_pedido = p_id_pedido;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El pedido no existe';
    END IF;

    INSERT INTO factura_proveedor (id_pedido, numero_factura, monto_factura)
    VALUES (p_id_pedido, p_numero_factura, p_monto);

    SET p_id_factura = LAST_INSERT_ID();
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE actualizar_inventario (
    IN p_id_ingrediente INT,
    IN p_cantidad DECIMAL(10,2)
)
BEGIN
    DECLARE v_existencias DECIMAL(10,2) DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;

    -- Validar ingrediente
    SELECT COUNT(*) INTO v_count
    FROM ingrediente
    WHERE id_ingrediente = p_id_ingrediente;

    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El ingrediente no existe';
    END IF;

    -- Cargar inventario actual
    SELECT existencias INTO v_existencias
    FROM inventario
    WHERE id_ingrediente = p_id_ingrediente
    FOR UPDATE;

    -- Actualizar existencias
    UPDATE inventario
    SET existencias = v_existencias + p_cantidad,
        fecha_actualizacion = NOW()
    WHERE id_ingrediente = p_id_ingrediente;
END$$

DELIMITER ;
