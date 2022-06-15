-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2022 a las 17:48:08
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
-- Base de datos: `ddbbgrupo3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bar`
--

CREATE TABLE `bar` (
  `cam_id` int(11) NOT NULL,
  `bar_id` int(11) NOT NULL,
  `bar_nombre` varchar(50) NOT NULL,
  `bar_abierto` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bar`
--

INSERT INTO `bar` (`cam_id`, `bar_id`, `bar_nombre`, `bar_abierto`) VALUES
(1, 1, 'Bar Belisario', 1),
(2, 2, 'Bar Centro', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzon`
--

CREATE TABLE `buzon` (
  `bar_id` int(11) NOT NULL,
  `buz_id` int(11) NOT NULL,
  `buz_fecha` date NOT NULL,
  `buz_descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `buzon`
--

INSERT INTO `buzon` (`bar_id`, `buz_id`, `buz_fecha`, `buz_descripcion`) VALUES
(1, 1, '2022-06-14', 'Buzon de Sugerencias'),
(2, 2, '2022-06-14', 'Buzón de Ayuda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

CREATE TABLE `campus` (
  `cam_id` int(11) NOT NULL,
  `cam_nombre` varchar(50) NOT NULL,
  `cam_direccion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`cam_id`, `cam_nombre`, `cam_direccion`) VALUES
(1, 'Belisario Quevedo', 'Parroquia Belisario Quevedo'),
(2, 'ESPE Centro', 'Quijano y Ordoñez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `bar_id` int(11) NOT NULL,
  `men_id` int(11) NOT NULL,
  `men_nombre` varchar(50) NOT NULL,
  `men_precio` float(8,2) NOT NULL,
  `men_disponible` tinyint(1) NOT NULL,
  `men_descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Se pretende que cada dia se acrualice los estados de DISPONI';

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`bar_id`, `men_id`, `men_nombre`, `men_precio`, `men_disponible`, `men_descripcion`) VALUES
(1, 1, 'Menú Martes', 2.50, 1, 'Menú del día Martes para estudiantes'),
(1, 2, 'Menú para Docentes', 3.00, 1, 'Menú para Docentes del día Martes'),
(2, 3, 'Menú Estudiantil', 2.00, 1, 'Menú para estudiantes'),
(2, 4, 'Menú Vegetariano', 2.50, 1, 'Menú de ensaladas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `men_id` int(11) NOT NULL,
  `pre_id` int(11) NOT NULL,
  `pre_fecha` date NOT NULL,
  `pre_observacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `preferencias`
--

INSERT INTO `preferencias` (`men_id`, `pre_id`, `pre_fecha`, `pre_observacion`) VALUES
(1, 1, '2022-06-14', 'Muy buen menú'),
(2, 2, '2022-06-14', 'Buena comida'),
(3, 3, '2022-06-14', 'Buen menú'),
(4, 4, '2022-06-14', 'Ingredientes frescos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `snack`
--

CREATE TABLE `snack` (
  `bar_id` int(11) NOT NULL,
  `sna_id` int(11) NOT NULL,
  `sna_nombre` varchar(50) NOT NULL,
  `sna_precio` float(8,2) NOT NULL,
  `sna_disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `snack`
--

INSERT INTO `snack` (`bar_id`, `sna_id`, `sna_nombre`, `sna_precio`, `sna_disponible`) VALUES
(1, 1, 'papitas', 0.65, 1),
(1, 2, 'galletas', 0.50, 1),
(2, 3, 'chetos', 0.50, 1),
(2, 4, 'doritos', 0.60, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_name` varchar(50) NOT NULL,
  `usu_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_name`, `usu_password`) VALUES
('eve', 'eve1234'),
('geral', 'geral1112'),
('jair', 'jair8910'),
('mishell', 'mishell567');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bar`
--
ALTER TABLE `bar`
  ADD PRIMARY KEY (`bar_id`),
  ADD KEY `fk_campus_bar` (`cam_id`);

--
-- Indices de la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD PRIMARY KEY (`buz_id`),
  ADD KEY `fk_bar_buzon` (`bar_id`);

--
-- Indices de la tabla `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`cam_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`men_id`),
  ADD KEY `fk_bar_menu` (`bar_id`);

--
-- Indices de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`pre_id`),
  ADD KEY `fk_menu_preferencias` (`men_id`);

--
-- Indices de la tabla `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`sna_id`),
  ADD KEY `fk_bar_nack` (`bar_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bar`
--
ALTER TABLE `bar`
  MODIFY `bar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `buzon`
--
ALTER TABLE `buzon`
  MODIFY `buz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `campus`
--
ALTER TABLE `campus`
  MODIFY `cam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `men_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `pre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `snack`
--
ALTER TABLE `snack`
  MODIFY `sna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bar`
--
ALTER TABLE `bar`
  ADD CONSTRAINT `fk_campus_bar` FOREIGN KEY (`cam_id`) REFERENCES `campus` (`cam_id`);

--
-- Filtros para la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD CONSTRAINT `fk_bar_buzon` FOREIGN KEY (`bar_id`) REFERENCES `bar` (`bar_id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_bar_menu` FOREIGN KEY (`bar_id`) REFERENCES `bar` (`bar_id`);

--
-- Filtros para la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `fk_menu_preferencias` FOREIGN KEY (`men_id`) REFERENCES `menu` (`men_id`);

--
-- Filtros para la tabla `snack`
--
ALTER TABLE `snack`
  ADD CONSTRAINT `fk_bar_nack` FOREIGN KEY (`bar_id`) REFERENCES `bar` (`bar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
