-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2015 a las 00:06:01
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `system`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounting_entry`
--

CREATE TABLE IF NOT EXISTS `accounting_entry` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_business` bigint(20) unsigned NOT NULL DEFAULT '1',
  `id_account_type` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_due_date` datetime DEFAULT NULL,
  `description` text,
  `debit` double unsigned NOT NULL DEFAULT '0',
  `credit` double unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `accounting_entry`
--

INSERT INTO `accounting_entry` (`id`, `date_created`, `date_deleted`, `id_business`, `id_account_type`, `id_client`, `payment_date`, `payment_due_date`, `description`, `debit`, `credit`) VALUES
(1, '2015-07-27 15:01:31', NULL, 1, 1, 202, NULL, '2015-05-05 00:00:00', 'Servicio Febrero  y Marzo Fact Nº 03-362', 0, 2900),
(2, '2015-07-27 15:02:33', NULL, 1, 1, 202, NULL, '2015-07-27 00:00:00', 'Servicio Abril, Mayo, Junio (1450) y Julio (1650) Pendiente de Facturación', 0, 6000);

--
-- Disparadores `accounting_entry`
--
DELIMITER //
CREATE TRIGGER `accounting_entry_date_created` BEFORE INSERT ON `accounting_entry`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_type`
--

CREATE TABLE IF NOT EXISTS `account_type` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `account_type`
--

INSERT INTO `account_type` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 07:32:12', NULL, 'caja', '');

--
-- Disparadores `account_type`
--
DELIMITER //
CREATE TRIGGER `account_type_date_created` BEFORE INSERT ON `account_type`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` text,
  `birthday` datetime DEFAULT NULL,
  `address` text,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administrator`
--

INSERT INTO `administrator` (`id`, `date_created`, `date_deleted`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-04-29 15:11:24', '2015-05-07 20:04:17', 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '2015-04-29 15:44:45', NULL, 'Elena', 'Diab', '', '', '', '2015-05-31 00:00:00', '', '', NULL, NULL, NULL, ''),
(3, '2015-04-29 15:54:45', NULL, 'Micheloti', 'Micheloti', 'M', '', '4243429', '0000-00-00 00:00:00', 'Obispo Salguero 420- 3º B', '', NULL, NULL, NULL, ''),
(4, '2015-04-29 16:10:32', NULL, 'Leonardo', 'Asis', 'M', 'estudiojuridicoasis@yahoo.com.ar', '4110310', '0000-00-00 00:00:00', 'Rondeau 353', '', NULL, NULL, NULL, ''),
(5, '2015-04-29 16:41:52', NULL, 'Mario', 'Prataviera', 'M', 'mgp@arnet.com.ar', '4684420', '0000-00-00 00:00:00', 'Larrañaga 212', '', 12, 7, 543, '5000'),
(6, '2015-04-29 16:43:04', NULL, 'Julio', 'Gallol', 'M', '', '155934521', '0000-00-00 00:00:00', '9 de Julio 661', '', NULL, NULL, NULL, ''),
(7, '2015-04-29 16:43:43', '2015-04-29 21:46:37', 'Julio', 'Gallol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-04-29 16:44:17', '2015-04-29 21:46:34', 'Julio', 'Gallol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-04-29 16:45:00', '2015-04-29 21:46:30', 'Julio', 'Gallol', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-04-29 16:49:35', '2015-05-18 21:05:58', 'Edilicia', 'Suez', '', '', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(11, '2015-04-29 16:50:53', NULL, 'Paula', 'Paula', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-05-07 09:30:00', NULL, 'Mario', 'Prataviera', 'M', 'mgp@arnet.com.ar', '4684420', '0000-00-00 00:00:00', 'Larrañaga 212', '', 12, 7, 543, '5000'),
(13, '2015-05-07 14:29:35', '2015-05-07 19:36:13', 'Maria', 'Gidetti', 'M', '', '4600808', '0000-00-00 00:00:00', 'Parana 657', '', 12, 7, NULL, ''),
(14, '2015-05-07 15:10:29', NULL, 'Daniel', 'Martinez', '', '', '155556061', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(15, '2015-05-07 15:12:38', NULL, 'Claudio', 'Tredichi', '', '', '155932074', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(16, '2015-05-07 15:16:14', NULL, 'Raul', 'Viqueira', 'M', 'matias.viqueira@gmail.com', '4228205', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(17, '2015-05-07 15:19:06', '2015-06-24 14:33:11', 'Contador', 'Buteler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '2015-05-12 14:06:33', '2015-05-12 19:10:26', 'Patricia', 'Valeri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '2015-05-12 14:08:46', NULL, 'Patricia', 'Valeri', 'F', '', '4831265', '0000-00-00 00:00:00', 'Jose Pucheta 1763', '', 12, 7, 543, '5000'),
(20, '2015-05-12 14:56:45', NULL, 'Norma', 'Gimenez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '2015-05-12 14:59:26', '2015-07-14 20:55:57', 'Marcelo', 'Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '2015-05-12 15:03:35', NULL, 'Romina', 'Romina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2015-05-12 15:05:07', NULL, 'Madre', 'Hilda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, '2015-05-14 12:29:21', NULL, 'Javier Portelli', 'Daniel Martinis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '2015-05-14 12:35:35', NULL, 'Marcelo', 'Martinez', 'M', '', '3516829627', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(26, '2015-05-14 12:42:47', NULL, 'Braian', 'Romero', 'M', 'condominiorevista@yahoo.com.ar', '4258141', '0000-00-00 00:00:00', 'Urquiza 145 – PB – Local 2', '', NULL, NULL, NULL, ''),
(27, '2015-05-14 13:07:11', NULL, 'arturo', 'caradaghian', '', '', '4513159', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(28, '2015-05-14 13:08:54', NULL, 'Lorena', 'Isaia', '', '', '22222222', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(29, '2015-05-14 13:18:09', NULL, 'Edilicia', 'Suez', '', '', '4600808', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(30, '2015-05-14 13:22:23', NULL, 'Soraya', 'Gonzales', '', 'echarras@consultoresdeempresas.com.ar', '', '0000-00-00 00:00:00', 'Urquiza 145 - PB - Local 2', '', NULL, NULL, NULL, ''),
(31, '2015-05-14 13:24:26', NULL, 'Natalia', 'Natalia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '2015-05-14 13:26:26', NULL, 'Liliana', 'Monserrat', '', 'lilianamonserrat_@hotmail.com', '4230585', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(33, '2015-05-15 17:01:01', NULL, 'Madre', 'Hilda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, '2015-05-15 17:03:44', NULL, 'German', 'Walter', 'M', '', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(35, '2015-05-15 17:14:20', NULL, 'Cristian', 'Baldi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '2015-05-15 17:16:50', NULL, 'Daniel', 'Shek', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '2015-05-15 17:37:01', NULL, 'Lorena', 'Isaia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '2015-05-15 17:38:21', NULL, 'Liliana', 'Monserrat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '2015-05-15 17:39:32', NULL, 'Paula', 'Acosta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '2015-05-15 17:40:46', NULL, 'Vilma', 'Ruiz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '2015-05-15 17:41:44', NULL, 'Arturo', 'Sosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '2015-05-15 17:48:04', NULL, 'Lorena', 'Arguello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '2015-05-15 17:50:10', NULL, 'Romina', 'Albese', 'F', 'romina.albese@allians.com.ar', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(44, '2015-05-15 17:51:08', NULL, 'Sebastian', 'Sarria', 'M', 'adm_sarria@yahoo.com.ar', '4247282', '0000-00-00 00:00:00', 'Jujuy 9 1º piso', '', NULL, NULL, NULL, ''),
(45, '2015-05-15 18:01:32', NULL, 'Yasmin', '-', 'F', 'yscribanti@ediliciasuez.com.ar', '4600808', '2015-10-15 00:00:00', 'Parana 653 PB', '', NULL, NULL, NULL, ''),
(46, '2015-05-15 18:02:59', NULL, 'Sandra', 'Farias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '2015-05-15 18:16:23', NULL, 'Andrea', 'Granero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '2015-05-18 10:38:08', NULL, 'Andrea Perez', 'Ramirez', 'F', 'andreaperezramirez@gmail.com', '3518021402', '0000-00-00 00:00:00', 'Pje San Agustin 332 2º Piso Of. A', '', NULL, NULL, NULL, ''),
(49, '2015-05-18 15:35:22', NULL, 'Federico', 'Federico', '', 'federicojavierpatino@yahoo.com.ar', '3513524455', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(50, '2015-05-18 15:49:33', '2015-09-16 16:16:27', 'Federico', 'Patino', 'M', 'federicojavierpatino@yahoo.com.ar', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(51, '2015-05-18 15:57:22', NULL, 'Gabriel', 'MORALES', 'M', NULL, '3515954054', NULL, 'Cacabuco 187 5A', NULL, NULL, NULL, NULL, NULL),
(52, '2015-05-18 16:05:40', NULL, 'Norma', 'Gimenez', 'F', 'adm_ngimenez@hotmail.com', '4281986', NULL, 'Av. Colón 525 – 3ºP – Of. 5', NULL, NULL, NULL, NULL, NULL),
(53, '2015-05-18 16:15:51', NULL, 'Miguel Argentino', 'Perez Gaudio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '2015-05-18 16:17:19', NULL, 'Miguel Argentino', 'Perez Gaudio', 'M', 'administracion@cup.com.ar', '4247278', NULL, 'Achaval Rodriguez  147', NULL, NULL, NULL, NULL, NULL),
(55, '2015-05-18 16:20:16', NULL, 'Miguel Argentino', 'Perez Gaudio', 'M', 'administracion@cup.com.ar', '4247278', NULL, 'Achaval Rodriguez  147', NULL, NULL, NULL, NULL, NULL),
(56, '2015-05-18 16:33:51', '2015-05-21 17:33:45', 'Ingeniero', 'Machado', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '2015-05-18 16:35:01', NULL, 'Ingeniero', 'Machado', 'M', 'felipemachado@live.com.ar', '4263398', '0000-00-00 00:00:00', 'Caseros 45 PB A y B', '', NULL, NULL, NULL, ''),
(58, '2015-05-18 16:50:53', NULL, 'Raul', 'Ochoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '2015-05-19 17:11:20', NULL, 'Administracion', 'Ghics', '', '', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(60, '2015-05-19 17:15:36', NULL, 'Angel', 'Cardozo', 'M', '', '3515414087', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(61, '2015-05-19 17:24:27', NULL, 'Lucas', 'Diaz Reina', 'M', '', '3515903378', '0000-00-00 00:00:00', 'Montevideo 820 – 1º F', '', NULL, NULL, NULL, ''),
(62, '2015-05-21 12:30:55', NULL, 'Inmobiliaria', 'Mora', 'M', '', '4222126', '0000-00-00 00:00:00', 'Gral. Paz 70 Local18', '', NULL, NULL, NULL, ''),
(63, '2015-05-21 18:04:16', NULL, 'Marcelo', 'Eredia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '2015-06-03 08:35:34', NULL, 'Florentino', 'Ledesma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '2015-06-09 16:04:25', NULL, 'Raul', 'Diaz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '2015-06-12 12:47:56', '2015-06-12 17:53:47', 'Pablo', 'Asis', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '2015-06-12 12:53:15', NULL, 'Pablo', 'Asis', 'M', 'pablo_asis@hotmail.com', '3516802345', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '2015-06-12 12:56:17', NULL, 'Pablo', 'Asis', 'M', 'pablo_asis@hotmai.com', '3516802345', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '2015-06-23 17:13:10', NULL, 'Madre', 'Hilda', 'F', 'defrancisco.buteler@gmail.com', '', '0000-00-00 00:00:00', 'Porto y Mariño 556', '', 12, 7, 543, '5000'),
(70, '2015-06-23 17:14:10', NULL, 'Lucas', 'Diaz Reina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '2015-06-23 17:16:26', NULL, 'Lucas', 'Diaz Reina', 'M', 'admdiazreina@hotmail.com', '4238904', '0000-00-00 00:00:00', 'Montevideo 820 1º F', '', NULL, NULL, NULL, ''),
(72, '2015-06-23 17:22:11', NULL, 'Jorge', 'Sacia', 'M', 'jorgesasia@hotmail.com', '4683705', '0000-00-00 00:00:00', 'Angelo de Peredo 65', '', 12, 7, NULL, ''),
(73, '2015-06-23 17:27:24', NULL, 'Jorge', 'Sasia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2015-06-24 09:30:20', '2015-06-24 14:33:14', 'Contador', 'Buteler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2015-06-24 09:32:19', NULL, 'Contador', 'Buteler', 'M', '', '152511308', NULL, 'Bv. San Juan 101 – 5º P – Of. B', NULL, NULL, NULL, NULL, NULL),
(76, '2015-07-14 15:35:06', NULL, 'Elena', 'Gonzales', 'F', '', '4234719\n155555887', '0000-00-00 00:00:00', 'Arturo M. Bas 327 Piso 2 Of 4', '', NULL, NULL, NULL, ''),
(77, '2015-07-14 15:38:59', '2015-07-14 20:43:29', 'Elena', 'Gonzales', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '2015-07-14 15:40:42', '2015-07-14 20:43:23', 'Elena', 'Gonzales', 'F', NULL, '4234719\n155555887', NULL, 'Arturo M. Bas 327 Piso 2 Of. 4', NULL, NULL, NULL, NULL, NULL),
(79, '2015-07-14 15:43:00', '2015-07-14 20:43:21', 'Elena', 'Gonzales', 'F', NULL, '4234719\n155555887', NULL, 'Arturo M. Bas 327 Piso 2 Of 4', NULL, 12, 7, 543, '5000'),
(80, '2015-07-14 16:59:30', NULL, 'Rodrigo', 'Campero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2015-07-14 17:01:16', NULL, 'Rodrigo', 'Campero', 'M', NULL, '155485200', NULL, NULL, NULL, 12, 7, 543, '5000'),
(82, '2015-07-14 17:15:14', NULL, 'Francisco', 'Coluchini', 'M', 'fideicomisocac@gmail.com', '0351-4684455', '0000-00-00 00:00:00', 'Bv. Chacabuco 1252, PB, local 2', '', NULL, NULL, NULL, ''),
(83, '2015-07-16 08:40:17', NULL, 'Daniel', 'Schsk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '2015-07-16 08:45:38', NULL, 'Daniel', 'Scchek', 'M', 'pchattas@yahoo.com.ar', '3516508961', NULL, '9 de Julio 849 7°  A', NULL, NULL, NULL, NULL, '5000'),
(85, '2015-07-28 08:47:37', NULL, 'Elena', 'Gonzales', 'F', NULL, '4234719\n3515555887', NULL, 'Arturo M Bas 327 2º P Of 4', NULL, NULL, NULL, NULL, NULL),
(86, '2015-09-16 14:43:33', NULL, 'Sebastian', 'Raschi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2015-09-16 14:48:30', NULL, 'Marcelo', 'Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '2015-09-16 15:15:43', NULL, 'Lorena', 'Arguello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '2015-09-16 16:41:30', '2015-09-16 21:44:15', 'Robles', 'Pozolo', '', 'info@roblespozzolo.com.ar', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(90, '2015-09-16 16:43:05', NULL, 'Robles', 'Pozzolo', 'M', 'info@roblespozzolo.com.ar', '4248486\n152313938', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '2015-10-08 16:11:28', NULL, 'Susana', 'Del Boca', '', 'delbocagus@yahoo.com.ar', '152743030', '0000-00-00 00:00:00', 'Gral Paz 81', '', NULL, NULL, NULL, ''),
(92, '2015-10-08 16:20:21', NULL, 'Soledad', 'Olivieri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '2015-10-08 16:54:51', NULL, 'Javier', 'Portelli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '2015-10-09 09:26:38', NULL, 'Mariano', 'Walter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '2015-10-09 09:30:34', NULL, 'Arturo', 'Sosa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '2015-10-09 09:35:14', NULL, 'Marcelo', 'Martinez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, '2015-10-15 09:08:09', NULL, 'Madre', 'Hilda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, '2015-10-15 09:10:36', NULL, 'Mirta', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, '2015-10-15 09:14:41', NULL, 'Susana', 'Del Boca', '', 'delbocagus@yahoo.com.ar', '152743030', '0000-00-00 00:00:00', 'Gral. Paz 81', '', NULL, NULL, NULL, ''),
(100, '2015-10-15 09:18:39', NULL, 'Mirta', 'Perez', '', 'mirta_perez66@hotmail.com', '3516832006', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(101, '2015-10-15 09:33:03', NULL, 'Soraya', 'Gonzalez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '2015-10-15 09:34:13', NULL, 'Soraya', 'Gonzalez', 'F', 'condominiorevista@yahoo.com.ar', NULL, NULL, 'Av. Olmos 336', NULL, 12, 7, 543, '5000'),
(103, '2015-10-15 09:35:47', NULL, 'Susana', 'del Boca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '2015-10-15 09:39:56', NULL, 'Susana', 'del Boca', NULL, NULL, NULL, NULL, NULL, NULL, 12, 7, 543, '5000'),
(105, '2015-10-15 09:44:55', NULL, 'Rodrigo', 'Campero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '2015-10-15 09:48:56', NULL, 'Rodrigo', 'Campero', 'M', 'echarras@consultoresdeempresas.com', NULL, NULL, NULL, NULL, 12, 7, 543, '5000'),
(107, '2015-10-15 09:58:16', NULL, 'Paula', 'Acosta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '2015-10-15 10:00:48', NULL, 'Paula', 'Acosta', 'M', 'centro_alegria@yahoo.com.ar', NULL, NULL, 'Caseros 680', NULL, 12, 7, 543, NULL),
(109, '2015-10-15 10:03:24', NULL, 'Lucas', 'Busso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, '2015-10-15 10:04:21', NULL, 'Lucas', 'Busso', NULL, 'ibusso@gmail.com', NULL, NULL, NULL, NULL, 12, 7, 543, '5000'),
(111, '2015-10-15 10:05:48', NULL, 'Liliana', 'Monserrat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '2015-10-15 10:10:35', NULL, 'German', '-', '', '', 'centro_alegria@yahoo.com.ar', '0000-00-00 00:00:00', 'Fragueiro 1761', '', NULL, NULL, NULL, ''),
(113, '2015-10-15 10:14:55', NULL, 'Paula', 'Acosta', NULL, 'paulacostacab@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, '2015-10-15 10:27:34', NULL, 'Lorena', '.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '2015-10-15 10:28:17', NULL, 'Lorena', '-', NULL, 'loisaia@afip.gob.ar', NULL, NULL, 'BS AS 150', NULL, NULL, NULL, NULL, NULL),
(116, '2015-10-15 10:31:08', NULL, 'Paula', 'Acosta', '', 'paulacostacab@gmail.com', '', '0000-00-00 00:00:00', 'caseros 680', '', NULL, NULL, NULL, ''),
(117, '2015-10-15 10:32:01', NULL, 'Susana', 'del Boca', NULL, 'delbocagus@yahoo.com.ar', NULL, NULL, 'General Paz 81', NULL, NULL, NULL, NULL, NULL),
(118, '2015-10-15 10:35:32', NULL, 'Lorena', 'Arguello', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '2015-10-15 10:35:44', NULL, 'Pamela', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '2015-10-15 10:37:49', NULL, 'Lorena', 'Argüello', NULL, 'lorenaarguello5@hotmail.com', NULL, NULL, 'Pasaje Santos Vega', NULL, NULL, NULL, NULL, NULL),
(121, '2015-10-15 10:41:23', NULL, 'Mario', 'Alvarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, '2015-10-15 10:41:47', NULL, 'Mario', 'Alvarez', NULL, NULL, NULL, NULL, 'Santa Rosa 2448', NULL, NULL, NULL, NULL, NULL),
(123, '2015-10-15 10:53:50', NULL, 'Sandra', 'Frias', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '2015-10-15 10:54:32', NULL, 'Sandra', 'Frias', NULL, 'sandrarifa13@hotmail.com', NULL, NULL, 'Dean Funes', NULL, NULL, NULL, NULL, NULL),
(125, '2015-10-15 10:59:00', NULL, 'Maria', 'Laura', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, '2015-10-15 11:00:13', NULL, 'Maria', 'Laura', NULL, 'mlaura@estudiopda.com.ar', NULL, NULL, 'Edf. Tita - Chacabuco 187 - 5º A', NULL, NULL, NULL, NULL, NULL),
(127, '2015-10-15 11:01:06', NULL, 'norma', 'gimenez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, '2015-10-15 11:02:05', NULL, 'Norma', 'Gimenez', NULL, 'adm_ngimenez@hotmail.com', '4248011', NULL, 'colon 525', NULL, NULL, NULL, NULL, NULL),
(129, '2015-10-15 11:18:01', NULL, 'Felpie', 'f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, '2015-10-15 11:19:28', NULL, 'Felipe', 'Machado', NULL, 'felipemachado@live.com.ar', NULL, NULL, 'Caseros 45 PB - A y B', NULL, NULL, NULL, NULL, NULL),
(131, '2015-10-15 11:32:00', NULL, 'raul', 'viqueira', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, '2015-10-15 11:32:57', NULL, 'Raúl', 'Viqueira', '', 'adm_viqueira@yahoo.com.ar', '', '0000-00-00 00:00:00', 'Av. Colon 187', '', NULL, NULL, NULL, ''),
(133, '2015-10-15 11:36:38', NULL, 'Porcel de', 'Peralta', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, '2015-10-15 11:37:39', NULL, 'Porcel de', 'Peralta', NULL, NULL, '4687109', NULL, 'San Lorenzo 440 PB D', NULL, NULL, NULL, NULL, NULL),
(135, '2015-10-15 11:47:09', NULL, 'Fredy Omar', 'Mani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '2015-10-15 11:48:01', NULL, 'Freddy Omar', 'Mani', NULL, 'Fredymani@hotmail.com', NULL, NULL, 'Caseros 344 7º of 58', NULL, NULL, NULL, NULL, NULL),
(137, '2015-10-15 11:52:07', NULL, 'Natalia', '-', NULL, 'nbreitung@crear-contructora.com.ar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, '2015-10-15 11:56:11', NULL, 'Graciela', 'Alvarez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '2015-10-15 11:57:27', NULL, 'Graciela', 'Alvarez', NULL, 'contaduria@cpsps.org.ar', NULL, NULL, 'Eugenio Garzon 404', NULL, NULL, NULL, NULL, NULL),
(140, '2015-10-15 12:09:19', NULL, 'viviana', 'Ferrero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, '2015-10-15 12:10:18', NULL, 'Viviana', 'Ferrero', NULL, 'vivianaferrero2002@yahoo.com.ar', '3513006681', NULL, 'San Nicolas 585', NULL, NULL, NULL, NULL, NULL),
(142, '2015-10-15 12:16:08', NULL, 'Santiago', 'Serranos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, '2015-10-15 12:17:35', NULL, 'Santiago', 'Serranos', NULL, 'sdeserranos@gmail.com', '351689634', NULL, 'Ituzaingo 270 7D', NULL, NULL, NULL, NULL, NULL),
(144, '2015-10-15 12:26:02', NULL, 'Oscar', 'Blanco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, '2015-10-15 12:27:30', NULL, 'Oscar', 'Blanco', NULL, 'oscarblanco_adm@hotmail.com.ar', NULL, NULL, '156783558', NULL, NULL, NULL, NULL, NULL),
(146, '2015-10-15 12:46:32', NULL, 'Daniel', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, '2015-10-15 12:47:08', NULL, 'Daniel', '-', NULL, 'ceom@arnet.com.ar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, '2015-10-15 12:52:17', NULL, 'Gonzalo', 'Chidiak', '', 'vperez@keyindumentaria.com.ar', '', '0000-00-00 00:00:00', 'Ituzaingo 394', '', NULL, NULL, NULL, ''),
(149, '2015-10-15 12:56:21', NULL, 'Cristina', 'Rojas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, '2015-10-15 12:57:01', NULL, 'Cristina', 'Rojas', NULL, NULL, NULL, NULL, 'Dean Funes 625 2º depto 9', NULL, NULL, NULL, NULL, NULL),
(151, '2015-10-15 13:02:56', NULL, 'Ruben', 'Galvan', '', 'rubengalvan_3@hotmail.com', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(152, '2015-10-15 13:07:45', NULL, 'Contador', 'Buteler', '', '', '', '0000-00-00 00:00:00', 'Bv. San Juan 101 5B', '', NULL, NULL, NULL, ''),
(153, '2015-10-19 09:26:27', NULL, 'Brian', 'Romero', '', 'condominiorevista@yahoo.com.ar', '3516205508', '0000-00-00 00:00:00', 'Av. Olmos 336', '', NULL, NULL, NULL, ''),
(154, '2015-10-19 09:57:29', NULL, 'Ana Lisa', 'Bonetto', '', 'administracion@cup.com.ar', '4253905', '0000-00-00 00:00:00', 'Achaval Rodriguez 147', '', NULL, NULL, NULL, ''),
(155, '2015-10-19 10:02:09', NULL, 'Fabiana', 'Cerino', '', 'fcerino@emusimundo.com', '', '0000-00-00 00:00:00', 'rivera indarte 175', '', NULL, NULL, NULL, ''),
(156, '2015-10-19 10:20:08', NULL, 'UNC', '-', '', 'economica@artes.unc.edu.ar', '155903378', '0000-00-00 00:00:00', 'Pabellon Mexico', '', NULL, NULL, NULL, ''),
(157, '2015-10-19 10:26:57', NULL, 'Leandro', 'Civalero', '', 'edificio.delvallevi@gmail.com', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(158, '2015-10-19 10:33:55', NULL, 'Jorge', 'Castiñeira', '', 'estacion1290@hotmail.com', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(159, '2015-10-19 10:49:04', NULL, 'roberto', 'balari', '', '', '', '0000-00-00 00:00:00', 'Av. Colon 184 - 2º', '', NULL, NULL, NULL, ''),
(160, '2015-10-19 10:54:13', NULL, 'Norma', 'Juncos', '', 'norma.juncos@robertcade.org.ar', '156533417', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(161, '2015-10-19 11:02:10', NULL, '-', 'Calvo', '', '', '', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(162, '2015-10-19 11:06:21', NULL, 'Guido', 'Salvatierra', '', '', '156529049', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(163, '2015-10-19 11:11:51', NULL, 'Cecilia', '-', '', '', '153234801', '0000-00-00 00:00:00', '', '', NULL, NULL, NULL, ''),
(164, '2015-10-19 11:17:35', NULL, 'Patricia', 'Del Bono', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, '2015-10-19 11:18:32', NULL, 'Lucas', '.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, '2015-10-19 11:25:06', NULL, 'Patricia', 'Del Bono', NULL, 'delbonopropiedades@live.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, '2015-10-19 12:05:13', NULL, 'Inm.', 'Trinidad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, '2015-10-19 12:05:55', NULL, 'Inm.', 'Trinidad', NULL, 'consorcios.cba@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, '2015-10-19 12:12:11', NULL, 'Patricia', 'Valeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, '2015-10-19 12:40:26', NULL, 'Sebastian', 'Atchian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, '2015-10-19 12:45:53', NULL, 'Sebastian', 'Atchian', NULL, 'sebastianatchian@torrescentauro.com.ar', '156147902', NULL, '25 de Mayo 115 - 5º D', NULL, NULL, NULL, NULL, NULL),
(172, '2015-10-19 13:02:06', NULL, 'Andrea', 'Basile', '', 'edificiointerlaken2@yahoo.com.ar', '156766651', '0000-00-00 00:00:00', 'Rosario de Sta. Fe1348 - PB', '', NULL, NULL, NULL, ''),
(173, '2015-10-19 13:18:59', NULL, 'Santiago', 'Raschi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, '2015-10-19 13:24:09', NULL, 'Santiago', 'Raschi', NULL, NULL, NULL, NULL, 'Av. Colon 720 1º piso', NULL, NULL, NULL, NULL, NULL);

--
-- Disparadores `administrator`
--
DELIMITER //
CREATE TRIGGER `administrator_date_created` BEFORE INSERT ON `administrator`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `business`
--

CREATE TABLE IF NOT EXISTS `business` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `business`
--

INSERT INTO `business` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 07:53:33', NULL, 'Ascensoft', NULL);

--
-- Disparadores `business`
--
DELIMITER //
CREATE TRIGGER `business_date_created` BEFORE INSERT ON `business`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE IF NOT EXISTS `city` (
`id` int(11) unsigned NOT NULL,
  `id_state` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2383 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `id_state`, `name`) VALUES
(1, 1, '25 de Mayo'),
(2, 1, '3 de febrero'),
(3, 1, 'A. Alsina'),
(4, 1, 'A. Gonzáles Cháves'),
(5, 1, 'Aguas Verdes'),
(6, 1, 'Alberti'),
(7, 1, 'Arrecifes'),
(8, 1, 'Ayacucho'),
(9, 1, 'Azul'),
(10, 1, 'Bahía Blanca'),
(11, 1, 'Balcarce'),
(12, 1, 'Baradero'),
(13, 1, 'Benito Juárez'),
(14, 1, 'Berisso'),
(15, 1, 'Bolívar'),
(16, 1, 'Bragado'),
(17, 1, 'Brandsen'),
(18, 1, 'Campana'),
(19, 1, 'Cañuelas'),
(20, 1, 'Capilla del Señor'),
(21, 1, 'Capitán Sarmiento'),
(22, 1, 'Carapachay'),
(23, 1, 'Carhue'),
(24, 1, 'Cariló'),
(25, 1, 'Carlos Casares'),
(26, 1, 'Carlos Tejedor'),
(27, 1, 'Carmen de Areco'),
(28, 1, 'Carmen de Patagones'),
(29, 1, 'Castelli'),
(30, 1, 'Chacabuco'),
(31, 1, 'Chascomús'),
(32, 1, 'Chivilcoy'),
(33, 1, 'Colón'),
(34, 1, 'Coronel Dorrego'),
(35, 1, 'Coronel Pringles'),
(36, 1, 'Coronel Rosales'),
(37, 1, 'Coronel Suarez'),
(38, 1, 'Costa Azul'),
(39, 1, 'Costa Chica'),
(40, 1, 'Costa del Este'),
(41, 1, 'Costa Esmeralda'),
(42, 1, 'Daireaux'),
(43, 1, 'Darregueira'),
(44, 1, 'Del Viso'),
(45, 1, 'Dolores'),
(46, 1, 'Don Torcuato'),
(47, 1, 'Ensenada'),
(48, 1, 'Escobar'),
(49, 1, 'Exaltación de la Cruz'),
(50, 1, 'Florentino Ameghino'),
(51, 1, 'Garín'),
(52, 1, 'Gral. Alvarado'),
(53, 1, 'Gral. Alvear'),
(54, 1, 'Gral. Arenales'),
(55, 1, 'Gral. Belgrano'),
(56, 1, 'Gral. Guido'),
(57, 1, 'Gral. Lamadrid'),
(58, 1, 'Gral. Las Heras'),
(59, 1, 'Gral. Lavalle'),
(60, 1, 'Gral. Madariaga'),
(61, 1, 'Gral. Pacheco'),
(62, 1, 'Gral. Paz'),
(63, 1, 'Gral. Pinto'),
(64, 1, 'Gral. Pueyrredón'),
(65, 1, 'Gral. Rodríguez'),
(66, 1, 'Gral. Viamonte'),
(67, 1, 'Gral. Villegas'),
(68, 1, 'Guaminí'),
(69, 1, 'Guernica'),
(70, 1, 'Hipólito Yrigoyen'),
(71, 1, 'Ing. Maschwitz'),
(72, 1, 'Junín'),
(73, 1, 'La Plata'),
(74, 1, 'Laprida'),
(75, 1, 'Las Flores'),
(76, 1, 'Las Toninas'),
(77, 1, 'Leandro N. Alem'),
(78, 1, 'Lincoln'),
(79, 1, 'Loberia'),
(80, 1, 'Lobos'),
(81, 1, 'Los Cardales'),
(82, 1, 'Los Toldos'),
(83, 1, 'Lucila del Mar'),
(84, 1, 'Luján'),
(85, 1, 'Magdalena'),
(86, 1, 'Maipú'),
(87, 1, 'Mar Chiquita'),
(88, 1, 'Mar de Ajó'),
(89, 1, 'Mar de las Pampas'),
(90, 1, 'Mar del Plata'),
(91, 1, 'Mar del Tuyú'),
(92, 1, 'Marcos Paz'),
(93, 1, 'Mercedes'),
(94, 1, 'Miramar'),
(95, 1, 'Monte'),
(96, 1, 'Monte Hermoso'),
(97, 1, 'Munro'),
(98, 1, 'Navarro'),
(99, 1, 'Necochea'),
(100, 1, 'Olavarría'),
(101, 1, 'Partido de la Costa'),
(102, 1, 'Pehuajó'),
(103, 1, 'Pellegrini'),
(104, 1, 'Pergamino'),
(105, 1, 'Pigüé'),
(106, 1, 'Pila'),
(107, 1, 'Pilar'),
(108, 1, 'Pinamar'),
(109, 1, 'Pinar del Sol'),
(110, 1, 'Polvorines'),
(111, 1, 'Pte. Perón'),
(112, 1, 'Puán'),
(113, 1, 'Punta Indio'),
(114, 1, 'Ramallo'),
(115, 1, 'Rauch'),
(116, 1, 'Rivadavia'),
(117, 1, 'Rojas'),
(118, 1, 'Roque Pérez'),
(119, 1, 'Saavedra'),
(120, 1, 'Saladillo'),
(121, 1, 'Salliqueló'),
(122, 1, 'Salto'),
(123, 1, 'San Andrés de Giles'),
(124, 1, 'San Antonio de Areco'),
(125, 1, 'San Antonio de Padua'),
(126, 1, 'San Bernardo'),
(127, 1, 'San Cayetano'),
(128, 1, 'San Clemente del Tuyú'),
(129, 1, 'San Nicolás'),
(130, 1, 'San Pedro'),
(131, 1, 'San Vicente'),
(132, 1, 'Santa Teresita'),
(133, 1, 'Suipacha'),
(134, 1, 'Tandil'),
(135, 1, 'Tapalqué'),
(136, 1, 'Tordillo'),
(137, 1, 'Tornquist'),
(138, 1, 'Trenque Lauquen'),
(139, 1, 'Tres Lomas'),
(140, 1, 'Villa Gesell'),
(141, 1, 'Villarino'),
(142, 1, 'Zárate'),
(143, 2, '11 de Septiembre'),
(144, 2, '20 de Junio'),
(145, 2, '25 de Mayo'),
(146, 2, 'Acassuso'),
(147, 2, 'Adrogué'),
(148, 2, 'Aldo Bonzi'),
(149, 2, 'Área Reserva Cinturón Ecológico'),
(150, 2, 'Avellaneda'),
(151, 2, 'Banfield'),
(152, 2, 'Barrio Parque'),
(153, 2, 'Barrio Santa Teresita'),
(154, 2, 'Beccar'),
(155, 2, 'Bella Vista'),
(156, 2, 'Berazategui'),
(157, 2, 'Bernal Este'),
(158, 2, 'Bernal Oeste'),
(159, 2, 'Billinghurst'),
(160, 2, 'Boulogne'),
(161, 2, 'Burzaco'),
(162, 2, 'Carapachay'),
(163, 2, 'Caseros'),
(164, 2, 'Castelar'),
(165, 2, 'Churruca'),
(166, 2, 'Ciudad Evita'),
(167, 2, 'Ciudad Madero'),
(168, 2, 'Ciudadela'),
(169, 2, 'Claypole'),
(170, 2, 'Crucecita'),
(171, 2, 'Dock Sud'),
(172, 2, 'Don Bosco'),
(173, 2, 'Don Orione'),
(174, 2, 'El Jagüel'),
(175, 2, 'El Libertador'),
(176, 2, 'El Palomar'),
(177, 2, 'El Tala'),
(178, 2, 'El Trébol'),
(179, 2, 'Ezeiza'),
(180, 2, 'Ezpeleta'),
(181, 2, 'Florencio Varela'),
(182, 2, 'Florida'),
(183, 2, 'Francisco Álvarez'),
(184, 2, 'Gerli'),
(185, 2, 'Glew'),
(186, 2, 'González Catán'),
(187, 2, 'Gral. Lamadrid'),
(188, 2, 'Grand Bourg'),
(189, 2, 'Gregorio de Laferrere'),
(190, 2, 'Guillermo Enrique Hudson'),
(191, 2, 'Haedo'),
(192, 2, 'Hurlingham'),
(193, 2, 'Ing. Sourdeaux'),
(194, 2, 'Isidro Casanova'),
(195, 2, 'Ituzaingó'),
(196, 2, 'José C. Paz'),
(197, 2, 'José Ingenieros'),
(198, 2, 'José Marmol'),
(199, 2, 'La Lucila'),
(200, 2, 'La Reja'),
(201, 2, 'La Tablada'),
(202, 2, 'Lanús'),
(203, 2, 'Llavallol'),
(204, 2, 'Loma Hermosa'),
(205, 2, 'Lomas de Zamora'),
(206, 2, 'Lomas del Millón'),
(207, 2, 'Lomas del Mirador'),
(208, 2, 'Longchamps'),
(209, 2, 'Los Polvorines'),
(210, 2, 'Luis Guillón'),
(211, 2, 'Malvinas Argentinas'),
(212, 2, 'Martín Coronado'),
(213, 2, 'Martínez'),
(214, 2, 'Merlo'),
(215, 2, 'Ministro Rivadavia'),
(216, 2, 'Monte Chingolo'),
(217, 2, 'Monte Grande'),
(218, 2, 'Moreno'),
(219, 2, 'Morón'),
(220, 2, 'Muñiz'),
(221, 2, 'Olivos'),
(222, 2, 'Pablo Nogués'),
(223, 2, 'Pablo Podestá'),
(224, 2, 'Paso del Rey'),
(225, 2, 'Pereyra'),
(226, 2, 'Piñeiro'),
(227, 2, 'Plátanos'),
(228, 2, 'Pontevedra'),
(229, 2, 'Quilmes'),
(230, 2, 'Rafael Calzada'),
(231, 2, 'Rafael Castillo'),
(232, 2, 'Ramos Mejía'),
(233, 2, 'Ranelagh'),
(234, 2, 'Remedios de Escalada'),
(235, 2, 'Sáenz Peña'),
(236, 2, 'San Antonio de Padua'),
(237, 2, 'San Fernando'),
(238, 2, 'San Francisco Solano'),
(239, 2, 'San Isidro'),
(240, 2, 'San José'),
(241, 2, 'San Justo'),
(242, 2, 'San Martín'),
(243, 2, 'San Miguel'),
(244, 2, 'Santos Lugares'),
(245, 2, 'Sarandí'),
(246, 2, 'Sourigues'),
(247, 2, 'Tapiales'),
(248, 2, 'Temperley'),
(249, 2, 'Tigre'),
(250, 2, 'Tortuguitas'),
(251, 2, 'Tristán Suárez'),
(252, 2, 'Trujui'),
(253, 2, 'Turdera'),
(254, 2, 'Valentín Alsina'),
(255, 2, 'Vicente López'),
(256, 2, 'Villa Adelina'),
(257, 2, 'Villa Ballester'),
(258, 2, 'Villa Bosch'),
(259, 2, 'Villa Caraza'),
(260, 2, 'Villa Celina'),
(261, 2, 'Villa Centenario'),
(262, 2, 'Villa de Mayo'),
(263, 2, 'Villa Diamante'),
(264, 2, 'Villa Domínico'),
(265, 2, 'Villa España'),
(266, 2, 'Villa Fiorito'),
(267, 2, 'Villa Guillermina'),
(268, 2, 'Villa Insuperable'),
(269, 2, 'Villa José León Suárez'),
(270, 2, 'Villa La Florida'),
(271, 2, 'Villa Luzuriaga'),
(272, 2, 'Villa Martelli'),
(273, 2, 'Villa Obrera'),
(274, 2, 'Villa Progreso'),
(275, 2, 'Villa Raffo'),
(276, 2, 'Villa Sarmiento'),
(277, 2, 'Villa Tesei'),
(278, 2, 'Villa Udaondo'),
(279, 2, 'Virrey del Pino'),
(280, 2, 'Wilde'),
(281, 2, 'William Morris'),
(282, 3, 'Agronomía'),
(283, 3, 'Almagro'),
(284, 3, 'Balvanera'),
(285, 3, 'Barracas'),
(286, 3, 'Belgrano'),
(287, 3, 'Boca'),
(288, 3, 'Boedo'),
(289, 3, 'Caballito'),
(290, 3, 'Chacarita'),
(291, 3, 'Coghlan'),
(292, 3, 'Colegiales'),
(293, 3, 'Constitución'),
(294, 3, 'Flores'),
(295, 3, 'Floresta'),
(296, 3, 'La Paternal'),
(297, 3, 'Liniers'),
(298, 3, 'Mataderos'),
(299, 3, 'Monserrat'),
(300, 3, 'Monte Castro'),
(301, 3, 'Nueva Pompeya'),
(302, 3, 'Núñez'),
(303, 3, 'Palermo'),
(304, 3, 'Parque Avellaneda'),
(305, 3, 'Parque Chacabuco'),
(306, 3, 'Parque Chas'),
(307, 3, 'Parque Patricios'),
(308, 3, 'Puerto Madero'),
(309, 3, 'Recoleta'),
(310, 3, 'Retiro'),
(311, 3, 'Saavedra'),
(312, 3, 'San Cristóbal'),
(313, 3, 'San Nicolás'),
(314, 3, 'San Telmo'),
(315, 3, 'Vélez Sársfield'),
(316, 3, 'Versalles'),
(317, 3, 'Villa Crespo'),
(318, 3, 'Villa del Parque'),
(319, 3, 'Villa Devoto'),
(320, 3, 'Villa Gral. Mitre'),
(321, 3, 'Villa Lugano'),
(322, 3, 'Villa Luro'),
(323, 3, 'Villa Ortúzar'),
(324, 3, 'Villa Pueyrredón'),
(325, 3, 'Villa Real'),
(326, 3, 'Villa Riachuelo'),
(327, 3, 'Villa Santa Rita'),
(328, 3, 'Villa Soldati'),
(329, 3, 'Villa Urquiza'),
(330, 4, 'Aconquija'),
(331, 4, 'Ancasti'),
(332, 4, 'Andalgalá'),
(333, 4, 'Antofagasta'),
(334, 4, 'Belén'),
(335, 4, 'Capayán'),
(336, 4, 'Capital'),
(337, 4, '4'),
(338, 4, 'Corral Quemado'),
(339, 4, 'El Alto'),
(340, 4, 'El Rodeo'),
(341, 4, 'F.Mamerto Esquiú'),
(342, 4, 'Fiambalá'),
(343, 4, 'Hualfín'),
(344, 4, 'Huillapima'),
(345, 4, 'Icaño'),
(346, 4, 'La Puerta'),
(347, 4, 'Las Juntas'),
(348, 4, 'Londres'),
(349, 4, 'Los Altos'),
(350, 4, 'Los Varela'),
(351, 4, 'Mutquín'),
(352, 4, 'Paclín'),
(353, 4, 'Poman'),
(354, 4, 'Pozo de La Piedra'),
(355, 4, 'Puerta de Corral'),
(356, 4, 'Puerta San José'),
(357, 4, 'Recreo'),
(358, 4, 'S.F.V de 4'),
(359, 4, 'San Fernando'),
(360, 4, 'San Fernando del Valle'),
(361, 4, 'San José'),
(362, 4, 'Santa María'),
(363, 4, 'Santa Rosa'),
(364, 4, 'Saujil'),
(365, 4, 'Tapso'),
(366, 4, 'Tinogasta'),
(367, 4, 'Valle Viejo'),
(368, 4, 'Villa Vil'),
(369, 5, 'Aviá Teraí'),
(370, 5, 'Barranqueras'),
(371, 5, 'Basail'),
(372, 5, 'Campo Largo'),
(373, 5, 'Capital'),
(374, 5, 'Capitán Solari'),
(375, 5, 'Charadai'),
(376, 5, 'Charata'),
(377, 5, 'Chorotis'),
(378, 5, 'Ciervo Petiso'),
(379, 5, 'Cnel. Du Graty'),
(380, 5, 'Col. Benítez'),
(381, 5, 'Col. Elisa'),
(382, 5, 'Col. Popular'),
(383, 5, 'Colonias Unidas'),
(384, 5, 'Concepción'),
(385, 5, 'Corzuela'),
(386, 5, 'Cote Lai'),
(387, 5, 'El Sauzalito'),
(388, 5, 'Enrique Urien'),
(389, 5, 'Fontana'),
(390, 5, 'Fte. Esperanza'),
(391, 5, 'Gancedo'),
(392, 5, 'Gral. Capdevila'),
(393, 5, 'Gral. Pinero'),
(394, 5, 'Gral. San Martín'),
(395, 5, 'Gral. Vedia'),
(396, 5, 'Hermoso Campo'),
(397, 5, 'I. del Cerrito'),
(398, 5, 'J.J. Castelli'),
(399, 5, 'La Clotilde'),
(400, 5, 'La Eduvigis'),
(401, 5, 'La Escondida'),
(402, 5, 'La Leonesa'),
(403, 5, 'La Tigra'),
(404, 5, 'La Verde'),
(405, 5, 'Laguna Blanca'),
(406, 5, 'Laguna Limpia'),
(407, 5, 'Lapachito'),
(408, 5, 'Las Breñas'),
(409, 5, 'Las Garcitas'),
(410, 5, 'Las Palmas'),
(411, 5, 'Los Frentones'),
(412, 5, 'Machagai'),
(413, 5, 'Makallé'),
(414, 5, 'Margarita Belén'),
(415, 5, 'Miraflores'),
(416, 5, 'Misión N. Pompeya'),
(417, 5, 'Napenay'),
(418, 5, 'Pampa Almirón'),
(419, 5, 'Pampa del Indio'),
(420, 5, 'Pampa del Infierno'),
(421, 5, 'Pdcia. de La Plaza'),
(422, 5, 'Pdcia. Roca'),
(423, 5, 'Pdcia. Roque Sáenz Peña'),
(424, 5, 'Pto. Bermejo'),
(425, 5, 'Pto. Eva Perón'),
(426, 5, 'Puero Tirol'),
(427, 5, 'Puerto Vilelas'),
(428, 5, 'Quitilipi'),
(429, 5, 'Resistencia'),
(430, 5, 'Sáenz Peña'),
(431, 5, 'Samuhú'),
(432, 5, 'San Bernardo'),
(433, 5, 'Santa Sylvina'),
(434, 5, 'Taco Pozo'),
(435, 5, 'Tres Isletas'),
(436, 5, 'Villa Ángela'),
(437, 5, 'Villa Berthet'),
(438, 5, 'Villa R. Bermejito'),
(439, 6, 'Aldea Apeleg'),
(440, 6, 'Aldea Beleiro'),
(441, 6, 'Aldea Epulef'),
(442, 6, 'Alto Río Sengerr'),
(443, 6, 'Buen Pasto'),
(444, 6, 'Camarones'),
(445, 6, 'Carrenleufú'),
(446, 6, 'Cholila'),
(447, 6, 'Co. Centinela'),
(448, 6, 'Colan Conhué'),
(449, 6, 'Comodoro Rivadavia'),
(450, 6, 'Corcovado'),
(451, 6, 'Cushamen'),
(452, 6, 'Dique F. Ameghino'),
(453, 6, 'Dolavón'),
(454, 6, 'Dr. R. Rojas'),
(455, 6, 'El Hoyo'),
(456, 6, 'El Maitén'),
(457, 6, 'Epuyén'),
(458, 6, 'Esquel'),
(459, 6, 'Facundo'),
(460, 6, 'Gaimán'),
(461, 6, 'Gan Gan'),
(462, 6, 'Gastre'),
(463, 6, 'Gdor. Costa'),
(464, 6, 'Gualjaina'),
(465, 6, 'J. de San Martín'),
(466, 6, 'Lago Blanco'),
(467, 6, 'Lago Puelo'),
(468, 6, 'Lagunita Salada'),
(469, 6, 'Las Plumas'),
(470, 6, 'Los Altares'),
(471, 6, 'Paso de los Indios'),
(472, 6, 'Paso del Sapo'),
(473, 6, 'Pto. Madryn'),
(474, 6, 'Pto. Pirámides'),
(475, 6, 'Rada Tilly'),
(476, 6, 'Rawson'),
(477, 6, 'Río Mayo'),
(478, 6, 'Río Pico'),
(479, 6, 'Sarmiento'),
(480, 6, 'Tecka'),
(481, 6, 'Telsen'),
(482, 6, 'Trelew'),
(483, 6, 'Trevelin'),
(484, 6, 'Veintiocho de Julio'),
(485, 7, 'Achiras'),
(486, 7, 'Adelia Maria'),
(487, 7, 'Agua de Oro'),
(488, 7, 'Alcira Gigena'),
(489, 7, 'Aldea Santa Maria'),
(490, 7, 'Alejandro Roca'),
(491, 7, 'Alejo Ledesma'),
(492, 7, 'Alicia'),
(493, 7, 'Almafuerte'),
(494, 7, 'Alpa Corral'),
(495, 7, 'Alta Gracia'),
(496, 7, 'Alto Alegre'),
(497, 7, 'Alto de Los Quebrachos'),
(498, 7, 'Altos de Chipion'),
(499, 7, 'Amboy'),
(500, 7, 'Ambul'),
(501, 7, 'Ana Zumaran'),
(502, 7, 'Anisacate'),
(503, 7, 'Arguello'),
(504, 7, 'Arias'),
(505, 7, 'Arroyito'),
(506, 7, 'Arroyo Algodon'),
(507, 7, 'Arroyo Cabral'),
(508, 7, 'Arroyo Los Patos'),
(509, 7, 'Assunta'),
(510, 7, 'Atahona'),
(511, 7, 'Ausonia'),
(512, 7, 'Avellaneda'),
(513, 7, 'Ballesteros'),
(514, 7, 'Ballesteros Sud'),
(515, 7, 'Balnearia'),
(516, 7, 'Bañado de Soto'),
(517, 7, 'Bell Ville'),
(518, 7, 'Bengolea'),
(519, 7, 'Benjamin Gould'),
(520, 7, 'Berrotaran'),
(521, 7, 'Bialet Masse'),
(522, 7, 'Bouwer'),
(523, 7, 'Brinkmann'),
(524, 7, 'Buchardo'),
(525, 7, 'Bulnes'),
(526, 7, 'Cabalango'),
(527, 7, 'Calamuchita'),
(528, 7, 'Calchin'),
(529, 7, 'Calchin Oeste'),
(530, 7, 'Calmayo'),
(531, 7, 'Camilo Aldao'),
(532, 7, 'Caminiaga'),
(533, 7, 'Cañada de Luque'),
(534, 7, 'Cañada de Machado'),
(535, 7, 'Cañada de Rio Pinto'),
(536, 7, 'Cañada del Sauce'),
(537, 7, 'Canals'),
(538, 7, 'Candelaria Sud'),
(539, 7, 'Capilla de Remedios'),
(540, 7, 'Capilla de Siton'),
(541, 7, 'Capilla del Carmen'),
(542, 7, 'Capilla del Monte'),
(543, 7, 'Capital'),
(544, 7, 'Capitan Gral B. O´Higgins'),
(545, 7, 'Carnerillo'),
(546, 7, 'Carrilobo'),
(547, 7, 'Casa Grande'),
(548, 7, 'Cavanagh'),
(549, 7, 'Cerro Colorado'),
(550, 7, 'Chaján'),
(551, 7, 'Chalacea'),
(552, 7, 'Chañar Viejo'),
(553, 7, 'Chancaní'),
(554, 7, 'Charbonier'),
(555, 7, 'Charras'),
(556, 7, 'Chazón'),
(557, 7, 'Chilibroste'),
(558, 7, 'Chucul'),
(559, 7, 'Chuña'),
(560, 7, 'Chuña Huasi'),
(561, 7, 'Churqui Cañada'),
(562, 7, 'Cienaga Del Coro'),
(563, 7, 'Cintra'),
(564, 7, 'Col. Almada'),
(565, 7, 'Col. Anita'),
(566, 7, 'Col. Barge'),
(567, 7, 'Col. Bismark'),
(568, 7, 'Col. Bremen'),
(569, 7, 'Col. Caroya'),
(570, 7, 'Col. Italiana'),
(571, 7, 'Col. Iturraspe'),
(572, 7, 'Col. Las Cuatro Esquinas'),
(573, 7, 'Col. Las Pichanas'),
(574, 7, 'Col. Marina'),
(575, 7, 'Col. Prosperidad'),
(576, 7, 'Col. San Bartolome'),
(577, 7, 'Col. San Pedro'),
(578, 7, 'Col. Tirolesa'),
(579, 7, 'Col. Vicente Aguero'),
(580, 7, 'Col. Videla'),
(581, 7, 'Col. Vignaud'),
(582, 7, 'Col. Waltelina'),
(583, 7, 'Colazo'),
(584, 7, 'Comechingones'),
(585, 7, 'Conlara'),
(586, 7, 'Copacabana'),
(587, 7, '7'),
(588, 7, 'Coronel Baigorria'),
(589, 7, 'Coronel Moldes'),
(590, 7, 'Corral de Bustos'),
(591, 7, 'Corralito'),
(592, 7, 'Cosquín'),
(593, 7, 'Costa Sacate'),
(594, 7, 'Cruz Alta'),
(595, 7, 'Cruz de Caña'),
(596, 7, 'Cruz del Eje'),
(597, 7, 'Cuesta Blanca'),
(598, 7, 'Dean Funes'),
(599, 7, 'Del Campillo'),
(600, 7, 'Despeñaderos'),
(601, 7, 'Devoto'),
(602, 7, 'Diego de Rojas'),
(603, 7, 'Dique Chico'),
(604, 7, 'El Arañado'),
(605, 7, 'El Brete'),
(606, 7, 'El Chacho'),
(607, 7, 'El Crispín'),
(608, 7, 'El Fortín'),
(609, 7, 'El Manzano'),
(610, 7, 'El Rastreador'),
(611, 7, 'El Rodeo'),
(612, 7, 'El Tío'),
(613, 7, 'Elena'),
(614, 7, 'Embalse'),
(615, 7, 'Esquina'),
(616, 7, 'Estación Gral. Paz'),
(617, 7, 'Estación Juárez Celman'),
(618, 7, 'Estancia de Guadalupe'),
(619, 7, 'Estancia Vieja'),
(620, 7, 'Etruria'),
(621, 7, 'Eufrasio Loza'),
(622, 7, 'Falda del Carmen'),
(623, 7, 'Freyre'),
(624, 7, 'Gral. Baldissera'),
(625, 7, 'Gral. Cabrera'),
(626, 7, 'Gral. Deheza'),
(627, 7, 'Gral. Fotheringham'),
(628, 7, 'Gral. Levalle'),
(629, 7, 'Gral. Roca'),
(630, 7, 'Guanaco Muerto'),
(631, 7, 'Guasapampa'),
(632, 7, 'Guatimozin'),
(633, 7, 'Gutenberg'),
(634, 7, 'Hernando'),
(635, 7, 'Huanchillas'),
(636, 7, 'Huerta Grande'),
(637, 7, 'Huinca Renanco'),
(638, 7, 'Idiazabal'),
(639, 7, 'Impira'),
(640, 7, 'Inriville'),
(641, 7, 'Isla Verde'),
(642, 7, 'Italó'),
(643, 7, 'James Craik'),
(644, 7, 'Jesús María'),
(645, 7, 'Jovita'),
(646, 7, 'Justiniano Posse'),
(647, 7, 'Km 658'),
(648, 7, 'L. V. Mansilla'),
(649, 7, 'La Batea'),
(650, 7, 'La Calera'),
(651, 7, 'La Carlota'),
(652, 7, 'La Carolina'),
(653, 7, 'La Cautiva'),
(654, 7, 'La Cesira'),
(655, 7, 'La Cruz'),
(656, 7, 'La Cumbre'),
(657, 7, 'La Cumbrecita'),
(658, 7, 'La Falda'),
(659, 7, 'La Francia'),
(660, 7, 'La Granja'),
(661, 7, 'La Higuera'),
(662, 7, 'La Laguna'),
(663, 7, 'La Paisanita'),
(664, 7, 'La Palestina'),
(665, 7, '12'),
(666, 7, 'La Paquita'),
(667, 7, 'La Para'),
(668, 7, 'La Paz'),
(669, 7, 'La Playa'),
(670, 7, 'La Playosa'),
(671, 7, 'La Población'),
(672, 7, 'La Posta'),
(673, 7, 'La Puerta'),
(674, 7, 'La Quinta'),
(675, 7, 'La Rancherita'),
(676, 7, 'La Rinconada'),
(677, 7, 'La Serranita'),
(678, 7, 'La Tordilla'),
(679, 7, 'Laborde'),
(680, 7, 'Laboulaye'),
(681, 7, 'Laguna Larga'),
(682, 7, 'Las Acequias'),
(683, 7, 'Las Albahacas'),
(684, 7, 'Las Arrias'),
(685, 7, 'Las Bajadas'),
(686, 7, 'Las Caleras'),
(687, 7, 'Las Calles'),
(688, 7, 'Las Cañadas'),
(689, 7, 'Las Gramillas'),
(690, 7, 'Las Higueras'),
(691, 7, 'Las Isletillas'),
(692, 7, 'Las Junturas'),
(693, 7, 'Las Palmas'),
(694, 7, 'Las Peñas'),
(695, 7, 'Las Peñas Sud'),
(696, 7, 'Las Perdices'),
(697, 7, 'Las Playas'),
(698, 7, 'Las Rabonas'),
(699, 7, 'Las Saladas'),
(700, 7, 'Las Tapias'),
(701, 7, 'Las Varas'),
(702, 7, 'Las Varillas'),
(703, 7, 'Las Vertientes'),
(704, 7, 'Leguizamón'),
(705, 7, 'Leones'),
(706, 7, 'Los Cedros'),
(707, 7, 'Los Cerrillos'),
(708, 7, 'Los Chañaritos (C.E)'),
(709, 7, 'Los Chanaritos (R.S)'),
(710, 7, 'Los Cisnes'),
(711, 7, 'Los Cocos'),
(712, 7, 'Los Cóndores'),
(713, 7, 'Los Hornillos'),
(714, 7, 'Los Hoyos'),
(715, 7, 'Los Mistoles'),
(716, 7, 'Los Molinos'),
(717, 7, 'Los Pozos'),
(718, 7, 'Los Reartes'),
(719, 7, 'Los Surgentes'),
(720, 7, 'Los Talares'),
(721, 7, 'Los Zorros'),
(722, 7, 'Lozada'),
(723, 7, 'Luca'),
(724, 7, 'Luque'),
(725, 7, 'Luyaba'),
(726, 7, 'Malagueño'),
(727, 7, 'Malena'),
(728, 7, 'Malvinas Argentinas'),
(729, 7, 'Manfredi'),
(730, 7, 'Maquinista Gallini'),
(731, 7, 'Marcos Juárez'),
(732, 7, 'Marull'),
(733, 7, 'Matorrales'),
(734, 7, 'Mattaldi'),
(735, 7, 'Mayu Sumaj'),
(736, 7, 'Media Naranja'),
(737, 7, 'Melo'),
(738, 7, 'Mendiolaza'),
(739, 7, 'Mi Granja'),
(740, 7, 'Mina Clavero'),
(741, 7, 'Miramar'),
(742, 7, 'Morrison'),
(743, 7, 'Morteros'),
(744, 7, 'Mte. Buey'),
(745, 7, 'Mte. Cristo'),
(746, 7, 'Mte. De Los Gauchos'),
(747, 7, 'Mte. Leña'),
(748, 7, 'Mte. Maíz'),
(749, 7, 'Mte. Ralo'),
(750, 7, 'Nicolás Bruzone'),
(751, 7, 'Noetinger'),
(752, 7, 'Nono'),
(753, 7, 'Nueva 7'),
(754, 7, 'Obispo Trejo'),
(755, 7, 'Olaeta'),
(756, 7, 'Oliva'),
(757, 7, 'Olivares San Nicolás'),
(758, 7, 'Onagolty'),
(759, 7, 'Oncativo'),
(760, 7, 'Ordoñez'),
(761, 7, 'Pacheco De Melo'),
(762, 7, 'Pampayasta N.'),
(763, 7, 'Pampayasta S.'),
(764, 7, 'Panaholma'),
(765, 7, 'Pascanas'),
(766, 7, 'Pasco'),
(767, 7, 'Paso del Durazno'),
(768, 7, 'Paso Viejo'),
(769, 7, 'Pilar'),
(770, 7, 'Pincén'),
(771, 7, 'Piquillín'),
(772, 7, 'Plaza de Mercedes'),
(773, 7, 'Plaza Luxardo'),
(774, 7, 'Porteña'),
(775, 7, 'Potrero de Garay'),
(776, 7, 'Pozo del Molle'),
(777, 7, 'Pozo Nuevo'),
(778, 7, 'Pueblo Italiano'),
(779, 7, 'Puesto de Castro'),
(780, 7, 'Punta del Agua'),
(781, 7, 'Quebracho Herrado'),
(782, 7, 'Quilino'),
(783, 7, 'Rafael García'),
(784, 7, 'Ranqueles'),
(785, 7, 'Rayo Cortado'),
(786, 7, 'Reducción'),
(787, 7, 'Rincón'),
(788, 7, 'Río Bamba'),
(789, 7, 'Río Ceballos'),
(790, 7, 'Río Cuarto'),
(791, 7, 'Río de Los Sauces'),
(792, 7, 'Río Primero'),
(793, 7, 'Río Segundo'),
(794, 7, 'Río Tercero'),
(795, 7, 'Rosales'),
(796, 7, 'Rosario del Saladillo'),
(797, 7, 'Sacanta'),
(798, 7, 'Sagrada Familia'),
(799, 7, 'Saira'),
(800, 7, 'Saladillo'),
(801, 7, 'Saldán'),
(802, 7, 'Salsacate'),
(803, 7, 'Salsipuedes'),
(804, 7, 'Sampacho'),
(805, 7, 'San Agustín'),
(806, 7, 'San Antonio de Arredondo'),
(807, 7, 'San Antonio de Litín'),
(808, 7, 'San Basilio'),
(809, 7, 'San Carlos Minas'),
(810, 7, 'San Clemente'),
(811, 7, 'San Esteban'),
(812, 7, 'San Francisco'),
(813, 7, 'San Ignacio'),
(814, 7, 'San Javier'),
(815, 7, 'San Jerónimo'),
(816, 7, 'San Joaquín'),
(817, 7, 'San José de La Dormida'),
(818, 7, 'San José de Las Salinas'),
(819, 7, 'San Lorenzo'),
(820, 7, 'San Marcos Sierras'),
(821, 7, 'San Marcos Sud'),
(822, 7, 'San Pedro'),
(823, 7, 'San Pedro N.'),
(824, 7, 'San Roque'),
(825, 7, 'San Vicente'),
(826, 7, 'Santa Catalina'),
(827, 7, 'Santa Elena'),
(828, 7, 'Santa Eufemia'),
(829, 7, 'Santa Maria'),
(830, 7, 'Sarmiento'),
(831, 7, 'Saturnino M.Laspiur'),
(832, 7, 'Sauce Arriba'),
(833, 7, 'Sebastián Elcano'),
(834, 7, 'Seeber'),
(835, 7, 'Segunda Usina'),
(836, 7, 'Serrano'),
(837, 7, 'Serrezuela'),
(838, 7, 'Sgo. Temple'),
(839, 7, 'Silvio Pellico'),
(840, 7, 'Simbolar'),
(841, 7, 'Sinsacate'),
(842, 7, 'Sta. Rosa de Calamuchita'),
(843, 7, 'Sta. Rosa de Río Primero'),
(844, 7, 'Suco'),
(845, 7, 'Tala Cañada'),
(846, 7, 'Tala Huasi'),
(847, 7, 'Talaini'),
(848, 7, 'Tancacha'),
(849, 7, 'Tanti'),
(850, 7, 'Ticino'),
(851, 7, 'Tinoco'),
(852, 7, 'Tío Pujio'),
(853, 7, 'Toledo'),
(854, 7, 'Toro Pujio'),
(855, 7, 'Tosno'),
(856, 7, 'Tosquita'),
(857, 7, 'Tránsito'),
(858, 7, 'Tuclame'),
(859, 7, 'Tutti'),
(860, 7, 'Ucacha'),
(861, 7, 'Unquillo'),
(862, 7, 'Valle de Anisacate'),
(863, 7, 'Valle Hermoso'),
(864, 7, 'Vélez Sarfield'),
(865, 7, 'Viamonte'),
(866, 7, 'Vicuña Mackenna'),
(867, 7, 'Villa Allende'),
(868, 7, 'Villa Amancay'),
(869, 7, 'Villa Ascasubi'),
(870, 7, 'Villa Candelaria N.'),
(871, 7, 'Villa Carlos Paz'),
(872, 7, 'Villa Cerro Azul'),
(873, 7, 'Villa Ciudad de América'),
(874, 7, 'Villa Ciudad Pque Los Reartes'),
(875, 7, 'Villa Concepción del Tío'),
(876, 7, 'Villa Cura Brochero'),
(877, 7, 'Villa de Las Rosas'),
(878, 7, 'Villa de María'),
(879, 7, 'Villa de Pocho'),
(880, 7, 'Villa de Soto'),
(881, 7, 'Villa del Dique'),
(882, 7, 'Villa del Prado'),
(883, 7, 'Villa del Rosario'),
(884, 7, 'Villa del Totoral'),
(885, 7, 'Villa Dolores'),
(886, 7, 'Villa El Chancay'),
(887, 7, 'Villa Elisa'),
(888, 7, 'Villa Flor Serrana'),
(889, 7, 'Villa Fontana'),
(890, 7, 'Villa Giardino'),
(891, 7, 'Villa Gral. Belgrano'),
(892, 7, 'Villa Gutierrez'),
(893, 7, 'Villa Huidobro'),
(894, 7, 'Villa La Bolsa'),
(895, 7, 'Villa Los Aromos'),
(896, 7, 'Villa Los Patos'),
(897, 7, 'Villa María'),
(898, 7, 'Villa Nueva'),
(899, 7, 'Villa Pque. Santa Ana'),
(900, 7, 'Villa Pque. Siquiman'),
(901, 7, 'Villa Quillinzo'),
(902, 7, 'Villa Rossi'),
(903, 7, 'Villa Rumipal'),
(904, 7, 'Villa San Esteban'),
(905, 7, 'Villa San Isidro'),
(906, 7, 'Villa 21'),
(907, 7, 'Villa Sarmiento (G.R)'),
(908, 7, 'Villa Sarmiento (S.A)'),
(909, 7, 'Villa Tulumba'),
(910, 7, 'Villa Valeria'),
(911, 7, 'Villa Yacanto'),
(912, 7, 'Washington'),
(913, 7, 'Wenceslao Escalante'),
(914, 7, 'Ycho Cruz Sierras'),
(915, 8, 'Alvear'),
(916, 8, 'Bella Vista'),
(917, 8, 'Berón de Astrada'),
(918, 8, 'Bonpland'),
(919, 8, 'Caá Cati'),
(920, 8, 'Capital'),
(921, 8, 'Chavarría'),
(922, 8, 'Col. C. Pellegrini'),
(923, 8, 'Col. Libertad'),
(924, 8, 'Col. Liebig'),
(925, 8, 'Col. Sta Rosa'),
(926, 8, 'Concepción'),
(927, 8, 'Cruz de Los Milagros'),
(928, 8, 'Curuzú-Cuatiá'),
(929, 8, 'Empedrado'),
(930, 8, 'Esquina'),
(931, 8, 'Estación Torrent'),
(932, 8, 'Felipe Yofré'),
(933, 8, 'Garruchos'),
(934, 8, 'Gdor. Agrónomo'),
(935, 8, 'Gdor. Martínez'),
(936, 8, 'Goya'),
(937, 8, 'Guaviravi'),
(938, 8, 'Herlitzka'),
(939, 8, 'Ita-Ibate'),
(940, 8, 'Itatí'),
(941, 8, 'Ituzaingó'),
(942, 8, 'José Rafael Gómez'),
(943, 8, 'Juan Pujol'),
(944, 8, 'La Cruz'),
(945, 8, 'Lavalle'),
(946, 8, 'Lomas de Vallejos'),
(947, 8, 'Loreto'),
(948, 8, 'Mariano I. Loza'),
(949, 8, 'Mburucuyá'),
(950, 8, 'Mercedes'),
(951, 8, 'Mocoretá'),
(952, 8, 'Mte. Caseros'),
(953, 8, 'Nueve de Julio'),
(954, 8, 'Palmar Grande'),
(955, 8, 'Parada Pucheta'),
(956, 8, 'Paso de La Patria'),
(957, 8, 'Paso de Los Libres'),
(958, 8, 'Pedro R. Fernandez'),
(959, 8, 'Perugorría'),
(960, 8, 'Pueblo Libertador'),
(961, 8, 'Ramada Paso'),
(962, 8, 'Riachuelo'),
(963, 8, 'Saladas'),
(964, 8, 'San Antonio'),
(965, 8, 'San Carlos'),
(966, 8, 'San Cosme'),
(967, 8, 'San Lorenzo'),
(968, 8, '20 del Palmar'),
(969, 8, 'San Miguel'),
(970, 8, 'San Roque'),
(971, 8, 'Santa Ana'),
(972, 8, 'Santa Lucía'),
(973, 8, 'Santo Tomé'),
(974, 8, 'Sauce'),
(975, 8, 'Tabay'),
(976, 8, 'Tapebicuá'),
(977, 8, 'Tatacua'),
(978, 8, 'Virasoro'),
(979, 8, 'Yapeyú'),
(980, 8, 'Yataití Calle'),
(981, 9, 'Alarcón'),
(982, 9, 'Alcaraz'),
(983, 9, 'Alcaraz N.'),
(984, 9, 'Alcaraz S.'),
(985, 9, 'Aldea Asunción'),
(986, 9, 'Aldea Brasilera'),
(987, 9, 'Aldea Elgenfeld'),
(988, 9, 'Aldea Grapschental'),
(989, 9, 'Aldea Ma. Luisa'),
(990, 9, 'Aldea Protestante'),
(991, 9, 'Aldea Salto'),
(992, 9, 'Aldea San Antonio (G)'),
(993, 9, 'Aldea San Antonio (P)'),
(994, 9, 'Aldea 19'),
(995, 9, 'Aldea San Miguel'),
(996, 9, 'Aldea San Rafael'),
(997, 9, 'Aldea Spatzenkutter'),
(998, 9, 'Aldea Sta. María'),
(999, 9, 'Aldea Sta. Rosa'),
(1000, 9, 'Aldea Valle María'),
(1001, 9, 'Altamirano Sur'),
(1002, 9, 'Antelo'),
(1003, 9, 'Antonio Tomás'),
(1004, 9, 'Aranguren'),
(1005, 9, 'Arroyo Barú'),
(1006, 9, 'Arroyo Burgos'),
(1007, 9, 'Arroyo Clé'),
(1008, 9, 'Arroyo Corralito'),
(1009, 9, 'Arroyo del Medio'),
(1010, 9, 'Arroyo Maturrango'),
(1011, 9, 'Arroyo Palo Seco'),
(1012, 9, 'Banderas'),
(1013, 9, 'Basavilbaso'),
(1014, 9, 'Betbeder'),
(1015, 9, 'Bovril'),
(1016, 9, 'Caseros'),
(1017, 9, 'Ceibas'),
(1018, 9, 'Cerrito'),
(1019, 9, 'Chajarí'),
(1020, 9, 'Chilcas'),
(1021, 9, 'Clodomiro Ledesma'),
(1022, 9, 'Col. Alemana'),
(1023, 9, 'Col. Avellaneda'),
(1024, 9, 'Col. Avigdor'),
(1025, 9, 'Col. Ayuí'),
(1026, 9, 'Col. Baylina'),
(1027, 9, 'Col. Carrasco'),
(1028, 9, 'Col. Celina'),
(1029, 9, 'Col. Cerrito'),
(1030, 9, 'Col. Crespo'),
(1031, 9, 'Col. Elia'),
(1032, 9, 'Col. Ensayo'),
(1033, 9, 'Col. Gral. Roca'),
(1034, 9, 'Col. La Argentina'),
(1035, 9, 'Col. Merou'),
(1036, 9, 'Col. Oficial Nª3'),
(1037, 9, 'Col. Oficial Nº13'),
(1038, 9, 'Col. Oficial Nº14'),
(1039, 9, 'Col. Oficial Nº5'),
(1040, 9, 'Col. Reffino'),
(1041, 9, 'Col. Tunas'),
(1042, 9, 'Col. Viraró'),
(1043, 9, 'Colón'),
(1044, 9, 'Concepción del Uruguay'),
(1045, 9, 'Concordia'),
(1046, 9, 'Conscripto Bernardi'),
(1047, 9, 'Costa Grande'),
(1048, 9, 'Costa San Antonio'),
(1049, 9, 'Costa Uruguay N.'),
(1050, 9, 'Costa Uruguay S.'),
(1051, 9, 'Crespo'),
(1052, 9, 'Crucecitas 3ª'),
(1053, 9, 'Crucecitas 7ª'),
(1054, 9, 'Crucecitas 8ª'),
(1055, 9, 'Cuchilla Redonda'),
(1056, 9, 'Curtiembre'),
(1057, 9, 'Diamante'),
(1058, 9, 'Distrito 6º'),
(1059, 9, 'Distrito Chañar'),
(1060, 9, 'Distrito Chiqueros'),
(1061, 9, 'Distrito Cuarto'),
(1062, 9, 'Distrito Diego López'),
(1063, 9, 'Distrito Pajonal'),
(1064, 9, 'Distrito Sauce'),
(1065, 9, 'Distrito Tala'),
(1066, 9, 'Distrito Talitas'),
(1067, 9, 'Don Cristóbal 1ª Sección'),
(1068, 9, 'Don Cristóbal 2ª Sección'),
(1069, 9, 'Durazno'),
(1070, 9, 'El Cimarrón'),
(1071, 9, 'El Gramillal'),
(1072, 9, 'El Palenque'),
(1073, 9, 'El Pingo'),
(1074, 9, 'El Quebracho'),
(1075, 9, 'El Redomón'),
(1076, 9, 'El Solar'),
(1077, 9, 'Enrique Carbo'),
(1078, 9, '9'),
(1079, 9, 'Espinillo N.'),
(1080, 9, 'Estación Campos'),
(1081, 9, 'Estación Escriña'),
(1082, 9, 'Estación Lazo'),
(1083, 9, 'Estación Raíces'),
(1084, 9, 'Estación Yerúa'),
(1085, 9, 'Estancia Grande'),
(1086, 9, 'Estancia Líbaros'),
(1087, 9, 'Estancia Racedo'),
(1088, 9, 'Estancia Solá'),
(1089, 9, 'Estancia Yuquerí'),
(1090, 9, 'Estaquitas'),
(1091, 9, 'Faustino M. Parera'),
(1092, 9, 'Febre'),
(1093, 9, 'Federación'),
(1094, 9, 'Federal'),
(1095, 9, 'Gdor. Echagüe'),
(1096, 9, 'Gdor. Mansilla'),
(1097, 9, 'Gilbert'),
(1098, 9, 'González Calderón'),
(1099, 9, 'Gral. Almada'),
(1100, 9, 'Gral. Alvear'),
(1101, 9, 'Gral. Campos'),
(1102, 9, 'Gral. Galarza'),
(1103, 9, 'Gral. Ramírez'),
(1104, 9, 'Gualeguay'),
(1105, 9, 'Gualeguaychú'),
(1106, 9, 'Gualeguaycito'),
(1107, 9, 'Guardamonte'),
(1108, 9, 'Hambis'),
(1109, 9, 'Hasenkamp'),
(1110, 9, 'Hernandarias'),
(1111, 9, 'Hernández'),
(1112, 9, 'Herrera'),
(1113, 9, 'Hinojal'),
(1114, 9, 'Hocker'),
(1115, 9, 'Ing. Sajaroff'),
(1116, 9, 'Irazusta'),
(1117, 9, 'Isletas'),
(1118, 9, 'J.J De Urquiza'),
(1119, 9, 'Jubileo'),
(1120, 9, 'La Clarita'),
(1121, 9, 'La Criolla'),
(1122, 9, 'La Esmeralda'),
(1123, 9, 'La Florida'),
(1124, 9, 'La Fraternidad'),
(1125, 9, 'La Hierra'),
(1126, 9, 'La Ollita'),
(1127, 9, 'La Paz'),
(1128, 9, 'La Picada'),
(1129, 9, 'La Providencia'),
(1130, 9, 'La Verbena'),
(1131, 9, 'Laguna Benítez'),
(1132, 9, 'Larroque'),
(1133, 9, 'Las Cuevas'),
(1134, 9, 'Las Garzas'),
(1135, 9, 'Las Guachas'),
(1136, 9, 'Las Mercedes'),
(1137, 9, 'Las Moscas'),
(1138, 9, 'Las Mulitas'),
(1139, 9, 'Las Toscas'),
(1140, 9, 'Laurencena'),
(1141, 9, 'Libertador San Martín'),
(1142, 9, 'Loma Limpia'),
(1143, 9, 'Los Ceibos'),
(1144, 9, 'Los Charruas'),
(1145, 9, 'Los Conquistadores'),
(1146, 9, 'Lucas González'),
(1147, 9, 'Lucas N.'),
(1148, 9, 'Lucas S. 1ª'),
(1149, 9, 'Lucas S. 2ª'),
(1150, 9, 'Maciá'),
(1151, 9, 'María Grande'),
(1152, 9, 'María Grande 2ª'),
(1153, 9, 'Médanos'),
(1154, 9, 'Mojones N.'),
(1155, 9, 'Mojones S.'),
(1156, 9, 'Molino Doll'),
(1157, 9, 'Monte Redondo'),
(1158, 9, 'Montoya'),
(1159, 9, 'Mulas Grandes'),
(1160, 9, 'Ñancay'),
(1161, 9, 'Nogoyá'),
(1162, 9, 'Nueva Escocia'),
(1163, 9, 'Nueva Vizcaya'),
(1164, 9, 'Ombú'),
(1165, 9, 'Oro Verde'),
(1166, 9, 'Paraná'),
(1167, 9, 'Pasaje Guayaquil'),
(1168, 9, 'Pasaje Las Tunas'),
(1169, 9, 'Paso de La Arena'),
(1170, 9, 'Paso de La Laguna'),
(1171, 9, 'Paso de Las Piedras'),
(1172, 9, 'Paso Duarte'),
(1173, 9, 'Pastor Britos'),
(1174, 9, 'Pedernal'),
(1175, 9, 'Perdices'),
(1176, 9, 'Picada Berón'),
(1177, 9, 'Piedras Blancas'),
(1178, 9, 'Primer Distrito Cuchilla'),
(1179, 9, 'Primero de Mayo'),
(1180, 9, 'Pronunciamiento'),
(1181, 9, 'Pto. Algarrobo'),
(1182, 9, 'Pto. Ibicuy'),
(1183, 9, 'Pueblo Brugo'),
(1184, 9, 'Pueblo Cazes'),
(1185, 9, 'Pueblo Gral. Belgrano'),
(1186, 9, 'Pueblo Liebig'),
(1187, 9, 'Puerto Yeruá'),
(1188, 9, 'Punta del Monte'),
(1189, 9, 'Quebracho'),
(1190, 9, 'Quinto Distrito'),
(1191, 9, 'Raices Oeste'),
(1192, 9, 'Rincón de Nogoyá'),
(1193, 9, 'Rincón del Cinto'),
(1194, 9, 'Rincón del Doll'),
(1195, 9, 'Rincón del Gato'),
(1196, 9, 'Rocamora'),
(1197, 9, 'Rosario del Tala'),
(1198, 9, 'San Benito'),
(1199, 9, 'San Cipriano'),
(1200, 9, 'San Ernesto'),
(1201, 9, 'San Gustavo'),
(1202, 9, 'San Jaime'),
(1203, 9, 'San José'),
(1204, 9, 'San José de Feliciano'),
(1205, 9, 'San Justo'),
(1206, 9, 'San Marcial'),
(1207, 9, 'San Pedro'),
(1208, 9, 'San Ramírez'),
(1209, 9, 'San Ramón'),
(1210, 9, 'San Roque'),
(1211, 9, 'San Salvador'),
(1212, 9, 'San Víctor'),
(1213, 9, 'Santa Ana'),
(1214, 9, 'Santa Anita'),
(1215, 9, 'Santa Elena'),
(1216, 9, 'Santa Lucía'),
(1217, 9, 'Santa Luisa'),
(1218, 9, 'Sauce de Luna'),
(1219, 9, 'Sauce Montrull'),
(1220, 9, 'Sauce Pinto'),
(1221, 9, 'Sauce Sur'),
(1222, 9, 'Seguí'),
(1223, 9, 'Sir Leonard'),
(1224, 9, 'Sosa'),
(1225, 9, 'Tabossi'),
(1226, 9, 'Tezanos Pinto'),
(1227, 9, 'Ubajay'),
(1228, 9, 'Urdinarrain'),
(1229, 9, 'Veinte de Septiembre'),
(1230, 9, 'Viale'),
(1231, 9, 'Victoria'),
(1232, 9, 'Villa Clara'),
(1233, 9, 'Villa del Rosario'),
(1234, 9, 'Villa Domínguez'),
(1235, 9, 'Villa Elisa'),
(1236, 9, 'Villa Fontana'),
(1237, 9, 'Villa Gdor. Etchevehere'),
(1238, 9, 'Villa Mantero'),
(1239, 9, 'Villa Paranacito'),
(1240, 9, 'Villa Urquiza'),
(1241, 9, 'Villaguay'),
(1242, 9, 'Walter Moss'),
(1243, 9, 'Yacaré'),
(1244, 9, 'Yeso Oeste'),
(1245, 10, 'Buena Vista'),
(1246, 10, 'Clorinda'),
(1247, 10, 'Col. Pastoril'),
(1248, 10, 'Cte. Fontana'),
(1249, 10, 'El Colorado'),
(1250, 10, 'El Espinillo'),
(1251, 10, 'Estanislao Del Campo'),
(1252, 10, '10'),
(1253, 10, 'Fortín Lugones'),
(1254, 10, 'Gral. Lucio V. Mansilla'),
(1255, 10, 'Gral. Manuel Belgrano'),
(1256, 10, 'Gral. Mosconi'),
(1257, 10, 'Gran Guardia'),
(1258, 10, 'Herradura'),
(1259, 10, 'Ibarreta'),
(1260, 10, 'Ing. Juárez'),
(1261, 10, 'Laguna Blanca'),
(1262, 10, 'Laguna Naick Neck'),
(1263, 10, 'Laguna Yema'),
(1264, 10, 'Las Lomitas'),
(1265, 10, 'Los Chiriguanos'),
(1266, 10, 'Mayor V. Villafañe'),
(1267, 10, 'Misión San Fco.'),
(1268, 10, 'Palo Santo'),
(1269, 10, 'Pirané'),
(1270, 10, 'Pozo del Maza'),
(1271, 10, 'Riacho He-He'),
(1272, 10, 'San Hilario'),
(1273, 10, 'San Martín II'),
(1274, 10, 'Siete Palmas'),
(1275, 10, 'Subteniente Perín'),
(1276, 10, 'Tres Lagunas'),
(1277, 10, 'Villa Dos Trece'),
(1278, 10, 'Villa Escolar'),
(1279, 10, 'Villa Gral. Güemes'),
(1280, 11, 'Abdon Castro Tolay'),
(1281, 11, 'Abra Pampa'),
(1282, 11, 'Abralaite'),
(1283, 11, 'Aguas Calientes'),
(1284, 11, 'Arrayanal'),
(1285, 11, 'Barrios'),
(1286, 11, 'Caimancito'),
(1287, 11, 'Calilegua'),
(1288, 11, 'Cangrejillos'),
(1289, 11, 'Caspala'),
(1290, 11, 'Catuá'),
(1291, 11, 'Cieneguillas'),
(1292, 11, 'Coranzulli'),
(1293, 11, 'Cusi-Cusi'),
(1294, 11, 'El Aguilar'),
(1295, 11, 'El Carmen'),
(1296, 11, 'El Cóndor'),
(1297, 11, 'El Fuerte'),
(1298, 11, 'El Piquete'),
(1299, 11, 'El Talar'),
(1300, 11, 'Fraile Pintado'),
(1301, 11, 'Hipólito Yrigoyen'),
(1302, 11, 'Huacalera'),
(1303, 11, 'Humahuaca'),
(1304, 11, 'La Esperanza'),
(1305, 11, 'La Mendieta'),
(1306, 11, 'La Quiaca'),
(1307, 11, 'Ledesma'),
(1308, 11, 'Libertador Gral. San Martin'),
(1309, 11, 'Maimara'),
(1310, 11, 'Mina Pirquitas'),
(1311, 11, 'Monterrico'),
(1312, 11, 'Palma Sola'),
(1313, 11, 'Palpalá'),
(1314, 11, 'Pampa Blanca'),
(1315, 11, 'Pampichuela'),
(1316, 11, 'Perico'),
(1317, 11, 'Puesto del Marqués'),
(1318, 11, 'Puesto Viejo'),
(1319, 11, 'Pumahuasi'),
(1320, 11, 'Purmamarca'),
(1321, 11, 'Rinconada'),
(1322, 11, 'Rodeitos'),
(1323, 11, 'Rosario de Río Grande'),
(1324, 11, 'San Antonio'),
(1325, 11, 'San Francisco'),
(1326, 11, 'San Pedro'),
(1327, 11, 'San Rafael'),
(1328, 11, 'San Salvador'),
(1329, 11, 'Santa Ana'),
(1330, 11, 'Santa Catalina'),
(1331, 11, 'Santa Clara'),
(1332, 11, 'Susques'),
(1333, 11, 'Tilcara'),
(1334, 11, 'Tres Cruces'),
(1335, 11, 'Tumbaya'),
(1336, 11, 'Valle Grande'),
(1337, 11, 'Vinalito'),
(1338, 11, 'Volcán'),
(1339, 11, 'Yala'),
(1340, 11, 'Yaví'),
(1341, 11, 'Yuto'),
(1342, 12, 'Abramo'),
(1343, 12, 'Adolfo Van Praet'),
(1344, 12, 'Agustoni'),
(1345, 12, 'Algarrobo del Aguila'),
(1346, 12, 'Alpachiri'),
(1347, 12, 'Alta Italia'),
(1348, 12, 'Anguil'),
(1349, 12, 'Arata'),
(1350, 12, 'Ataliva Roca'),
(1351, 12, 'Bernardo Larroude'),
(1352, 12, 'Bernasconi'),
(1353, 12, 'Caleufú'),
(1354, 12, 'Carro Quemado'),
(1355, 12, 'Catriló'),
(1356, 12, 'Ceballos'),
(1357, 12, 'Chacharramendi'),
(1358, 12, 'Col. Barón'),
(1359, 12, 'Col. Santa María'),
(1360, 12, 'Conhelo'),
(1361, 12, 'Coronel Hilario Lagos'),
(1362, 12, 'Cuchillo-Có'),
(1363, 12, 'Doblas'),
(1364, 12, 'Dorila'),
(1365, 12, 'Eduardo Castex'),
(1366, 12, 'Embajador Martini'),
(1367, 12, 'Falucho'),
(1368, 12, 'Gral. Acha'),
(1369, 12, 'Gral. Manuel Campos'),
(1370, 12, 'Gral. Pico'),
(1371, 12, 'Guatraché'),
(1372, 12, 'Ing. Luiggi'),
(1373, 12, 'Intendente Alvear'),
(1374, 12, 'Jacinto Arauz'),
(1375, 12, 'La Adela'),
(1376, 12, 'La Humada'),
(1377, 12, 'La Maruja'),
(1378, 12, '12'),
(1379, 12, 'La Reforma'),
(1380, 12, 'Limay Mahuida'),
(1381, 12, 'Lonquimay'),
(1382, 12, 'Loventuel'),
(1383, 12, 'Luan Toro'),
(1384, 12, 'Macachín'),
(1385, 12, 'Maisonnave'),
(1386, 12, 'Mauricio Mayer'),
(1387, 12, 'Metileo'),
(1388, 12, 'Miguel Cané'),
(1389, 12, 'Miguel Riglos'),
(1390, 12, 'Monte Nievas'),
(1391, 12, 'Parera'),
(1392, 12, 'Perú'),
(1393, 12, 'Pichi-Huinca'),
(1394, 12, 'Puelches'),
(1395, 12, 'Puelén'),
(1396, 12, 'Quehue'),
(1397, 12, 'Quemú Quemú'),
(1398, 12, 'Quetrequén'),
(1399, 12, 'Rancul'),
(1400, 12, 'Realicó'),
(1401, 12, 'Relmo'),
(1402, 12, 'Rolón'),
(1403, 12, 'Rucanelo'),
(1404, 12, 'Sarah'),
(1405, 12, 'Speluzzi'),
(1406, 12, 'Sta. Isabel'),
(1407, 12, 'Sta. Rosa'),
(1408, 12, 'Sta. Teresa'),
(1409, 12, 'Telén'),
(1410, 12, 'Toay'),
(1411, 12, 'Tomas M. de Anchorena'),
(1412, 12, 'Trenel'),
(1413, 12, 'Unanue'),
(1414, 12, 'Uriburu'),
(1415, 12, 'Veinticinco de Mayo'),
(1416, 12, 'Vertiz'),
(1417, 12, 'Victorica'),
(1418, 12, 'Villa Mirasol'),
(1419, 12, 'Winifreda'),
(1420, 13, 'Arauco'),
(1421, 13, 'Capital'),
(1422, 13, 'Castro Barros'),
(1423, 13, 'Chamical'),
(1424, 13, 'Chilecito'),
(1425, 13, 'Coronel F. Varela'),
(1426, 13, 'Famatina'),
(1427, 13, 'Gral. A.V.Peñaloza'),
(1428, 13, 'Gral. Belgrano'),
(1429, 13, 'Gral. J.F. Quiroga'),
(1430, 13, 'Gral. Lamadrid'),
(1431, 13, 'Gral. Ocampo'),
(1432, 13, 'Gral. San Martín'),
(1433, 13, 'Independencia'),
(1434, 13, 'Rosario Penaloza'),
(1435, 13, 'San Blas de Los Sauces'),
(1436, 13, 'Sanagasta'),
(1437, 13, 'Vinchina'),
(1438, 14, 'Capital'),
(1439, 14, 'Chacras de Coria'),
(1440, 14, 'Dorrego'),
(1441, 14, 'Gllen'),
(1442, 14, 'Godoy Cruz'),
(1443, 14, 'Gral. Alvear'),
(1444, 14, 'Guaymallén'),
(1445, 14, 'Junín'),
(1446, 14, 'La Paz'),
(1447, 14, 'Las Heras'),
(1448, 14, 'Lavalle'),
(1449, 14, 'Luján'),
(1450, 14, 'Luján De Cuyo'),
(1451, 14, 'Maipú'),
(1452, 14, 'Malargüe'),
(1453, 14, 'Rivadavia'),
(1454, 14, 'San Carlos'),
(1455, 14, 'San Martín'),
(1456, 14, 'San Rafael'),
(1457, 14, 'Sta. Rosa'),
(1458, 14, 'Tunuyán'),
(1459, 14, 'Tupungato'),
(1460, 14, 'Villa Nueva'),
(1461, 15, 'Alba Posse'),
(1462, 15, 'Almafuerte'),
(1463, 15, 'Apóstoles'),
(1464, 15, 'Aristóbulo Del Valle'),
(1465, 15, 'Arroyo Del Medio'),
(1466, 15, 'Azara'),
(1467, 15, 'Bdo. De Irigoyen'),
(1468, 15, 'Bonpland'),
(1469, 15, 'Caá Yari'),
(1470, 15, 'Campo Grande'),
(1471, 15, 'Campo Ramón'),
(1472, 15, 'Campo Viera'),
(1473, 15, 'Candelaria'),
(1474, 15, 'Capioví'),
(1475, 15, 'Caraguatay'),
(1476, 15, 'Cdte. Guacurarí'),
(1477, 15, 'Cerro Azul'),
(1478, 15, 'Cerro Corá'),
(1479, 15, 'Col. Alberdi'),
(1480, 15, 'Col. Aurora'),
(1481, 15, 'Col. Delicia'),
(1482, 15, 'Col. Polana'),
(1483, 15, 'Col. Victoria'),
(1484, 15, 'Col. Wanda'),
(1485, 15, 'Concepción De La Sierra'),
(1486, 15, 'Corpus'),
(1487, 15, 'Dos Arroyos'),
(1488, 15, 'Dos de Mayo'),
(1489, 15, 'El Alcázar'),
(1490, 15, 'El Dorado'),
(1491, 15, 'El Soberbio'),
(1492, 15, 'Esperanza'),
(1493, 15, 'F. Ameghino'),
(1494, 15, 'Fachinal'),
(1495, 15, 'Garuhapé'),
(1496, 15, 'Garupá'),
(1497, 15, 'Gdor. López'),
(1498, 15, 'Gdor. Roca'),
(1499, 15, 'Gral. Alvear'),
(1500, 15, 'Gral. Urquiza'),
(1501, 15, 'Guaraní'),
(1502, 15, 'H. Yrigoyen'),
(1503, 15, 'Iguazú'),
(1504, 15, 'Itacaruaré'),
(1505, 15, 'Jardín América'),
(1506, 15, 'Leandro N. Alem'),
(1507, 15, 'Libertad'),
(1508, 15, 'Loreto'),
(1509, 15, 'Los Helechos'),
(1510, 15, 'Mártires'),
(1511, 15, '15'),
(1512, 15, 'Mojón Grande'),
(1513, 15, 'Montecarlo'),
(1514, 15, 'Nueve de Julio'),
(1515, 15, 'Oberá'),
(1516, 15, 'Olegario V. Andrade'),
(1517, 15, 'Panambí'),
(1518, 15, 'Posadas'),
(1519, 15, 'Profundidad'),
(1520, 15, 'Pto. Iguazú'),
(1521, 15, 'Pto. Leoni'),
(1522, 15, 'Pto. Piray'),
(1523, 15, 'Pto. Rico'),
(1524, 15, 'Ruiz de Montoya'),
(1525, 15, 'San Antonio'),
(1526, 15, 'San Ignacio'),
(1527, 15, 'San Javier'),
(1528, 15, 'San José'),
(1529, 15, 'San Martín'),
(1530, 15, 'San Pedro'),
(1531, 15, 'San Vicente'),
(1532, 15, 'Santiago De Liniers'),
(1533, 15, 'Santo Pipo'),
(1534, 15, 'Sta. Ana'),
(1535, 15, 'Sta. María'),
(1536, 15, 'Tres Capones'),
(1537, 15, 'Veinticinco de Mayo'),
(1538, 15, 'Wanda'),
(1539, 16, 'Aguada San Roque'),
(1540, 16, 'Aluminé'),
(1541, 16, 'Andacollo'),
(1542, 16, 'Añelo'),
(1543, 16, 'Bajada del Agrio'),
(1544, 16, 'Barrancas'),
(1545, 16, 'Buta Ranquil'),
(1546, 16, 'Capital'),
(1547, 16, 'Caviahué'),
(1548, 16, 'Centenario'),
(1549, 16, 'Chorriaca'),
(1550, 16, 'Chos Malal'),
(1551, 16, 'Cipolletti'),
(1552, 16, 'Covunco Abajo'),
(1553, 16, 'Coyuco Cochico'),
(1554, 16, 'Cutral Có'),
(1555, 16, 'El Cholar'),
(1556, 16, 'El Huecú'),
(1557, 16, 'El Sauce'),
(1558, 16, 'Guañacos'),
(1559, 16, 'Huinganco'),
(1560, 16, 'Las Coloradas'),
(1561, 16, 'Las Lajas'),
(1562, 16, 'Las Ovejas'),
(1563, 16, 'Loncopué'),
(1564, 16, 'Los Catutos'),
(1565, 16, 'Los Chihuidos'),
(1566, 16, 'Los Miches'),
(1567, 16, 'Manzano Amargo'),
(1568, 16, '16'),
(1569, 16, 'Octavio Pico'),
(1570, 16, 'Paso Aguerre'),
(1571, 16, 'Picún Leufú'),
(1572, 16, 'Piedra del Aguila'),
(1573, 16, 'Pilo Lil'),
(1574, 16, 'Plaza Huincul'),
(1575, 16, 'Plottier'),
(1576, 16, 'Quili Malal'),
(1577, 16, 'Ramón Castro'),
(1578, 16, 'Rincón de Los Sauces'),
(1579, 16, 'San Martín de Los Andes'),
(1580, 16, 'San Patricio del Chañar'),
(1581, 16, 'Santo Tomás'),
(1582, 16, 'Sauzal Bonito'),
(1583, 16, 'Senillosa'),
(1584, 16, 'Taquimilán'),
(1585, 16, 'Tricao Malal'),
(1586, 16, 'Varvarco'),
(1587, 16, 'Villa Curí Leuvu'),
(1588, 16, 'Villa del Nahueve'),
(1589, 16, 'Villa del Puente Picún Leuvú'),
(1590, 16, 'Villa El Chocón'),
(1591, 16, 'Villa La Angostura'),
(1592, 16, 'Villa Pehuenia'),
(1593, 16, 'Villa Traful'),
(1594, 16, 'Vista Alegre'),
(1595, 16, 'Zapala'),
(1596, 17, 'Aguada Cecilio'),
(1597, 17, 'Aguada de Guerra'),
(1598, 17, 'Allén'),
(1599, 17, 'Arroyo de La Ventana'),
(1600, 17, 'Arroyo Los Berros'),
(1601, 17, 'Bariloche'),
(1602, 17, 'Calte. Cordero'),
(1603, 17, 'Campo Grande'),
(1604, 17, 'Catriel'),
(1605, 17, 'Cerro Policía'),
(1606, 17, 'Cervantes'),
(1607, 17, 'Chelforo'),
(1608, 17, 'Chimpay'),
(1609, 17, 'Chinchinales'),
(1610, 17, 'Chipauquil'),
(1611, 17, 'Choele Choel'),
(1612, 17, 'Cinco Saltos'),
(1613, 17, 'Cipolletti'),
(1614, 17, 'Clemente Onelli'),
(1615, 17, 'Colán Conhue'),
(1616, 17, 'Comallo'),
(1617, 17, 'Comicó'),
(1618, 17, 'Cona Niyeu'),
(1619, 17, 'Coronel Belisle'),
(1620, 17, 'Cubanea'),
(1621, 17, 'Darwin'),
(1622, 17, 'Dina Huapi'),
(1623, 17, 'El Bolsón'),
(1624, 17, 'El Caín'),
(1625, 17, 'El Manso'),
(1626, 17, 'Gral. Conesa'),
(1627, 17, 'Gral. Enrique Godoy'),
(1628, 17, 'Gral. Fernandez Oro'),
(1629, 17, 'Gral. Roca'),
(1630, 17, 'Guardia Mitre'),
(1631, 17, 'Ing. Huergo'),
(1632, 17, 'Ing. Jacobacci'),
(1633, 17, 'Laguna Blanca'),
(1634, 17, 'Lamarque'),
(1635, 17, 'Las Grutas'),
(1636, 17, 'Los Menucos'),
(1637, 17, 'Luis Beltrán'),
(1638, 17, 'Mainqué'),
(1639, 17, 'Mamuel Choique'),
(1640, 17, 'Maquinchao'),
(1641, 17, 'Mencué'),
(1642, 17, 'Mtro. Ramos Mexia'),
(1643, 17, 'Nahuel Niyeu'),
(1644, 17, 'Naupa Huen'),
(1645, 17, 'Ñorquinco'),
(1646, 17, 'Ojos de Agua'),
(1647, 17, 'Paso de Agua'),
(1648, 17, 'Paso Flores'),
(1649, 17, 'Peñas Blancas'),
(1650, 17, 'Pichi Mahuida'),
(1651, 17, 'Pilcaniyeu'),
(1652, 17, 'Pomona'),
(1653, 17, 'Prahuaniyeu'),
(1654, 17, 'Rincón Treneta'),
(1655, 17, 'Río Chico'),
(1656, 17, 'Río Colorado'),
(1657, 17, 'Roca'),
(1658, 17, 'San Antonio Oeste'),
(1659, 17, 'San Javier'),
(1660, 17, 'Sierra Colorada'),
(1661, 17, 'Sierra Grande'),
(1662, 17, 'Sierra Pailemán'),
(1663, 17, 'Valcheta'),
(1664, 17, 'Valle Azul'),
(1665, 17, 'Viedma'),
(1666, 17, 'Villa Llanquín'),
(1667, 17, 'Villa Mascardi'),
(1668, 17, 'Villa Regina'),
(1669, 17, 'Yaminué'),
(1670, 18, 'A. Saravia'),
(1671, 18, 'Aguaray'),
(1672, 18, 'Angastaco'),
(1673, 18, 'Animaná'),
(1674, 18, 'Cachi'),
(1675, 18, 'Cafayate'),
(1676, 18, 'Campo Quijano'),
(1677, 18, 'Campo Santo'),
(1678, 18, 'Capital'),
(1679, 18, 'Cerrillos'),
(1680, 18, 'Chicoana'),
(1681, 18, 'Col. Sta. Rosa'),
(1682, 18, 'Coronel Moldes'),
(1683, 18, 'El Bordo'),
(1684, 18, 'El Carril'),
(1685, 18, 'El Galpón'),
(1686, 18, 'El Jardín'),
(1687, 18, 'El Potrero'),
(1688, 18, 'El Quebrachal'),
(1689, 18, 'El Tala'),
(1690, 18, 'Embarcación'),
(1691, 18, 'Gral. Ballivian'),
(1692, 18, 'Gral. Güemes'),
(1693, 18, 'Gral. Mosconi'),
(1694, 18, 'Gral. Pizarro'),
(1695, 18, 'Guachipas'),
(1696, 18, 'Hipólito Yrigoyen'),
(1697, 18, 'Iruyá'),
(1698, 18, 'Isla De Cañas'),
(1699, 18, 'J. V. Gonzalez'),
(1700, 18, 'La Caldera'),
(1701, 18, 'La Candelaria'),
(1702, 18, 'La Merced'),
(1703, 18, 'La Poma'),
(1704, 18, 'La Viña'),
(1705, 18, 'Las Lajitas'),
(1706, 18, 'Los Toldos'),
(1707, 18, 'Metán'),
(1708, 18, 'Molinos'),
(1709, 18, 'Nazareno'),
(1710, 18, 'Orán'),
(1711, 18, 'Payogasta'),
(1712, 18, 'Pichanal'),
(1713, 18, 'Prof. S. Mazza'),
(1714, 18, 'Río Piedras'),
(1715, 18, 'Rivadavia Banda Norte'),
(1716, 18, 'Rivadavia Banda Sur'),
(1717, 18, 'Rosario de La Frontera'),
(1718, 18, 'Rosario de Lerma'),
(1719, 18, 'Saclantás'),
(1720, 18, '18'),
(1721, 18, 'San Antonio'),
(1722, 18, 'San Carlos'),
(1723, 18, 'San José De Metán'),
(1724, 18, 'San Ramón'),
(1725, 18, 'Santa Victoria E.'),
(1726, 18, 'Santa Victoria O.'),
(1727, 18, 'Tartagal'),
(1728, 18, 'Tolar Grande'),
(1729, 18, 'Urundel'),
(1730, 18, 'Vaqueros'),
(1731, 18, 'Villa San Lorenzo'),
(1732, 19, 'Albardón'),
(1733, 19, 'Angaco'),
(1734, 19, 'Calingasta'),
(1735, 19, 'Capital'),
(1736, 19, 'Caucete'),
(1737, 19, 'Chimbas'),
(1738, 19, 'Iglesia'),
(1739, 19, 'Jachal'),
(1740, 19, 'Nueve de Julio'),
(1741, 19, 'Pocito'),
(1742, 19, 'Rawson'),
(1743, 19, 'Rivadavia'),
(1744, 19, '19'),
(1745, 19, 'San Martín'),
(1746, 19, 'Santa Lucía'),
(1747, 19, 'Sarmiento'),
(1748, 19, 'Ullum'),
(1749, 19, 'Valle Fértil'),
(1750, 19, 'Veinticinco de Mayo'),
(1751, 19, 'Zonda'),
(1752, 20, 'Alto Pelado'),
(1753, 20, 'Alto Pencoso'),
(1754, 20, 'Anchorena'),
(1755, 20, 'Arizona'),
(1756, 20, 'Bagual'),
(1757, 20, 'Balde'),
(1758, 20, 'Batavia'),
(1759, 20, 'Beazley'),
(1760, 20, 'Buena Esperanza'),
(1761, 20, 'Candelaria'),
(1762, 20, 'Capital'),
(1763, 20, 'Carolina'),
(1764, 20, 'Carpintería'),
(1765, 20, 'Concarán'),
(1766, 20, 'Cortaderas'),
(1767, 20, 'El Morro'),
(1768, 20, 'El Trapiche'),
(1769, 20, 'El Volcán'),
(1770, 20, 'Fortín El Patria'),
(1771, 20, 'Fortuna'),
(1772, 20, 'Fraga'),
(1773, 20, 'Juan Jorba'),
(1774, 20, 'Juan Llerena'),
(1775, 20, 'Juana Koslay'),
(1776, 20, 'Justo Daract'),
(1777, 20, 'La Calera'),
(1778, 20, 'La Florida'),
(1779, 20, 'La Punilla'),
(1780, 20, 'La Toma'),
(1781, 20, 'Lafinur'),
(1782, 20, 'Las Aguadas'),
(1783, 20, 'Las Chacras'),
(1784, 20, 'Las Lagunas'),
(1785, 20, 'Las Vertientes'),
(1786, 20, 'Lavaisse'),
(1787, 20, 'Leandro N. Alem'),
(1788, 20, 'Los Molles'),
(1789, 20, 'Luján'),
(1790, 20, 'Mercedes'),
(1791, 20, 'Merlo'),
(1792, 20, 'Naschel'),
(1793, 20, 'Navia'),
(1794, 20, 'Nogolí'),
(1795, 20, 'Nueva Galia'),
(1796, 20, 'Papagayos'),
(1797, 20, 'Paso Grande'),
(1798, 20, 'Potrero de Los Funes'),
(1799, 20, 'Quines'),
(1800, 20, 'Renca'),
(1801, 20, 'Saladillo'),
(1802, 20, 'San Francisco'),
(1803, 20, 'San Gerónimo'),
(1804, 20, 'San Martín'),
(1805, 20, 'San Pablo'),
(1806, 20, 'Santa Rosa de Conlara'),
(1807, 20, 'Talita'),
(1808, 20, 'Tilisarao'),
(1809, 20, 'Unión'),
(1810, 20, 'Villa de La Quebrada'),
(1811, 20, 'Villa de Praga'),
(1812, 20, 'Villa del Carmen'),
(1813, 20, 'Villa Gral. Roca'),
(1814, 20, 'Villa Larca'),
(1815, 20, 'Villa Mercedes'),
(1816, 20, 'Zanjitas'),
(1817, 21, 'Calafate'),
(1818, 21, 'Caleta Olivia'),
(1819, 21, 'Cañadón Seco'),
(1820, 21, 'Comandante Piedrabuena'),
(1821, 21, 'El Calafate'),
(1822, 21, 'El Chaltén'),
(1823, 21, 'Gdor. Gregores'),
(1824, 21, 'Hipólito Yrigoyen'),
(1825, 21, 'Jaramillo'),
(1826, 21, 'Koluel Kaike'),
(1827, 21, 'Las Heras'),
(1828, 21, 'Los Antiguos'),
(1829, 21, 'Perito Moreno'),
(1830, 21, 'Pico Truncado'),
(1831, 21, 'Pto. Deseado'),
(1832, 21, 'Pto. San Julián'),
(1833, 21, 'Pto. 21'),
(1834, 21, 'Río Cuarto'),
(1835, 21, 'Río Gallegos'),
(1836, 21, 'Río Turbio'),
(1837, 21, 'Tres Lagos'),
(1838, 21, 'Veintiocho De Noviembre'),
(1839, 22, 'Aarón Castellanos'),
(1840, 22, 'Acebal'),
(1841, 22, 'Aguará Grande'),
(1842, 22, 'Albarellos'),
(1843, 22, 'Alcorta'),
(1844, 22, 'Aldao'),
(1845, 22, 'Alejandra'),
(1846, 22, 'Álvarez'),
(1847, 22, 'Ambrosetti'),
(1848, 22, 'Amenábar'),
(1849, 22, 'Angélica'),
(1850, 22, 'Angeloni'),
(1851, 22, 'Arequito'),
(1852, 22, 'Arminda'),
(1853, 22, 'Armstrong'),
(1854, 22, 'Arocena'),
(1855, 22, 'Arroyo Aguiar'),
(1856, 22, 'Arroyo Ceibal'),
(1857, 22, 'Arroyo Leyes'),
(1858, 22, 'Arroyo Seco'),
(1859, 22, 'Arrufó'),
(1860, 22, 'Arteaga'),
(1861, 22, 'Ataliva'),
(1862, 22, 'Aurelia'),
(1863, 22, 'Avellaneda'),
(1864, 22, 'Barrancas'),
(1865, 22, 'Bauer Y Sigel'),
(1866, 22, 'Bella Italia'),
(1867, 22, 'Berabevú'),
(1868, 22, 'Berna'),
(1869, 22, 'Bernardo de Irigoyen'),
(1870, 22, 'Bigand'),
(1871, 22, 'Bombal'),
(1872, 22, 'Bouquet'),
(1873, 22, 'Bustinza'),
(1874, 22, 'Cabal'),
(1875, 22, 'Cacique Ariacaiquin'),
(1876, 22, 'Cafferata'),
(1877, 22, 'Calchaquí'),
(1878, 22, 'Campo Andino'),
(1879, 22, 'Campo Piaggio'),
(1880, 22, 'Cañada de Gómez'),
(1881, 22, 'Cañada del Ucle'),
(1882, 22, 'Cañada Rica'),
(1883, 22, 'Cañada Rosquín'),
(1884, 22, 'Candioti'),
(1885, 22, 'Capital'),
(1886, 22, 'Capitán Bermúdez'),
(1887, 22, 'Capivara'),
(1888, 22, 'Carcarañá'),
(1889, 22, 'Carlos Pellegrini'),
(1890, 22, 'Carmen'),
(1891, 22, 'Carmen Del Sauce'),
(1892, 22, 'Carreras'),
(1893, 22, 'Carrizales'),
(1894, 22, 'Casalegno'),
(1895, 22, 'Casas'),
(1896, 22, 'Casilda'),
(1897, 22, 'Castelar'),
(1898, 22, 'Castellanos'),
(1899, 22, 'Cayastá'),
(1900, 22, 'Cayastacito'),
(1901, 22, 'Centeno'),
(1902, 22, 'Cepeda'),
(1903, 22, 'Ceres'),
(1904, 22, 'Chabás'),
(1905, 22, 'Chañar Ladeado'),
(1906, 22, 'Chapuy'),
(1907, 22, 'Chovet'),
(1908, 22, 'Christophersen'),
(1909, 22, 'Classon'),
(1910, 22, 'Cnel. Arnold'),
(1911, 22, 'Cnel. Bogado'),
(1912, 22, 'Cnel. Dominguez'),
(1913, 22, 'Cnel. Fraga'),
(1914, 22, 'Col. Aldao'),
(1915, 22, 'Col. Ana'),
(1916, 22, 'Col. Belgrano'),
(1917, 22, 'Col. Bicha'),
(1918, 22, 'Col. Bigand'),
(1919, 22, 'Col. Bossi'),
(1920, 22, 'Col. Cavour'),
(1921, 22, 'Col. Cello'),
(1922, 22, 'Col. Dolores'),
(1923, 22, 'Col. Dos Rosas'),
(1924, 22, 'Col. Durán'),
(1925, 22, 'Col. Iturraspe'),
(1926, 22, 'Col. Margarita'),
(1927, 22, 'Col. Mascias'),
(1928, 22, 'Col. Raquel'),
(1929, 22, 'Col. Rosa'),
(1930, 22, 'Col. San José'),
(1931, 22, 'Constanza'),
(1932, 22, 'Coronda'),
(1933, 22, 'Correa'),
(1934, 22, 'Crispi'),
(1935, 22, 'Cululú'),
(1936, 22, 'Curupayti'),
(1937, 22, 'Desvio Arijón'),
(1938, 22, 'Diaz'),
(1939, 22, 'Diego de Alvear'),
(1940, 22, 'Egusquiza'),
(1941, 22, 'El Arazá'),
(1942, 22, 'El Rabón'),
(1943, 22, 'El Sombrerito'),
(1944, 22, 'El Trébol'),
(1945, 22, 'Elisa'),
(1946, 22, 'Elortondo'),
(1947, 22, 'Emilia'),
(1948, 22, 'Empalme San Carlos'),
(1949, 22, 'Empalme Villa Constitucion'),
(1950, 22, 'Esmeralda'),
(1951, 22, 'Esperanza'),
(1952, 22, 'Estación Alvear'),
(1953, 22, 'Estacion Clucellas'),
(1954, 22, 'Esteban Rams'),
(1955, 22, 'Esther'),
(1956, 22, 'Esustolia'),
(1957, 22, 'Eusebia'),
(1958, 22, 'Felicia'),
(1959, 22, 'Fidela'),
(1960, 22, 'Fighiera'),
(1961, 22, 'Firmat'),
(1962, 22, 'Florencia'),
(1963, 22, 'Fortín Olmos'),
(1964, 22, 'Franck'),
(1965, 22, 'Fray Luis Beltrán'),
(1966, 22, 'Frontera'),
(1967, 22, 'Fuentes'),
(1968, 22, 'Funes'),
(1969, 22, 'Gaboto'),
(1970, 22, 'Galisteo'),
(1971, 22, 'Gálvez'),
(1972, 22, 'Garabalto'),
(1973, 22, 'Garibaldi'),
(1974, 22, 'Gato Colorado'),
(1975, 22, 'Gdor. Crespo'),
(1976, 22, 'Gessler'),
(1977, 22, 'Godoy'),
(1978, 22, 'Golondrina'),
(1979, 22, 'Gral. Gelly'),
(1980, 22, 'Gral. Lagos'),
(1981, 22, 'Granadero Baigorria'),
(1982, 22, 'Gregoria Perez De Denis'),
(1983, 22, 'Grutly'),
(1984, 22, 'Guadalupe N.'),
(1985, 22, 'Gödeken'),
(1986, 22, 'Helvecia'),
(1987, 22, 'Hersilia'),
(1988, 22, 'Hipatía'),
(1989, 22, 'Huanqueros'),
(1990, 22, 'Hugentobler'),
(1991, 22, 'Hughes'),
(1992, 22, 'Humberto 1º'),
(1993, 22, 'Humboldt'),
(1994, 22, 'Ibarlucea'),
(1995, 22, 'Ing. Chanourdie'),
(1996, 22, 'Intiyaco'),
(1997, 22, 'Ituzaingó'),
(1998, 22, 'Jacinto L. Aráuz'),
(1999, 22, 'Josefina'),
(2000, 22, 'Juan B. Molina'),
(2001, 22, 'Juan de Garay'),
(2002, 22, 'Juncal'),
(2003, 22, 'La Brava'),
(2004, 22, 'La Cabral'),
(2005, 22, 'La Camila'),
(2006, 22, 'La Chispa'),
(2007, 22, 'La Clara'),
(2008, 22, 'La Criolla'),
(2009, 22, 'La Gallareta'),
(2010, 22, 'La Lucila'),
(2011, 22, 'La Pelada'),
(2012, 22, 'La Penca'),
(2013, 22, 'La Rubia'),
(2014, 22, 'La Sarita'),
(2015, 22, 'La Vanguardia'),
(2016, 22, 'Labordeboy'),
(2017, 22, 'Laguna Paiva'),
(2018, 22, 'Landeta'),
(2019, 22, 'Lanteri'),
(2020, 22, 'Larrechea'),
(2021, 22, 'Las Avispas'),
(2022, 22, 'Las Bandurrias'),
(2023, 22, 'Las Garzas'),
(2024, 22, 'Las Palmeras'),
(2025, 22, 'Las Parejas'),
(2026, 22, 'Las Petacas'),
(2027, 22, 'Las Rosas'),
(2028, 22, 'Las Toscas'),
(2029, 22, 'Las Tunas'),
(2030, 22, 'Lazzarino'),
(2031, 22, 'Lehmann'),
(2032, 22, 'Llambi Campbell'),
(2033, 22, 'Logroño'),
(2034, 22, 'Loma Alta'),
(2035, 22, 'López'),
(2036, 22, 'Los Amores'),
(2037, 22, 'Los Cardos'),
(2038, 22, 'Los Laureles'),
(2039, 22, 'Los Molinos'),
(2040, 22, 'Los Quirquinchos'),
(2041, 22, 'Lucio V. Lopez'),
(2042, 22, 'Luis Palacios'),
(2043, 22, 'Ma. Juana'),
(2044, 22, 'Ma. Luisa'),
(2045, 22, 'Ma. Susana'),
(2046, 22, 'Ma. Teresa'),
(2047, 22, 'Maciel'),
(2048, 22, 'Maggiolo'),
(2049, 22, 'Malabrigo'),
(2050, 22, 'Marcelino Escalada'),
(2051, 22, 'Margarita'),
(2052, 22, 'Matilde'),
(2053, 22, 'Mauá'),
(2054, 22, 'Máximo Paz'),
(2055, 22, 'Melincué'),
(2056, 22, 'Miguel Torres'),
(2057, 22, 'Moisés Ville'),
(2058, 22, 'Monigotes'),
(2059, 22, 'Monje'),
(2060, 22, 'Monte Obscuridad'),
(2061, 22, 'Monte Vera'),
(2062, 22, 'Montefiore'),
(2063, 22, 'Montes de Oca'),
(2064, 22, 'Murphy'),
(2065, 22, 'Ñanducita'),
(2066, 22, 'Naré'),
(2067, 22, 'Nelson'),
(2068, 22, 'Nicanor E. Molinas'),
(2069, 22, 'Nuevo Torino'),
(2070, 22, 'Oliveros'),
(2071, 22, 'Palacios'),
(2072, 22, 'Pavón'),
(2073, 22, 'Pavón Arriba'),
(2074, 22, 'Pedro Gómez Cello');
INSERT INTO `city` (`id`, `id_state`, `name`) VALUES
(2075, 22, 'Pérez'),
(2076, 22, 'Peyrano'),
(2077, 22, 'Piamonte'),
(2078, 22, 'Pilar'),
(2079, 22, 'Piñero'),
(2080, 22, 'Plaza Clucellas'),
(2081, 22, 'Portugalete'),
(2082, 22, 'Pozo Borrado'),
(2083, 22, 'Progreso'),
(2084, 22, 'Providencia'),
(2085, 22, 'Pte. Roca'),
(2086, 22, 'Pueblo Andino'),
(2087, 22, 'Pueblo Esther'),
(2088, 22, 'Pueblo Gral. San Martín'),
(2089, 22, 'Pueblo Irigoyen'),
(2090, 22, 'Pueblo Marini'),
(2091, 22, 'Pueblo Muñoz'),
(2092, 22, 'Pueblo Uranga'),
(2093, 22, 'Pujato'),
(2094, 22, 'Pujato N.'),
(2095, 22, 'Rafaela'),
(2096, 22, 'Ramayón'),
(2097, 22, 'Ramona'),
(2098, 22, 'Reconquista'),
(2099, 22, 'Recreo'),
(2100, 22, 'Ricardone'),
(2101, 22, 'Rivadavia'),
(2102, 22, 'Roldán'),
(2103, 22, 'Romang'),
(2104, 22, 'Rosario'),
(2105, 22, 'Rueda'),
(2106, 22, 'Rufino'),
(2107, 22, 'Sa Pereira'),
(2108, 22, 'Saguier'),
(2109, 22, 'Saladero M. Cabal'),
(2110, 22, 'Salto Grande'),
(2111, 22, 'San Agustín'),
(2112, 22, 'San Antonio de Obligado'),
(2113, 22, 'San Bernardo (N.J.)'),
(2114, 22, 'San Bernardo (S.J.)'),
(2115, 22, 'San Carlos Centro'),
(2116, 22, 'San Carlos N.'),
(2117, 22, 'San Carlos S.'),
(2118, 22, 'San Cristóbal'),
(2119, 22, 'San Eduardo'),
(2120, 22, 'San Eugenio'),
(2121, 22, 'San Fabián'),
(2122, 22, 'San Fco. de Santa Fé'),
(2123, 22, 'San Genaro'),
(2124, 22, 'San Genaro N.'),
(2125, 22, 'San Gregorio'),
(2126, 22, 'San Guillermo'),
(2127, 22, 'San Javier'),
(2128, 22, 'San Jerónimo del Sauce'),
(2129, 22, 'San Jerónimo N.'),
(2130, 22, 'San Jerónimo S.'),
(2131, 22, 'San Jorge'),
(2132, 22, 'San José de La Esquina'),
(2133, 22, 'San José del Rincón'),
(2134, 22, 'San Justo'),
(2135, 22, 'San Lorenzo'),
(2136, 22, 'San Mariano'),
(2137, 22, 'San Martín de Las Escobas'),
(2138, 22, 'San Martín N.'),
(2139, 22, 'San Vicente'),
(2140, 22, 'Sancti Spititu'),
(2141, 22, 'Sanford'),
(2142, 22, 'Santo Domingo'),
(2143, 22, 'Santo Tomé'),
(2144, 22, 'Santurce'),
(2145, 22, 'Sargento Cabral'),
(2146, 22, 'Sarmiento'),
(2147, 22, 'Sastre'),
(2148, 22, 'Sauce Viejo'),
(2149, 22, 'Serodino'),
(2150, 22, 'Silva'),
(2151, 22, 'Soldini'),
(2152, 22, 'Soledad'),
(2153, 22, 'Soutomayor'),
(2154, 22, 'Sta. Clara de Buena Vista'),
(2155, 22, 'Sta. Clara de Saguier'),
(2156, 22, 'Sta. Isabel'),
(2157, 22, 'Sta. Margarita'),
(2158, 22, 'Sta. Maria Centro'),
(2159, 22, 'Sta. María N.'),
(2160, 22, 'Sta. Rosa'),
(2161, 22, 'Sta. Teresa'),
(2162, 22, 'Suardi'),
(2163, 22, 'Sunchales'),
(2164, 22, 'Susana'),
(2165, 22, 'Tacuarendí'),
(2166, 22, 'Tacural'),
(2167, 22, 'Tartagal'),
(2168, 22, 'Teodelina'),
(2169, 22, 'Theobald'),
(2170, 22, 'Timbúes'),
(2171, 22, 'Toba'),
(2172, 22, 'Tortugas'),
(2173, 22, 'Tostado'),
(2174, 22, 'Totoras'),
(2175, 22, 'Traill'),
(2176, 22, 'Venado Tuerto'),
(2177, 22, 'Vera'),
(2178, 22, 'Vera y Pintado'),
(2179, 22, 'Videla'),
(2180, 22, 'Vila'),
(2181, 22, 'Villa Amelia'),
(2182, 22, 'Villa Ana'),
(2183, 22, 'Villa Cañas'),
(2184, 22, 'Villa Constitución'),
(2185, 22, 'Villa Eloísa'),
(2186, 22, 'Villa Gdor. Gálvez'),
(2187, 22, 'Villa Guillermina'),
(2188, 22, 'Villa Minetti'),
(2189, 22, 'Villa Mugueta'),
(2190, 22, 'Villa Ocampo'),
(2191, 22, 'Villa San José'),
(2192, 22, 'Villa Saralegui'),
(2193, 22, 'Villa Trinidad'),
(2194, 22, 'Villada'),
(2195, 22, 'Virginia'),
(2196, 22, 'Wheelwright'),
(2197, 22, 'Zavalla'),
(2198, 22, 'Zenón Pereira'),
(2199, 23, 'Añatuya'),
(2200, 23, 'Árraga'),
(2201, 23, 'Bandera'),
(2202, 23, 'Bandera Bajada'),
(2203, 23, 'Beltrán'),
(2204, 23, 'Brea Pozo'),
(2205, 23, 'Campo Gallo'),
(2206, 23, 'Capital'),
(2207, 23, 'Chilca Juliana'),
(2208, 23, 'Choya'),
(2209, 23, 'Clodomira'),
(2210, 23, 'Col. Alpina'),
(2211, 23, 'Col. Dora'),
(2212, 23, 'Col. El Simbolar Robles'),
(2213, 23, 'El Bobadal'),
(2214, 23, 'El Charco'),
(2215, 23, 'El Mojón'),
(2216, 23, 'Estación Atamisqui'),
(2217, 23, 'Estación Simbolar'),
(2218, 23, 'Fernández'),
(2219, 23, 'Fortín Inca'),
(2220, 23, 'Frías'),
(2221, 23, 'Garza'),
(2222, 23, 'Gramilla'),
(2223, 23, 'Guardia Escolta'),
(2224, 23, 'Herrera'),
(2225, 23, 'Icaño'),
(2226, 23, 'Ing. Forres'),
(2227, 23, 'La Banda'),
(2228, 23, 'La Cañada'),
(2229, 23, 'Laprida'),
(2230, 23, 'Lavalle'),
(2231, 23, 'Loreto'),
(2232, 23, 'Los Juríes'),
(2233, 23, 'Los Núñez'),
(2234, 23, 'Los Pirpintos'),
(2235, 23, 'Los Quiroga'),
(2236, 23, 'Los Telares'),
(2237, 23, 'Lugones'),
(2238, 23, 'Malbrán'),
(2239, 23, 'Matara'),
(2240, 23, 'Medellín'),
(2241, 23, 'Monte Quemado'),
(2242, 23, 'Nueva Esperanza'),
(2243, 23, 'Nueva Francia'),
(2244, 23, 'Palo Negro'),
(2245, 23, 'Pampa de Los Guanacos'),
(2246, 23, 'Pinto'),
(2247, 23, 'Pozo Hondo'),
(2248, 23, 'Quimilí'),
(2249, 23, 'Real Sayana'),
(2250, 23, 'Sachayoj'),
(2251, 23, 'San Pedro de Guasayán'),
(2252, 23, 'Selva'),
(2253, 23, 'Sol de Julio'),
(2254, 23, 'Sumampa'),
(2255, 23, 'Suncho Corral'),
(2256, 23, 'Taboada'),
(2257, 23, 'Tapso'),
(2258, 23, 'Termas de Rio Hondo'),
(2259, 23, 'Tintina'),
(2260, 23, 'Tomas Young'),
(2261, 23, 'Vilelas'),
(2262, 23, 'Villa Atamisqui'),
(2263, 23, 'Villa La Punta'),
(2264, 23, 'Villa Ojo de Agua'),
(2265, 23, 'Villa Río Hondo'),
(2266, 23, 'Villa Salavina'),
(2267, 23, 'Villa Unión'),
(2268, 23, 'Vilmer'),
(2269, 23, 'Weisburd'),
(2270, 24, 'Río Grande'),
(2271, 24, 'Tolhuin'),
(2272, 24, 'Ushuaia'),
(2273, 25, 'Acheral'),
(2274, 25, 'Agua Dulce'),
(2275, 25, 'Aguilares'),
(2276, 25, 'Alderetes'),
(2277, 25, 'Alpachiri'),
(2278, 25, 'Alto Verde'),
(2279, 25, 'Amaicha del Valle'),
(2280, 25, 'Amberes'),
(2281, 25, 'Ancajuli'),
(2282, 25, 'Arcadia'),
(2283, 25, 'Atahona'),
(2284, 25, 'Banda del Río Sali'),
(2285, 25, 'Bella Vista'),
(2286, 25, 'Buena Vista'),
(2287, 25, 'Burruyacú'),
(2288, 25, 'Capitán Cáceres'),
(2289, 25, 'Cevil Redondo'),
(2290, 25, 'Choromoro'),
(2291, 25, 'Ciudacita'),
(2292, 25, 'Colalao del Valle'),
(2293, 25, 'Colombres'),
(2294, 25, 'Concepción'),
(2295, 25, 'Delfín Gallo'),
(2296, 25, 'El Bracho'),
(2297, 25, 'El Cadillal'),
(2298, 25, 'El Cercado'),
(2299, 25, 'El Chañar'),
(2300, 25, 'El Manantial'),
(2301, 25, 'El Mojón'),
(2302, 25, 'El Mollar'),
(2303, 25, 'El Naranjito'),
(2304, 25, 'El Naranjo'),
(2305, 25, 'El Polear'),
(2306, 25, 'El Puestito'),
(2307, 25, 'El Sacrificio'),
(2308, 25, 'El Timbó'),
(2309, 25, 'Escaba'),
(2310, 25, 'Esquina'),
(2311, 25, 'Estación Aráoz'),
(2312, 25, 'Famaillá'),
(2313, 25, 'Gastone'),
(2314, 25, 'Gdor. Garmendia'),
(2315, 25, 'Gdor. Piedrabuena'),
(2316, 25, 'Graneros'),
(2317, 25, 'Huasa Pampa'),
(2318, 25, 'J. B. Alberdi'),
(2319, 25, 'La Cocha'),
(2320, 25, 'La Esperanza'),
(2321, 25, 'La Florida'),
(2322, 25, 'La Ramada'),
(2323, 25, 'La Trinidad'),
(2324, 25, 'Lamadrid'),
(2325, 25, 'Las Cejas'),
(2326, 25, 'Las Talas'),
(2327, 25, 'Las Talitas'),
(2328, 25, 'Los Bulacio'),
(2329, 25, 'Los Gómez'),
(2330, 25, 'Los Nogales'),
(2331, 25, 'Los Pereyra'),
(2332, 25, 'Los Pérez'),
(2333, 25, 'Los Puestos'),
(2334, 25, 'Los Ralos'),
(2335, 25, 'Los Sarmientos'),
(2336, 25, 'Los Sosa'),
(2337, 25, 'Lules'),
(2338, 25, 'M. García Fernández'),
(2339, 25, 'Manuela Pedraza'),
(2340, 25, 'Medinas'),
(2341, 25, 'Monte Bello'),
(2342, 25, 'Monteagudo'),
(2343, 25, 'Monteros'),
(2344, 25, 'Padre Monti'),
(2345, 25, 'Pampa Mayo'),
(2346, 25, 'Quilmes'),
(2347, 25, 'Raco'),
(2348, 25, 'Ranchillos'),
(2349, 25, 'Río Chico'),
(2350, 25, 'Río Colorado'),
(2351, 25, 'Río Seco'),
(2352, 25, 'Rumi Punco'),
(2353, 25, 'San Andrés'),
(2354, 25, 'San Felipe'),
(2355, 25, 'San Ignacio'),
(2356, 25, 'San Javier'),
(2357, 25, 'San José'),
(2358, 25, 'San Miguel de 25'),
(2359, 25, 'San Pedro'),
(2360, 25, 'San Pedro de Colalao'),
(2361, 25, 'Santa Rosa de Leales'),
(2362, 25, 'Sgto. Moya'),
(2363, 25, 'Siete de Abril'),
(2364, 25, 'Simoca'),
(2365, 25, 'Soldado Maldonado'),
(2366, 25, 'Sta. Ana'),
(2367, 25, 'Sta. Cruz'),
(2368, 25, 'Sta. Lucía'),
(2369, 25, 'Taco Ralo'),
(2370, 25, 'Tafí del Valle'),
(2371, 25, 'Tafí Viejo'),
(2372, 25, 'Tapia'),
(2373, 25, 'Teniente Berdina'),
(2374, 25, 'Trancas'),
(2375, 25, 'Villa Belgrano'),
(2376, 25, 'Villa Benjamín Araoz'),
(2377, 25, 'Villa Chiligasta'),
(2378, 25, 'Villa de Leales'),
(2379, 25, 'Villa Quinteros'),
(2380, 25, 'Yánima'),
(2381, 25, 'Yerba Buena'),
(2382, 25, 'Yerba Buena (S)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE IF NOT EXISTS `client` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text,
  `phone` text,
  `address` varchar(40) DEFAULT NULL,
  `id_client_type` int(10) unsigned DEFAULT NULL,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `latitude` decimal(18,14) DEFAULT NULL,
  `longitude` decimal(18,14) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id`, `date_created`, `date_deleted`, `name`, `description`, `phone`, `address`, `id_client_type`, `id_country`, `id_state`, `id_city`, `zip_code`, `latitude`, `longitude`) VALUES
(1, '2015-04-29 08:29:21', NULL, '24 de Septiembre 914', '', '4807822', '24 de Septiembre 914', 2, 12, 7, 543, '', '-31.41503100740400', '-64.17059617519200'),
(2, '2015-04-29 08:35:45', NULL, 'Cochera Centro Bancario', '', '4684420', 'Rosario de Santa Fe 440', 2, 12, 7, 543, '5000', '-31.41771880000000', '-64.17827770000000'),
(3, '2015-04-29 08:37:49', NULL, 'Acapulco', '', '4243429/155558829', 'Maipu 364', 2, 12, 7, 543, '5000', '-31.41297250000000', '-64.17827710000000'),
(4, '2015-04-29 08:39:05', NULL, 'Addoc', '', '4649088', 'Av. Circunvalacion', 2, 12, 7, 543, '5000', '-31.39772990000000', '-64.13149260000000'),
(5, '2015-04-29 08:39:44', NULL, 'Asis', '', '3516135675', 'Rosario de Santa Fe 264', 2, 12, 7, 543, '5000', '-31.41703400000000', '-64.18060570000000'),
(6, '2015-04-29 08:40:45', NULL, 'Cocheras Cordoba', '', '3515934521', '9 de Julio 661', 2, 12, 7, 543, '5000', '-31.41225890000000', '-64.19256100000000'),
(7, '2015-04-29 08:41:06', NULL, 'Los Alerces', '', '4221571', 'Larrañaga 147', 2, 12, 7, 543, '5000', '-31.42724130000000', '-64.18672219999900'),
(8, '2015-04-29 08:42:11', NULL, 'Lima 233', '', '4243429', 'Lima 233', 2, 12, 7, 543, '5000', '-31.41345290000000', '-64.17949310000000'),
(9, '2015-04-29 08:43:12', NULL, 'M&M', '', '3516829627', 'Rosario de Santa Fe 1269', 2, 12, 7, 543, '5000', '-31.41589480000000', '-64.16556410000000'),
(10, '2015-04-29 08:47:51', NULL, 'Cohigüe IV', '', '3512511308', 'San Lorenzo 172', 2, 12, 7, 543, '', '-31.42390710000000', '-64.18496790000000'),
(11, '2015-04-29 08:49:15', NULL, 'Colegio Paula Montal', '', '4842618', 'Porto y Mariño 556', 2, 12, 7, 543, '5000', '-31.39273430000000', '-64.23791390000000'),
(12, '2015-04-29 08:50:53', NULL, 'Colon 635', '', '4258141', 'Colon 635', 2, 12, 7, 543, '5000', '-31.41123010000000', '-64.19177400000000'),
(13, '2015-04-29 08:53:46', NULL, 'Consorcio Colon', '', '4221571', 'Colon 441', 2, 12, 7, 543, '5000', '-31.41176630000000', '-64.18928900000000'),
(14, '2015-04-29 08:56:26', NULL, 'AFIP-DGA', '', '4270955/56', 'Buenos Aires 150', 2, 12, 7, 543, '5000', '-31.41801140000000', '-64.18369210000000'),
(15, '2015-04-29 08:57:47', NULL, 'Consultores de Empresas', '', '4253244', 'Av. Olmos 336', 2, 12, 7, 543, '5000', '-31.41501120000000', '-64.17863710000000'),
(16, '2015-04-29 08:58:22', NULL, 'Alegria Asociacion Civil', '', '4741826', 'Fragueiro 1761', 2, 12, 7, 543, '5000', '-31.39497950000000', '-64.18569760000000'),
(17, '2015-04-29 08:58:36', NULL, 'COPI JC SUD (Mormones)', '', '3515485200', 'Pedro Laplace 5647', 2, 12, 7, 543, '5000', '-31.35874860000000', '-64.24318629999900'),
(18, '2015-04-29 08:59:12', NULL, 'Cristobal', '', '3516425395', 'A. Colon 1891', 2, 12, 7, 543, '5000', '-31.40634240000000', '-64.20836630000000'),
(19, '2015-04-29 08:59:51', NULL, 'Dean Funes 2448', '', '4230585/155730858', 'Dean Funes 2448', 2, 12, 7, 543, '5000', '-31.40629880000000', '-64.21532990000000'),
(20, '2015-04-29 09:00:30', NULL, 'Dibel', '', '3515730858', 'Independencia 1121', 2, NULL, NULL, NULL, '', '-31.42897019301300', '-64.18948429107600'),
(21, '2015-04-29 09:01:05', NULL, 'DIra', '', '4265048', 'Coronel Olmedo 165', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(22, '2015-04-29 09:06:50', '2015-05-07 19:25:33', 'Dirección de Vivienda', NULL, '4341590', 'Humberto Primo 467', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(23, '2015-04-29 09:14:11', NULL, 'Alfa', '', '154596175', 'Sucre 246', 2, 12, 7, 543, '5000', '-31.41144150000000', '-64.18848320000000'),
(24, '2015-04-29 12:09:26', NULL, '9 de Julio 679', '', '4240541- 3516832006', '9 de Julio 679 1 º C', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(25, '2015-04-29 12:15:31', NULL, 'Alihuen', '', '153559661', 'Ituzaingo 1159', 2, 12, 7, 543, '5000', '-31.43012390000000', '-64.18693990000000'),
(26, '2015-04-29 12:17:52', NULL, 'Allegro', '', '3516333693', 'Chaco 123', 2, 12, 7, 543, '5000', '-31.40892200000000', '-64.20274030000000'),
(27, '2015-04-29 12:27:27', NULL, 'Allianz Seguro', '', '4227067 / 3515300304', 'Fragueiro 474', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(28, '2015-04-29 12:28:36', NULL, 'Altamira', '', '4247282	1555794', 'Olmos 15', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(29, '2015-04-29 12:50:02', NULL, 'Alto Alberdi 31 Viviendas', '', '3516994869', 'Santa rosa 2528', 2, 12, 7, 543, '5000', '-31.40288229999900', '-64.21489530000000'),
(30, '2015-04-29 12:52:30', NULL, 'Alto Cofico', '', '4600808', 'Sucre 1484', 2, 12, 7, 543, '5000', '-31.39926639999900', '-64.18308050000000'),
(31, '2015-04-29 12:53:53', NULL, 'Altos de Alberdi', '', '153597825', 'Ingeniero Lopez 09', 2, 12, 7, 543, '', '-31.40841500000000', '-64.20925940000000'),
(32, '2015-04-29 12:55:25', NULL, 'Amancay', '', '4217797', 'Urquiza 383', 2, 12, 7, 543, '5000', '-31.40828190000000', '-64.19348010000000'),
(33, '2015-04-29 12:56:49', NULL, 'Amazonas I', '', '4600808', 'Obispo Salguero 387', 2, 12, 7, 543, '5000', '-31.42198040000000', '-64.18067420000000'),
(34, '2015-04-29 12:57:29', NULL, 'Amazonas II', '', '4600808', 'Bv. Ilia 413', 2, 12, 7, 543, '5000', '-31.41932720000000', '-64.19191500000000'),
(35, '2015-04-29 13:00:10', NULL, 'Ancona', '', '4248011\n3513524455', 'Velez Sarsfield 236', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(36, '2015-04-29 13:01:34', NULL, 'Arsen', '', '4281986', 'Duarte Quiros 1696', 2, 12, 7, 543, '5000', '-31.41228110000000', '-64.20748139999900'),
(37, '2015-04-29 13:01:42', NULL, 'Educación y Comunicación SRL', '', '', 'Achabal Rodriguez 147', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(38, '2015-04-29 13:02:57', NULL, 'Artigas 234', '', '4263398', 'Artigas 234', 2, 12, 7, 543, '', '-31.41545290000000', '-64.19603950000000'),
(39, '2015-04-29 13:03:02', NULL, 'Eiffel', '', '4600808', 'Transito Caceres de Allende 491', 2, 12, 7, 543, '5000', '-31.42473990000000', '-64.17744250000000'),
(40, '2015-04-29 13:03:38', '2015-10-19 15:01:30', 'Electrónica Megatone', '', '', '9 de Julio 97', 2, 12, 7, 543, '5000', '-31.41442670000000', '-64.18507110000000'),
(41, '2015-04-29 13:04:01', '2015-10-19 15:01:33', 'Electrónica Megatone', '', '', 'Rivera Indarte 175', 2, 12, 7, 543, '5000', '-31.41346930000000', '-64.18475900000000'),
(42, '2015-04-29 13:04:04', NULL, 'Arturo M. Bas 6', '', '4265757', 'Arturo M. Bas 6', 2, 12, 7, 543, '5000', '-31.41360430000000', '-64.19244800000000'),
(43, '2015-04-29 13:04:58', NULL, 'Ercilia I', '', '4247282', 'Bedoya 132', 2, 12, 7, 543, '5000', '-31.40135030000000', '-64.17607160000000'),
(44, '2015-04-29 13:05:04', NULL, 'Asis Rondeau', '', '4110310', 'Rondeau 353', 2, 12, 7, 543, '5000', '-31.42344340000000', '-64.18205130000000'),
(45, '2015-04-29 13:05:40', NULL, 'Escuela de Hoteleria y Turismo', NULL, NULL, 'Chateau (UPC)', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '2015-04-29 13:06:27', NULL, 'Escuela de Musica', NULL, NULL, 'Richieri (UPC)', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '2015-04-29 13:06:53', '2015-05-07 20:02:13', 'Europa II', NULL, '4600808', 'Buenos Aires 550', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '2015-04-29 13:07:52', NULL, 'Astral III', '', '4270311', 'Chacabuco 651', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(49, '2015-04-29 14:55:43', NULL, 'Aurora', '', '4262743', 'Av. Colon 342', 2, 12, 7, 543, '5000', '-31.41214740000000', '-64.18792170000000'),
(50, '2015-04-29 14:57:08', NULL, 'Avellaneda', '', '4221571', 'Avellaneda 258', 2, 12, 7, 543, '5000', '-31.40932710000000', '-64.19533679999900'),
(51, '2015-04-29 14:58:42', NULL, 'Ayacucho', '', '4238904', 'Ayacucho 72', 2, 12, 7, 543, '5000', '-31.41511020000000', '-64.19004230000000'),
(52, '2015-04-29 14:59:52', NULL, 'Balcones del Palacio', '', '4247282', 'Derqui 313', 2, 12, 7, 543, '5000', '-31.42680490000000', '-64.18395640000000'),
(53, '2015-04-29 15:01:23', NULL, 'Balsamo', '', '4222126', 'La Rioja 624', 2, 12, 7, 543, '5000', '-31.40877200000000', '-64.19099090000000'),
(54, '2015-04-29 15:02:38', NULL, 'Barcelona VIII', '', '5890741', 'La Rioja 624', 2, 12, 7, 543, '5000', '-31.40875930000000', '-64.19090400000000'),
(55, '2015-04-29 15:05:40', NULL, 'Bv. Ocampo 232', NULL, '4227421', 'Bv. Ocampo 232', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '2015-04-29 15:07:02', NULL, 'Bv. Ocampo 418', NULL, '155900804', 'Bv. Ocampo 418', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '2015-04-29 15:10:35', NULL, 'Caja de Previcion', '', '4106040 / 46', '27 de Abril 770', 2, 12, 7, 543, '', '-31.40000000000000', '-64.18000000000000'),
(58, '2015-04-29 15:27:50', NULL, 'Calicanto', NULL, '4233793', 'San Luis 331', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '2015-04-29 15:28:55', NULL, 'Camino Real', '', '4600808', 'Catamarca 895', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(60, '2015-04-29 15:37:33', NULL, 'Campillo 988', '', '4219555', 'Campillo 988', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(61, '2015-04-29 15:38:37', NULL, 'Casanova II', '', '4684420', 'Ovidio Lagos 385', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(62, '2015-04-29 15:39:18', NULL, 'Caseros 1061', NULL, '4527958', 'Caseros 1061', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '2015-04-29 15:40:28', NULL, 'Caseros 2940', NULL, '156089634', 'Caseros 2940', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '2015-04-29 16:24:06', NULL, 'Caseros 679', '', '4281905', 'Caseros 679', 2, 12, 7, 543, '', '-31.40000000000000', '-64.18000000000000'),
(65, '2015-04-29 16:53:51', NULL, 'Cedro Azul', '', '4281986', 'Av. Colon484', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(66, '2015-04-29 16:54:35', NULL, 'Centauro', '', '3516333693', 'Belgrano 165', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(67, '2015-04-29 16:55:03', NULL, 'Centenario', '', '4281986', 'Duarte Quiros 49', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(68, '2015-04-29 16:55:33', NULL, 'Centro', NULL, NULL, 'Arturo M. Bas 54', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '2015-04-29 16:56:15', NULL, 'Ceom', NULL, NULL, 'Larrañaga 94', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '2015-04-29 16:56:41', NULL, 'Salomon', NULL, NULL, 'Ituzaingo 394', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '2015-04-29 16:57:05', NULL, 'Ciadeco III', NULL, NULL, 'Dean Funes 625', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '2015-04-29 16:57:31', NULL, 'Cibeles', '', '4683705', 'Pasaje España 1415', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(73, '2015-04-29 16:57:58', '2015-10-16 23:00:29', 'Clinica Privada Curet', NULL, NULL, 'Urquiza 401', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '2015-04-29 16:58:41', NULL, 'Club Belgrano', NULL, NULL, 'Camino San Antonio Km 5', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '2015-04-29 16:59:44', '2015-05-07 20:02:33', 'Facultad de Artes', NULL, NULL, 'Ciudad Universitaria', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '2015-04-29 17:00:09', NULL, 'Ferrazano', '', '4238904', 'Duarte Quiros 395', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(77, '2015-04-29 17:00:50', NULL, 'Fidecomiso Villa Canarias', NULL, NULL, 'Lindor Ferreira 6700', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '2015-04-29 17:01:54', NULL, 'Fideicomiso Edificio del Valle', '', '', 'Duarte Quiros 1915', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(79, '2015-04-29 17:02:27', NULL, 'Florida VI', '', '4233793', 'San Juan 311', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(80, '2015-04-29 17:02:51', NULL, 'Fragueiro', NULL, NULL, 'Fragueiro 715', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '2015-04-29 17:03:25', '2015-07-27 19:55:26', 'Fundacion Robert Cade', NULL, NULL, 'Pedro Oñate 254', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '2015-04-29 17:06:19', NULL, 'Galeria Cabildo', NULL, NULL, 'Dean Funes 80', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '2015-04-29 17:06:54', NULL, 'General Paz 636', NULL, NULL, 'General Paz 636', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '2015-04-29 17:08:01', '2015-07-14 22:03:41', 'Genesis I', NULL, NULL, 'Coronel Olmedo 174', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '2015-04-29 17:08:30', NULL, 'Giraudo', '', '', 'Olmos 165', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(86, '2015-04-29 17:09:07', NULL, 'Guemes Sociedad Civil', NULL, NULL, '24 de Septiembre 1702', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '2015-04-29 17:09:46', NULL, 'H. Irigoyen 208', '', '4684420', 'H. Irigoyen 208', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(88, '2015-04-29 17:10:13', NULL, 'Habitania II', '', '', 'San Lorenzo 392', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(89, '2015-04-29 17:10:55', '2015-06-12 17:46:14', 'Ignacio Jose', NULL, NULL, 'M T de Alvear 263', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '2015-04-29 17:11:24', NULL, 'Independencia 489', NULL, NULL, 'Independencia 489', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '2015-04-29 17:11:51', NULL, 'Independencia 509', '', '4831265', 'Independencia 509', 2, 12, 7, 543, '5000', '-31.42212080000000', '-64.18686560000000'),
(92, '2015-04-29 17:12:19', NULL, 'Interlaken I', NULL, NULL, 'Felix Frias 290', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '2015-04-29 17:12:48', NULL, 'Interlaken II', NULL, NULL, 'Rosario de Santa Fe 1348', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '2015-04-29 17:13:18', NULL, 'Interlaken III', '', '4218775', 'General Guemes 178', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(95, '2015-04-29 17:13:44', NULL, 'Jose Ignacio', '', '4226527\n3515083834', 'Ituzaingo 946', 2, 12, 7, 543, '5000', '-31.42784500000000', '-64.18600780000000'),
(96, '2015-04-29 17:14:09', NULL, 'Jose Ignacio', '', '4237237\n3516538994', 'Maipu 343', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(97, '2015-04-29 17:14:33', NULL, 'La Amistad', '', '', 'Urquiza 131', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(98, '2015-04-29 17:15:01', NULL, 'La Plaza', NULL, NULL, 'Monseñor de Andrea 130', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(99, '2015-04-29 17:15:24', NULL, 'La Viña', NULL, NULL, 'Olmos 395', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(100, '2015-04-29 17:15:57', NULL, 'Lamadrid', NULL, NULL, 'Lamadrid 170', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(101, '2015-04-29 17:16:33', NULL, 'Las Marias I', NULL, NULL, 'Enfermera Clermon 146', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(102, '2015-04-29 17:17:19', NULL, 'Leonidas Office', NULL, NULL, 'Humberto Primo 945', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(103, '2015-04-29 17:17:45', NULL, 'Lima', NULL, NULL, 'Lima 1109', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(104, '2015-05-06 14:45:00', NULL, 'Lima', NULL, NULL, 'Lima 233', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(105, '2015-05-06 14:45:45', '2015-05-11 22:00:25', 'LOS ALERCES', NULL, NULL, 'Larrañaga 147', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(106, '2015-05-06 14:46:24', NULL, 'M & M', NULL, NULL, 'Rosario de Santa Fe 1269', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(107, '2015-05-06 14:46:50', NULL, 'MABRUK', NULL, NULL, 'Corrientes 33', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(108, '2015-05-06 14:47:19', NULL, 'MANHATAN', NULL, NULL, 'San Lorenzo 490', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(109, '2015-05-06 14:47:51', NULL, 'MANIAGO II', '', '', 'Ambrocio Olmos 776', 2, 12, 7, 543, '5000', '-31.43083310000000', '-64.18990020000000'),
(110, '2015-05-06 14:48:30', NULL, 'MARIANA', NULL, NULL, 'Hipolito Irigiyen 384', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(111, '2015-05-06 14:48:56', NULL, 'MAYORAZGO I', NULL, NULL, 'Parana 653', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(112, '2015-05-06 14:49:23', NULL, 'MAYORAZGO II', NULL, NULL, 'Parana 657', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(113, '2015-05-06 14:50:01', NULL, 'MEMPHIS', NULL, NULL, 'Hipolito Irigoyen 147', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(114, '2015-05-06 14:50:33', NULL, 'MENFIS I', NULL, NULL, 'David Luque 119', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(115, '2015-05-06 14:50:54', NULL, 'MERGUERIAN', NULL, NULL, 'Sucre 318', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(116, '2015-05-06 14:51:36', NULL, 'MIRADORES DE PUEYRREDON', NULL, NULL, 'Pueyrredon 76', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(117, '2015-05-06 14:51:59', NULL, 'MISIONES III', NULL, NULL, 'Maipu 491', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(118, '2015-05-06 14:52:35', NULL, 'MOLINO MINETTI', NULL, NULL, 'Rio Negro 3550', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(119, '2015-05-06 14:53:09', NULL, 'MONIMAR', NULL, NULL, 'Bv. Ilia 235', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(120, '2015-05-06 14:53:38', NULL, 'NAZARET VI', NULL, NULL, 'Poeta Lugones 230', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(121, '2015-05-06 14:54:03', NULL, 'NOGARO', '', '', 'La Rioja 238', 2, 12, 7, 543, '', '-31.41052819999900', '-64.18525710000000'),
(122, '2015-05-06 14:54:46', NULL, 'NUEVA CORDOBA', NULL, NULL, 'Buenos Aires 949/951', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(123, '2015-05-06 14:55:26', NULL, 'NUEVO SALGUERO', NULL, NULL, 'Obispo Salguero 582', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(124, '2015-05-06 14:55:57', NULL, 'OBISPO ORO', NULL, NULL, 'Obispo Oro 259', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(125, '2015-05-06 14:56:57', NULL, 'OBISPO SALGUERO', '', '4234719\n155555887', 'Obispo Salguero 456', 2, 12, 7, 543, '5000', '-31.42293190000000', '-64.18114220000000'),
(126, '2015-05-06 14:57:27', NULL, 'TREJO', NULL, NULL, 'Obispo Trejo 835', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(127, '2015-05-06 14:57:53', NULL, 'OLMOS', NULL, NULL, 'Olmos 141', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(128, '2015-05-06 14:58:19', NULL, 'ONELIA', NULL, NULL, 'Sucre 71', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(129, '2015-05-06 14:58:46', NULL, 'ORONTES', '', '', 'Poeta Lugones 94', 2, 12, 7, 543, '5000', '-31.42482750000000', '-64.17702430000000'),
(130, '2015-05-06 14:59:17', NULL, 'PACIFICO', NULL, NULL, 'Crisol 29', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(131, '2015-05-06 15:00:02', NULL, 'PAMPA I', NULL, NULL, 'Bv. Illia 607 / 611', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(132, '2015-05-06 15:00:32', NULL, 'PATRIA I', '', '3518021', 'Av. Patria 249', 2, 12, 7, 543, '5000', '-31.41080720000000', '-64.15737360000000'),
(133, '2015-05-06 15:01:07', NULL, 'PATRIA II', NULL, NULL, 'Rosario de Santa Fe 1565', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(134, '2015-05-06 15:01:40', NULL, 'PLAZA MERCADO', NULL, NULL, 'San Jeronimo 2775', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(135, '2015-05-06 15:02:25', NULL, 'PORTALES DE SOLARES II', NULL, NULL, 'Ramires Tello 2195', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(136, '2015-05-06 15:03:17', NULL, 'PONTEVEDRA II', NULL, NULL, 'M. T. de Alvear 480', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(137, '2015-05-06 15:03:54', NULL, 'PROMDEX', NULL, NULL, 'Bv. Guzman 65', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(138, '2015-05-06 15:04:23', NULL, 'PUCARA', NULL, NULL, 'Agustin Garzon 1668', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(139, '2015-05-06 15:04:52', NULL, 'RIO PARANA I', NULL, NULL, 'Parana 336', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(140, '2015-05-06 15:05:28', NULL, 'RIO URUGUAY SEGUROS', NULL, NULL, 'Fragueiro 290', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(141, '2015-05-06 15:05:58', NULL, 'ROBERTO II', NULL, NULL, 'Rondeau 585', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(142, '2015-05-06 15:06:25', NULL, 'ROBERTO III', '', '', 'Balcarce 455', 2, 12, 7, 543, '', '-31.42385920000000', '-64.17834990000000'),
(143, '2015-05-06 15:07:02', NULL, 'RODRIGUEZ PEÑA', NULL, NULL, 'Rodriguez Peña 1409', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(144, '2015-05-06 15:07:33', NULL, 'RONCAGLIA', NULL, NULL, 'Fragueiro 2448', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(145, '2015-05-06 15:08:08', NULL, 'ROSARIO DE SANTA FE', NULL, NULL, 'Rosario de Santa Fe 126', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(146, '2015-05-06 15:08:58', NULL, 'SALAMANCA', NULL, NULL, 'M. T. de Alvear 376', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(147, '2015-05-06 15:09:24', NULL, 'SAN ANDRES', NULL, NULL, 'Crisol 93', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(148, '2015-05-06 15:09:51', NULL, 'SAN FERNANDO', NULL, NULL, 'Rondeau 675', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(149, '2015-05-06 15:10:23', NULL, 'SAN GIMINIANO', NULL, NULL, 'Chacabuco 41', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(150, '2015-05-06 15:10:51', NULL, 'SAN JOSE', NULL, NULL, 'Obispo Oro 445', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(151, '2015-05-06 15:11:17', NULL, 'SAN JUAN', NULL, NULL, 'San Juan 838', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(152, '2015-05-06 15:27:27', NULL, 'SAN LORENZO', NULL, NULL, 'Ituzaingo 594', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(153, '2015-05-06 15:28:09', NULL, 'SANATORIO DEL SALVADOR', NULL, NULL, 'General Deheza 450', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(154, '2015-05-06 15:28:40', NULL, 'SANATORIO PARQUE', '', '', 'San Jeronimo 3115', 2, 12, 7, 543, '5000', '-31.42372090000000', '-64.14411900000000'),
(155, '2015-05-06 15:29:07', NULL, 'SARACHAGA', NULL, NULL, 'Sarachaga 1269', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(156, '2015-05-06 15:29:34', NULL, 'SEÑORIL', NULL, NULL, 'Obispo Salguero 421', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(157, '2015-05-06 15:30:03', NULL, 'SILVANA III', '', '', 'Lima 1672', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(158, '2015-05-06 15:30:33', NULL, 'SOBREMONTE', NULL, NULL, 'Rosario de Santa Fe 194', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(159, '2015-05-06 15:30:58', NULL, 'SOL IV', NULL, NULL, 'Larrañaga 91', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(160, '2015-05-06 15:31:48', NULL, 'SOL V', NULL, NULL, 'Ituzaingo 1156', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(161, '2015-05-06 15:32:12', NULL, 'SOLEIL', NULL, NULL, 'Balcarce 390', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(162, '2015-05-06 15:32:37', NULL, 'STABIO', NULL, NULL, 'General Paz 351', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(163, '2015-05-06 15:33:01', NULL, 'ZUES', NULL, NULL, 'General Paz 94', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(164, '2015-05-06 15:33:27', NULL, 'TANGO', NULL, NULL, 'Castro Barros 347', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(165, '2015-05-06 15:33:51', NULL, 'TEBIE', NULL, NULL, 'Sucre 79', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(166, '2015-05-06 15:34:18', NULL, 'TERRAZA I', NULL, NULL, 'San Lorenzo 586', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(167, '2015-05-06 15:34:44', NULL, 'TORINO', NULL, NULL, 'Eugenio Garzon 404', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(168, '2015-05-06 15:35:12', NULL, 'TORRE AMARILLA', NULL, NULL, 'La Plata 870', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(169, '2015-05-06 15:35:46', NULL, 'TORRE ARGUS', NULL, NULL, 'Ovidio Lagos 394', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(170, '2015-05-06 15:36:09', NULL, 'TORRE AZUL', NULL, NULL, 'La Plata 870', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(171, '2015-05-06 15:38:18', NULL, 'TORRE DEL LITORAL', NULL, NULL, 'M. T. de Alvear 545', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(172, '2015-05-06 15:38:44', NULL, 'TORRE ROJA', NULL, NULL, 'La Plata 870', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(173, '2015-05-06 15:39:18', NULL, 'TORRES DE ALBERDI', NULL, NULL, '27 de Abril 1797', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(174, '2015-05-06 15:39:55', NULL, 'TREINTA DE OCTUBRE', NULL, NULL, 'Montevideo 765', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(175, '2015-05-06 15:40:24', NULL, 'TYPUANA', NULL, NULL, 'M. T. de Alvear 68', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(176, '2015-05-06 15:41:20', NULL, 'UNC ( IIFAP / CIECS )', NULL, NULL, 'Rondo 467', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(177, '2015-05-06 15:41:43', NULL, 'VALDAGNO', NULL, NULL, 'Bolivar 49', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(178, '2015-05-06 15:42:21', NULL, 'VELEZ SARSFIELD', NULL, NULL, 'Velez Sarsfield 256', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(179, '2015-05-06 15:43:27', NULL, 'VELEZ SARSFIELD 286', NULL, NULL, 'Velez Sarsfield 286', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(180, '2015-05-06 15:43:56', NULL, 'VERACRUZ', NULL, NULL, 'Av. Santa Fe 346', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(181, '2015-05-06 15:44:23', NULL, 'VERDI II', NULL, NULL, '9 de Julio 1333', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(182, '2015-05-06 15:44:52', NULL, 'VERMELHO', NULL, NULL, 'Chacabuco 327', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(183, '2015-05-06 15:45:22', NULL, 'VILLA ALLENDE OFICE', NULL, NULL, 'Villa Allende', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(184, '2015-05-06 15:45:52', NULL, 'VIRGINIA VI', NULL, NULL, 'Obispo Trejo 1149', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(185, '2015-05-06 15:46:15', NULL, 'VIRGINIA X', NULL, NULL, 'Derqui 312', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(186, '2015-05-06 15:46:47', NULL, 'VIVACHE', NULL, NULL, 'Chaco 131', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(187, '2015-05-06 15:47:15', NULL, 'ZARAUS', NULL, NULL, 'Buenos Aires 1078', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(188, '2015-05-06 15:47:39', NULL, 'ZARIMAR', '', '4229492', 'Colon 3140', 2, 12, 7, 543, '5000', '-31.40185040000000', '-64.22232730000000'),
(189, '2015-05-07 14:21:42', NULL, 'Direccion de la Vivienda', '', '4341590', 'Humberto Primo 467', 2, 12, 7, 543, '5000', '-31.40818830000000', '-64.18831930000000'),
(190, '2015-05-07 14:28:17', '2015-10-19 14:59:59', 'EIFFEL', '', '4600808', 'Trancito Caseres de Allende491', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(191, '2015-05-07 14:31:54', NULL, 'ELECTRONICA MEGATONE', '', '4288765 / 64', '9 de Julio 97', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(192, '2015-05-07 14:32:57', NULL, 'ELECTRONICA MEGATONE', '', '4288765 / 64', 'Rivera Indarte 175', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(193, '2015-05-07 14:38:35', NULL, 'Escuela de Hoteleria y Turismo', NULL, NULL, 'Chateau (UPC )', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(194, '2015-05-07 14:39:09', NULL, 'Escuela de Musica', NULL, NULL, 'Richieri ( UPC )', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(195, '2015-05-07 14:39:54', NULL, 'EUROPA II', '', '4600808', 'Buenos Aires 550', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(196, '2015-05-07 14:40:30', NULL, 'Facultad de Artes UNC', NULL, NULL, 'UNC', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(197, '2015-05-07 14:41:04', '2015-10-19 15:23:15', 'FERRAZANO', NULL, NULL, 'Duarte Quiros 395', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(198, '2015-05-07 14:41:50', '2015-10-19 15:31:27', 'FIDECOMISO VILLA CANARIAS', NULL, NULL, 'Lindor Ferreira 6700', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(199, '2015-05-07 14:42:32', NULL, 'Fidecomiso del Valle V', NULL, NULL, 'Duarte Quios 1915', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(200, '2015-05-07 14:43:20', '2015-10-19 15:37:53', 'FLORIDA VI', NULL, NULL, 'San Juan 311', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(201, '2015-05-07 14:43:46', NULL, 'FRAGUEIRO', NULL, NULL, 'Campillo 715', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(202, '2015-05-07 14:46:41', NULL, 'FUNDACION ROBERT CADE', '', '4840816', 'Pedro Oñate 254', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(203, '2015-05-07 14:47:20', '2015-10-19 15:58:55', 'GALERIA CABILDO', NULL, NULL, 'Dean Funes 80', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(204, '2015-05-07 14:53:15', '2015-10-19 16:03:18', 'GENERAL PAZ', NULL, NULL, 'General PAZ 636', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(205, '2015-05-07 14:56:06', NULL, 'GENESIS', NULL, NULL, 'Coronel Olmedo 174', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(206, '2015-05-07 14:56:33', '2015-06-25 20:26:49', 'GIRAUDO', NULL, NULL, 'Olmos 165', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(207, '2015-05-07 14:57:18', '2015-10-19 16:18:55', 'GUEMES SOCIEDAD CIVIL', NULL, NULL, '24 de Septiembte 1702', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(208, '2015-05-07 14:58:18', '2015-10-19 16:31:17', 'HIPOLITO IRIGOYEN', NULL, NULL, 'H. Hirigoyen 208', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(209, '2015-05-07 14:58:56', '2015-10-19 16:45:23', 'HABITANIA II', NULL, NULL, 'San Lorenzo 392', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(210, '2015-05-07 14:59:34', NULL, 'IGNACIO JOSE', '', '', 'M. T. de Alvear 263', 2, 12, 7, 543, '', '-31.41715700000000', '-64.19056160000000'),
(211, '2015-05-07 15:00:06', '2015-05-12 19:04:17', 'INDEPENDENCIA', NULL, NULL, 'Independencia 489', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(212, '2015-05-07 15:00:29', '2015-05-12 19:04:20', 'INDEPENDENCIA', NULL, NULL, 'Independencia 509', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(213, '2015-05-14 13:06:41', '2015-05-21 22:38:55', 'jacinto', '', '', 'jacinto Rios 886', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(214, '2015-05-20 09:06:44', NULL, 'DIRECCION DE VIVIENDA', '', '', 'Humberto Primo 467', 2, 12, 7, 543, '', '-31.40818830000000', '-64.18831930000000'),
(215, '2015-05-21 15:28:31', '2015-07-21 22:18:04', 'TRIBUNALES POLICIA JUDICIAL', '', '', 'Duarte Quiros 650', 3, 12, 7, 543, '5000', '-31.41690450000000', '-64.19436610000000'),
(216, '2015-05-21 17:54:58', NULL, 'CORONEL OLMEDO', '', '', '12 DE OCTUBRE Y CORONEL AGUSTÍN OLMEDO', 2, 12, 7, 543, '', '-31.40360260000000', '-64.19747160000000'),
(217, '2015-06-09 16:00:39', NULL, 'TRIBUNALES', '', '3517658723', 'Caseros 553', 2, 12, 7, 543, '5000', '-31.41610560000000', '-64.19238530000000'),
(218, '2015-07-13 17:07:31', NULL, 'Balcones de ituzaingo', NULL, NULL, 'Ituzaingo 585', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(219, '2015-07-13 17:10:24', NULL, 'OPEN', NULL, NULL, 'Santa Fe 43', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(220, '2015-07-13 17:10:52', NULL, 'CAMARA DE LA CONSTRUCCION', '', '4683485\n155949042', 'Poeta Lugones 350', 2, 12, 7, 543, '5000', '-31.42712190000000', '-64.18181950000000'),
(221, '2015-07-13 17:11:28', '2015-10-15 16:35:47', 'Balcones de Ituzaingo', NULL, NULL, 'Ituzaingo 585', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(222, '2015-07-13 17:11:49', NULL, 'LOTUS', '', '', 'Caseros 985', 2, 12, 7, 543, '5000', '-31.41442600000000', '-64.19802059999900'),
(223, '2015-07-13 17:36:14', NULL, 'MANIAGO IV', '', '', 'San Juan 517', 2, 12, 7, 543, '5000', '-31.54004520000000', '-68.51830530000000'),
(224, '2015-09-17 09:24:57', NULL, 'San Andres', NULL, NULL, 'Crisol 93', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(225, '2015-09-17 09:25:51', '2015-10-19 14:42:53', 'COPI JC SUD', '', '', 'Pedro Laplace 5647', 2, 12, 7, 543, '', '-31.35925750000000', '-64.24417380000000'),
(226, '2015-10-08 15:51:35', NULL, 'ALBA', '', '152743030', '27 de Abril 290', 2, 12, 7, 543, '5000', '-31.41595270000000', '-64.18847939999900'),
(227, '2015-10-08 15:52:45', NULL, 'RONDEAU 85', '', '', 'Rondo 85', 2, 12, 7, 543, '5000', '-31.42227090000000', '-64.18551980000000'),
(228, '2015-10-08 15:53:37', NULL, 'CENTRO INDUSTRIAL Y COMERCIAL', '', '', 'General Paz 81', 2, 12, 7, 543, '5000', '-31.41430760000000', '-64.18636000000000'),
(229, '2015-10-08 15:54:44', NULL, 'COLON 1042', '', '', 'Av. Colon 1042', 2, 12, 7, 543, '5000', '-31.40943620000000', '-64.19713810000000'),
(230, '2015-10-08 15:55:13', NULL, 'TANTI', NULL, NULL, 'Ituzaingo 670', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(231, '2015-10-08 15:56:02', NULL, 'RAFAELA', '', '', '9 de julio 630', 2, 12, 7, 543, '5000', '-31.41232770000000', '-64.19220650000000'),
(232, '2015-10-08 16:00:00', NULL, 'BARCELONA III', '', '', 'Obispo Trejo 738', 2, 12, 7, 543, '5000', '-31.42441370000000', '-64.18906630000000'),
(233, '2015-10-08 16:00:35', NULL, 'PORTAL DE JUJUY', '', '', 'Jujuy 177', 2, 12, 7, 543, '5000', '-31.41202090000000', '-64.18997770000000'),
(234, '2015-10-08 16:01:02', NULL, 'DOMUS', '', '', 'Urrutia 196', 2, 12, 7, 543, '5000', '-31.41009470000000', '-64.20716050000000'),
(235, '2015-10-08 16:02:08', NULL, 'TORRE LIMUS', NULL, NULL, 'Coronel Olmedo 1456', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(236, '2015-10-08 16:03:05', NULL, 'TORRE VISTA', '', '', 'Coronel Olmedo 718', 2, 12, 7, 543, '5000', '-31.40349370000000', '-64.19717740000000'),
(237, '2015-10-08 17:22:43', NULL, 'Tribunales Cont. y Adm.', '', '', 'Arturo M. Bas 244', 2, 12, 7, 543, '5000', '-31.41641670000000', '-64.19322050000000'),
(238, '2015-10-15 09:09:36', '2015-10-15 14:13:50', '9 de Julio 679', NULL, '4240541/351682006', '9 de Julio 679', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(239, '2015-10-15 09:12:27', NULL, '9 de Julio 679', '', '4240541/3516832006', '9 de Julio 679', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000'),
(240, '2015-10-15 11:53:18', NULL, 'Caja de Prevision', '', '4106040', '27 de Abril 772', 2, NULL, NULL, NULL, '', '-31.40000000000000', '-64.18000000000000'),
(241, '2015-10-15 12:48:34', NULL, 'Chidiak Salomon', NULL, '4238906', 'Ituzaingo 394', 2, NULL, NULL, NULL, NULL, NULL, NULL),
(242, '2015-10-19 09:55:17', NULL, 'Edif. Contencioso Administrativo', '', '4481614', 'Arturo M. Bas 244', 2, 12, 7, 543, '5000', '-31.40000000000000', '-64.18000000000000');

--
-- Disparadores `client`
--
DELIMITER //
CREATE TRIGGER `client_date_created` BEFORE INSERT ON `client`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_administrator`
--

CREATE TABLE IF NOT EXISTS `client_administrator` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_administrator` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_administrator`
--

INSERT INTO `client_administrator` (`id`, `id_client`, `id_administrator`) VALUES
(2, 1, 2),
(4, 3, 3),
(5, 5, 4),
(6, 8, 3),
(17, 7, 16),
(20, 2, 5),
(26, 4, 22),
(31, 6, 6),
(44, 20, 38),
(50, 27, 43),
(51, 28, 44),
(53, 30, 45),
(55, 32, 47),
(59, 33, 45),
(61, 34, 45),
(66, 39, 45),
(68, 43, 44),
(69, 44, 4),
(70, 48, 59),
(72, 50, 16),
(74, 52, 44),
(75, 53, 62),
(77, 217, 65),
(79, 210, 67),
(80, 11, 69),
(88, 109, 5),
(89, 125, 77),
(90, 17, 80),
(91, 220, 82),
(92, 72, 72),
(93, 21, 83),
(95, 157, 88),
(96, 97, 89),
(97, 226, 91),
(98, 227, 91),
(99, 228, 91),
(101, 231, 91),
(104, 234, 93),
(105, 233, 92),
(106, 222, 24),
(107, 236, 92),
(108, 237, 65),
(110, 25, 95),
(111, 9, 96),
(113, 238, 98),
(114, 239, 99),
(120, 18, 109),
(123, 14, 114),
(126, 26, 119),
(127, 29, 121),
(128, 31, 123),
(129, 35, 125),
(130, 36, 127),
(131, 38, 129),
(132, 42, 58),
(134, 49, 60),
(135, 51, 61),
(136, 218, 133),
(137, 232, 73),
(138, 54, 73),
(139, 55, 135),
(140, 56, 31),
(141, 58, 138),
(142, 59, 45),
(143, 60, 5),
(144, 61, 5),
(145, 62, 140),
(146, 63, 142),
(147, 64, 144),
(148, 65, 20),
(149, 66, 42),
(152, 67, 128),
(153, 68, 98),
(154, 68, 99),
(155, 69, 146),
(156, 71, 149),
(157, 191, 155),
(158, 192, 155),
(159, 195, 45),
(160, 76, 61),
(161, 78, 157),
(162, 79, 138),
(163, 202, 160),
(164, 83, 162),
(165, 205, 163),
(167, 85, 165),
(168, 86, 164),
(169, 87, 5),
(170, 88, 45),
(171, 90, 167),
(172, 91, 19),
(173, 92, 170),
(174, 94, 170),
(175, 95, 173);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_engineer`
--

CREATE TABLE IF NOT EXISTS `client_engineer` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_engineer` bigint(20) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_engineer`
--

INSERT INTO `client_engineer` (`id`, `id_client`, `id_engineer`) VALUES
(4, 1, 10),
(5, 5, 10),
(6, 8, 10),
(7, 6, 9),
(14, 3, 9),
(16, 7, 9),
(28, 9, 9),
(29, 4, 9),
(30, 2, 10),
(34, 33, 10),
(35, 34, 9),
(36, 20, 9),
(41, 23, 9),
(42, 24, 10),
(43, 25, 10),
(44, 26, 10),
(45, 27, 9),
(46, 28, 10),
(47, 29, 10),
(49, 30, 10),
(51, 32, 10),
(53, 35, 10),
(54, 36, 10),
(55, 37, 9),
(56, 38, 9),
(57, 39, 10),
(58, 40, 10),
(60, 42, 10),
(61, 43, 9),
(62, 44, 9),
(63, 48, 9),
(64, 49, 9),
(65, 50, 9),
(67, 52, 9),
(68, 53, 9),
(70, 121, 10),
(72, 210, 10),
(73, 11, 9),
(74, 51, 9),
(75, 109, 10),
(76, 17, 10),
(77, 72, 10),
(78, 125, 9),
(79, 95, 10),
(80, 157, 9),
(81, 226, 12),
(82, 227, 12),
(83, 228, 12),
(84, 229, 12),
(85, 231, 12),
(86, 54, 12),
(87, 234, 12),
(88, 233, 12),
(89, 222, 12),
(90, 232, 12),
(91, 236, 12),
(92, 217, 12),
(93, 237, 12),
(94, 16, 10),
(95, 10, 9),
(96, 239, 10),
(97, 13, 10),
(98, 18, 9),
(99, 21, 9),
(100, 31, 10),
(101, 55, 10),
(102, 240, 9),
(103, 220, 12),
(104, 60, 9),
(105, 61, 10),
(106, 62, 10),
(107, 63, 10),
(108, 64, 10),
(109, 65, 10),
(110, 66, 10),
(111, 67, 10),
(112, 68, 9),
(113, 69, 9),
(114, 241, 10),
(115, 71, 10),
(116, 74, 10),
(117, 12, 10),
(118, 19, 9),
(119, 214, 10),
(120, 242, 12),
(121, 191, 10),
(122, 192, 10),
(123, 196, 9),
(124, 76, 10),
(125, 78, 10),
(126, 77, 10),
(127, 79, 9),
(128, 201, 10),
(129, 202, 9),
(130, 82, 10),
(131, 83, 9),
(132, 205, 10),
(133, 85, 9),
(134, 86, 9),
(135, 87, 10),
(136, 88, 10),
(137, 90, 10),
(138, 91, 9),
(139, 92, 10),
(140, 93, 10),
(141, 94, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_file`
--

CREATE TABLE IF NOT EXISTS `client_file` (
`id` bigint(20) unsigned NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `category` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_file`
--

INSERT INTO `client_file` (`id`, `id_client`, `category`, `url`, `description`) VALUES
(6, 3, 1, 'uploads/MAIPÚ 3641.doc', NULL),
(7, 3, 1, 'uploads/ACAPULCO complemento23.xls', NULL),
(8, 3, 1, 'uploads/ACAPULCO.xls', NULL),
(12, 223, 3, 'uploads/Indicador 1.JPG', NULL),
(13, 223, 3, 'uploads/indicador 2.JPG', NULL),
(19, 5, 1, 'uploads/ASIS R. DE STA. FE.xls', NULL),
(20, 5, 1, 'uploads/complemento27.xls', NULL),
(21, 5, 1, 'uploads/Leonardo Asis.doc', NULL),
(22, 6, 1, 'uploads/cocheras Cba..odt', NULL),
(23, 6, 1, 'uploads/cocheras Cba.-R.doc', NULL),
(24, 6, 1, 'uploads/complemento28.xls', NULL),
(25, 6, 1, 'uploads/Copia de complemento2.xls', NULL),
(26, 7, 1, 'uploads/complemento29.xls', NULL),
(27, 7, 1, 'uploads/contrato1.doc', NULL),
(28, 7, 1, 'uploads/ordenanza1.doc', NULL),
(36, 8, 1, 'uploads/Pres. Ordenanza.xls', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_type`
--

CREATE TABLE IF NOT EXISTS `client_type` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_type`
--

INSERT INTO `client_type` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-15 00:21:15', NULL, 'Potencial', ''),
(2, '2015-03-15 00:21:21', NULL, 'Activo', ''),
(3, '2015-03-15 00:22:54', NULL, 'Otros', '');

--
-- Disparadores `client_type`
--
DELIMITER //
CREATE TRIGGER `client_type_date_created` BEFORE INSERT ON `client_type`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE IF NOT EXISTS `country` (
`id` int(11) unsigned NOT NULL,
  `code` varchar(2) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `code`, `name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People''s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People''s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elevator`
--

CREATE TABLE IF NOT EXISTS `elevator` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `elevator`
--

INSERT INTO `elevator` (`id`, `date_created`, `date_deleted`, `name`, `id_client`, `description`) VALUES
(1, '2015-06-02 17:36:26', NULL, 'Ascensor 1', 165, 'Cambiar porta lamparas y poner una de bajo consumo'),
(2, '2015-06-04 08:32:22', NULL, '1', 1, NULL),
(3, '2015-06-12 12:19:27', NULL, 'Ascensor 1', 150, '12/6/15 se termino la modernización completa y se puso en funcionamiento'),
(4, '2015-06-16 17:22:29', NULL, '2', 1, NULL),
(5, '2015-06-25 18:43:21', NULL, '1', 4, NULL);

--
-- Disparadores `elevator`
--
DELIMITER //
CREATE TRIGGER `elevator_date_created` BEFORE INSERT ON `elevator`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `engineer`
--

CREATE TABLE IF NOT EXISTS `engineer` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` text,
  `birthday` datetime DEFAULT NULL,
  `address` text,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `engineer`
--

INSERT INTO `engineer` (`id`, `date_created`, `date_deleted`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-03-14 23:11:10', '2015-04-08 10:14:12', 'Lucas', 'Moyano', '', 'lucasmoyano@live.com', '2312312', '2015-03-03 00:00:00', 'dasd asd 23', 'asdasdasdasd', 12, 11, NULL, '5152'),
(2, '2015-03-14 23:14:12', '2015-03-15 03:26:41', 'asd', 'asfd', 'F', 'asf@asd.com', '234', '2015-03-11 00:00:00', 'sdfdsf', 'sfdgsd', 12, 11, NULL, ''),
(3, '2015-03-14 23:26:07', '2015-03-15 03:26:37', 'sfdsf', 'sdfdsf', NULL, 'sdfsdf@adsf.com', '345', NULL, 'dfg', 'dfg', NULL, NULL, NULL, NULL),
(4, '2015-03-14 23:28:03', '2015-04-28 02:10:24', 'Mario', 'Goneli', '', 'sdf@asdf.com', '345', NULL, 'gdgd', 'gfgfgf', NULL, NULL, NULL, ''),
(5, '2015-03-15 04:58:48', '2015-04-28 02:10:26', 'Osvaldo', 'Pugliese', '', '', '', NULL, '', '', NULL, NULL, NULL, ''),
(6, '2015-03-15 08:20:01', '2015-04-28 02:10:28', 'Lucas', 'Moyano', '', 'lucasmoyano@gmail.com', '251751100', NULL, 'Roque Saenz Peña 1131', '', NULL, NULL, NULL, ''),
(7, '2015-03-15 17:46:11', '2015-04-28 02:10:31', 'Gabriel', 'Moyano', NULL, 'gabrielmoyano@gmail.com', '35163232', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-04-09 07:59:32', '2015-04-28 02:10:34', 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-04-29 08:38:00', NULL, 'Rodolfo', 'Martin', 'M', 'rodo_martin@hotmail.com', '3512050286', NULL, '24 de Septiembre 2702', '', 12, 7, 543, '5000'),
(10, '2015-04-29 08:39:06', NULL, 'Claudio', 'Berasategui', 'M', 'cberasa@hotmail.com', '3515550395', NULL, 'Americo Vespucio 1176', '', 12, NULL, NULL, ''),
(11, '2015-06-03 08:35:09', '2015-10-08 21:05:32', 'Florentino', 'Ledesma', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-10-08 16:09:18', NULL, 'Leonardo', 'Scandaliaris', NULL, 'leoscandal@gmail.com', '3517565904', NULL, 'La Madrid', NULL, NULL, NULL, NULL, NULL);

--
-- Disparadores `engineer`
--
DELIMITER //
CREATE TRIGGER `engineer_date_created` BEFORE INSERT ON `engineer`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `tablename` varchar(64) DEFAULT NULL,
  `id_row` bigint(20) unsigned DEFAULT NULL,
  `type` char(1) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `log`
--
DELIMITER //
CREATE TRIGGER `log_date_created` BEFORE INSERT ON `log`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  `priority` tinyint(3) unsigned NOT NULL,
  `id_role` bigint(20) unsigned DEFAULT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `description` text,
  `link` varchar(2083) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notification`
--

INSERT INTO `notification` (`id`, `date_created`, `date_deleted`, `date`, `priority`, `id_role`, `id_user`, `description`, `link`) VALUES
(26, '2015-04-08 06:19:02', '2015-04-28 02:10:03', '2015-04-16 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=44'),
(27, '2015-04-08 06:20:17', '2015-04-28 02:10:04', '2015-04-09 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=45'),
(28, '2015-04-08 06:24:01', '2015-04-28 02:10:10', '2015-04-08 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=46'),
(29, '2015-04-23 01:01:23', '2015-04-28 02:09:53', '2015-04-29 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=59'),
(30, '2015-04-23 01:02:28', '2015-04-28 02:09:55', '2015-04-30 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=60'),
(31, '2015-04-23 01:07:06', '2015-04-28 02:09:59', '2015-04-28 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=61'),
(32, '2015-04-23 01:08:18', '2015-04-28 02:09:48', '2015-05-01 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=62'),
(33, '2015-04-23 01:08:30', '2015-04-28 02:09:49', '2015-05-01 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=62'),
(34, '2015-04-23 01:09:23', '2015-04-28 02:09:51', '2015-05-01 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=62'),
(35, '2015-04-23 01:09:34', '2015-04-28 02:09:57', '2015-04-28 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=63'),
(36, '2015-04-23 01:09:39', '2015-04-28 02:10:01', '2015-04-28 00:00:00', 2, 1, NULL, 'Soporte Técnico: DELL', '#/ticket/view?id=63'),
(37, '2015-05-12 15:11:23', '2015-05-14 17:37:32', '2015-04-13 00:00:00', 1, 1, 3, 'prueba', NULL),
(38, '2015-05-12 15:13:35', '2015-05-14 17:37:29', '2015-05-13 00:00:00', 1, 1, 3, 'terminal de omnibus retirar el enco', NULL),
(39, '2015-05-14 12:38:13', '2015-06-02 22:39:01', '2015-05-15 00:00:00', 1, 1, NULL, 'llamar a Robertino', NULL),
(40, '2015-06-02 17:38:06', '2015-06-09 20:57:13', '2015-06-03 00:00:00', 1, 1, 3, 'cambiar porta lamparas tebie', NULL),
(41, '2015-06-02 17:38:38', '2015-06-09 20:57:20', '2015-06-03 00:00:00', 1, 1, 3, 'cobrar Orbis y presupuesto Garcia', NULL),
(42, '2015-06-04 08:32:56', '2015-06-09 20:57:24', '2015-06-08 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=2'),
(43, '2015-06-05 08:53:27', '2015-06-09 20:57:03', '2015-06-09 00:00:00', 1, 1, 3, 'Verdi pedir llaves desala de maquin', NULL),
(44, '2015-06-05 08:54:34', '2015-06-09 20:57:10', '2015-06-09 00:00:00', 1, 1, 3, 'Lotus pedir todas las llaves', NULL),
(45, '2015-06-05 08:55:42', '2015-06-16 22:24:39', '2015-06-09 00:00:00', 1, 1, 3, 'Hablar Paula del Alfa para reemplaz', NULL),
(46, '2015-06-09 15:58:47', '2015-06-25 20:23:38', '2015-06-11 00:00:00', 1, 1, 3, 'Derqui 312 hablarpor carpintero', NULL),
(47, '2015-06-09 15:59:18', '2015-06-15 14:19:59', '2015-06-10 00:00:00', 1, 1, 3, 'TORRE MURANO', NULL),
(48, '2015-06-16 17:20:45', '2015-06-16 22:24:53', '2015-06-17 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=3'),
(49, '2015-06-16 17:21:13', '2015-06-16 22:24:50', '2015-06-17 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=3'),
(50, '2015-06-16 17:23:09', '2015-06-16 22:24:46', '2015-06-17 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=2'),
(51, '2015-06-25 18:11:37', '2015-06-25 23:11:51', '2015-06-26 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=4'),
(52, '2015-06-25 18:20:49', '2015-07-02 20:57:16', '2015-06-26 00:00:00', 2, 1, NULL, 'Soporte Técnico: Cocheras Cordoba', '#/ticket/view?id=5'),
(53, '2015-06-25 18:30:03', '2015-07-02 20:57:14', '2015-06-25 00:00:00', 2, 1, NULL, 'Soporte Técnico: 24 de Septiembre 914', '#/ticket/view?id=6'),
(54, '2015-06-25 18:32:42', '2015-06-25 23:33:16', '2015-07-02 00:00:00', 1, 1, 6, 'test', NULL),
(55, '2015-06-25 18:33:06', '2015-06-25 23:33:18', '2015-07-07 00:00:00', 2, 1, 6, 'tyjytk', NULL),
(56, '2015-06-26 13:24:20', '2015-06-26 18:24:22', '2015-06-24 00:00:00', 1, 1, 6, 'jhgfbvwhv', NULL),
(57, '2015-07-02 15:58:32', NULL, '2015-09-02 00:00:00', 3, 1, NULL, 'Cambiar cables de acero de traccion', NULL),
(58, '2015-07-27 15:01:31', NULL, '2015-05-05 00:00:00', 2, 1, NULL, 'Deuda: $2900, FUNDACION ROBERT CADE', '#/accounting-entry/view-due?id=1'),
(59, '2015-07-27 15:02:33', NULL, '2015-07-27 00:00:00', 2, 1, NULL, 'Deuda: $6000, FUNDACION ROBERT CADE', '#/accounting-entry/view-due?id=2'),
(60, '2015-07-27 15:03:03', NULL, '2015-07-27 00:00:00', 2, 1, NULL, 'Deuda: $6000, FUNDACION ROBERT CADE', '#/accounting-entry/view-due?id=2'),
(61, '2015-07-27 15:08:51', NULL, '2015-05-05 00:00:00', 2, 1, NULL, 'Deuda: $2900, FUNDACION ROBERT CADE', '#/accounting-entry/view-due?id=1'),
(62, '2015-07-28 08:43:35', NULL, '2015-07-29 00:00:00', 1, 1, NULL, 'Reunion O salguero 456 10 hs', NULL);

--
-- Disparadores `notification`
--
DELIMITER //
CREATE TRIGGER `notification_date_created` BEFORE INSERT ON `notification`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `permission`
--
DELIMITER //
CREATE TRIGGER `permission_date_created` BEFORE INSERT ON `permission`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_assigned`
--

CREATE TABLE IF NOT EXISTS `permission_assigned` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_permission` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned DEFAULT NULL,
  `id_role` bigint(20) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `permission_assigned`
--
DELIMITER //
CREATE TRIGGER `permission_assigned_date_created` BEFORE INSERT ON `permission_assigned`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Disparadores `profile`
--
DELIMITER //
CREATE TRIGGER `profile_date_created` BEFORE INSERT ON `profile`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE IF NOT EXISTS `role` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `date_created`, `date_deleted`, `name`, `description`) VALUES
(1, '2015-03-10 14:21:17', NULL, 'Administrador', '1'),
(37, '2015-03-14 11:05:40', '2015-03-14 18:54:03', 'asdasd', NULL),
(38, '2015-03-14 11:10:56', '2015-03-14 18:54:06', 'xxxx', NULL),
(39, '2015-03-14 12:06:53', '2015-03-14 18:54:09', 'sddsdsf', NULL),
(40, '2015-03-14 22:40:35', '2015-03-15 02:45:07', 'xxxx', ''),
(41, '2015-03-14 22:45:01', '2015-03-15 02:55:34', 'sssss', NULL),
(42, '2015-06-26 13:34:32', '2015-06-26 18:34:37', 'gg', NULL);

--
-- Disparadores `role`
--
DELIMITER //
CREATE TRIGGER `role_date_created` BEFORE INSERT ON `role`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE IF NOT EXISTS `state` (
`id` int(11) unsigned NOT NULL,
  `id_country` int(11) unsigned NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `id_country`, `name`) VALUES
(1, 12, 'Buenos Aires'),
(2, 12, 'Buenos Aires-GBA'),
(3, 12, 'Capital Federal'),
(4, 12, 'Catamarca'),
(5, 12, 'Chaco'),
(6, 12, 'Chubut'),
(7, 12, 'Córdoba'),
(8, 12, 'Corrientes'),
(9, 12, 'Entre Ríos'),
(10, 12, 'Formosa'),
(11, 12, 'Jujuy'),
(12, 12, 'La Pampa'),
(13, 12, 'La Rioja'),
(14, 12, 'Mendoza'),
(15, 12, 'Misiones'),
(16, 12, 'Neuquén'),
(17, 12, 'Río Negro'),
(18, 12, 'Salta'),
(19, 12, 'San Juan'),
(20, 12, 'San Luis'),
(21, 12, 'Santa Cruz'),
(22, 12, 'Santa Fe'),
(23, 12, 'Santiago del Estero'),
(24, 12, 'Tierra del Fuego'),
(25, 12, 'Tucumán');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `technician`
--

CREATE TABLE IF NOT EXISTS `technician` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` text,
  `birthday` datetime DEFAULT NULL,
  `address` text,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `technician`
--

INSERT INTO `technician` (`id`, `date_created`, `date_deleted`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-04-23 00:03:55', '2015-04-28 02:10:40', 'Matías', 'Navarro', NULL, 'matias.navarro@gmail.com', '3512325533', NULL, 'San Roque 1101', NULL, NULL, NULL, NULL, NULL),
(2, '2015-04-23 00:04:23', '2015-04-28 02:10:50', 'Edgar', 'Mendez', 'M', 'edgar.mendes@gmail.com', '324222344', NULL, 'Sarmiento 902', '', NULL, NULL, NULL, ''),
(3, '2015-04-27 21:11:06', '2015-04-28 02:11:12', 'test', 'test', NULL, 'test@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '2015-04-27 21:11:57', '2015-04-28 02:12:01', 'test', 'test', NULL, 'asd@asd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-04-27 21:14:58', '2015-04-28 02:15:00', 'asd', 'asd', NULL, 'asdasd@asd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2015-04-29 08:37:01', '2015-04-29 13:37:24', 'Rodolfo', 'Martin', NULL, NULL, '3512050286', NULL, '24 de Septiembre 2702', NULL, NULL, NULL, NULL, NULL),
(7, '2015-05-15 09:24:02', '2015-05-15 14:24:10', 'Diego', 'Leo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '2015-05-15 09:24:25', NULL, 'Diego', 'Pedroca', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '2015-05-15 09:24:42', NULL, 'Leo', 'Ontivero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-05-15 09:25:44', NULL, 'Gaston', 'Montoya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2015-05-15 09:26:00', NULL, 'Lucas', 'Montoya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '2015-05-15 09:26:13', NULL, 'Nacho', 'Caradaghian', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '2015-05-15 09:26:42', NULL, 'Omar', 'Ontivero', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2015-05-15 09:27:34', NULL, 'Marcelo', 'Morenilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '2015-05-15 09:27:47', NULL, 'Guillermo', 'Morenilla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '2015-05-15 09:28:01', NULL, 'Gringo', 'Dominguez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Disparadores `technician`
--
DELIMITER //
CREATE TRIGGER `technician_date_created` BEFORE INSERT ON `technician`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_engineer` bigint(20) unsigned DEFAULT NULL,
  `id_technician` bigint(20) unsigned DEFAULT NULL,
  `id_client` bigint(20) unsigned NOT NULL,
  `id_elevator` bigint(20) unsigned NOT NULL,
  `id_ticket_option` bigint(20) unsigned DEFAULT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `date_created`, `date_deleted`, `date`, `id_engineer`, `id_technician`, `id_client`, `id_elevator`, `id_ticket_option`, `description`) VALUES
(1, '2015-06-04 08:32:44', NULL, '2015-06-01 00:00:00', 10, 9, 1, 2, 10, 'BLA BLA'),
(2, '2015-06-04 08:32:55', NULL, '2015-06-17 00:00:00', NULL, NULL, 1, 4, NULL, 'cerradura'),
(3, '2015-06-16 17:20:45', '2015-06-25 23:12:03', '2015-06-17 00:00:00', NULL, NULL, 1, 2, NULL, 'motor quemado'),
(4, '2015-06-25 18:11:37', '2015-06-26 18:23:10', '2015-06-26 00:00:00', NULL, NULL, 1, 1, NULL, 'test'),
(5, '2015-06-25 18:20:49', '2015-06-26 18:23:12', '2015-06-26 00:00:00', NULL, NULL, 6, 1, NULL, 'test'),
(6, '2015-06-25 18:30:03', '2015-06-26 18:23:14', '2015-06-25 00:00:00', NULL, NULL, 1, 1, NULL, 'test');

--
-- Disparadores `ticket`
--
DELIMITER //
CREATE TRIGGER `ticket_date_created` BEFORE INSERT ON `ticket`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket_option`
--

CREATE TABLE IF NOT EXISTS `ticket_option` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ticket_option`
--

INSERT INTO `ticket_option` (`id`, `date_created`, `date_deleted`, `name`) VALUES
(8, '2015-03-15 05:45:26', NULL, 'No se encontró al encargado.'),
(9, '2015-03-15 05:45:26', NULL, 'Suministro eléctrico interrumpido.'),
(10, '2015-03-15 05:45:26', NULL, 'El/los ascensores se encontraban funcionando.'),
(11, '2015-03-15 05:45:26', NULL, 'El ascensor queda detenido por reparaciones.'),
(12, '2015-03-15 05:45:26', NULL, 'No se accedió a los libros de inspección.'),
(13, '2015-03-15 05:45:26', NULL, 'No se pudo acceder al edificio/dependencias.'),
(14, '2015-03-15 05:45:26', NULL, 'El ascensor, quedo en funcionamiento.');

--
-- Disparadores `ticket_option`
--
DELIMITER //
CREATE TRIGGER `ticket_option_date_created` BEFORE INSERT ON `ticket_option`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` bigint(20) unsigned NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  `id_role` bigint(20) unsigned NOT NULL,
  `password` char(16) DEFAULT NULL,
  `password_question` varchar(200) DEFAULT NULL,
  `password_answer` varchar(100) DEFAULT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `description` text,
  `id_country` int(10) unsigned DEFAULT NULL,
  `id_state` int(10) unsigned DEFAULT NULL,
  `id_city` int(10) unsigned DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `date_created`, `date_deleted`, `id_role`, `password`, `password_question`, `password_answer`, `first_name`, `last_name`, `sex`, `email`, `phone`, `birthday`, `address`, `description`, `id_country`, `id_state`, `id_city`, `zip_code`) VALUES
(1, '2015-03-10 14:21:17', NULL, 1, 'system', '', '', 'System', 'System', '', 'info@system.com', '', NULL, '', '', NULL, NULL, NULL, '5152'),
(2, '2015-03-10 14:21:17', NULL, 1, 'test', '', '', 'Administrator', 'Administrator', '', 'admin@system.com', '', '2015-03-02 00:00:00', '', '', NULL, NULL, NULL, ''),
(3, '2015-04-28 19:13:07', NULL, 1, '10904519', '', '', 'Arturo', 'Caradaghian', 'M', 'arturocaradaghian@gmail.com', '', NULL, '', '', 13, NULL, NULL, ''),
(4, '2015-04-28 19:17:28', '2015-04-29 00:21:08', 1, NULL, NULL, NULL, 'test', 'test', NULL, 'test@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-04-28 19:20:35', '2015-04-29 00:21:06', 1, 'ascensoft', NULL, NULL, 'test', 'test', NULL, 'test1@test.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '2015-04-28 19:22:40', NULL, 1, '33598419', '', '', 'Ignacio', 'Caradaghian', 'M', 'i.caradaghian@gmail.com', '3513498194', '1988-01-21 00:00:00', 'Rincon 140', 'me la aguanto un paquetaso!!!', 12, 7, 543, '5000'),
(7, '2015-04-29 08:21:51', NULL, 1, '12744650', '', '', 'Juan Carlos', 'Dominguez', '', 'juan_290158@hotmail.com', '', NULL, '', '', NULL, NULL, NULL, ''),
(8, '2015-04-29 08:23:20', NULL, 1, '34247311', '', '', 'Matias', 'Dominguez', '', 'mdominguezcrivello50@gmail.com', '', NULL, '', '', NULL, NULL, NULL, ''),
(9, '2015-06-26 13:29:17', NULL, 1, '14797104', '', '', 'Patricia', 'Cucco', 'F', 'patriciacucco@hotmail.com', '3515933180', '1960-09-11 00:00:00', '', '', 12, 7, 543, '5000');

--
-- Disparadores `user`
--
DELIMITER //
CREATE TRIGGER `user_date_created` BEFORE INSERT ON `user`
 FOR EACH ROW set new.`date_created` = now()
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_notification`
--

CREATE TABLE IF NOT EXISTS `user_notification` (
`id` bigint(20) unsigned NOT NULL,
  `id_notification` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user_notification`
--

INSERT INTO `user_notification` (`id`, `id_notification`, `id_user`, `checked`) VALUES
(19, 57, 1, 0),
(20, 57, 2, 0),
(21, 57, 3, 0),
(22, 57, 6, 0),
(23, 57, 7, 0),
(24, 57, 8, 0),
(25, 57, 9, 0),
(26, 58, 1, 0),
(27, 58, 2, 0),
(28, 58, 3, 0),
(29, 58, 6, 0),
(30, 58, 7, 0),
(31, 58, 8, 0),
(32, 58, 9, 0),
(33, 59, 1, 0),
(34, 59, 2, 0),
(35, 59, 3, 0),
(36, 59, 6, 0),
(37, 59, 7, 0),
(38, 59, 8, 0),
(39, 59, 9, 0),
(40, 60, 1, 0),
(41, 60, 2, 0),
(42, 60, 3, 0),
(43, 60, 6, 0),
(44, 60, 7, 0),
(45, 60, 8, 0),
(46, 60, 9, 0),
(47, 61, 1, 0),
(48, 61, 2, 0),
(49, 61, 3, 0),
(50, 61, 6, 0),
(51, 61, 7, 0),
(52, 61, 8, 0),
(53, 61, 9, 0),
(54, 62, 1, 0),
(55, 62, 2, 0),
(57, 62, 6, 0),
(58, 62, 7, 0),
(59, 62, 8, 0),
(60, 62, 9, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_session`
--

CREATE TABLE IF NOT EXISTS `user_session` (
`id` bigint(20) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `logon_date` datetime DEFAULT NULL,
  `logoff_date` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(413) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
 ADD PRIMARY KEY (`id`), ADD KEY `id_business` (`id_business`), ADD KEY `id_client` (`id_client`), ADD KEY `id_account_type` (`id_account_type`);

--
-- Indices de la tabla `account_type`
--
ALTER TABLE `account_type`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `administrator`
--
ALTER TABLE `administrator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `business`
--
ALTER TABLE `business`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
 ADD PRIMARY KEY (`id`), ADD KEY `id_state` (`id_state`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`), ADD KEY `id_client_type` (`id_client_type`);

--
-- Indices de la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`), ADD KEY `id_administrator` (`id_administrator`);

--
-- Indices de la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`), ADD KEY `id_engineer` (`id_engineer`);

--
-- Indices de la tabla `client_file`
--
ALTER TABLE `client_file`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `client_type`
--
ALTER TABLE `client_type`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `elevator`
--
ALTER TABLE `elevator`
 ADD PRIMARY KEY (`id`), ADD KEY `id_client` (`id_client`);

--
-- Indices de la tabla `engineer`
--
ALTER TABLE `engineer`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`id`), ADD KEY `id_role` (`id_role`), ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `permission`
--
ALTER TABLE `permission`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
 ADD PRIMARY KEY (`id`), ADD KEY `id_permission` (`id_permission`), ADD KEY `id_user` (`id_user`), ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`);

--
-- Indices de la tabla `technician`
--
ALTER TABLE `technician`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
 ADD PRIMARY KEY (`id`), ADD KEY `id_engineer` (`id_engineer`), ADD KEY `id_client` (`id_client`), ADD KEY `id_elevator` (`id_elevator`), ADD KEY `id_ticket_option` (`id_ticket_option`), ADD KEY `id_technician` (`id_technician`);

--
-- Indices de la tabla `ticket_option`
--
ALTER TABLE `ticket_option`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD KEY `id_role` (`id_role`), ADD KEY `id_country` (`id_country`), ADD KEY `id_state` (`id_state`), ADD KEY `id_city` (`id_city`);

--
-- Indices de la tabla `user_notification`
--
ALTER TABLE `user_notification`
 ADD PRIMARY KEY (`id`), ADD KEY `id_notification` (`id_notification`), ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `user_session`
--
ALTER TABLE `user_session`
 ADD PRIMARY KEY (`id`), ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `account_type`
--
ALTER TABLE `account_type`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `administrator`
--
ALTER TABLE `administrator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT de la tabla `business`
--
ALTER TABLE `business`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2383;
--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT de la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT de la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=142;
--
-- AUTO_INCREMENT de la tabla `client_file`
--
ALTER TABLE `client_file`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT de la tabla `client_type`
--
ALTER TABLE `client_type`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT de la tabla `elevator`
--
ALTER TABLE `elevator`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `engineer`
--
ALTER TABLE `engineer`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `notification`
--
ALTER TABLE `notification`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT de la tabla `permission`
--
ALTER TABLE `permission`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `profile`
--
ALTER TABLE `profile`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `technician`
--
ALTER TABLE `technician`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `ticket_option`
--
ALTER TABLE `ticket_option`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `user_notification`
--
ALTER TABLE `user_notification`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `user_session`
--
ALTER TABLE `user_session`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accounting_entry`
--
ALTER TABLE `accounting_entry`
ADD CONSTRAINT `accounting_entry_ibfk_1` FOREIGN KEY (`id_business`) REFERENCES `business` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `accounting_entry_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `accounting_entry_ibfk_3` FOREIGN KEY (`id_account_type`) REFERENCES `account_type` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `administrator`
--
ALTER TABLE `administrator`
ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `administrator_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `administrator_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city`
ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_administrator`
--
ALTER TABLE `client_administrator`
ADD CONSTRAINT `client_administrator_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_administrator_ibfk_2` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_engineer`
--
ALTER TABLE `client_engineer`
ADD CONSTRAINT `client_engineer_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `client_engineer_ibfk_2` FOREIGN KEY (`id_engineer`) REFERENCES `engineer` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_file`
--
ALTER TABLE `client_file`
ADD CONSTRAINT `client_file_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `elevator`
--
ALTER TABLE `elevator`
ADD CONSTRAINT `elevator_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `engineer`
--
ALTER TABLE `engineer`
ADD CONSTRAINT `engineer_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `engineer_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `engineer_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `notification`
--
ALTER TABLE `notification`
ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `permission_assigned`
--
ALTER TABLE `permission_assigned`
ADD CONSTRAINT `permission_assigned_ibfk_1` FOREIGN KEY (`id_permission`) REFERENCES `permission` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `permission_assigned_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `permission_assigned_ibfk_3` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `profile`
--
ALTER TABLE `profile`
ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `state`
--
ALTER TABLE `state`
ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `technician`
--
ALTER TABLE `technician`
ADD CONSTRAINT `technician_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `technician_ibfk_2` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `technician_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
ADD CONSTRAINT `technician_ibfk_5` FOREIGN KEY (`id_technician`) REFERENCES `technician` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_engineer`) REFERENCES `engineer` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_elevator`) REFERENCES `elevator` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`id_ticket_option`) REFERENCES `ticket_option` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`id_city`) REFERENCES `city` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_notification`
--
ALTER TABLE `user_notification`
ADD CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`id_notification`) REFERENCES `notification` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_session`
--
ALTER TABLE `user_session`
ADD CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
