-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2022 a las 00:06:13
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_orders`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id_cliente` int(10) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `responsable` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id_cliente`, `empresa`, `direccion`, `telefono`, `responsable`) VALUES
(46, 'Metalist  ', 'Calle Abc 123  ', '154510789', 'Juan Fernandez  '),
(47, 'Petroleum ', 'John Lennon 26 ', '154898756', 'Mauricio Javier '),
(48, 'ArgenCer ', 'Buzón 140 ', '154736985', 'Veronica Mariela '),
(49, 'Carregul ', 'Ugarte 764 ', '154236978', 'Alfredo Garcia ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `myorder`
--

CREATE TABLE `myorder` (
  `n_pedido` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `forma_pago` varchar(20) NOT NULL,
  `detalle` text NOT NULL,
  `enviado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `myorder`
--

INSERT INTO `myorder` (`n_pedido`, `id_cliente`, `fecha_pedido`, `forma_pago`, `detalle`, `enviado`) VALUES
(66, 46, '2022-10-01', 'Credito', '1- Planchas de metal\r\n2- Hojas de sierra\r\n3- Plato de corte\r\n', 1),
(67, 46, '2022-10-02', 'Contado', '1- Vateriales varios según muestra', 0),
(68, 46, '2022-10-02', 'Cheque', '1- Planchas de metal\r\n2- Hojas de sierra\r\n3- Plato de corte\r\n4- Bolsas\r\n5- Guantes de seguridad', 0),
(69, 47, '2022-10-03', 'Transferencia', '1- Tambores de aceite xv300\r\n2- Listros de d-500 por 5000 litros', 1),
(70, 47, '2022-10-04', 'CtaCte', '1- Litros de gasoil por 30.000 litros distribuidos en camión cisterna.', 0),
(71, 48, '2022-10-02', 'Contado', '1- Silobolsas de color verde\r\n2- Silobolsas de color blanco\r\n3- Alquiler de deposito ', 1),
(72, 48, '2022-10-06', 'CtaCte', '1- 50 bolsas de semilla de trigo\r\n2- 150 bolsas de semilla de cebada\r\n3- 200 bolsas de avena integral\r\n4- 30 bolsas de cebada importada\r\n5- 150 bolsas de maiz', 0),
(73, 49, '2022-10-12', 'CtaCte', '1- Cajas de cartón\r\n2- Estanterias reforzadas\r\n', 1),
(74, 49, '2022-10-13', 'Cheque', '1- Lapices\r\n2- Gomas\r\n3- Lapiceras\r\n4- Correstores\r\n5- Marcadores', 0),
(75, 49, '2022-10-14', 'Contado', '1- Kit de limpieza', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(1, 'herzgott@yahoo.com.ar', '$2y$10$vsSdj5JWgtGQrHQKp1D27.U/ANJpYcje/szRmgjm4xuJDxIHnHoz6'),
(2, 'admin@admin.com', '$2y$10$e2VlOQiKuB5eFiHXzq3JBOPXCTKB5SF2na58VWgvR5RRgqKSSYmim');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `myorder`
--
ALTER TABLE `myorder`
  ADD PRIMARY KEY (`n_pedido`),
  ADD KEY `id_cliente` (`id_cliente`) USING BTREE;

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `myorder`
--
ALTER TABLE `myorder`
  MODIFY `n_pedido` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `myorder`
--
ALTER TABLE `myorder`
  ADD CONSTRAINT `myorder_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `customer` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
