-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2025 a las 06:25:02
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
-- Base de datos: `capitulo_11`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumes`
--

CREATE TABLE `albumes` (
  `idAlbum` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `selloDiscografico` varchar(100) NOT NULL,
  `fechaLanzamiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `albumes`
--

INSERT INTO `albumes` (`idAlbum`, `titulo`, `selloDiscografico`, `fechaLanzamiento`) VALUES
(1, 'Mis Favoritas', 'Universal Music', '2008-11-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones`
--

CREATE TABLE `canciones` (
  `idCancion` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `duracion` time NOT NULL,
  `tempoBPM` int(11) DEFAULT NULL,
  `idioma` varchar(30) NOT NULL,
  `esInstrumental` bit(1) NOT NULL DEFAULT b'0',
  `fechaLanzamiento` date NOT NULL,
  `idAlbum` int(11) DEFAULT NULL,
  `idInterprete` int(11) NOT NULL,
  `idGenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `canciones`
--

INSERT INTO `canciones` (`idCancion`, `titulo`, `duracion`, `tempoBPM`, `idioma`, `esInstrumental`, `fechaLanzamiento`, `idAlbum`, `idInterprete`, `idGenero`) VALUES
(1, 'La camisa negra', '00:03:36', 110, 'Español', b'0', '2005-02-08', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `idGenero` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`idGenero`, `nombre`, `descripcion`) VALUES
(1, 'Pop', 'Genero musical popular.'),
(2, 'Rock', 'Genero de guitarra electrica.'),
(3, 'Salsa', 'Genero de baile latino.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interpretes`
--

CREATE TABLE `interpretes` (
  `idInterprete` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `anioLanzamiento` int(11) NOT NULL,
  `anioRetiro` int(11) DEFAULT NULL,
  `tipoInterprete` varchar(10) NOT NULL,
  `idGenero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interpretes`
--

INSERT INTO `interpretes` (`idInterprete`, `nombre`, `anioLanzamiento`, `anioRetiro`, `tipoInterprete`, `idGenero`) VALUES
(1, 'Juanes', 1990, NULL, 'Solista', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albumes`
--
ALTER TABLE `albumes`
  ADD PRIMARY KEY (`idAlbum`);

--
-- Indices de la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD PRIMARY KEY (`idCancion`),
  ADD KEY `idAlbum` (`idAlbum`),
  ADD KEY `idInterprete` (`idInterprete`),
  ADD KEY `idGenero` (`idGenero`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `interpretes`
--
ALTER TABLE `interpretes`
  ADD PRIMARY KEY (`idInterprete`),
  ADD KEY `idGenero` (`idGenero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canciones`
--
ALTER TABLE `canciones`
  ADD CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `albumes` (`idAlbum`),
  ADD CONSTRAINT `canciones_ibfk_2` FOREIGN KEY (`idInterprete`) REFERENCES `interpretes` (`idInterprete`),
  ADD CONSTRAINT `canciones_ibfk_3` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`);

--
-- Filtros para la tabla `interpretes`
--
ALTER TABLE `interpretes`
  ADD CONSTRAINT `interpretes_ibfk_1` FOREIGN KEY (`idGenero`) REFERENCES `generos` (`idGenero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
