-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 05-06-2023 a las 13:18:20
-- Versión del servidor: 5.7.39
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoIntegrador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `idPost` int(10) UNSIGNED DEFAULT NULL,
  `idUsuario` int(10) UNSIGNED DEFAULT NULL,
  `comentario` varchar(400) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `idPost`, `idUsuario`, `comentario`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 1, 2, 'Que linda remeraa!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(2, 1, 4, 'Me encanta el color', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(3, 1, 3, 'ET es mi pelicula favorita', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(4, 1, 5, 'Tienen buzos?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(5, 2, 3, 'Jajajaj es muy mi tio.', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(6, 2, 1, 'Van a sacar mas modelos manga larga?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(7, 2, 4, 'Recomiendo este producto', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(8, 2, 5, 'Excelente calidad', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(9, 3, 4, 'Mi amiga tiene el mismo!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(10, 3, 2, 'Puedo ponerle la nueva camiseta de boca?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(11, 3, 1, 'Hay mas colores?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(12, 3, 3, 'Cupido tiro la flecha', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(13, 4, 5, 'Quiero uno', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(14, 4, 1, 'Imagine all the people!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(15, 4, 2, 'Mi amiga justice quiere uno!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(16, 4, 5, 'Hacen canje?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(17, 5, 1, 'Se le puede sacar la bata?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(18, 5, 4, 'Tienen fundas de ET?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(19, 5, 2, 'Es perfecto para mi abuelo', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(20, 5, 5, 'Amo las cookies', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(21, 6, 1, 'El precio incluye el envio?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(22, 6, 2, 'Se puede pagar en cuotas?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(23, 6, 4, 'Ame', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(24, 6, 5, 'Odie', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(25, 7, 1, 'Llore', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(26, 7, 3, 'Excelente calidad, voy a pedir 15 mas', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(27, 7, 4, 'Esta genial', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(28, 7, 5, 'Indispensable para la vuelta a clases', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(29, 8, 1, 'Hermoso', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(30, 8, 2, 'Ahora mi mochila es la envidia de todos', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(31, 8, 3, 'El favorito de mis hijos', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(32, 8, 4, 'Mi pin favorito', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(33, 9, 3, 'Me encanto', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(34, 9, 2, 'Cotidiano', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(35, 9, 1, 'De chiquita siempre quise uno', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(36, 9, 5, 'Es muy lindo', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(37, 10, 5, 'Que canchera!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(38, 10, 3, 'uwu', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(39, 10, 1, 'Sofi kawai', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(40, 10, 2, 'Aesthetic', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(41, 11, 3, 'Que lindo', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(42, 11, 2, 'Practico', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(43, 11, 5, 'Lo recomiendo', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(44, 11, 4, 'Van a sacar mas modelos?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(45, 12, 1, 'Love this product', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(46, 12, 2, 'Hay descuento para jubilados?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(47, 12, 3, 'Mi personaje fav!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(48, 12, 5, 'Me recuerda a mi niñez', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(49, 13, 1, 'Que copado!', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(50, 13, 2, 'Si lo compro ahora, llega para navidad?', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(51, 13, 4, 'No puedo esperar a que llegue', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(52, 13, 3, 'Mi amiga sofia lo ama', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `nombreProducto` varchar(250) NOT NULL,
  `fotoProducto` varchar(1250) NOT NULL,
  `descripcion` varchar(400) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idUsuario`, `nombreProducto`, `fotoProducto`, `descripcion`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 1, 'I will be right here', '/images/products/remeraCortaET.jpg', 'Remera con frase de ET, color celeste', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(2, 2, 'ET Long Sleeve', '/images/products/remeraLargaET.jpg', 'Remera con frase de ET, manga larga, color azul', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(3, 3, 'Peluche ET con camperita', '/images/products/pelucheETcamperita.jpg', 'Peluche de ET para decorar o jugar con el', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(4, 4, 'Peluche ET con corazon', '/images/products/pelucheETcorazon.jpg', 'Peluche del 40 aniversario de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(5, 5, 'Peluche ET en bata', '/images/products/pelucheETbata.jpg', 'Peluche de ET con bata, super suave y tierno', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(6, 1, 'Set de vasos de shot de ET', '/images/products/shotsET.jpg', 'Vasos de shot del aniversario 40 de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(7, 2, 'Pin The extra-terrestrial', '/images/products/pinET.jpg', 'Pin coleccionable de la tienda del mejor extraterestre', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(8, 3, 'Magnet I love ET', '/images/products/imanILET.jpg', 'Iman para decorar tu heladera de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(9, 4, 'Magnet Be Good', '/images/products/imanBeGoodET.jpg', 'Iman para decorar tu heladera de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(10, 5, 'ET Wallet', '/images/products/billeteraET.jpg', 'Billetera de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(11, 1, 'ET Mug', '/images/products/tazaET.jpg', 'Taza con doble diseño de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(12, 2, 'ET Key Ring', '/images/products/llaveroETcamperita.jpg', 'Llavero de ET con la figura de ET en 3D, para decorar tus llaves', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL),
(13, 3, 'Peluche ET Bebe', '/images/products/pelucheETbebe.jpg', 'Peluche super suave y tierno de ET', '2023-06-02 03:18:28', '2023-06-02 03:18:28', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombreUsuario` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `fotoPerfil` varchar(300) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombreUsuario`, `email`, `contrasena`, `fotoPerfil`, `fecha`, `dni`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'juanneira', 'juanneira@gmail.com', 'juan_neira', '/images/users/foto_jeremias.jpg', '2003-10-08', 45978253, '2023-06-02 03:18:15', '2023-06-02 03:18:15', NULL),
(2, 'boquita', 'bocapasion@gmail.com', 'bocapasion', '/images/users/bocapasion.jpg', '2003-10-08', 45212253, '2023-06-02 03:18:15', '2023-06-02 03:18:15', NULL),
(3, 'sofiamaggio', 'sofimaggio@gmail.com', 'sofimaggio', '/images/users/sofimaggio.jpg', '2003-10-08', 45212253, '2023-06-02 03:18:15', '2023-06-02 03:18:15', NULL),
(4, 'lolo', 'lolo_123@gmail.com', 'lolo_123', '/images/users/lolo_123.jpg', '2003-10-08', 46212563, '2023-06-02 03:18:15', '2023-06-02 03:18:15', NULL),
(5, 'justivergara', 'justivergara@gmail.com', 'justivergara', '/images/users/justivergara.jpg', '2003-10-08', 4512253, '2023-06-02 03:18:15', '2023-06-02 03:18:15', NULL),
(6, 'nsikorski', 'nsikorski@capa', '$2a$10$MpHm5GPtpT2BoVT6GffIeOJvEcEiOejf5b.siYmWLzQuHXKg9eTde', 'notiene', '2004-06-17', 123456, '2023-06-04 21:28:27', '2023-06-04 21:28:27', NULL),
(7, 'eusta', 'eusta@gmail', '$2a$10$axUk/V4bQG36pJLKEcVU6ueed5wNiJewn2ftGuMPHvlh2gXwJqWeO', 'notiene', '2023-06-16', 866543, '2023-06-05 12:19:49', '2023-06-05 12:19:49', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPost` (`idPost`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idPost`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
