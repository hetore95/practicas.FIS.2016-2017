-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2017 a las 14:55:37
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica_upm`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`ID`, `NOMBRE`) VALUES
(1, 'Anestesiología'),
(2, 'Cardiología'),
(3, 'Dermatología'),
(4, 'Endocrinología'),
(5, 'Gastroenterología'),
(6, 'Geriatría'),
(7, 'Ginecología'),
(8, 'Hemoterapia'),
(9, 'Infectología'),
(10, 'Alergología');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `COMPANIA_SEGURO` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID`, `ID_USUARIO`, `COMPANIA_SEGURO`) VALUES
(3, 24, 'Asisa'),
(4, 25, 'Sanitas'),
(5, 26, 'Asisa'),
(6, 27, 'Mafre'),
(7, 28, 'Sanitas'),
(8, 29, 'Mafre');

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
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`ID`, `ID_USUARIO`, `NUM_COLEGIADO`, `DISPONIBILIDAD`, `TIEMPO_MIN_CONSULTA`) VALUES
(4, 7, 100, 'NO', 60),
(5, 8, 101, 'NO', 90),
(6, 9, 102, 'NO', 60),
(7, 10, 103, 'NO', 90),
(8, 11, 104, 'NO', 90),
(9, 12, 105, 'NO', 60),
(10, 13, 106, 'NO', 60),
(11, 14, 107, 'NO', 90),
(12, 15, 108, 'NO', 60),
(13, 16, 109, 'NO', 60),
(14, 17, 110, 'NO', 60),
(15, 18, 111, 'NO', 60),
(16, 19, 112, 'NO', 60),
(17, 20, 113, 'NO', 90),
(18, 21, 114, 'NO', 60),
(19, 22, 115, 'NO', 90),
(20, 23, 116, 'NO', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion_salas`
--

CREATE TABLE `programacion_salas` (
  `ID` int(11) NOT NULL,
  `ID_SALA` int(11) NOT NULL,
  `ID_ESPECIALIDAD` int(11) NOT NULL,
  `ID_PERSONAL` int(11) NOT NULL,
  `FECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
-- Volcado de datos para la tabla `rel_personal_especialidad`
--

INSERT INTO `rel_personal_especialidad` (`ID`, `ID_PERSONAL`, `ID_ESPECIALIDAD`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 5, 4),
(5, 5, 5),
(6, 5, 6),
(7, 6, 7),
(8, 6, 8),
(9, 6, 9),
(10, 7, 10),
(11, 7, 1),
(12, 7, 2),
(13, 8, 3),
(14, 8, 4),
(15, 8, 5),
(16, 9, 6),
(17, 9, 7),
(18, 9, 8),
(19, 10, 9),
(20, 10, 10),
(21, 10, 1),
(22, 11, 2),
(23, 11, 3),
(24, 11, 4),
(25, 12, 5),
(26, 12, 6),
(27, 12, 7),
(28, 13, 8),
(29, 13, 9),
(30, 13, 10),
(31, 14, 1),
(32, 14, 2),
(33, 14, 3),
(34, 15, 4),
(35, 15, 5),
(36, 15, 6),
(37, 16, 7),
(38, 16, 8),
(39, 16, 9),
(40, 17, 10),
(41, 17, 1),
(42, 17, 2),
(43, 18, 3),
(44, 18, 4),
(45, 18, 5),
(46, 19, 6),
(47, 19, 7),
(48, 19, 8),
(49, 20, 9),
(50, 20, 10),
(51, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `APELLIDOS` varchar(24) COLLATE utf8_spanish_ci NOT NULL,
  `DNI` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `PASSWORD` varchar(24) COLLATE utf8_spanish_ci NOT NULL,
  `TIPO_USUARIO` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `NOMBRE`, `APELLIDOS`, `DNI`, `PASSWORD`, `TIPO_USUARIO`) VALUES
(1, 'ROOT', '', 'ROOT', 'ROOT', 'PERSONAL'),
(7, 'Soledad', 'Amoros', '123456789', 'soledad', 'PERSONAL'),
(8, 'Daniel', 'Andela', '123466789', 'daniel', 'PERSONAL'),
(9, 'Jose Maria', 'Dorado', '123476789', 'jose', 'PERSONAL'),
(10, 'Natalia', 'Lopez', '123486789', 'natalia', 'PERSONAL'),
(11, 'Esther', 'Gutierrez', '123496789', 'esther', 'PERSONAL'),
(12, 'Luis', 'Martin', '223496789', 'luis', 'PERSONAL'),
(13, 'Pablo', 'Cano', '323496789', 'pablo', 'PERSONAL'),
(14, 'Arturo', 'Perez', '423496789', 'arturo', 'PERSONAL'),
(15, 'Aurora', 'Luque', '523496789', 'aurora', 'PERSONAL'),
(16, 'Alfonso', 'Garrido', '623496789', 'alfonso', 'PERSONAL'),
(17, 'Pedro Luis', 'Encinas', '723496789', 'pedro', 'PERSONAL'),
(18, 'Benito', 'Drasin', '823496789', 'benito', 'PERSONAL'),
(19, 'Ramon', 'Ayala', '923496789', 'ramon', 'PERSONAL'),
(20, 'Jorge', 'Ruiz', '987654321', 'medico', 'PERSONAL'),
(21, 'Carmen', 'Carrasco', '987654322', 'carmen', 'PERSONAL'),
(22, 'Fernando', 'Sanchez', '987654323', 'fernando', 'PERSONAL'),
(23, 'Raul', 'Mendez', '987654324', 'raul', 'PERSONAL'),
(24, 'Antonio', 'Hernandez', '123498765', '', 'PACIENTE'),
(25, 'Carlos', 'Fuentes', '223498765', '', 'PACIENTE'),
(26, 'Daniel', 'Macias', '323498765', '', 'PACIENTE'),
(27, 'Ernesto', 'Sevilla', '423498765', '', 'PACIENTE'),
(28, 'Fabiola', 'Campos', '523498765', '', 'PACIENTE'),
(29, 'Grabriela', 'Gonzalez', '623498765', '', 'PACIENTE');

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
-- Indices de la tabla `programacion_salas`
--
ALTER TABLE `programacion_salas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONAL_2` (`ID_PERSONAL`),
  ADD KEY `ID_ESPECIALIDAD` (`ID_ESPECIALIDAD`) USING BTREE,
  ADD KEY `ID_PERSONAL` (`ID_PERSONAL`) USING BTREE;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `programacion_salas`
--
ALTER TABLE `programacion_salas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `rel_personal_especialidad`
--
ALTER TABLE `rel_personal_especialidad`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `programacion_salas`
--
ALTER TABLE `programacion_salas`
  ADD CONSTRAINT `programacion_salas_ibfk_1` FOREIGN KEY (`ID_ESPECIALIDAD`) REFERENCES `especialidad` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `programacion_salas_ibfk_2` FOREIGN KEY (`ID_PERSONAL`) REFERENCES `personal` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
