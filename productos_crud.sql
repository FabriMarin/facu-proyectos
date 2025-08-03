-- CRUD procedures for productos table

-- Procedure to create a product
DELIMITER $$
CREATE PROCEDURE sp_create_producto(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_unidad_medida VARCHAR(20),
    IN p_categoria VARCHAR(50),
    IN p_stock_actual INT
)
BEGIN
    INSERT INTO productos (nombre, descripcion, unidad_medida, categoria, stock_actual)
    VALUES (p_nombre, p_descripcion, p_unidad_medida, p_categoria, p_stock_actual);
    SELECT LAST_INSERT_ID() AS id_producto;
END $$
DELIMITER ;

-- Procedure to get a product by ID
DELIMITER $$
CREATE PROCEDURE sp_get_producto(
    IN p_id INT
)
BEGIN
    SELECT * FROM productos WHERE id_producto = p_id;
END $$
DELIMITER ;

-- Procedure to update a product
DELIMITER $$
CREATE PROCEDURE sp_update_producto(
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_unidad_medida VARCHAR(20),
    IN p_categoria VARCHAR(50),
    IN p_stock_actual INT
)
BEGIN
    UPDATE productos
    SET nombre = p_nombre,
        descripcion = p_descripcion,
        unidad_medida = p_unidad_medida,
        categoria = p_categoria,
        stock_actual = p_stock_actual
    WHERE id_producto = p_id;
END $$
DELIMITER ;

-- Procedure to delete a product
DELIMITER $$
CREATE PROCEDURE sp_delete_producto(
    IN p_id INT
)
BEGIN
    DELETE FROM productos WHERE id_producto = p_id;
END $$
DELIMITER ;

-- Procedure to list all products
DELIMITER $$
CREATE PROCEDURE sp_list_productos()
BEGIN
    SELECT * FROM productos;
END $$
DELIMITER ;

