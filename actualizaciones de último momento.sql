-- 1. Eliminar la columna que registra el monto de efectivo contado físicamente
ALTER TABLE `cierre_caja`
DROP COLUMN `monto_contado_efectivo`;

-- 2. Eliminar la columna que registra la diferencia de efectivo (cuadre de caja)
ALTER TABLE `cierre_caja`
DROP COLUMN `diferencia_efectivo`;




-- Trigger para actualizar porciones disponibles
CREATE TRIGGER trg_actualizar_porciones_disponibles
AFTER INSERT ON venta_detalle
FOR EACH ROW
BEGIN
    -- Resta la cantidad vendida de las porciones disponibles en la orden de producción
    UPDATE produccion_diaria
    SET porciones_disponibles = porciones_disponibles - NEW.cantidad
    WHERE id_produccion_diaria = NEW.id_produccion_diaria;
END;

-- DELIMITER temporal para permitir la creación del procedimiento
DELIMITER //

CREATE PROCEDURE SP_CERRAR_CAJA (
    IN p_id_usuario_cajero INT,
    IN p_comentarios_cierre TEXT
)
BEGIN
    -- Variables locales para almacenar los totales calculados
    DECLARE v_total_ventas_sistema DECIMAL(10,2);
    DECLARE v_total_pagos_sistema DECIMAL(10,2);
    DECLARE v_fecha_apertura TIMESTAMP;

    -- 1. Determinar la última fecha de cierre para usarla como FECHA DE APERTURA
    SELECT
        MAX(fecha_cierre)
    INTO
        v_fecha_apertura
    FROM
        cierre_caja
    WHERE
        id_usuario_cajero = p_id_usuario_cajero;

    -- Si no hay cierres previos, asume una fecha de inicio general
    IF v_fecha_apertura IS NULL THEN
        -- Establece la apertura un día antes o al inicio del día actual, según la lógica del negocio
        SET v_fecha_apertura = DATE_SUB(NOW(), INTERVAL 1 DAY);
    END IF;

    -- 2. Calcular el Total de Ventas del Sistema
    SELECT
        COALESCE(SUM(v.total), 0.00)
    INTO
        v_total_ventas_sistema
    FROM
        venta v
    WHERE
        v.id_usuario_cajero = p_id_usuario_cajero
        AND v.fecha_venta >= v_fecha_apertura
        AND v.fecha_venta <= NOW();

    -- 3. Calcular el Total de Pagos Registrados en el Sistema (Tarjetas + Vales)
    SELECT
        COALESCE(SUM(vp.monto_pagado), 0.00)
    INTO
        v_total_pagos_sistema
    FROM
        venta_pago vp
        JOIN venta v ON vp.id_venta = v.id_venta
    WHERE
        v.id_usuario_cajero = p_id_usuario_cajero
        AND v.fecha_venta >= v_fecha_apertura
        AND v.fecha_venta <= NOW();

    -- 4. Insertar el registro de Cierre de Caja
    INSERT INTO cierre_caja (
        id_usuario_cajero,
        fecha_apertura,
        total_ventas_sistema,
        total_pagos_sistema,
        total_anulaciones, -- Columna mantenida, asumida como 0.00 sin tabla de anulaciones
        comentarios_cierre
    ) VALUES (
        p_id_usuario_cajero,
        v_fecha_apertura,
        v_total_ventas_sistema,
        v_total_pagos_sistema,
        0.00,
        p_comentarios_cierre
    );

END //

-- Restaurar el delimitador por defecto
DELIMITER ;


-- 
-- DELIMITER temporal para permitir la creación del procedimiento
DELIMITER //

CREATE PROCEDURE SP_ESTIMAR_DEMANDA_NO_SATISFECHA (
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_factor_latente DECIMAL(3,2) -- Ej: 0.15 para un 15% de demanda latente
)
BEGIN

/*
Este procedimiento calcula la demanda no satisfecha para un rango de fechas utilizando un factor de demanda latente.
Supuestos de la Estimación
    Agotamiento Total: La estimación solo aplica a los platos donde porciones_disponibles = 0.
    Factor de Demanda Latente: Se usa un parámetro de entrada (p_factor_latente) para definir qué porcentaje de las porciones vendidas se habría vendido adicionalmente si el plato hubiera tenido stock. (Ejemplo: Un factor de 0.15 significa que se estima que se perdieron 15 ventas por cada 100 ventas realizadas).
*/

    -- Tabla temporal para almacenar los resultados de la estimación
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_demanda_no_satisfecha (
        id_produccion_diaria INT,
        plato_servido VARCHAR(150),
        total_producido INT,
        porciones_vendidas INT,
        demanda_estimada_perdida DECIMAL(10,2)
    );

    -- Limpiar tabla temporal de ejecuciones anteriores
    TRUNCATE TABLE temp_demanda_no_satisfecha;

    -- Insertar resultados: Identificar agotamientos y aplicar el factor de estimación
    INSERT INTO temp_demanda_no_satisfecha (
        id_produccion_diaria,
        plato_servido,
        total_producido,
        porciones_vendidas,
        demanda_estimada_perdida
    )
    SELECT
        pd.id_produccion_diaria,
        rh.nombre_receta,
        pd.cantidad_producida,
        (pd.cantidad_producida - pd.porciones_disponibles) AS porciones_vendidas,
        -- Cálculo: Porciones Vendidas * Factor Latente
        (pd.cantidad_producida - pd.porciones_disponibles) * p_factor_latente AS demanda_estimada_perdida
    FROM
        produccion_diaria pd
    JOIN
        receta_historico rh ON pd.id_receta_historico = rh.id_receta_historico
    WHERE
        pd.fecha_inicio BETWEEN p_fecha_inicio AND p_fecha_fin
        AND pd.estado = 'terminada'
        AND pd.porciones_disponibles = 0; -- SOLO considera platos agotados

    -- Devolver los resultados de la estimación al usuario
    SELECT
        plato_servido,
        total_producido,
        porciones_vendidas,
        demanda_estimada_perdida,
        CONCAT(p_factor_latente * 100, '%') AS Factor_Aplicado
    FROM
        temp_demanda_no_satisfecha;

    -- Limpiar la tabla temporal al finalizar
    DROP TEMPORARY TABLE IF EXISTS temp_demanda_no_satisfecha;

END //

-- Restaurar el delimitador por defecto
DELIMITER ;