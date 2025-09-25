-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql211.byetcluster.com
-- Tiempo de generación: 25-09-2025 a las 14:00:25
-- Versión del servidor: 11.4.7-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_39865555_786545677`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `num_boleta` char(6) NOT NULL,
  `fecha_emi` datetime DEFAULT NULL,
  `id_cliente` char(6) DEFAULT NULL,
  `cod_emple` char(6) DEFAULT NULL,
  `estado_boleta` varchar(30) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `cod_cargo` char(6) NOT NULL,
  `nombre_cargo` varchar(30) DEFAULT NULL,
  `sueldo_basico` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` char(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` char(6) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `fono` char(9) DEFAULT NULL,
  `id_dirección` char(6) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `genero` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_direccion`
--

CREATE TABLE `cliente_direccion` (
  `id_cliente_direccion` char(6) NOT NULL,
  `id_direccion` char(6) DEFAULT NULL,
  `id_cliente` char(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleboleta`
--

CREATE TABLE `detalleboleta` (
  `id_detalleboleta` char(6) NOT NULL,
  `num_boleta` char(6) DEFAULT NULL,
  `id_producto` char(6) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  `IGV` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` char(6) NOT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `provincia` varchar(15) DEFAULT NULL,
  `detalle_direccion` varchar(30) DEFAULT NULL,
  `referencia` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `cod_emple` char(6) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `DNI_Emple` char(6) DEFAULT NULL,
  `estado_civil` varchar(10) DEFAULT NULL,
  `nivel_educa` varchar(15) DEFAULT NULL,
  `teléfono` char(9) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `id_direccion` char(6) DEFAULT NULL,
  `cod_cargo` char(8) DEFAULT NULL,
  `cod_sede` char(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` char(6) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `stock_minimo` varchar(255) DEFAULT NULL,
  `stock_actual` varchar(255) DEFAULT NULL,
  `cod_categoria` char(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `cod_sede` char(6) NOT NULL,
  `cod_emple` char(6) DEFAULT NULL,
  `id_producto` char(6) DEFAULT NULL,
  `m2` int(11) DEFAULT NULL,
  `aforo` int(11) DEFAULT NULL,
  `num_pisos` int(11) DEFAULT NULL,
  `ubicacion` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`num_boleta`),
  ADD KEY `cod_emple` (`cod_emple`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`cod_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente_direccion`
--
ALTER TABLE `cliente_direccion`
  ADD PRIMARY KEY (`id_cliente_direccion`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD PRIMARY KEY (`id_detalleboleta`),
  ADD KEY `num_boleta` (`num_boleta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`cod_emple`),
  ADD KEY `cod_cargo` (`cod_cargo`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `cod_sede` (`cod_sede`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `cod_categoria` (`cod_categoria`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`cod_sede`),
  ADD KEY `id_producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
