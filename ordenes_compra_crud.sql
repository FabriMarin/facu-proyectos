-- CRUD procedures and table definitions for ordenes_compra

-- Table structure for ordenes_compra
CREATE TABLE IF NOT EXISTS ordenes_compra (
    id_orden_compra INT NOT NULL AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_proveedor INT NOT NULL,
    id_usuario INT NOT NULL,
    estado VARCHAR(50) DEFAULT 'pendiente',
    observacion TEXT DEFAULT NULL,
    PRIMARY KEY (id_orden_compra),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Table structure for ordenes_compra_detalle
CREATE TABLE IF NOT EXISTS ordenes_compra_detalle (
    id_detalle INT NOT NULL AUTO_INCREMENT,
    id_orden_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    unidad VARCHAR(10) DEFAULT NULL,
    PRIMARY KEY (id_detalle),
    FOREIGN KEY (id_orden_compra) REFERENCES ordenes_compra(id_orden_compra),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Stored procedures for CRUD operations on ordenes_compra
DELIMITER $$

CREATE PROCEDURE sp_create_orden_compra(
    IN p_fecha DATE,
    IN p_id_proveedor INT,
    IN p_id_usuario INT,
    IN p_estado VARCHAR(50),
    IN p_observacion TEXT
)
BEGIN
    INSERT INTO ordenes_compra (fecha, id_proveedor, id_usuario, estado, observacion)
    VALUES (p_fecha, p_id_proveedor, p_id_usuario, p_estado, p_observacion);
    SELECT LAST_INSERT_ID() AS id_orden_compra;
END $$

CREATE PROCEDURE sp_get_orden_compra(
    IN p_id INT
)
BEGIN
    SELECT * FROM ordenes_compra WHERE id_orden_compra = p_id;
END $$

CREATE PROCEDURE sp_update_orden_compra(
    IN p_id INT,
    IN p_fecha DATE,
    IN p_id_proveedor INT,
    IN p_id_usuario INT,
    IN p_estado VARCHAR(50),
    IN p_observacion TEXT
)
BEGIN
    UPDATE ordenes_compra
    SET fecha = p_fecha,
        id_proveedor = p_id_proveedor,
        id_usuario = p_id_usuario,
        estado = p_estado,
        observacion = p_observacion
    WHERE id_orden_compra = p_id;
END $$

CREATE PROCEDURE sp_delete_orden_compra(
    IN p_id INT
)
BEGIN
    DELETE FROM ordenes_compra WHERE id_orden_compra = p_id;
END $$

CREATE PROCEDURE sp_list_ordenes_compra()
BEGIN
    SELECT * FROM ordenes_compra;
END $$

-- Stored procedures for CRUD operations on ordenes_compra_detalle

CREATE PROCEDURE sp_add_orden_compra_detalle(
    IN p_id_orden_compra INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_unidad VARCHAR(10)
)
BEGIN
    INSERT INTO ordenes_compra_detalle (id_orden_compra, id_producto, cantidad, unidad)
    VALUES (p_id_orden_compra, p_id_producto, p_cantidad, p_unidad);
    SELECT LAST_INSERT_ID() AS id_detalle;
END $$

CREATE PROCEDURE sp_get_orden_compra_detalle(
    IN p_id_orden_compra INT
)
BEGIN
    SELECT * FROM ordenes_compra_detalle WHERE id_orden_compra = p_id_orden_compra;
END $$

CREATE PROCEDURE sp_update_orden_compra_detalle(
    IN p_id_detalle INT,
    IN p_id_producto INT,
    IN p_cantidad INT,
    IN p_unidad VARCHAR(10)
)
BEGIN
    UPDATE ordenes_compra_detalle
    SET id_producto = p_id_producto,
        cantidad = p_cantidad,
        unidad = p_unidad
    WHERE id_detalle = p_id_detalle;
END $$

CREATE PROCEDURE sp_delete_orden_compra_detalle(
    IN p_id_detalle INT
)
BEGIN
    DELETE FROM ordenes_compra_detalle WHERE id_detalle = p_id_detalle;
END $$

DELIMITER ;
