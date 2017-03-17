-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2017 a las 01:59:41
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica_upm`
--
CREATE DATABASE IF NOT EXISTS `clinica_upm` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `clinica_upm`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `ID` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `ID_ESPECIALIDAD` int(11) NOT NULL,
  `ID_PERSONAL` int(11) NOT NULL,
  `ID_PACIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `cita`:
--   `ID_ESPECIALIDAD`
--       `especialidad` -> `ID`
--   `ID_PACIENTE`
--       `paciente` -> `ID`
--   `ID_PERSONAL`
--       `personal` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `especialidad`:
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `ID` int(11) NOT NULL,
  `ID_PACIENTE` int(11) NOT NULL,
  `ID_PERSONAL` int(11) NOT NULL,
  `F_ALTA` date NOT NULL,
  `F_ULT_MOD` date NOT NULL,
  `COMENTARIOS` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `historial`:
--   `ID_PACIENTE`
--       `paciente` -> `ID`
--   `ID_PERSONAL`
--       `personal` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `COMPANIA_SEGURO` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `paciente`:
--   `ID_USUARIO`
--       `usuario` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `NUM_COLEGIADO` int(11) NOT NULL,
  `DISPONIBILIDAD` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `TIEMPO_MIN_CONSULTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `personal`:
--   `ID_USUARIO`
--       `usuario` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_personal_especialidad`
--

CREATE TABLE `rel_personal_especialidad` (
  `ID` int(11) NOT NULL,
  `ID_PERSONAL` int(11) NOT NULL,
  `ID_ESPECIALIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `rel_personal_especialidad`:
--   `ID_ESPECIALIDAD`
--       `especialidad` -> `ID`
--   `ID_PERSONAL`
--       `personal` -> `ID`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `APELLIDOS` varchar(24) COLLATE utf8_spanish_ci NOT NULL,
  `ALIAS` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `PASSWORD` varchar(24) COLLATE utf8_spanish_ci NOT NULL,
  `TIPO_USUARIO` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `usuario`:
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ESPECIALIDAD` (`ID_ESPECIALIDAD`),
  ADD KEY `ID_PERSONAL` (`ID_PERSONAL`),
  ADD KEY `ID_PACIENTE` (`ID_PACIENTE`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PACIENTE` (`ID_PACIENTE`),
  ADD KEY `ID_PERSONAL` (`ID_PERSONAL`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `rel_personal_especialidad`
--
ALTER TABLE `rel_personal_especialidad`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONAL` (`ID_PERSONAL`),
  ADD KEY `ID_ESPECIALIDAD` (`ID_ESPECIALIDAD`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_personal_especialidad`
--
ALTER TABLE `rel_personal_especialidad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para cita
--

--
-- Metadatos para especialidad
--

--
-- Metadatos para historial
--

--
-- Metadatos para paciente
--

--
-- Metadatos para personal
--

--
-- Metadatos para rel_personal_especialidad
--

--
-- Metadatos para usuario
--

--
-- Metadatos para clinica_upm
--

--
-- Volcado de datos para la tabla `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('clinica_upm', 'cita', 'ID_ESPECIALIDAD', 'clinica_upm', 'especialidad', 'ID'),
('clinica_upm', 'cita', 'ID_PACIENTE', 'clinica_upm', 'paciente', 'ID'),
('clinica_upm', 'cita', 'ID_PERSONAL', 'clinica_upm', 'personal', 'ID'),
('clinica_upm', 'historial', 'ID_PACIENTE', 'clinica_upm', 'paciente', 'ID'),
('clinica_upm', 'historial', 'ID_PERSONAL', 'clinica_upm', 'personal', 'ID'),
('clinica_upm', 'paciente', 'ID_USUARIO', 'clinica_upm', 'usuario', 'ID'),
('clinica_upm', 'personal', 'ID_USUARIO', 'clinica_upm', 'usuario', 'ID'),
('clinica_upm', 'rel_personal_especialidad', 'ID_ESPECIALIDAD', 'clinica_upm', 'especialidad', 'ID'),
('clinica_upm', 'rel_personal_especialidad', 'ID_PERSONAL', 'clinica_upm', 'personal', 'ID');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
