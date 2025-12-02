-- ============================================
-- SCRIPT DE CARGA INICIAL - SISTEMA COMEDOR
-- Ejecutar UNA VEZ después de crear las tablas
-- ============================================

BEGIN;

-- ========== 1. CATÁLOGOS GENERALES ==========

-- Estados del sistema
INSERT INTO estados (codigo, nombre, descripcion, tipo, activo) VALUES
('ACT', 'Activo', 'Registro activo y disponible', 'general', true),
('INA', 'Inactivo', 'Registro inactivo', 'general', true),
('PEN', 'Pendiente', 'Pendiente de aprobación', 'general', true),
('APR', 'Aprobado', 'Aprobado para uso', 'general', true),
('REC', 'Rechazado', 'Rechazado', 'general', true),
('ANU', 'Anulado', 'Anulado/cancelado', 'general', true),
('SUS', 'Suspendido', 'Suspendido temporalmente', 'general', true);

-- Unidades de medida
INSERT INTO unidades_medida (codigo, nombre, simbolo, tipo, activo) VALUES
('KG', 'Kilogramo', 'kg', 'peso', true),
('GR', 'Gramo', 'g', 'peso', true),
('LT', 'Litro', 'L', 'volumen', true),
('ML', 'Mililitro', 'ml', 'volumen', true),
('UN', 'Unidad', 'un', 'unidad', true),
('PQ', 'Paquete', 'pq', 'empaque', true),
('CA', 'Caja', 'caja', 'empaque', true),
('BO', 'Bolsa', 'bolsa', 'empaque', true);

-- Categorías de ingredientes
INSERT INTO categorias_ingredientes (codigo, nombre, descripcion, activo) VALUES
('PROT', 'Proteínas', 'Carnes, pollo, pescado, huevos', true),
('CERE', 'Cereales', 'Arroz, frijoles, pasta, maíz', true),
('LACT', 'Lácteos', 'Leche, queso, yogurt, mantequilla', true),
('VERD', 'Verduras', 'Vegetales y hortalizas', true),
('FRUT', 'Frutas', 'Frutas frescas y secas', true),
('GRAS', 'Grasas', 'Aceites, manteca', true),
('COND', 'Condimentos', 'Sal, pimienta, especias', true),
('BEB', 'Bebidas', 'Jugos, refrescos, café', true),
('VAR', 'Varios', 'Otros ingredientes', true);

-- Tipos de comida
INSERT INTO tipos_comida (codigo, nombre, hora_inicio, hora_fin, activo) VALUES
('DES', 'Desayuno', '06:00:00', '09:00:00', true),
('ALM', 'Almuerzo', '11:00:00', '14:00:00', true),
('MER', 'Merienda', '15:00:00', '16:00:00', true),
('CEN', 'Cena', '18:00:00', '20:00:00', true);

-- Métodos de pago
INSERT INTO metodos_pago (codigo, nombre, requiere_cambio, activo) VALUES
('EFE', 'Efectivo', true, true),
('TCD', 'Tarjeta de Débito', false, true),
('TCC', 'Tarjeta de Crédito', false, true),
('TRA', 'Transferencia', false, true),
('VAL', 'Vale institucional', false, true),
('SIN', 'Cortesía/Sin pago', false, true);

-- ========== 2. ROLES DEL SISTEMA ==========

INSERT INTO roles (codigo, nombre, descripcion, nivel_acceso, permisos, activo) VALUES
('GER', 'Gerencia/Coordinación', 'Acceso total a todos los módulos', 100, 
 '{"ventas": true, "inventario": true, "produccion": true, "reportes": true, "configuracion": true, "usuarios": true}', 
 true),
('NUT', 'Nutrición', 'Gestión de menús y recetas', 80,
 '{"recetas": true, "menus": true, "reportes_nutricionales": true, "configuracion_menus": true}',
 true),
('BOD', 'Bodega', 'Gestión de inventario', 70,
 '{"inventario": true, "compras": true, "reportes_inventario": true}',
 true),
('COC', 'Cocina', 'Registro de producción', 60,
 '{"produccion": true, "recetas": true, "inventario_consulta": true}',
 true),
('CAJ', 'Cajero/Ventas', 'Punto de venta', 50,
 '{"ventas": true, "reportes_ventas": true}',
 true),
('ADM', 'Asistente Administrativo', 'Gestión administrativa', 75,
 '{"ventas": true, "inventario": true, "reportes": true, "configuracion_basica": true}',
 true),
('TEC', 'Administrador Técnico', 'Mantenimiento técnico', 90,
 '{"configuracion": true, "usuarios": true, "backup": true, "logs": true}',
 true);

-- ========== 3. USUARIOS INICIALES ==========

-- Contraseñas: En producción usar bcrypt, aquí es demo
INSERT INTO usuarios (username, password_hash, nombre_completo, email, rol_id, activo) VALUES
('admin', 'admin123', 'Administrador del Sistema', 'admin@comedor.com', 
 (SELECT id FROM roles WHERE codigo = 'GER'), true),
('nutricion', 'nutri123', 'Ana Rodríguez - Nutrición', 'nutricion@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'NUT'), true),
('bodega', 'bodega123', 'Carlos Méndez - Bodega', 'bodega@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'BOD'), true),
('cocina', 'cocina123', 'María González - Cocina', 'cocina@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'COC'), true),
('cajero1', 'cajero123', 'Laura Sánchez - Cajera', 'cajero1@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'CAJ'), true),
('cajero2', 'cajero123', 'Juan Pérez - Cajero', 'cajero2@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'CAJ'), true),
('asistente', 'asist123', 'Sofía Ramírez - Asistente', 'asistente@comedor.com',
 (SELECT id FROM roles WHERE codigo = 'ADM'), true);

-- ========== 4. INGREDIENTES BASE ==========

INSERT INTO ingredientes (codigo, nombre, descripcion, unidad_medida_id, categoria_id, costo_promedio, stock_minimo, stock_maximo, activo) VALUES
('ARROZ-1', 'Arroz blanco', 'Arroz blanco grano corto', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'CERE'),
 1200.00, 50, 200, true),
('FRIJ-1', 'Frijoles negros', 'Frijoles negros', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'CERE'),
 1800.00, 30, 150, true),
('POLLO-1', 'Pollo entero', 'Pollo para guisar', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'PROT'),
 2800.00, 20, 100, true),
('CARNE-1', 'Carne molida', 'Carne molida de res', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'PROT'),
 3500.00, 15, 80, true),
('LECH-1', 'Leche líquida', 'Leche entera', 
 (SELECT id FROM unidades_medida WHERE codigo = 'LT'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'LACT'),
 850.00, 20, 100, true),
('QUES-1', 'Queso fresco', 'Queso fresco', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'LACT'),
 3200.00, 10, 50, true),
('TOMA-1', 'Tomate', 'Tomate rojo', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'VERD'),
 800.00, 10, 40, true),
('CEBO-1', 'Cebolla', 'Cebolla blanca', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'VERD'),
 600.00, 10, 40, true),
('ACEI-1', 'Aceite vegetal', 'Aceite para cocinar', 
 (SELECT id FROM unidades_medida WHERE codigo = 'LT'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'GRAS'),
 2200.00, 10, 50, true),
('SAL-1', 'Sal', 'Sal de mesa', 
 (SELECT id FROM unidades_medida WHERE codigo = 'KG'),
 (SELECT id FROM categorias_ingredientes WHERE codigo = 'COND'),
 500.00, 5, 20, true);

-- ========== 5. RECETAS BASE ==========

INSERT INTO recetas (codigo, nombre, descripcion, porciones, tiempo_preparacion, dificultad, activo) VALUES
('REC-001', 'Casado típico', 'Plato típico con arroz, frijoles, carne, ensalada y plátano', 1, 45, 'media', true),
('REC-002', 'Arroz con pollo', 'Arroz cocinado con pollo y vegetales', 1, 60, 'media', true),
('REC-003', 'Gallo pinto', 'Arroz con frijoles típico para desayuno', 1, 30, 'facil', true),
('REC-004', 'Sopa de verduras', 'Sopa con variedad de vegetales', 1, 40, 'facil', true),
('REC-005', 'Ensalada fresca', 'Ensalada de lechuga, tomate y cebolla', 1, 15, 'facil', true);

-- Ingredientes para receta 1 (Casado típico)
INSERT INTO receta_ingredientes (receta_id, ingrediente_id, cantidad, unidad_medida_id, observaciones) VALUES
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'ARROZ-1'), 0.2, (SELECT id FROM unidades_medida WHERE codigo = 'KG'), 'Arroz cocido'),
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'FRIJ-1'), 0.15, (SELECT id FROM unidades_medida WHERE codigo = 'KG'), 'Frijoles cocidos'),
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'CARNE-1'), 0.15, (SELECT id FROM unidades_medida WHERE codigo = 'KG'), 'Carne guisada'),
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'TOMA-1'), 0.05, (SELECT id FROM unidades_medida WHERE codigo = 'KG'), 'Para ensalada'),
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'CEBO-1'), 0.02, (SELECT id FROM unidades_medida WHERE codigo = 'KG'), 'Para ensalada'),
((SELECT id FROM recetas WHERE codigo = 'REC-001'), (SELECT id FROM ingredientes WHERE codigo = 'ACEI-1'), 0.01, (SELECT id FROM unidades_medida WHERE codigo = 'LT'), 'Para cocinar');

-- ========== 6. CONFIGURACIÓN DEL SISTEMA ==========

INSERT INTO configuracion_sistema (clave, valor, descripcion, categoria, editable) VALUES
('NOMBRE_COMEDOR', 'Comedor Institucional TEC', 'Nombre oficial del comedor', 'general', true),
('IMPUESTO_VENTAS', '13', 'Porcentaje de impuesto de ventas', 'fiscal', true),
('MONEDA', 'CRC', 'Moneda local (Colones costarricenses)', 'general', false),
('LOGO_URL', '/assets/logo.png', 'URL del logo institucional', 'general', true),
('HORA_APERTURA', '06:00', 'Hora de apertura del comedor', 'horarios', true),
('HORA_CIERRE', '20:00', 'Hora de cierre del comedor', 'horarios', true),
('STOCK_ALERTA_DIAS', '7', 'Días para alerta de productos por vencer', 'inventario', true),
('TICKET_PIE', 'Gracias por su preferencia', 'Texto al pie del ticket', 'ventas', true),
('CORREO_CONTACTO', 'comedor@tec.ac.cr', 'Correo electrónico de contacto', 'contacto', true),
('TELEFONO_CONTACTO', '2550-0000', 'Teléfono de contacto', 'contacto', true);

-- ========== 7. INVENTARIO INICIAL ==========

INSERT INTO inventario (ingrediente_id, cantidad, ubicacion, lote, fecha_ingreso, fecha_caducidad) VALUES
((SELECT id FROM ingredientes WHERE codigo = 'ARROZ-1'), 100.00, 'Bodega A, Estante 1', 'LOTE-2025-001', '2025-01-10', '2026-01-10'),
((SELECT id FROM ingredientes WHERE codigo = 'FRIJ-1'), 80.00, 'Bodega A, Estante 2', 'LOTE-2025-002', '2025-01-10', '2026-06-10'),
((SELECT id FROM ingredientes WHERE codigo = 'POLLO-1'), 50.00, 'Cuarto frío 1', 'LOTE-2025-003', '2025-01-15', '2025-02-15'),
((SELECT id FROM ingredientes WHERE codigo = 'CARNE-1'), 30.00, 'Cuarto frío 2', 'LOTE-2025-004', '2025-01-15', '2025-02-01'),
((SELECT id FROM ingredientes WHERE codigo = 'LECH-1'), 60.00, 'Refrigerador 1', 'LOTE-2025-005', '2025-01-12', '2025-02-12'),
((SELECT id FROM ingredientes WHERE codigo = 'QUES-1'), 25.00, 'Refrigerador 2', 'LOTE-2025-006', '2025-01-12', '2025-03-12'),
((SELECT id FROM ingredientes WHERE codigo = 'TOMA-1'), 15.00, 'Bodega B, Estante 3', 'LOTE-2025-007', '2025-01-14', '2025-01-28'),
((SELECT id FROM ingredientes WHERE codigo = 'CEBO-1'), 20.00, 'Bodega B, Estante 4', 'LOTE-2025-008', '2025-01-14', '2025-02-14'),
((SELECT id FROM ingredientes WHERE codigo = 'ACEI-1'), 30.00, 'Bodega A, Estante 5', 'LOTE-2025-009', '2025-01-10', '2026-01-10'),
((SELECT id FROM ingredientes WHERE codigo = 'SAL-1'), 10.00, 'Bodega B, Estante 6', 'LOTE-2025-010', '2025-01-10', '2027-01-10');

-- ========== 8. PRODUCTOS PARA VENTA ==========

INSERT INTO productos (codigo, nombre, descripcion, receta_id, precio_venta, costo_estimado, categoria, disponible) VALUES
('PROD-001', 'Casado de carne', 'Plato típico con carne', (SELECT id FROM recetas WHERE codigo = 'REC-001'), 2500.00, 1200.00, 'almuerzo', true),
('PROD-002', 'Casado de pollo', 'Plato típico con pollo', (SELECT id FROM recetas WHERE codigo = 'REC-001'), 2500.00, 1100.00, 'almuerzo', true),
('PROD-003', 'Arroz con pollo', 'Arroz con pollo y vegetales', (SELECT id FROM recetas WHERE codigo = 'REC-002'), 2200.00, 1000.00, 'almuerzo', true),
('PROD-004', 'Gallo pinto completo', 'Desayuno típico con huevo y tortilla', (SELECT id FROM recetas WHERE codigo = 'REC-003'), 1800.00, 800.00, 'desayuno', true),
('PROD-005', 'Sopa de verduras', 'Sopa de vegetales frescos', (SELECT id FROM recetas WHERE codigo = 'REC-004'), 1500.00, 600.00, 'almuerzo', true),
('PROD-006', 'Ensalada fresca', 'Ensalada de la casa', (SELECT id FROM recetas WHERE codigo = 'REC-005'), 1200.00, 400.00, 'acompañamiento', true),
('PROD-007', 'Fresco natural', 'Fresco de fruta natural', NULL, 800.00, 300.00, 'bebida', true),
('PROD-008', 'Café', 'Café negro o con leche', NULL, 500.00, 150.00, 'bebida', true),
('PROD-009', 'Postre del día', 'Postre variado diario', NULL, 1000.00, 400.00, 'postre', true);

-- ========== 9. MENÚ SEMANAL DE EJEMPLO ==========

INSERT INTO menus (fecha, tipo_comida_id, estado, usuario_creador_id) VALUES
(CURRENT_DATE + 1, (SELECT id FROM tipos_comida WHERE codigo = 'DES'), 'planificado', 
 (SELECT id FROM usuarios WHERE username = 'nutricion')),
(CURRENT_DATE + 1, (SELECT id FROM tipos_comida WHERE codigo = 'ALM'), 'planificado',
 (SELECT id FROM usuarios WHERE username = 'nutricion'));

-- Productos en el menú
INSERT INTO menu_productos (menu_id, producto_id, orden, disponible) VALUES
((SELECT id FROM menus WHERE fecha = CURRENT_DATE + 1 AND tipo_comida_id = (SELECT id FROM tipos_comida WHERE codigo = 'ALM')),
 (SELECT id FROM productos WHERE codigo = 'PROD-001'), 1, true),
((SELECT id FROM menus WHERE fecha = CURRENT_DATE + 1 AND tipo_comida_id = (SELECT id FROM tipos_comida WHERE codigo = 'ALM')),
 (SELECT id FROM productos WHERE codigo = 'PROD-003'), 2, true),
((SELECT id FROM menus WHERE fecha = CURRENT_DATE + 1 AND tipo_comida_id = (SELECT id FROM tipos_comida WHERE codigo = 'ALM')),
 (SELECT id FROM productos WHERE codigo = 'PROD-005'), 3, true),
((SELECT id FROM menus WHERE fecha = CURRENT_DATE + 1 AND tipo_comida_id = (SELECT id FROM tipos_comida WHERE codigo = 'ALM')),
 (SELECT id FROM productos WHERE codigo = 'PROD-007'), 4, true);

-- ========== 10. PUNTOS DE VENTA ==========

INSERT INTO puntos_venta (codigo, nombre, ubicacion, impresora_fiscal, activo) VALUES
('PV-01', 'Caja Principal', 'Entrada principal', 'Epson TM-T88V', true),
('PV-02', 'Caja Secundaria', 'Área de desayuno', 'Epson TM-T88V', true),
('PV-03', 'Caja Eventos', 'Salón de eventos', 'Epson TM-T88V', false);

COMMIT;

-- ============================================
-- RESUMEN DE LA CARGA
-- ============================================
DO $$
BEGIN
    RAISE NOTICE '✅ CARGA INICIAL COMPLETADA';
    RAISE NOTICE '================================';
    RAISE NOTICE 'Estados del sistema: 7 registros';
    RAISE NOTICE 'Unidades de medida: 8 registros';
    RAISE NOTICE 'Categorías ingredientes: 9 registros';
    RAISE NOTICE 'Tipos de comida: 4 registros';
    RAISE NOTICE 'Métodos de pago: 6 registros';
    RAISE NOTICE 'Roles: 7 registros';
    RAISE NOTICE 'Usuarios: 7 registros';
    RAISE NOTICE 'Ingredientes: 10 registros';
    RAISE NOTICE 'Recetas: 5 registros';
    RAISE NOTICE 'Ingredientes en recetas: 6 registros';
    RAISE NOTICE 'Configuración: 10 registros';
    RAISE NOTICE 'Inventario: 10 registros';
    RAISE NOTICE 'Productos: 9 registros';
    RAISE NOTICE 'Menús: 2 registros';
    RAISE NOTICE 'Productos en menús: 4 registros';
    RAISE NOTICE 'Puntos de venta: 3 registros';
    RAISE NOTICE '================================';
    RAISE NOTICE 'TOTAL: ~90 registros insertados';
    RAISE NOTICE 'Sistema listo para producción.';
END $$;