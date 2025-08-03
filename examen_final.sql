-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2025 a las 21:39:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `examen_final`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `ruc`, `telefono`, `email`, `direccion`) VALUES
(2, 'Humberto', '5544778899', '0984555222', 'galarza@gmail.com', 'Itaugua-Paraguay'),
(3, 'Alberto', '587946123', '0987485212', '11111@gmail.com', 'Paraguari');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_compra`
--

CREATE TABLE `pedidos_compra` (
  `id_pedido_compra` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_compra_detalle`
--

CREATE TABLE `pedidos_compra_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unidad` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_venta`
--

CREATE TABLE `pedidos_venta` (
  `id_pedido_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_venta_detalle`
--

CREATE TABLE `pedidos_venta_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `unidad` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_compra`
--

CREATE TABLE `presupuestos_compra` (
  `id_presupuesto_compra` int(11) NOT NULL,
  `id_pedido_compra` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `condiciones_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_compra_detalle`
--

CREATE TABLE `presupuestos_compra_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_presupuesto_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_servicio`
--

CREATE TABLE `presupuestos_servicio` (
  `id_presupuesto_servicio` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_servicio_detalle`
--

CREATE TABLE `presupuestos_servicio_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_presupuesto_servicio` int(11) NOT NULL,
  `descripcion_servicio` text NOT NULL,
  `equipo` varchar(100) DEFAULT NULL,
  `costo_estimado` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_venta`
--

CREATE TABLE `presupuestos_venta` (
  `id_presupuesto_venta` int(11) NOT NULL,
  `id_pedido_venta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `condiciones_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos_venta_detalle`
--

CREATE TABLE `presupuestos_venta_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_presupuesto_venta` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `unidad_medida`, `categoria`, `stock_actual`) VALUES
(1, 'Humberto', 'CIUDAD 1', 'Unidad', 'Calzados', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `ruc`, `telefono`, `email`, `direccion`) VALUES
(1, 'dwdw', 'ggg', 'gggg', 'ggg', 'ggg'),
(2, 'Humberto', '5544778899', '0981200555', '1111111@111111.com', 'Itaugua-Paraguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `id_presupuesto_servicio` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT 'en proceso',
  `observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_detalle`
--

CREATE TABLE `servicios_detalle` (
  `id_detalle` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `descripcion_trabajo` text NOT NULL,
  `equipo` varchar(100) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `serie` varchar(100) DEFAULT NULL,
  `costo_final` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `rol`) VALUES
(2, 'Humberto', 'jhgjhag@jkaHK.COM', 'empleado'),
(3, 'David', 'jhgjhag@jkaHK.COM', 'empleado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  ADD PRIMARY KEY (`id_pedido_compra`),
  ADD KEY `proveedor_id` (`id_proveedor`),
  ADD KEY `usuario_id` (`id_usuario`);

--
-- Indices de la tabla `pedidos_compra_detalle`
--
ALTER TABLE `pedidos_compra_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido_compra` (`id_pedido_compra`),
  ADD KEY `producto_id` (`id_producto`);

--
-- Indices de la tabla `pedidos_venta`
--
ALTER TABLE `pedidos_venta`
  ADD PRIMARY KEY (`id_pedido_venta`),
  ADD KEY `cliente_id` (`id_cliente`),
  ADD KEY `usuario_id` (`id_usuario`);

--
-- Indices de la tabla `pedidos_venta_detalle`
--
ALTER TABLE `pedidos_venta_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido_venta` (`id_pedido_venta`),
  ADD KEY `producto_id` (`id_producto`);

--
-- Indices de la tabla `presupuestos_compra`
--
ALTER TABLE `presupuestos_compra`
  ADD PRIMARY KEY (`id_presupuesto_compra`),
  ADD KEY `id_pedido_compra` (`id_pedido_compra`),
  ADD KEY `proveedor_id` (`id_proveedor`);

--
-- Indices de la tabla `presupuestos_compra_detalle`
--
ALTER TABLE `presupuestos_compra_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_presupuesto_compra` (`id_presupuesto_compra`),
  ADD KEY `producto_id` (`id_producto`);

--
-- Indices de la tabla `presupuestos_servicio`
--
ALTER TABLE `presupuestos_servicio`
  ADD PRIMARY KEY (`id_presupuesto_servicio`),
  ADD KEY `cliente_id` (`id_cliente`),
  ADD KEY `usuario_id` (`id_usuario`);

--
-- Indices de la tabla `presupuestos_servicio_detalle`
--
ALTER TABLE `presupuestos_servicio_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_presupuesto_servicio` (`id_presupuesto_servicio`);

--
-- Indices de la tabla `presupuestos_venta`
--
ALTER TABLE `presupuestos_venta`
  ADD PRIMARY KEY (`id_presupuesto_venta`),
  ADD KEY `id_pedido_venta` (`id_pedido_venta`),
  ADD KEY `cliente_id` (`id_cliente`);

--
-- Indices de la tabla `presupuestos_venta_detalle`
--
ALTER TABLE `presupuestos_venta_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_presupuesto_venta` (`id_presupuesto_venta`),
  ADD KEY `producto_id` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_presupuesto_servicio` (`id_presupuesto_servicio`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `servicios_detalle`
--
ALTER TABLE `servicios_detalle`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  MODIFY `id_pedido_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_compra_detalle`
--
ALTER TABLE `pedidos_compra_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_venta`
--
ALTER TABLE `pedidos_venta`
  MODIFY `id_pedido_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos_venta_detalle`
--
ALTER TABLE `pedidos_venta_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_compra`
--
ALTER TABLE `presupuestos_compra`
  MODIFY `id_presupuesto_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_compra_detalle`
--
ALTER TABLE `presupuestos_compra_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_servicio`
--
ALTER TABLE `presupuestos_servicio`
  MODIFY `id_presupuesto_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_servicio_detalle`
--
ALTER TABLE `presupuestos_servicio_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_venta`
--
ALTER TABLE `presupuestos_venta`
  MODIFY `id_presupuesto_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presupuestos_venta_detalle`
--
ALTER TABLE `presupuestos_venta_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios_detalle`
--
ALTER TABLE `servicios_detalle`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos_compra`
--
ALTER TABLE `pedidos_compra`
  ADD CONSTRAINT `pedidos_compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `pedidos_compra_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `pedidos_compra_detalle`
--
ALTER TABLE `pedidos_compra_detalle`
  ADD CONSTRAINT `pedidos_compra_detalle_ibfk_1` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidos_compra` (`id_pedido_compra`),
  ADD CONSTRAINT `pedidos_compra_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `pedidos_venta`
--
ALTER TABLE `pedidos_venta`
  ADD CONSTRAINT `pedidos_venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_venta_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `pedidos_venta_detalle`
--
ALTER TABLE `pedidos_venta_detalle`
  ADD CONSTRAINT `pedidos_venta_detalle_ibfk_1` FOREIGN KEY (`id_pedido_venta`) REFERENCES `pedidos_venta` (`id_pedido_venta`),
  ADD CONSTRAINT `pedidos_venta_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `presupuestos_compra`
--
ALTER TABLE `presupuestos_compra`
  ADD CONSTRAINT `presupuestos_compra_ibfk_1` FOREIGN KEY (`id_pedido_compra`) REFERENCES `pedidos_compra` (`id_pedido_compra`),
  ADD CONSTRAINT `presupuestos_compra_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `presupuestos_compra_detalle`
--
ALTER TABLE `presupuestos_compra_detalle`
  ADD CONSTRAINT `presupuestos_compra_detalle_ibfk_1` FOREIGN KEY (`id_presupuesto_compra`) REFERENCES `presupuestos_compra` (`id_presupuesto_compra`),
  ADD CONSTRAINT `presupuestos_compra_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `presupuestos_servicio`
--
ALTER TABLE `presupuestos_servicio`
  ADD CONSTRAINT `presupuestos_servicio_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `presupuestos_servicio_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `presupuestos_servicio_detalle`
--
ALTER TABLE `presupuestos_servicio_detalle`
  ADD CONSTRAINT `presupuestos_servicio_detalle_ibfk_1` FOREIGN KEY (`id_presupuesto_servicio`) REFERENCES `presupuestos_servicio` (`id_presupuesto_servicio`);

--
-- Filtros para la tabla `presupuestos_venta`
--
ALTER TABLE `presupuestos_venta`
  ADD CONSTRAINT `presupuestos_venta_ibfk_1` FOREIGN KEY (`id_pedido_venta`) REFERENCES `pedidos_venta` (`id_pedido_venta`),
  ADD CONSTRAINT `presupuestos_venta_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Filtros para la tabla `presupuestos_venta_detalle`
--
ALTER TABLE `presupuestos_venta_detalle`
  ADD CONSTRAINT `presupuestos_venta_detalle_ibfk_1` FOREIGN KEY (`id_presupuesto_venta`) REFERENCES `presupuestos_venta` (`id_presupuesto_venta`),
  ADD CONSTRAINT `presupuestos_venta_detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`id_presupuesto_servicio`) REFERENCES `presupuestos_servicio` (`id_presupuesto_servicio`),
  ADD CONSTRAINT `servicios_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `servicios_detalle`
--
ALTER TABLE `servicios_detalle`
  ADD CONSTRAINT `servicios_detalle_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
