-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql211.infinityfree.com
-- Tiempo de generación: 11-09-2025 a las 11:33:33
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
-- Base de datos: `if0_39865555_precio1_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licenciafuncionamiento`
--

CREATE TABLE `licenciafuncionamiento` (
  `nroLicencia` char(6) NOT NULL,
  `fechaEmision` datetime NOT NULL,
  `fechaVencimiento` datetime NOT NULL,
  `nroDecretoAlcaldia` char(6) NOT NULL,
  `actividad` varchar(30) NOT NULL,
  `nroNegocio` char(6) NOT NULL,
  `representanteLegal` varchar(30) NOT NULL,
  `codPropietario` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio`
--

CREATE TABLE `negocio` (
  `nroNegocio` char(6) NOT NULL,
  `razonSocial` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `capacidad` int(11) NOT NULL,
  `tipoAcceso` varchar(30) NOT NULL,
  `nroLote` int(11) NOT NULL,
  `codTipoNeg` char(6) NOT NULL,
  `codPlano` char(6) NOT NULL,
  `codPropietario` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocioxpropietario`
--

CREATE TABLE `negocioxpropietario` (
  `codPropietario` char(6) NOT NULL,
  `nroNegocio` char(6) NOT NULL,
  `nombreProp` varchar(30) NOT NULL,
  `apellidósProp` varchar(30) NOT NULL,
  `razonProp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoimpuestos`
--

CREATE TABLE `pagoimpuestos` (
  `nroPago` char(6) NOT NULL,
  `fechaPago` datetime NOT NULL,
  `concepto` varchar(30) NOT NULL,
  `montoPago` decimal(10,2) NOT NULL,
  `periodoPredial` varchar(30) NOT NULL,
  `multa` decimal(10,2) NOT NULL,
  `descuento` decimal(10,2) NOT NULL,
  `codPropietario` char(6) NOT NULL,
  `totalPago` char(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planociudad`
--

CREATE TABLE `planociudad` (
  `codPlano` char(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `zonifacacion` varchar(30) NOT NULL,
  `longitud` int(11) NOT NULL,
  `nroCuadras` int(11) NOT NULL,
  `codTipoPlano` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `predios`
--

CREATE TABLE `predios` (
  `nroPredio` char(18) NOT NULL,
  `tipoPredio` char(18) NOT NULL,
  `categorizacion` char(18) NOT NULL,
  `pisos` char(18) NOT NULL,
  `fechaRegistro` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `extension` char(18) NOT NULL,
  `material` char(18) NOT NULL,
  `nroRegistro` char(6) NOT NULL,
  `numPredio` char(6) NOT NULL,
  `codPlano` char(6) NOT NULL,
  `fechaConstruccion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prediosxpropietarios`
--

CREATE TABLE `prediosxpropietarios` (
  `nroPredio` char(6) NOT NULL,
  `codPropietario` char(6) NOT NULL,
  `nombreProp` varchar(30) NOT NULL,
  `apellidosProp` varchar(30) NOT NULL,
  `porcTitularidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `codPropietario` char(6) NOT NULL,
  `nombreProp` varchar(30) NOT NULL,
  `apellidosProp` varchar(30) NOT NULL,
  `dniProp` char(8) NOT NULL,
  `telefonoRef` varchar(12) NOT NULL,
  `rucProp` char(11) NOT NULL,
  `edadProp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registromorosos`
--

CREATE TABLE `registromorosos` (
  `nroRegMorosos` char(6) NOT NULL,
  `fechaRegistro` datetime NOT NULL,
  `motivoMorosidad` varchar(30) NOT NULL,
  `montodeuda` decimal(10,2) NOT NULL,
  `codPropietario` char(6) NOT NULL,
  `Situacion` char(18) NOT NULL,
  `periodoAdeudado` char(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiponegocio`
--

CREATE TABLE `tiponegocio` (
  `codTipoNeg` char(6) NOT NULL,
  `denominacion` varchar(30) NOT NULL,
  `rubroGeneral` varchar(30) NOT NULL,
  `porcimpuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoplanos`
--

CREATE TABLE `tipoplanos` (
  `codTipoPlano` char(6) NOT NULL,
  `denominacionPlano` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `licenciafuncionamiento`
--
ALTER TABLE `licenciafuncionamiento`
  ADD PRIMARY KEY (`nroLicencia`),
  ADD KEY `R_23` (`nroNegocio`,`codPropietario`);

--
-- Indices de la tabla `negocio`
--
ALTER TABLE `negocio`
  ADD PRIMARY KEY (`nroNegocio`,`codPropietario`),
  ADD KEY `R_20` (`codPropietario`,`nroNegocio`),
  ADD KEY `R_22` (`codPlano`),
  ADD KEY `R_24` (`codTipoNeg`);

--
-- Indices de la tabla `negocioxpropietario`
--
ALTER TABLE `negocioxpropietario`
  ADD PRIMARY KEY (`codPropietario`,`nroNegocio`);

--
-- Indices de la tabla `pagoimpuestos`
--
ALTER TABLE `pagoimpuestos`
  ADD PRIMARY KEY (`nroPago`),
  ADD KEY `R_17` (`codPropietario`);

--
-- Indices de la tabla `planociudad`
--
ALTER TABLE `planociudad`
  ADD PRIMARY KEY (`codPlano`),
  ADD KEY `R_25` (`codTipoPlano`);

--
-- Indices de la tabla `predios`
--
ALTER TABLE `predios`
  ADD PRIMARY KEY (`nroPredio`),
  ADD KEY `R_7` (`codPlano`);

--
-- Indices de la tabla `prediosxpropietarios`
--
ALTER TABLE `prediosxpropietarios`
  ADD PRIMARY KEY (`nroPredio`,`codPropietario`),
  ADD KEY `R_14` (`codPropietario`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`codPropietario`);

--
-- Indices de la tabla `registromorosos`
--
ALTER TABLE `registromorosos`
  ADD PRIMARY KEY (`nroRegMorosos`),
  ADD KEY `R_16` (`codPropietario`);

--
-- Indices de la tabla `tiponegocio`
--
ALTER TABLE `tiponegocio`
  ADD PRIMARY KEY (`codTipoNeg`);

--
-- Indices de la tabla `tipoplanos`
--
ALTER TABLE `tipoplanos`
  ADD PRIMARY KEY (`codTipoPlano`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `licenciafuncionamiento`
--
ALTER TABLE `licenciafuncionamiento`
  ADD CONSTRAINT `R_23` FOREIGN KEY (`nroNegocio`,`codPropietario`) REFERENCES `negocio` (`nroNegocio`, `codPropietario`);

--
-- Filtros para la tabla `negocio`
--
ALTER TABLE `negocio`
  ADD CONSTRAINT `R_20` FOREIGN KEY (`codPropietario`,`nroNegocio`) REFERENCES `negocioxpropietario` (`codPropietario`, `nroNegocio`),
  ADD CONSTRAINT `R_22` FOREIGN KEY (`codPlano`) REFERENCES `planociudad` (`codPlano`),
  ADD CONSTRAINT `R_24` FOREIGN KEY (`codTipoNeg`) REFERENCES `tiponegocio` (`codTipoNeg`);

--
-- Filtros para la tabla `negocioxpropietario`
--
ALTER TABLE `negocioxpropietario`
  ADD CONSTRAINT `R_18` FOREIGN KEY (`codPropietario`) REFERENCES `propietarios` (`codPropietario`);

--
-- Filtros para la tabla `pagoimpuestos`
--
ALTER TABLE `pagoimpuestos`
  ADD CONSTRAINT `R_17` FOREIGN KEY (`codPropietario`) REFERENCES `propietarios` (`codPropietario`);

--
-- Filtros para la tabla `planociudad`
--
ALTER TABLE `planociudad`
  ADD CONSTRAINT `R_25` FOREIGN KEY (`codTipoPlano`) REFERENCES `tipoplanos` (`codTipoPlano`);

--
-- Filtros para la tabla `predios`
--
ALTER TABLE `predios`
  ADD CONSTRAINT `R_7` FOREIGN KEY (`codPlano`) REFERENCES `planociudad` (`codPlano`);

--
-- Filtros para la tabla `prediosxpropietarios`
--
ALTER TABLE `prediosxpropietarios`
  ADD CONSTRAINT `R_10` FOREIGN KEY (`nroPredio`) REFERENCES `predios` (`nroPredio`),
  ADD CONSTRAINT `R_14` FOREIGN KEY (`codPropietario`) REFERENCES `propietarios` (`codPropietario`);

--
-- Filtros para la tabla `registromorosos`
--
ALTER TABLE `registromorosos`
  ADD CONSTRAINT `R_16` FOREIGN KEY (`codPropietario`) REFERENCES `propietarios` (`codPropietario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
