-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2017 a las 16:25:08
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ja`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `codigo` (`cod` INT) RETURNS VARCHAR(20) CHARSET latin1 Begin
Declare 

nombre varchar(20);

select u.nombre into nombre 
from usuario u 
where u.id=cod;

return (nombre);

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `id` int(11) NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `actividad` varchar(200) NOT NULL,
  `observacion` varchar(200) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_relatoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`id`, `tiempo`, `cantidad`, `folio`, `actividad`, `observacion`, `estado`, `created_at`, `updated_at`, `id_relatoria`) VALUES
(1, 1, 1, 0, 'Actividad #1', 'Observacion #1', 'A', '2015-07-13 23:36:03', '0000-00-00 00:00:00', 1),
(2, 3, 2, 5, 'Actividad #2', 'Observacion #2', 'A', '2015-08-05 16:09:32', '0000-00-00 00:00:00', 1),
(3, 1, 1, 2, 'Sdfsdfssd', 'Sdfdf', 'A', '2015-07-29 20:56:40', '0000-00-00 00:00:00', 2),
(4, 6, 0, 0, 'Sdsdfsdfsdf', '', 'A', '2015-07-29 21:24:48', '0000-00-00 00:00:00', 3),
(5, 8, 0, 0, 'Ghhfhgfgh', '', 'A', '2015-07-29 21:31:02', '0000-00-00 00:00:00', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `id_programa` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_ejecucion` date NOT NULL,
  `id_subcaso` int(11) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caso`
--

INSERT INTO `caso` (`id`, `id_empresa`, `id_programa`, `descripcion`, `id_usuario`, `fecha`, `fecha_ejecucion`, `id_subcaso`, `estado`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Caso #2', 1, '2015-07-13 15:13:09', '0000-00-00', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, NULL, 1, 'Caso #298', 1, '2015-07-13 15:15:29', '0000-00-00', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 1, 'Caso aprendiz', 2, '2015-07-15 22:25:02', '0000-00-00', NULL, 'A', '2015-07-16 03:25:02', '2015-07-16 03:25:02'),
(4, 1, 1, 'Caso aprendiz', 2, '2015-07-15 22:25:24', '0000-00-00', 3, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 1, 'Caso cielo', 3, '2015-07-15 22:27:24', '0000-00-00', NULL, 'A', '2015-07-16 03:27:24', '2015-07-16 03:27:24'),
(6, 1, 1, 'Caso chague', 2, '2015-07-16 16:21:52', '0000-00-00', NULL, 'A', '2015-07-16 21:21:52', '2015-07-16 21:21:52'),
(7, 1, 1, 'Caso chague 1.1 ', 2, '2015-07-16 16:22:35', '0000-00-00', 6, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 1, 'Caso aprendiz modificado', 2, '2015-07-16 16:23:46', '0000-00-00', 3, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, NULL, 1, 'Gfghhgjgghghk', 1, '2015-07-24 15:31:00', '0000-00-00', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, NULL, 1, 'Gfghhgjgghghk bnbmnmn', 1, '2015-07-24 15:31:28', '0000-00-00', 9, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 1, 1, 'Aasdasda', 2, '2015-07-29 20:55:25', '0000-00-00', NULL, 'A', '2015-07-30 01:55:25', '2015-07-30 01:55:25'),
(12, NULL, 3, 'Hoy vi una mosca cagando', 4, '2015-07-29 21:09:53', '0000-00-00', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, NULL, 3, 'Hoy vi una pila de papeles', 4, '2015-07-29 21:10:28', '0000-00-00', 12, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, NULL, 1, 'Pppppppppppp', 1, '2017-05-04 06:36:23', '0000-00-00', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_concepto`
--

CREATE TABLE `caso_concepto` (
  `id_caso` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caso_concepto`
--

INSERT INTO `caso_concepto` (`id_caso`, `id_concepto`) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 1),
(4, 3),
(5, 1),
(5, 4),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 94),
(13, 94),
(14, 1),
(14, 2),
(14, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_proceso`
--

CREATE TABLE `caso_proceso` (
  `id_caso` int(11) NOT NULL,
  `id_proceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caso_proceso`
--

INSERT INTO `caso_proceso` (`id_caso`, `id_proceso`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 3),
(13, 3),
(14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_resultado`
--

CREATE TABLE `caso_resultado` (
  `id_caso` int(11) NOT NULL,
  `id_resultado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `caso_resultado`
--

INSERT INTO `caso_resultado` (`id_caso`, `id_resultado`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 1),
(3, 3),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 3),
(9, 1),
(10, 1),
(10, 2),
(11, 1),
(11, 2),
(12, 46),
(13, 46),
(14, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE `centro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'ceai', 'A', '2015-07-14 16:30:03', '0000-00-00 00:00:00'),
(2, 'Hhfh', 'A', '2015-07-14 21:30:28', '2015-07-14 21:30:28'),
(3, 'Hhfh', 'A', '2015-07-14 21:32:14', '2015-07-14 21:32:14'),
(4, 'Ceai', 'A', '2015-07-14 21:33:06', '2015-07-14 21:33:06'),
(5, 'Ceai', 'A', '2015-07-14 21:34:16', '2015-07-14 21:34:16'),
(6, 'CEAI', 'A', '2015-07-14 16:35:56', '2015-07-14 21:35:56'),
(7, 'Cgts', 'A', '2015-07-24 20:12:53', '2015-07-24 20:12:53'),
(8, 'Cgts', 'A', '2015-07-30 00:54:22', '2015-07-30 00:54:22'),
(9, 'Cgts', 'A', '2015-08-05 15:55:31', '2015-08-05 20:55:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_regional` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `estado`, `id_regional`, `created_at`, `updated_at`) VALUES
(1, 'Cali', 'A', 1, '2015-07-15 21:51:28', '2015-07-16 02:51:28'),
(2, 'Pereira', 'A', 1, '2015-07-15 21:51:22', '2015-07-16 02:51:22'),
(3, 'Tulua', 'A', 1, '2015-07-24 20:11:57', '2015-07-24 20:11:57'),
(4, 'Palmira', 'A', 1, '2015-08-05 15:55:07', '2015-08-05 20:55:07'),
(5, 'Buenaventura', 'A', 2, '2015-08-05 15:54:32', '2015-08-05 20:54:32'),
(6, 'Choco', 'A', 2, '2015-08-05 15:54:48', '2015-08-05 20:54:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencia`
--

CREATE TABLE `competencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_programa` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `competencia`
--

INSERT INTO `competencia` (`id`, `nombre`, `estado`, `id_programa`, `created_at`, `updated_at`) VALUES
(1, 'Producir Los Documentos Que Se Originen De Las Funciones Administrativas Siguiendo La Norma Técnica ', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(2, 'Facilitar El Servicio A Los Clientes Internos Y Externos De Acuerdo Con Las Políticas De La Organiza', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(3, 'Tramitar Los Documentos De Archivo De Acuerdo Con La Normatividad Vigente Y Con La Política Instituc', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(4, 'Organizar Archivos De Gestión De Acuerdo Con Normatividad Vigente Y Políticas Institucionales', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(5, 'Promover La Interacción Idónea Consigo Mismo Con Los Demás Y Con La Naturaleza En Los Contextos Labo', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(6, 'Comprender Textos En Inglés En Forma Escrita Y Auditiva', 'A', 1, '2015-05-26 18:02:50', '2015-05-26 18:02:50'),
(7, 'Competencia #12', 'I', 1, '2015-07-13 15:03:42', '2015-07-13 20:03:42'),
(8, 'Jajajaja', 'A', 3, '2015-07-30 02:05:23', '2015-07-30 02:05:23'),
(9, 'Keekekekeke', 'I', 1, '2015-07-29 21:45:31', '2015-07-30 02:45:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_principio`
--

CREATE TABLE `concepto_principio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `concepto_principio`
--

INSERT INTO `concepto_principio` (`id`, `nombre`, `id_programa`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Redacta documentos organizacionales aplicando las normas gramaticales, de sintaxis y las de redacción. ', 1, 'A', '2015-05-29 17:51:42', '2015-05-29 13:58:28'),
(2, 'Elabora documentos organizacionales, aplicando las técnicas de digitación', 1, 'A', '2015-05-29 17:51:49', '2015-05-29 13:58:28'),
(3, 'Identifica la papelería en cuanto a tamaño y calidad para el proceso de digitación y/o transcripción, de acuerdo con los estándares internacionales. ', 1, 'A', '2015-05-29 17:51:59', '2015-05-29 13:58:28'),
(4, 'Digita con precisión y velocidad documentos aplicando las técnicas de digitación. ', 1, 'A', '2015-05-29 17:52:03', '2015-05-29 13:58:28'),
(5, 'Opera los equipos de digitación de acuerdo con los manuales de usuario y las normas de seguridad. ', 1, 'A', '2015-05-29 17:52:05', '2015-05-29 13:58:28'),
(6, 'Realiza la limpieza de los equipos para su conservación de acuerdo con el manual. ', 1, 'A', '2015-05-29 17:52:07', '2015-05-29 13:58:28'),
(7, 'Adopta la postura corporal requerida, durante el proceso de digitación, para el desarrollo de habilidades y destrezas, de acuerdo con las normas de salud ocupacional.', 1, 'A', '2015-05-29 17:52:09', '2015-05-29 13:58:28'),
(8, 'Aplica las técnicas de digitación, realizando ejercicios con los alcances superiores e inferiores y de integración con todo el teclado hasta lograr su dominio e incrementando la velocidad y la precisi', 1, 'A', '2015-05-29 17:52:12', '2015-05-29 13:58:28'),
(9, 'Auto-revisa y corrige los ejercicios digitados de acuerdo con la guía suministrada.', 1, 'A', '2015-05-29 17:52:14', '2015-05-29 13:58:28'),
(10, 'Reproduce los documentos solicitados teniendo en cuenta las políticas de la organización.', 1, 'A', '2015-05-29 17:52:18', '2015-05-29 13:58:28'),
(11, ' Atiende el público y facilita el servicio al cliente, observando el protocolo y los estándares establecidos. ', 1, 'A', '2015-05-29 17:52:20', '2015-05-29 13:58:28'),
(12, 'Emite los mensajes tanto al cliente interno como al externo, dentro de un proceso de comunicación efectiva, aplicando las normas de la Organización. ', 1, 'A', '2015-05-29 17:52:22', '2015-05-29 13:58:28'),
(13, 'Identifica los tipos de clientes, de acuerdo con los parámetros establecidos por la Organización. ', 1, 'A', '2015-05-29 17:52:24', '2015-05-29 13:58:28'),
(14, 'Atiende las contingencias en la prestación del servicio al cliente interno y externo, de acuerdo con protocolos y políticas institucionales. ', 1, 'A', '2015-05-29 17:52:26', '2015-05-29 13:58:28'),
(15, 'Ofrece la  atención y servicio del cliente según el portafolio de servicios de la Organización.', 1, 'A', '2015-05-29 17:52:30', '2015-05-29 13:58:28'),
(16, 'Opera los medios tecnológicos y aplicativos disponibles en la Organización para la atención y el servicio al cliente interno y externo, de acuerdo con los manuales de seguridad y de usuario. ', 1, 'A', '2015-05-29 17:52:33', '2015-05-29 13:58:28'),
(17, 'Registra la información del servicio prestado a los clientes o usuarios, de acuerdo con las políticas de la Organización. ', 1, 'A', '2015-05-29 17:52:35', '2015-05-29 13:58:28'),
(18, 'Aplica los protocolos y normas establecidas por la empresa para la prestación de los servicios archivísticos.', 1, 'A', '2015-05-29 17:52:40', '2015-05-29 13:58:28'),
(19, 'Utiliza la papelería, elementos, mobiliario y equipos requeridos para la  recepción y despacho de documentos de acuerdo con el manual de gestión documental y las políticas de la organización. ', 1, 'A', '2015-05-29 17:52:44', '2015-05-29 13:58:28'),
(20, 'Opera los equipos y programas (aplicativo)  para el recibo y despacho de documentos internos y externos de acuerdo con el manual de usuario. ', 1, 'A', '2015-05-29 17:52:47', '2015-05-29 13:58:28'),
(21, 'Direcciona los documentos radicados de acuerdo con las series establecidas en las Tablas de Retención Documental y las políticas de la organización.}', 1, 'A', '2015-05-29 17:52:49', '2015-05-29 13:58:28'),
(22, 'Aplica los procedimientos, manuales o automatizados, la normativa vigente para la recepción de los documentos de acuerdo con el manual de gestión documental y las normas organizacionales. ', 1, 'A', '2015-05-29 17:52:52', '2015-05-29 13:58:28'),
(23, 'Verifica que los documentos recibidos reúnan las condiciones para ser radicados de acuerdo con el manual de gestión documental y las normas organizacionales. .', 1, 'A', '2015-05-29 17:52:54', '2015-05-29 13:58:28'),
(24, 'Clasifica la documentación recibida de acuerdo con el manual de gestión documental y las normas organizacionales. ', 1, 'A', '2015-05-29 17:53:01', '2015-05-29 13:58:28'),
(25, 'Radica los documentos para la Organización, internos y externos, utilizando el software, las normas y la legislación vigente. ', 1, 'A', '2015-05-29 17:53:04', '2015-05-29 13:58:28'),
(26, 'Analiza e  interpreta la información contenida en los documentos recibidos, para el respectivo registro aplicando las normas lingüísticas. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(27, 'Distribuye los documentos a las dependencias encargadas del trámite, de acuerdo con las Tablas de Retención Documental y las políticas de la empresa. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(28, 'Realiza el seguimiento de las comunicaciones recibidas, teniendo en cuenta los registros de radicación y el manual de gestión documental.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(29, 'Utiliza los elementos de protección, de acuerdo con las normas de seguridad y salud ocupacional durante el desempeño de sus funciones.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(30, 'Verifica que los documentos reúnan las condiciones para ser radicados, registrados y despachados, de acuerdo con el manual de gestión documental, las normas técnicas colombianas para la elaboración y ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(31, 'Aplica el procedimiento, manual o automatizado, para la radicación de los documentos por despachar, utilizando la tecnología disponible. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(32, 'Registra los documentos internos y externos por despachar, aplicando el manual de gestión documental y la tecnología disponible. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(33, 'Distribuye las copias de los documentos despachados de acuerdo con las Tablas de Retención Documental y las normas internas.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(34, 'Conserva las copias (Consecutivo de Correspondencia Despachada) de los documentos enviados de acuerdo con las normas de la Organización y la legislación vigente. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(35, 'Aplica técnicas de plegado y embalaje para el despacho de los documentos, de acuerdo con las normas técnicas y las de correo y mensajería. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(36, 'Realiza el descargue de los documentos trasladados a las dependencias responsables de su trámite, de acuerdo con el manual de gestión documental.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(37, ' Identifica y relaciona las ciencias auxiliares de la Archivística, teniendo en cuenta el aporte que éstas le hacen a los archivos. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(38, 'Aplica las etapas del proceso administrativo en cada tarea que realiza, según el ciclo PHVA. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(39, 'Describe las actividades administrativas de las unidades de información, de acuerdo con sus características. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(40, 'Identifica  las diferentes clases de  archivos  de acuerdo con la misión institucional. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(41, 'Aplica  el Código de Ética del Archivista. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(42, 'Interpreta   las directrices para la disposición final de los documentos de archivo, según la TRD. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(43, 'Aplica  las Tablas de Retención Documental y el instructivo, de acuerdo con las normas establecidas y la legislación vigente.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(44, '" Aplica las normas de gestión de la calidad, de seguridad y salud ocupacional, utilizando los equipos y elementos archivísticos', 0, '1', '0000-00-00 00:00:00', '2015-05-29 13:58:28'),
(45, 'Aplica  los requisitos de la documentación,  según lo establecido por el sistema de gestión de la calidad. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(46, 'Aplica  los principios archivísticos  para la clasificación documental, de acuerdo con la estructura orgánico-funcional, las Tablas de Retención Documental, las normas y la legislación vigente. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(47, 'Aplica las agrupaciones documentales de la Organización, según la estructura orgánico funcional de la empresa. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(48, 'Elabora el cuadro de clasificación documental, de acuerdo con los principios archivísticos. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(49, 'Aplica los principios y sistemas de ordenación documental de acuerdo con las políticas institucionales y la legislación vigente.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(50, ' Realiza la conformación y ordenación interna del expediente, según normas vigentes ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(51, 'Aplica  los conceptos  de archivo de gestión, archivo central, archivo histórico, de acuerdo con el ciclo vital de los documentos. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(52, 'Interpreta el Programa de Gestión Documental, su incidencia en las Organizaciones y los procedimientos de producción, recepción, distribución, trámite, organización, consulta y disposición final de lo', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(53, 'Aplica  los principios y procesos archivísticos en la organización de la sección documental: Clasificación, Ordenación y Descripción, teniendo en cuenta la depuración, foliación y almacenamiento de la', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(54, 'Aplica el proceso de  conservación documental, teniendo en cuenta las Tablas de Retención. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(55, 'Aplica  los conceptos de preservación y conservación documental, de acuerdo con las normas vigentes.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(56, 'Identifica  los factores de deterioro en los bienes documentales, de acuerdo con su clasificación. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(57, 'Selecciona  el mobiliario, los equipos, elementos y útiles  de archivo, para la conservación y seguridad de la información, de acuerdo con la normatividad vigente.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(58, 'Establece relaciones interpersonales dentro de criterios de libertad, justicia, respeto, responsabilidad, tolerancia y solidaridad según principios y valores universales. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(59, 'Analiza de manera crítica las situaciones pertinentes que contribuyen a la resolución de problemas según los requerimientos de los contextos productivos y sociales. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(60, 'Argumenta y acoge objetivamente los criterios que contribuyen a la resolución de problemas según requerimientos del proceso formativo en función de las demandas concretas de los contextos productivos ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(61, 'Propone alternativas creativas, lógicas y coherentes que posibiliten la resolución de problemas según la demanda del contexto social y productivo. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(62, 'Desarrolla actividades de autogestión orientadas hacia el mejoramiento personal según los requerimientos del proceso formativo. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(63, 'Aborda procesos de trabajo colaborativo orientados hacia la construcción colectiva según los requerimientos de los contextos sociales y productivos. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(64, 'Armoniza los componentes racionales y emocionales en el desarrollo de los procesos de trabajo colectivo según normas de convivencia. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(65, 'Identifica e integra los elementos  de su contexto que le permiten redimensionar su proyecto de vida. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(66, 'Vivencia su proyecto de vida en el marco del Desarrollo Humano Integral según competencias ciudadanas', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(67, 'Se comunica fácilmente con los miembros de la comunidad educativa según protocolos y normas de convivencia institucional. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(68, 'Establece procesos comunicativos asertivos que posibilitan la convivencia en los contextos social y productivo de acuerdo con las competencias ciudadanas. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(69, 'Resuelve conflictos mediante el uso de la racionalidad, la argumentación y la asertividad. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(70, 'Establece acuerdos mediante el uso de procesos comunicativos,  racionales y argumentados orientados hacia la resolución de problemas según normas y protocolos institucionales. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(71, 'Aporta elementos en la construcción colectiva del conocimiento según la naturaleza del problema. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(72, 'Optimiza los recursos requeridos en el desarrollo de sus actividades  formativas y productivas según normas institucionales. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(73, 'Contribuye en el cuidado y uso de los elementos que integran su entorno formativo y laboral según normas institucionales. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(74, 'Dispone los residuos teniendo en cuenta las normas de clasificación de los mismos. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(75, 'Mantiene limpio y ordenado el lugar donde desarrolla sus actividades formativas y productivas según estándares de protección ambiental. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(76, 'Aplica los test de condición física según técnicas de medición. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(77, 'Selecciona los ejercicios para el plan de acondicionamiento físico de acuerdo con los métodos de entrenamiento físico. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(78, 'Elabora el plan de acondicionamiento físico, según sistemas de entrenamiento físico.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(79, 'Diagnóstica los riesgos ergonómicos y psicosociales de su desempeño laboral según normas de salud ocupacional. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(80, 'Selecciona las técnicas de cultura física para prevenir riesgos ergonómicos y psicosociales según naturaleza y complejidad del desempeño laboral. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(81, 'Implementa técnicas de cultura física para la prevención de riesgos ergonómicos y psicosociales teniendo en cuenta la naturaleza y complejidad del desempeño laboral. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(82, 'Valora el impacto de la cultura física en el mejoramiento de la calidad de vida y su efecto en el entorno familiar social y productivo teniendo en cuenta su proyecto de vida. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(83, 'Implementa estrategias que le permitan liderar actividades físicas deportivas y culturales en contexto social y productivo teniendo en cuenta las competencias ciudadanas. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(84, 'Participa en actividades  que requieren coordinación motriz fina y gruesa de forma individual y grupal teniendo en cuenta la naturaleza y complejidad del desempeño laboral. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(85, 'Aplica técnicas y procedimientos orientados al perfeccionamiento de la psicomotricidad frente a los requerimientos de su desempeño laboral.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(86, 'Interpreta un texto sencillo y puede construir un mapa conceptual basado en el mismo. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(87, 'Pronuncia adecuadamente el vocabulario y modismos básicos del idioma.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(88, ' Sostiene conversaciones con vocabulario básico y técnico aprendido. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(89, 'Estructura adecuadamente.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(90, 'Elabora resúmenes cortos sobre textos sencillos, y con contenido técnico. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(91, 'Escribe o presenta descripciones de sí mismo, su profesión y su entorno. ', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(92, 'Plantea y responde preguntas sobre sí mismo.', 0, 'A', '2015-05-29 13:58:28', '2015-05-29 13:58:28'),
(93, 'Concepto #1345435', 1, 'I', '2015-07-13 14:50:19', '2015-07-13 19:50:19'),
(94, 'Pilla esta monita esta suckulenta', 3, 'A', '2015-07-30 02:00:20', '2015-07-30 02:00:20'),
(95, 'Kekekeke', 3, 'I', '2015-07-29 21:38:16', '2015-07-30 02:38:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nit` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `representante` varchar(30) NOT NULL,
  `sector` varchar(30) NOT NULL,
  `tipo_empresa` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nit`, `nombre`, `representante`, `sector`, `tipo_empresa`, `estado`, `created_at`, `updated_at`) VALUES
(1, '989898989', 'Carvajal S.A', 'Sandra Paricia Arango', 'Secundario', 'Privada', 'A', '2015-05-28 20:23:54', '0000-00-00 00:00:00'),
(2, '123465431', 'Tecnoquimicas', 'Luis Perez', 'Secundario', 'Privada', 'I', '2015-07-13 13:50:44', '2015-07-13 18:50:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_formacion`
--

CREATE TABLE `grupo_formacion` (
  `id` int(11) NOT NULL,
  `ficha` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `id_version` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo_formacion`
--

INSERT INTO `grupo_formacion` (`id`, `ficha`, `nombre`, `id_version`, `estado`, `created_at`, `updated_at`) VALUES
(1, 456789, 'Asistencia Archivo', 1, 'A', '2015-05-28 20:36:54', '0000-00-00 00:00:00'),
(2, 988622, 'Asistencia Archivo', 4, 'A', '2015-07-15 22:43:48', '0000-00-00 00:00:00'),
(3, 7867, 'Lelo', 1, 'A', '2015-07-29 21:09:12', '2015-07-30 02:09:12'),
(4, 5677, 'Hjhjj', 5, 'I', '2015-07-29 21:46:46', '2015-07-30 02:46:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `insertar` int(1) DEFAULT NULL,
  `actualizar` int(1) DEFAULT NULL,
  `eliminar` int(1) DEFAULT NULL,
  `seleccionar` int(1) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id`, `nombre`, `id_programa`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Proceso1\r\n', 1, 'A', '2015-05-30 00:14:40', '2015-05-30 00:14:40'),
(2, 'Proceso #123424', 1, 'I', '2015-07-13 14:59:26', '2015-07-13 19:59:26'),
(3, 'Sisas Esta Mas Q Buena', 3, 'A', '2015-07-30 02:03:00', '2015-07-30 02:03:00'),
(4, 'Akakakaka', 3, 'I', '2015-07-29 21:38:49', '2015-07-30 02:38:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_formacion`
--

CREATE TABLE `programa_formacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa_formacion`
--

INSERT INTO `programa_formacion` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Asistencia En Organizaciòn De Archivos', 'A', '2015-07-29 20:23:39', '2015-07-30 01:23:39'),
(2, 'Tecnico En Corte Y Confeccion De Empanadas', 'I', '2015-07-13 14:47:54', '2015-07-13 19:47:54'),
(3, 'Loladrones Fase 2', 'A', '2015-07-29 20:59:37', '2015-07-30 01:59:37'),
(4, 'Ole Vn O No', 'I', '2015-07-29 21:37:33', '2015-07-30 02:37:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regional`
--

CREATE TABLE `regional` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regional`
--

INSERT INTO `regional` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Valle', 'A', '2015-08-05 15:53:48', '2015-08-05 20:53:48'),
(2, 'Cauca', 'A', '2015-08-05 15:54:00', '2015-08-05 20:54:00'),
(3, 'Vichada', 'I', '2015-07-29 19:52:12', '2015-07-30 00:52:12'),
(4, 'Lalsasasdad', 'I', '2015-07-29 21:35:41', '2015-07-30 02:35:41'),
(5, 'Sdfdsdfsdf', 'A', '2015-09-10 21:58:23', '2015-09-10 21:58:23'),
(6, 'Dfgdfgdfg', 'A', '2015-09-10 22:12:17', '2015-09-10 22:12:17'),
(7, 'Regional', 'A', '2015-09-14 22:36:21', '2015-09-14 22:36:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regional_centro_ciudad`
--

CREATE TABLE `regional_centro_ciudad` (
  `id_regional` int(11) NOT NULL,
  `id_centro` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regional_centro_ciudad`
--

INSERT INTO `regional_centro_ciudad` (`id_regional`, `id_centro`, `id_ciudad`) VALUES
(1, 7, 2),
(2, 8, 5),
(2, 9, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relatorias`
--

CREATE TABLE `relatorias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_ejecucion` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `estado` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `relatorias`
--

INSERT INTO `relatorias` (`id`, `titulo`, `id_empresa`, `id_grupo`, `id_usuario`, `fecha_ejecucion`, `created_at`, `updated_at`, `estado`) VALUES
(1, 'Relatoria #1', 1, 1, 2, '2015-07-08', '2015-07-14 04:35:32', '2015-07-14 04:35:32', 'A'),
(2, 'Lalalal', 1, 1, 2, '2015-07-01', '2015-07-30 01:56:40', '2015-07-30 01:56:40', 'A'),
(3, 'Sddf', 1, 1, 2, '2015-07-02', '2015-07-30 02:24:48', '2015-07-30 02:24:48', 'A'),
(4, 'Ole Q Dice', 1, 1, 2, '2015-07-17', '2015-07-30 02:31:02', '2015-07-30 02:31:02', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_aprendizaje`
--

CREATE TABLE `resultado_aprendizaje` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `id_programa` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultado_aprendizaje`
--

INSERT INTO `resultado_aprendizaje` (`id`, `nombre`, `estado`, `id_programa`, `created_at`, `updated_at`) VALUES
(1, 'Digitar textos utilizando la tecnología disponible aplicando las técnicas de digitación y el desarrollo de habilidades y destrezas para el logro de la velocidad y la precisión de acuerdo con los requerimientos y las normas de seguridad y salud ocupacional', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(2, 'Transcribir documentos organizacionales utilizando la tecnología disponible aplicando las técnicas de digitación las normas técnicas colombianas vigentes para su presentación las de la organización las de gestión documental y de la calidad', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(3, 'Redactar documentos organizacionales teniendo en cuenta el asunto el tipo las funciones de la unidad administrativa aplicando las normas gramaticales de semántica y de sintaxis las normas técnicas colombianas vigentes para la elaboración y presentación y las normas de gestión de la calidad', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(4, 'Operar los recursos técnicos y tecnológicos disponibles para la atención y servicio al cliente de acuerdo con las políticas de la organización las normas de gestión de calidad  de seguridad y salud ocupacional', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(5, ' Proporcionar atención y servicio al cliente en inglés y en español  de manera efectiva a través de los medios tecnológicos y los aplicativos disponibles aplicando la comunicación empresarial los estándares de calidad y las políticas de la organización', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(6, 'Verificar la aplicación de las estrategias de atención y servicio al cliente cara a cara a través de medios tecnológicos en inglés y español de acuerdo con la política institucional y los estándares de calidad establecidos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(7, 'Identificar soluciones de atención y servicio al cliente interno y externo, mediante la implementación de la tecnología disponible teniendo en cuenta los requerimientos de la unidad administrativa y la organización', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(8, 'Utilizar los aplicativos (software-hardware) y sus características en la satisfacción de los clientes el mejoramiento continuo de acuerdo con las políticas de la organización.', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(9, 'Proporcionar diligentemente atención y servicio al cliente cara a cara en inglés y en español aplicando actitudes y valores el protocolo, la etiqueta y las políticas de la organización de acuerdo con los estándares de calidad establecidos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(10, 'Despachar los documentos y la correspondencia generados por la empresa, teniendo en cuenta las políticas de la organización, las normas técnicas las de gestión de la calidad la legislación vigente y la tecnología disponible', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(11, 'Verificar los registros de recibo despacho y control de los documentos de la organización de acuerdo con la política institucional y la legislación vigente', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(12, 'Operar la tecnología disponible en el trámite de documentos internos y externos teniendo en cuenta la normatividad y políticas en la organización', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(13, 'Recibir la correspondencia y los documentos producidos por la empresa teniendo en cuenta el manual de gestión documental las normas técnicas y las de gestión de la calidad la legislación vigente la tecnología y el aplicativo disponible', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(14, 'Verificar la aplicación de las normas técnicas colombianas gramaticales de sintaxis la política institucional y la legislación vigente en los documentos producidos despachados y en los procedimientos de recibo de documentos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(15, ' Proyectar la organización y el desarrollo de las diferentes actividades relacionadas con el recibo el despacho y el control de los documentos de la organización', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(16, 'Aplicar las tablas de retención documental teniendo en cuenta principios archivísticos normas institucionales y la legislación vigente', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(17, 'Describir documentos de archivo, teniendo en cuenta las normas técnicas, la tecnología disponible y la política institucional para la posterior recuperación de la información', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(18, 'Archivar los documentos teniendo en cuenta las tablas de retención y de valoración documental los principios archivísticos las normas técnicas y la legislación vigente', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(19, 'Preparar y recibir las transferencias documentales primarias de acuerdo con lo establecido en las tablas de retención documental y cronograma institucional establecido', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(20, 'Clasificar los documentos de archivo aplicando los principios archivísticos, normas de seguridad y salud ocupacional normas y técnicas de preservación y conservación documental y la legislación vigente', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(21, 'Preservar y conservar los documentos de archivo de acuerdo a la normatividad técnica legal vigente', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(22, 'Ordenar los documentos de archivo de acuerdo con el sistema establecido por la organización la normatividad vigente y el sistema de gestión de la calidad', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(23, 'Desarrollar permanentemente las habilidades psicomotrices y de pensamiento en la ejecución de los procesos de aprendizaje', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(24, 'Generar hábitos saludables en su estilo de vida para garantizar la prevención de riesgos ocupacionales de acuerdo con el diagnóstico de su condición física individual y la naturaleza y complejidad de su desempeño laboral', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(25, 'Gestionar la información de acuerdo con los procedimientos establecidos y con las tecnologías de la información y la comunicación disponibles', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(26, 'Interactuar en los contextos productivos y sociales en función de los principios y valores universales', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(27, 'Generar procesos autónomos y de trabajo colaborativo permanentes fortaleciendo el equilibrio de los componentes racionales y emocionales orientados hacia el desarrollo humano integral', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(28, 'Aplicar técnicas de cultura física para el mejoramiento de su expresión corporal desempeño laboral según la naturaleza y complejidad del área ocupacional', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(29, 'Reconocer el rol de los participantes en el proceso formativo el papel de los ambientes de aprendizaje y la metodología de formación de acuerdo con la dinámica organizacional del sena', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(30, 'Asumir actitudes críticas argumentativas y propositivas en función de la resolución de problemas de carácter productivo y social', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(31, 'Identificar las oportunidades que el sena ofrece en el marco de la formación profesional de acuerdo con el contexto nacional e internacional', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(32, 'Redimensionar permanentemente su proyecto de vida de acuerdo con las circunstancias del contexto y con visión prospectiva', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(33, 'Concertar alternativas y acciones de formación para el desarrollo de las competencias del programa formación con base en la política institucional', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(34, 'Asumir los deberes y derechos con base en las leyes y la normativa institucional en el marco de su proyecto de vida.', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(35, 'Desarrollar procesos comunicativos eficaces y asertivos dentro de criterios de racionalidad que posibiliten la convivencia el establecimiento de acuerdos  la construcción colectiva del conocimiento y la resolución de problemas de carácter productivo y social', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(36, 'Asumir responsablemente los criterios de preservación y conservación del medio ambiente y de desarrollo sostenible en el ejercicio de su desempeño laboral y social', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(37, 'Realizar intercambios sociales y prácticos muy breves con un vocabulario suficiente para hacer una exposición o mantener una conversación sencilla sobre temas técnicos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(38, 'Comunicarse en tareas sencillas y habituales que requieren un intercambio simple y directo de información cotidiana y técnica', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(39, 'Encontrar información específica y predecible en escritos sencillos y cotidianos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(40, 'Encontrar vocabulario y expresiones de inglés técnico en anuncios folletos páginas web  etc', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(41, 'Comprender frases y vocabulario habitual sobre temas de interés personal y temas técnicos', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(42, 'Leer textos muy breves y sencillos en inglés general y técnico', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(43, 'Comprender la idea principal en avisos y mensajes breves claros y sencillos en inglés técnico', 'A', 1, '2015-05-26 20:04:11', '2015-05-26 20:04:11'),
(44, 'Resultado1', 'A', 1, '2015-05-30 00:15:01', '2015-05-30 00:15:01'),
(45, 'Resultado #1', 'I', 1, '2015-07-13 15:00:45', '2015-07-13 20:00:45'),
(46, 'Jajaja yo le doy sin mente como a pandereta de evangelico', 'A', 3, '2015-07-29 21:05:03', '2015-07-30 02:05:03'),
(47, 'Lero lero', 'I', 1, '2015-07-29 21:43:39', '2015-07-30 02:43:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_competencia`
--

CREATE TABLE `resultado_competencia` (
  `id_resultado` int(11) NOT NULL,
  `id_competencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultado_competencia`
--

INSERT INTO `resultado_competencia` (`id_resultado`, `id_competencia`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 4),
(22, 4),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(37, 6),
(38, 6),
(39, 6),
(40, 6),
(41, 6),
(42, 6),
(43, 6),
(1, 7),
(3, 7),
(4, 7),
(46, 8),
(1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_concepto`
--

CREATE TABLE `resultado_concepto` (
  `id_resultado` int(11) NOT NULL,
  `id_concepto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultado_concepto`
--

INSERT INTO `resultado_concepto` (`id_resultado`, `id_concepto`) VALUES
(45, 1),
(45, 2),
(46, 94),
(47, 2),
(47, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado_proceso`
--

CREATE TABLE `resultado_proceso` (
  `id_resultado` int(11) NOT NULL,
  `id_proceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultado_proceso`
--

INSERT INTO `resultado_proceso` (`id_resultado`, `id_proceso`) VALUES
(45, 1),
(46, 3),
(47, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'A', '2015-05-28 20:27:15', '0000-00-00 00:00:00'),
(2, 'Instructor', 'A', '2015-05-29 13:00:01', '0000-00-00 00:00:00'),
(3, 'Digitador', 'A', '2015-05-28 20:27:31', '0000-00-00 00:00:00'),
(4, 'Aprendiz', 'A', '2015-05-28 20:27:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solucion`
--

CREATE TABLE `solucion` (
  `id` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_subsolucion` int(11) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solucion`
--

INSERT INTO `solucion` (`id`, `id_tipo`, `descripcion`, `id_usuario`, `fecha`, `id_subsolucion`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tecnica #1', 1, '2015-07-13 23:33:24', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 'Legal ', 1, '2015-07-13 23:34:02', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 'Funcional', 1, '2015-07-13 23:34:02', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 'Tecnica #1.1', 1, '2015-07-13 23:34:35', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 'Legal #1.1', 1, '2015-07-13 23:34:35', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 3, 'Funcional', 1, '2015-07-15 21:53:37', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 1, 'Tecnica', 1, '2015-07-15 21:53:37', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 1, 'Tecnica 1.1', 1, '2015-07-15 21:54:12', 7, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, 'Legal 1.1', 1, '2015-07-15 21:54:13', 6, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 1, 'Tecnica2', 1, '2015-07-15 22:13:14', 7, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 2, 'Legal', 1, '2015-07-15 22:22:50', 6, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, 'Solucion  tecnica', 2, '2015-07-16 16:28:23', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 2, 'Solucion legal', 2, '2015-07-16 16:28:23', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 3, 'Solucion funcional', 2, '2015-07-16 16:28:23', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 'Xdvxxf', 1, '2015-07-24 15:32:24', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 3, 'Hjhkjhkj', 1, '2015-07-24 15:32:24', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 3, 'Hjhkjhkj ghfhgfhggfgfhjfjhj', 1, '2015-07-24 15:32:57', 16, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 'Eso no se debe escribir coja oficio', 4, '2015-07-29 21:11:20', NULL, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 2, 'No se haga hacer estropear', 4, '2015-07-29 21:11:49', 18, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, 'Tecnica #1.2', 1, '2015-08-05 16:08:03', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 2, 'Legal #1', 1, '2015-08-05 16:08:03', 1, 'A', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solucion_caso`
--

CREATE TABLE `solucion_caso` (
  `id_caso` int(11) NOT NULL,
  `id_solucion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `solucion_caso`
--

INSERT INTO `solucion_caso` (`id_caso`, `id_solucion`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 20),
(1, 21),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 12),
(3, 13),
(3, 14),
(9, 15),
(9, 16),
(9, 17),
(12, 18),
(12, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `jefe` varchar(40) NOT NULL,
  `departamento` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `id_empresa`, `id_ciudad`, `telefono`, `direccion`, `email`, `jefe`, `departamento`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '6675435', 'cll 5', 'carvajal@gmail.com', 'luis perez', 'contabilidad', '2015-07-29 20:17:46', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Tarjeta de identidad', 'A', '2015-05-28 20:28:16', '0000-00-00 00:00:00'),
(2, 'Cédula de ciudadania', 'A', '2015-05-28 20:29:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solucion`
--

CREATE TABLE `tipo_solucion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_solucion`
--

INSERT INTO `tipo_solucion` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Tecnica', 'A', '2015-05-28 20:46:04', '0000-00-00 00:00:00'),
(2, 'Legal', 'A', '2015-05-28 20:46:04', '0000-00-00 00:00:00'),
(3, 'Funcional', 'A', '2015-05-28 20:46:13', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `id_tipodoc` int(11) DEFAULT NULL,
  `nro_documento` int(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `foto` varchar(50) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `id_tipodoc`, `nro_documento`, `direccion`, `telefono`, `email`, `password`, `id_ciudad`, `id_rol`, `id_grupo`, `id_empresa`, `foto`, `estado`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Carlos', 'Cantor', 2, 1144678989, 'Cra 5', '4567808', 'cantor@misena.edu.co', '$2y$10$jxWtGki6UL.IQzURxE1.g.Q8kno0OQw2kv1cG7CjzTljvzRcaAAju', 1, 1, NULL, NULL, '11800096_891434680951006_3559461769035115217_n.jpg', 'A', '6vf2qqtLcQbUBRCYAbzM4LhulBBdCvf9RKk8dXYMOHgwh4vDPvT81ZyT33nY', '2017-06-30 14:04:23', '2017-06-30 19:04:23'),
(2, 'Jhonatan', 'Chaguendo', 2, 2147483647, 'Cll 34', '8978657', 'chague@misena.edu.co', '$2y$10$E1hqLWNc3Ut9mFepTBMvH.O3NIvma1un4CK9NCxzfcy1PXXZjVidC', 1, 4, 1, 1, '132.jpg', 'A', 'pUHAK7xaazZuCVcCjTUkcyA4DFOjjRfkh5wTX9QqcG06zsWscLyme2aI99aP', '2015-08-05 18:29:22', '2015-08-05 23:29:22'),
(3, 'Cielo', 'Castillo', 2, 2147483647, 'Cll 2', '8876756', 'cielo@misena.edu.co', '$2y$10$NbZltIbNwwoO7VUwA8m2KO8Al6M5caduS3edGgx2kZD58XbKGnGKa', 1, 4, 1, 1, '', 'A', 'cCK9C4RMmrbe9qwqLQa5q9mshhJLyXVHpn1apRcjlBs4vDD7Ie8uVB43WR2U', '2015-07-15 22:50:07', '2015-07-16 03:50:07'),
(4, 'Laura', 'Cuatin', 2, 2147483647, 'Cll 4', '6675462', 'laura@misena.edu.co', '$2y$10$DnYthq/s0Fz.kImhmS.yd.FI6ZhZ7yaFpnhvHzEnv0aSs2ewUCsxS', 1, 2, NULL, NULL, '', 'A', 'OYwIR6kzfinlQ0GO2nfwVSAZoQm1gSrMH65MuhoV9hnJtVAQ6qpccUyjcGGZ', '2015-08-05 22:59:14', '2015-08-06 03:59:14'),
(5, 'Pepito', 'Perez', 1, 2147483647, 'Cll3', '6678564', 'pipe@misena.edu.co', '123', 1, 3, NULL, NULL, '', 'A', 'dXILNfpzOtne6Y5PrEAZsZusAAPJZ7bKctfNUFgAgx5fQLJ4HzBYFThcJiET', '2016-07-07 21:40:16', '2016-07-06 22:27:14'),
(6, 'Felipe', 'Uribe', 2, 1234567890, 'Dig', '1234567', 'felipe@misena.edu.co', '$2y$10$jxWtGki6UL.IQzURxE1.g.Q8kno0OQw2kv1cG7CjzTljvzRcaAAju', 1, 4, 3, 1, 'imagen_1448143216.jpg', 'A', 'PysqC31BsFAuATv3ZmvKxWX0IkpUee3GZ0lMBNUjn1SjYArngGgQBDZHZwQA', '2016-07-08 21:50:27', '2016-07-09 02:50:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `version`
--

INSERT INTO `version` (`id`, `nombre`, `id_programa`, `estado`, `created_at`, `updated_at`) VALUES
(1, '101', 1, 'A', '2015-05-29 14:02:44', '2015-05-29 13:36:36'),
(4, '102', 1, 'A', '2015-07-13 20:09:50', '2015-07-13 15:09:50'),
(5, '987', 3, 'A', '2015-07-30 02:07:51', '2015-07-29 21:07:51'),
(6, '345', 3, 'I', '2015-07-29 21:46:11', '2015-07-29 21:46:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `version_competencia`
--

CREATE TABLE `version_competencia` (
  `id_version` int(11) NOT NULL,
  `id_competencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `version_competencia`
--

INSERT INTO `version_competencia` (`id_version`, `id_competencia`) VALUES
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(5, 8),
(6, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `id_usuario`, `created_at`, `updated_at`) VALUES
(1, 1, '2015-07-13 13:45:03', '0000-00-00 00:00:00'),
(2, 1, '2015-07-13 15:11:50', '0000-00-00 00:00:00'),
(3, 1, '2015-07-13 23:31:13', '0000-00-00 00:00:00'),
(4, 1, '2015-07-14 13:36:56', '0000-00-00 00:00:00'),
(5, 1, '2015-07-14 15:05:18', '0000-00-00 00:00:00'),
(6, 1, '2015-07-15 14:51:20', '0000-00-00 00:00:00'),
(7, 1, '2015-07-15 17:53:56', '0000-00-00 00:00:00'),
(8, 1, '2015-07-15 21:38:17', '0000-00-00 00:00:00'),
(9, 2, '2015-07-15 22:24:41', '0000-00-00 00:00:00'),
(10, 3, '2015-07-15 22:27:11', '0000-00-00 00:00:00'),
(11, 1, '2015-07-16 13:37:18', '0000-00-00 00:00:00'),
(12, 2, '2015-07-16 16:21:18', '0000-00-00 00:00:00'),
(13, 1, '2015-07-22 13:49:37', '0000-00-00 00:00:00'),
(14, 1, '2015-07-22 15:01:09', '0000-00-00 00:00:00'),
(15, 1, '2015-07-23 20:19:42', '0000-00-00 00:00:00'),
(16, 1, '2015-07-24 14:08:01', '0000-00-00 00:00:00'),
(17, 1, '2015-07-24 15:11:25', '0000-00-00 00:00:00'),
(18, 1, '2015-07-24 15:16:06', '0000-00-00 00:00:00'),
(19, 1, '2015-07-27 14:04:14', '0000-00-00 00:00:00'),
(20, 1, '2015-07-27 18:59:19', '0000-00-00 00:00:00'),
(21, 1, '2015-07-27 19:27:24', '0000-00-00 00:00:00'),
(22, 1, '2015-07-27 19:58:58', '0000-00-00 00:00:00'),
(23, 1, '2015-07-27 20:20:54', '0000-00-00 00:00:00'),
(24, 1, '2015-07-28 00:43:46', '0000-00-00 00:00:00'),
(25, 1, '2015-07-29 16:10:21', '0000-00-00 00:00:00'),
(26, 1, '2015-07-29 18:33:53', '0000-00-00 00:00:00'),
(27, 1, '2015-07-29 19:51:26', '0000-00-00 00:00:00'),
(28, 2, '2015-07-29 20:55:01', '0000-00-00 00:00:00'),
(29, 1, '2015-07-29 20:57:38', '0000-00-00 00:00:00'),
(30, 4, '2015-07-29 20:59:06', '0000-00-00 00:00:00'),
(31, 1, '2015-07-29 21:15:19', '0000-00-00 00:00:00'),
(32, 1, '2015-07-29 21:23:53', '0000-00-00 00:00:00'),
(33, 4, '2015-07-29 21:25:16', '0000-00-00 00:00:00'),
(34, 1, '2015-07-29 21:33:30', '0000-00-00 00:00:00'),
(35, 5, '2015-07-29 21:35:07', '0000-00-00 00:00:00'),
(36, 1, '2015-07-29 21:49:41', '0000-00-00 00:00:00'),
(37, 1, '2015-07-30 12:03:50', '0000-00-00 00:00:00'),
(38, 1, '2015-08-04 22:00:09', '0000-00-00 00:00:00'),
(39, 2, '2015-08-04 22:41:34', '0000-00-00 00:00:00'),
(40, 1, '2015-08-05 15:47:19', '0000-00-00 00:00:00'),
(41, 1, '2015-08-05 17:57:24', '0000-00-00 00:00:00'),
(42, 5, '2015-08-05 17:58:32', '0000-00-00 00:00:00'),
(43, 4, '2015-08-05 18:02:58', '0000-00-00 00:00:00'),
(44, 2, '2015-08-05 18:03:52', '0000-00-00 00:00:00'),
(45, 1, '2015-08-05 18:37:29', '0000-00-00 00:00:00'),
(46, 1, '2015-08-05 21:58:03', '0000-00-00 00:00:00'),
(47, 4, '2015-08-05 22:29:35', '0000-00-00 00:00:00'),
(48, 5, '2015-08-05 22:29:56', '0000-00-00 00:00:00'),
(49, 1, '2015-08-05 22:38:27', '0000-00-00 00:00:00'),
(50, 4, '2015-08-05 22:51:03', '0000-00-00 00:00:00'),
(51, 1, '2015-08-05 22:59:32', '0000-00-00 00:00:00'),
(52, 1, '2015-09-02 18:23:02', '0000-00-00 00:00:00'),
(53, 1, '2015-09-02 19:09:17', '0000-00-00 00:00:00'),
(54, 1, '2015-09-10 14:46:43', '0000-00-00 00:00:00'),
(55, 1, '2015-09-10 16:58:10', '0000-00-00 00:00:00'),
(56, 1, '2015-09-14 17:35:56', '0000-00-00 00:00:00'),
(57, 1, '2016-07-06 17:02:58', '0000-00-00 00:00:00'),
(58, 1, '2016-07-06 17:20:35', '0000-00-00 00:00:00'),
(59, 5, '2016-07-06 17:26:22', '0000-00-00 00:00:00'),
(60, 6, '2016-07-06 17:28:07', '0000-00-00 00:00:00'),
(61, 1, '2016-07-06 21:06:29', '0000-00-00 00:00:00'),
(62, 1, '2016-07-06 22:31:47', '0000-00-00 00:00:00'),
(63, 1, '2016-07-07 21:55:09', '0000-00-00 00:00:00'),
(64, 1, '2016-07-07 21:56:05', '0000-00-00 00:00:00'),
(65, 1, '2016-07-07 22:06:03', '0000-00-00 00:00:00'),
(66, 1, '2016-07-07 22:08:15', '0000-00-00 00:00:00'),
(67, 1, '2016-07-07 22:11:02', '0000-00-00 00:00:00'),
(68, 1, '2016-07-07 22:14:20', '0000-00-00 00:00:00'),
(69, 1, '2016-07-07 22:16:27', '0000-00-00 00:00:00'),
(70, 1, '2016-07-07 22:20:41', '0000-00-00 00:00:00'),
(71, 1, '2016-07-07 22:20:41', '0000-00-00 00:00:00'),
(72, 1, '2016-07-07 22:31:56', '0000-00-00 00:00:00'),
(73, 1, '2016-07-07 22:33:26', '0000-00-00 00:00:00'),
(74, 1, '2016-07-08 18:27:51', '0000-00-00 00:00:00'),
(75, 1, '2016-07-08 18:30:48', '0000-00-00 00:00:00'),
(76, 1, '2016-07-08 18:38:21', '0000-00-00 00:00:00'),
(77, 1, '2016-07-08 18:44:45', '0000-00-00 00:00:00'),
(78, 1, '2016-07-08 18:45:39', '0000-00-00 00:00:00'),
(79, 1, '2016-07-08 21:07:40', '0000-00-00 00:00:00'),
(80, 1, '2016-07-08 21:23:09', '0000-00-00 00:00:00'),
(81, 6, '2016-07-08 21:49:38', '0000-00-00 00:00:00'),
(82, 1, '2016-07-08 22:12:52', '0000-00-00 00:00:00'),
(83, 1, '2016-07-14 21:16:02', '0000-00-00 00:00:00'),
(84, 1, '2016-07-14 21:38:16', '0000-00-00 00:00:00'),
(85, 1, '2017-03-23 18:10:51', '0000-00-00 00:00:00'),
(86, 1, '2017-03-23 18:39:52', '0000-00-00 00:00:00'),
(87, 1, '2017-03-27 04:50:25', '0000-00-00 00:00:00'),
(88, 1, '2017-05-04 06:34:32', '0000-00-00 00:00:00'),
(89, 1, '2017-06-30 14:04:00', '0000-00-00 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_relatoria` (`id_relatoria`);

--
-- Indices de la tabla `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_subcaso` (`id_subcaso`),
  ADD KEY `id_programa` (`id_programa`),
  ADD KEY `id_empresa_2` (`id_empresa`,`id_programa`,`id_usuario`,`id_subcaso`);

--
-- Indices de la tabla `caso_concepto`
--
ALTER TABLE `caso_concepto`
  ADD KEY `id_caso` (`id_caso`,`id_concepto`),
  ADD KEY `id_concepto` (`id_concepto`),
  ADD KEY `id_caso_2` (`id_caso`,`id_concepto`);

--
-- Indices de la tabla `caso_proceso`
--
ALTER TABLE `caso_proceso`
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_proceso` (`id_proceso`),
  ADD KEY `id_caso_2` (`id_caso`,`id_proceso`);

--
-- Indices de la tabla `caso_resultado`
--
ALTER TABLE `caso_resultado`
  ADD KEY `id_caso` (`id_caso`),
  ADD KEY `id_resultado` (`id_resultado`),
  ADD KEY `id_caso_2` (`id_caso`,`id_resultado`);

--
-- Indices de la tabla `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_regional` (`id_regional`);

--
-- Indices de la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`),
  ADD KEY `id_programa_2` (`id_programa`);

--
-- Indices de la tabla `concepto_principio`
--
ALTER TABLE `concepto_principio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grupo_formacion`
--
ALTER TABLE `grupo_formacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_version` (`id_version`),
  ADD KEY `id_version_2` (`id_version`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regional`
--
ALTER TABLE `regional`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `regional_centro_ciudad`
--
ALTER TABLE `regional_centro_ciudad`
  ADD KEY `id_regional` (`id_regional`,`id_centro`,`id_ciudad`),
  ADD KEY `id_centro` (`id_centro`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `relatorias`
--
ALTER TABLE `relatorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresa` (`id_empresa`,`id_grupo`,`id_usuario`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `resultado_aprendizaje`
--
ALTER TABLE `resultado_aprendizaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `resultado_competencia`
--
ALTER TABLE `resultado_competencia`
  ADD KEY `id_resultado` (`id_resultado`),
  ADD KEY `id_competencia` (`id_competencia`);

--
-- Indices de la tabla `resultado_concepto`
--
ALTER TABLE `resultado_concepto`
  ADD KEY `id_resultado` (`id_resultado`,`id_concepto`),
  ADD KEY `id_concepto` (`id_concepto`);

--
-- Indices de la tabla `resultado_proceso`
--
ALTER TABLE `resultado_proceso`
  ADD KEY `id_resultado` (`id_resultado`,`id_proceso`),
  ADD KEY `id_proceso` (`id_proceso`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solucion`
--
ALTER TABLE `solucion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`,`id_subsolucion`),
  ADD KEY `id_subsolucion` (`id_subsolucion`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `id_tipo_2` (`id_tipo`);

--
-- Indices de la tabla `solucion_caso`
--
ALTER TABLE `solucion_caso`
  ADD KEY `id_caso` (`id_caso`,`id_solucion`),
  ADD KEY `id_solucion` (`id_solucion`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresa` (`id_empresa`,`id_ciudad`),
  ADD KEY `id_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_solucion`
--
ALTER TABLE `tipo_solucion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipodoc` (`id_tipodoc`,`id_ciudad`,`id_rol`,`id_grupo`,`id_empresa`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_ciudad` (`id_ciudad`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_grupo_2` (`id_grupo`);

--
-- Indices de la tabla `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_programa` (`id_programa`),
  ADD KEY `id_programa_2` (`id_programa`);

--
-- Indices de la tabla `version_competencia`
--
ALTER TABLE `version_competencia`
  ADD KEY `id_version` (`id_version`),
  ADD KEY `id_competencia` (`id_competencia`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividades`
--
ALTER TABLE `actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `caso`
--
ALTER TABLE `caso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `centro`
--
ALTER TABLE `centro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `competencia`
--
ALTER TABLE `competencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `concepto_principio`
--
ALTER TABLE `concepto_principio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `grupo_formacion`
--
ALTER TABLE `grupo_formacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proceso`
--
ALTER TABLE `proceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `programa_formacion`
--
ALTER TABLE `programa_formacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `regional`
--
ALTER TABLE `regional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `relatorias`
--
ALTER TABLE `relatorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `resultado_aprendizaje`
--
ALTER TABLE `resultado_aprendizaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `solucion`
--
ALTER TABLE `solucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_solucion`
--
ALTER TABLE `tipo_solucion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`id_relatoria`) REFERENCES `relatorias` (`id`);

--
-- Filtros para la tabla `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `caso_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa_formacion` (`id`),
  ADD CONSTRAINT `caso_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `caso_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `caso_ibfk_4` FOREIGN KEY (`id_subcaso`) REFERENCES `caso` (`id`);

--
-- Filtros para la tabla `caso_concepto`
--
ALTER TABLE `caso_concepto`
  ADD CONSTRAINT `caso_concepto_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id`),
  ADD CONSTRAINT `caso_concepto_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `concepto_principio` (`id`);

--
-- Filtros para la tabla `caso_proceso`
--
ALTER TABLE `caso_proceso`
  ADD CONSTRAINT `caso_proceso_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id`),
  ADD CONSTRAINT `caso_proceso_ibfk_2` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id`);

--
-- Filtros para la tabla `caso_resultado`
--
ALTER TABLE `caso_resultado`
  ADD CONSTRAINT `caso_resultado_ibfk_1` FOREIGN KEY (`id_resultado`) REFERENCES `resultado_aprendizaje` (`id`),
  ADD CONSTRAINT `caso_resultado_ibfk_2` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id`);

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_regional`) REFERENCES `regional` (`id`);

--
-- Filtros para la tabla `competencia`
--
ALTER TABLE `competencia`
  ADD CONSTRAINT `competencia_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa_formacion` (`id`);

--
-- Filtros para la tabla `grupo_formacion`
--
ALTER TABLE `grupo_formacion`
  ADD CONSTRAINT `grupo_formacion_ibfk_1` FOREIGN KEY (`id_version`) REFERENCES `version` (`id`);

--
-- Filtros para la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD CONSTRAINT `proceso_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa_formacion` (`id`);

--
-- Filtros para la tabla `regional_centro_ciudad`
--
ALTER TABLE `regional_centro_ciudad`
  ADD CONSTRAINT `regional_centro_ciudad_ibfk_1` FOREIGN KEY (`id_regional`) REFERENCES `regional` (`id`),
  ADD CONSTRAINT `regional_centro_ciudad_ibfk_2` FOREIGN KEY (`id_centro`) REFERENCES `centro` (`id`);

--
-- Filtros para la tabla `relatorias`
--
ALTER TABLE `relatorias`
  ADD CONSTRAINT `relatorias_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `relatorias_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_formacion` (`id`),
  ADD CONSTRAINT `relatorias_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `resultado_aprendizaje`
--
ALTER TABLE `resultado_aprendizaje`
  ADD CONSTRAINT `resultado_aprendizaje_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa_formacion` (`id`);

--
-- Filtros para la tabla `resultado_competencia`
--
ALTER TABLE `resultado_competencia`
  ADD CONSTRAINT `resultado_competencia_ibfk_1` FOREIGN KEY (`id_resultado`) REFERENCES `resultado_aprendizaje` (`id`),
  ADD CONSTRAINT `resultado_competencia_ibfk_2` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id`);

--
-- Filtros para la tabla `resultado_concepto`
--
ALTER TABLE `resultado_concepto`
  ADD CONSTRAINT `resultado_concepto_ibfk_1` FOREIGN KEY (`id_resultado`) REFERENCES `resultado_aprendizaje` (`id`),
  ADD CONSTRAINT `resultado_concepto_ibfk_2` FOREIGN KEY (`id_concepto`) REFERENCES `concepto_principio` (`id`);

--
-- Filtros para la tabla `resultado_proceso`
--
ALTER TABLE `resultado_proceso`
  ADD CONSTRAINT `resultado_proceso_ibfk_1` FOREIGN KEY (`id_resultado`) REFERENCES `resultado_aprendizaje` (`id`),
  ADD CONSTRAINT `resultado_proceso_ibfk_2` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id`);

--
-- Filtros para la tabla `solucion`
--
ALTER TABLE `solucion`
  ADD CONSTRAINT `solucion_ibfk_1` FOREIGN KEY (`id_subsolucion`) REFERENCES `solucion` (`id`),
  ADD CONSTRAINT `solucion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `solucion_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_solucion` (`id`);

--
-- Filtros para la tabla `solucion_caso`
--
ALTER TABLE `solucion_caso`
  ADD CONSTRAINT `solucion_caso_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `caso` (`id`),
  ADD CONSTRAINT `solucion_caso_ibfk_2` FOREIGN KEY (`id_solucion`) REFERENCES `solucion` (`id`);

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `sucursal_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `sucursal_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_tipodoc`) REFERENCES `tipo_documento` (`id`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `usuario_ibfk_5` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_formacion` (`id`);

--
-- Filtros para la tabla `version_competencia`
--
ALTER TABLE `version_competencia`
  ADD CONSTRAINT `version_competencia_ibfk_1` FOREIGN KEY (`id_version`) REFERENCES `version` (`id`),
  ADD CONSTRAINT `version_competencia_ibfk_2` FOREIGN KEY (`id_competencia`) REFERENCES `competencia` (`id`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
