-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2024 a las 19:12:22
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
-- Base de datos: `camikakis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE DATBASE `camikakis`;
USE `camikakis`;

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camisetas`
--

CREATE TABLE `camisetas` (
  `id` int(11) NOT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `year_inicio` int(11) DEFAULT NULL,
  `year_fin` int(11) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camisetas`
--

INSERT INTO `camisetas` (`id`, `equipo_id`, `year_inicio`, `year_fin`, `version`, `precio`, `estado`) VALUES
(203, 1, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(204, 1, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(205, 2, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(206, 2, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(207, 3, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(208, 3, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(209, 4, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(210, 4, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(211, 5, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(212, 5, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(213, 6, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(214, 6, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(215, 7, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(216, 7, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(217, 8, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(218, 8, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(219, 9, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(220, 9, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(221, 10, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(222, 10, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(223, 11, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(224, 11, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(225, 12, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(226, 12, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(227, 13, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(228, 13, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(229, 14, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(230, 14, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(231, 15, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(232, 15, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(233, 16, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(234, 16, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(235, 17, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(236, 17, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(237, 18, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(238, 18, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(239, 19, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(240, 19, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(241, 20, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(242, 20, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(243, 21, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(244, 21, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(245, 22, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(246, 22, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(247, 23, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(248, 23, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(249, 24, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(250, 24, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(251, 25, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(252, 25, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(253, 26, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(254, 26, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(255, 27, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(256, 27, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(257, 28, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(258, 28, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(259, 29, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(260, 29, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(261, 30, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(262, 30, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(263, 31, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(264, 31, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(265, 32, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(266, 32, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(267, 33, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(268, 33, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(269, 34, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(270, 34, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(271, 35, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(272, 35, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(273, 36, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(274, 36, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(275, 37, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(276, 37, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(277, 38, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(278, 38, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(279, 39, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(280, 39, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(281, 40, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(282, 40, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(283, 41, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(284, 41, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(285, 42, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(286, 42, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(287, 43, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(288, 43, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(289, 44, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(290, 44, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(291, 45, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(292, 45, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(293, 46, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(294, 46, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(295, 47, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(296, 47, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(297, 48, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(298, 48, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(299, 49, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(300, 49, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(301, 50, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(302, 50, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(303, 51, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(304, 51, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(305, 52, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(306, 52, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(307, 53, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(308, 53, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(309, 54, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(310, 54, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(311, 55, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(312, 55, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(313, 56, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(314, 56, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(315, 57, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(316, 57, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(317, 58, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(318, 58, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(319, 59, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(320, 59, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(321, 60, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(322, 60, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(323, 61, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(324, 61, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(325, 62, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(326, 62, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(327, 63, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(328, 63, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(329, 64, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(330, 64, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(331, 65, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(332, 65, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(333, 66, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(334, 66, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(335, 67, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(336, 67, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(337, 68, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(338, 68, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(339, 69, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(340, 69, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(341, 70, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(342, 70, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(343, 71, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(344, 71, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(345, 72, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(346, 72, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(347, 73, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(348, 73, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(349, 74, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(350, 74, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(351, 75, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(352, 75, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(353, 76, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(354, 76, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(355, 77, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(356, 77, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(357, 78, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(358, 78, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(359, 79, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(360, 79, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(361, 80, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(362, 80, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(363, 81, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(364, 81, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(365, 82, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(366, 82, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(367, 83, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(368, 83, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(369, 84, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(370, 84, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(371, 85, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(372, 85, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(373, 86, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(374, 86, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(375, 87, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(376, 87, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(377, 88, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(378, 88, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(379, 89, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(380, 89, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(381, 90, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(382, 90, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(383, 91, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(384, 91, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(385, 92, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(386, 92, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(387, 93, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(388, 93, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(389, 94, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(390, 94, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(391, 95, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(392, 95, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(393, 96, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(394, 96, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(395, 97, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(396, 97, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(397, 98, 2023, 2024, 'LOCAL', 19.99, 'normal'),
(398, 98, 2023, 2024, 'VISITANTE', 19.99, 'normal'),
(399, 1, 1970, 2000, 'TEST', 0.00, 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camiseta_talla`
--

CREATE TABLE `camiseta_talla` (
  `camiseta_id` int(11) NOT NULL,
  `talla_id` int(11) NOT NULL,
  `stock` int(10) NOT NULL,
  `ventas` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camiseta_talla`
--

INSERT INTO `camiseta_talla` (`camiseta_id`, `talla_id`, `stock`, `ventas`) VALUES
(203, 1, 42, 0),
(203, 2, 79, 0),
(203, 3, 68, 0),
(203, 4, 1, 0),
(204, 1, 6, 0),
(204, 2, 28, 0),
(204, 3, 22, 0),
(204, 4, 27, 0),
(205, 1, 68, 0),
(205, 2, 56, 0),
(205, 3, 77, 0),
(205, 4, 16, 0),
(206, 1, 51, 0),
(206, 2, 5, 0),
(206, 3, 74, 0),
(206, 4, 52, 0),
(207, 1, 41, 0),
(207, 2, 49, 0),
(207, 3, 23, 0),
(207, 4, 67, 0),
(208, 1, 66, 0),
(208, 2, 26, 0),
(208, 3, 35, 0),
(208, 4, 99, 0),
(209, 1, 88, 0),
(209, 2, 42, 0),
(209, 3, 49, 0),
(209, 4, 17, 0),
(210, 1, 38, 0),
(210, 2, 38, 0),
(210, 3, 77, 0),
(210, 4, 70, 0),
(211, 1, 19, 0),
(211, 2, 87, 0),
(211, 3, 78, 0),
(211, 4, 25, 0),
(212, 1, 96, 0),
(212, 2, 2, 0),
(212, 3, 26, 0),
(212, 4, 24, 0),
(213, 1, 40, 0),
(213, 2, 28, 0),
(213, 3, 20, 0),
(213, 4, 17, 0),
(214, 1, 25, 0),
(214, 2, 77, 0),
(214, 3, 5, 0),
(214, 4, 96, 0),
(215, 1, 64, 0),
(215, 2, 31, 0),
(215, 3, 66, 0),
(215, 4, 35, 0),
(216, 1, 76, 0),
(216, 2, 76, 0),
(216, 3, 53, 0),
(216, 4, 36, 0),
(217, 1, 22, 0),
(217, 2, 2, 0),
(217, 3, 48, 0),
(217, 4, 30, 0),
(218, 1, 5, 0),
(218, 2, 39, 0),
(218, 3, 79, 0),
(218, 4, 78, 0),
(219, 1, 51, 0),
(219, 2, 22, 0),
(219, 3, 56, 0),
(219, 4, 15, 0),
(220, 1, 8, 0),
(220, 2, 97, 0),
(220, 3, 56, 0),
(220, 4, 93, 0),
(221, 1, 95, 0),
(221, 2, 94, 0),
(221, 3, 84, 0),
(221, 4, 40, 0),
(222, 1, 49, 0),
(222, 2, 25, 0),
(222, 3, 81, 0),
(222, 4, 25, 0),
(223, 1, 87, 0),
(223, 2, 56, 0),
(223, 3, 18, 0),
(223, 4, 25, 0),
(224, 1, 70, 0),
(224, 2, 72, 0),
(224, 3, 53, 0),
(224, 4, 46, 0),
(225, 1, 75, 0),
(225, 2, 32, 0),
(225, 3, 39, 0),
(225, 4, 100, 0),
(226, 1, 79, 0),
(226, 2, 98, 0),
(226, 3, 48, 0),
(226, 4, 51, 0),
(227, 1, 9, 0),
(227, 2, 95, 0),
(227, 3, 44, 0),
(227, 4, 38, 0),
(228, 1, 58, 0),
(228, 2, 77, 0),
(228, 3, 8, 0),
(228, 4, 11, 0),
(229, 1, 31, 0),
(229, 2, 20, 0),
(229, 3, 10, 0),
(229, 4, 89, 0),
(230, 1, 12, 0),
(230, 2, 99, 0),
(230, 3, 55, 0),
(230, 4, 78, 0),
(231, 1, 25, 0),
(231, 2, 95, 0),
(231, 3, 95, 0),
(231, 4, 92, 0),
(232, 1, 72, 0),
(232, 2, 85, 0),
(232, 3, 8, 0),
(232, 4, 87, 0),
(233, 1, 7, 0),
(233, 2, 78, 0),
(233, 3, 65, 0),
(233, 4, 94, 0),
(234, 1, 72, 0),
(234, 2, 77, 0),
(234, 3, 69, 0),
(234, 4, 16, 0),
(235, 1, 74, 0),
(235, 2, 19, 0),
(235, 3, 74, 0),
(235, 4, 12, 0),
(236, 1, 41, 0),
(236, 2, 69, 0),
(236, 3, 19, 0),
(236, 4, 92, 0),
(237, 1, 1, 0),
(237, 2, 30, 0),
(237, 3, 48, 0),
(237, 4, 50, 0),
(238, 1, 7, 0),
(238, 2, 85, 0),
(238, 3, 2, 0),
(238, 4, 58, 0),
(239, 1, 83, 0),
(239, 2, 37, 0),
(239, 3, 41, 0),
(239, 4, 93, 0),
(240, 1, 41, 0),
(240, 2, 26, 0),
(240, 3, 7, 0),
(240, 4, 57, 0),
(241, 1, 64, 0),
(241, 2, 49, 0),
(241, 3, 54, 0),
(241, 4, 22, 0),
(242, 1, 48, 0),
(242, 2, 76, 0),
(242, 3, 33, 0),
(242, 4, 40, 0),
(243, 1, 0, 0),
(243, 2, 84, 0),
(243, 3, 13, 0),
(243, 4, 19, 0),
(244, 1, 56, 0),
(244, 2, 19, 0),
(244, 3, 30, 0),
(244, 4, 92, 0),
(245, 1, 66, 0),
(245, 2, 58, 0),
(245, 3, 90, 0),
(245, 4, 74, 0),
(246, 1, 2, 0),
(246, 2, 90, 0),
(246, 3, 42, 0),
(246, 4, 40, 0),
(247, 1, 76, 0),
(247, 2, 58, 0),
(247, 3, 63, 0),
(247, 4, 40, 0),
(248, 1, 10, 0),
(248, 2, 34, 0),
(248, 3, 37, 0),
(248, 4, 84, 0),
(249, 1, 6, 0),
(249, 2, 82, 0),
(249, 3, 91, 0),
(249, 4, 7, 0),
(250, 1, 65, 0),
(250, 2, 0, 0),
(250, 3, 10, 0),
(250, 4, 49, 0),
(251, 1, 13, 0),
(251, 2, 19, 0),
(251, 3, 57, 0),
(251, 4, 25, 0),
(252, 1, 56, 0),
(252, 2, 5, 0),
(252, 3, 58, 0),
(252, 4, 75, 0),
(253, 1, 0, 0),
(253, 2, 77, 0),
(253, 3, 84, 0),
(253, 4, 87, 0),
(254, 1, 85, 0),
(254, 2, 62, 0),
(254, 3, 56, 0),
(254, 4, 94, 0),
(255, 1, 0, 0),
(255, 2, 22, 0),
(255, 3, 8, 0),
(255, 4, 77, 0),
(256, 1, 59, 0),
(256, 2, 62, 0),
(256, 3, 33, 0),
(256, 4, 81, 0),
(257, 1, 3, 0),
(257, 2, 75, 0),
(257, 3, 64, 0),
(257, 4, 93, 0),
(258, 1, 75, 0),
(258, 2, 96, 0),
(258, 3, 52, 0),
(258, 4, 74, 0),
(259, 1, 14, 0),
(259, 2, 49, 0),
(259, 3, 3, 0),
(259, 4, 70, 0),
(260, 1, 39, 0),
(260, 2, 85, 0),
(260, 3, 6, 0),
(260, 4, 78, 0),
(261, 1, 71, 0),
(261, 2, 21, 0),
(261, 3, 95, 0),
(261, 4, 9, 0),
(262, 1, 62, 0),
(262, 2, 84, 0),
(262, 3, 30, 0),
(262, 4, 0, 0),
(263, 1, 13, 0),
(263, 2, 65, 0),
(263, 3, 83, 0),
(263, 4, 19, 0),
(264, 1, 49, 0),
(264, 2, 89, 0),
(264, 3, 95, 0),
(264, 4, 5, 0),
(265, 1, 47, 0),
(265, 2, 15, 0),
(265, 3, 38, 0),
(265, 4, 44, 0),
(266, 1, 4, 0),
(266, 2, 89, 0),
(266, 3, 33, 0),
(266, 4, 99, 0),
(267, 1, 93, 0),
(267, 2, 68, 0),
(267, 3, 61, 0),
(267, 4, 3, 0),
(268, 1, 33, 0),
(268, 2, 55, 0),
(268, 3, 76, 0),
(268, 4, 12, 0),
(269, 1, 36, 0),
(269, 2, 42, 0),
(269, 3, 2, 0),
(269, 4, 86, 0),
(270, 1, 23, 0),
(270, 2, 58, 0),
(270, 3, 20, 0),
(270, 4, 26, 0),
(271, 1, 72, 0),
(271, 2, 81, 0),
(271, 3, 87, 0),
(271, 4, 93, 0),
(272, 1, 2, 0),
(272, 2, 36, 0),
(272, 3, 71, 0),
(272, 4, 45, 0),
(273, 1, 12, 0),
(273, 2, 28, 0),
(273, 3, 4, 0),
(273, 4, 36, 0),
(274, 1, 66, 0),
(274, 2, 24, 0),
(274, 3, 21, 0),
(274, 4, 34, 0),
(275, 1, 9, 0),
(275, 2, 42, 0),
(275, 3, 84, 0),
(275, 4, 91, 0),
(276, 1, 4, 0),
(276, 2, 49, 0),
(276, 3, 33, 0),
(276, 4, 16, 0),
(277, 1, 82, 0),
(277, 2, 61, 0),
(277, 3, 58, 0),
(277, 4, 9, 0),
(278, 1, 74, 0),
(278, 2, 38, 0),
(278, 3, 72, 0),
(278, 4, 43, 0),
(279, 1, 99, 0),
(279, 2, 66, 0),
(279, 3, 32, 0),
(279, 4, 66, 0),
(280, 1, 29, 0),
(280, 2, 51, 0),
(280, 3, 66, 0),
(280, 4, 78, 0),
(281, 1, 91, 0),
(281, 2, 19, 0),
(281, 3, 24, 0),
(281, 4, 62, 0),
(282, 1, 37, 0),
(282, 2, 2, 0),
(282, 3, 0, 0),
(282, 4, 94, 0),
(283, 1, 69, 0),
(283, 2, 63, 0),
(283, 3, 7, 0),
(283, 4, 46, 0),
(284, 1, 11, 0),
(284, 2, 19, 0),
(284, 3, 60, 0),
(284, 4, 41, 0),
(285, 1, 26, 0),
(285, 2, 6, 0),
(285, 3, 55, 0),
(285, 4, 54, 0),
(286, 1, 4, 0),
(286, 2, 60, 0),
(286, 3, 89, 0),
(286, 4, 61, 0),
(287, 1, 42, 0),
(287, 2, 24, 0),
(287, 3, 98, 0),
(287, 4, 13, 0),
(288, 1, 76, 0),
(288, 2, 36, 0),
(288, 3, 53, 0),
(288, 4, 59, 0),
(289, 1, 36, 0),
(289, 2, 5, 0),
(289, 3, 15, 0),
(289, 4, 60, 0),
(290, 1, 55, 0),
(290, 2, 97, 0),
(290, 3, 17, 0),
(290, 4, 97, 0),
(291, 1, 32, 0),
(291, 2, 70, 0),
(291, 3, 54, 0),
(291, 4, 61, 0),
(292, 1, 40, 0),
(292, 2, 19, 0),
(292, 3, 75, 0),
(292, 4, 16, 0),
(293, 1, 58, 0),
(293, 2, 39, 0),
(293, 3, 21, 0),
(293, 4, 91, 0),
(294, 1, 87, 0),
(294, 2, 63, 0),
(294, 3, 55, 0),
(294, 4, 87, 0),
(295, 1, 69, 0),
(295, 2, 83, 0),
(295, 3, 8, 0),
(295, 4, 94, 0),
(296, 1, 41, 0),
(296, 2, 26, 0),
(296, 3, 7, 0),
(296, 4, 59, 0),
(297, 1, 73, 0),
(297, 2, 88, 0),
(297, 3, 21, 0),
(297, 4, 41, 0),
(298, 1, 42, 0),
(298, 2, 88, 0),
(298, 3, 12, 0),
(298, 4, 98, 0),
(299, 1, 51, 0),
(299, 2, 63, 0),
(299, 3, 59, 0),
(299, 4, 8, 0),
(300, 1, 66, 0),
(300, 2, 3, 0),
(300, 3, 20, 0),
(300, 4, 93, 0),
(301, 1, 0, 0),
(301, 2, 24, 0),
(301, 3, 22, 0),
(301, 4, 35, 0),
(302, 1, 11, 0),
(302, 2, 52, 0),
(302, 3, 23, 0),
(302, 4, 60, 0),
(303, 1, 29, 0),
(303, 2, 66, 0),
(303, 3, 44, 0),
(303, 4, 20, 0),
(304, 1, 69, 0),
(304, 2, 85, 0),
(304, 3, 15, 0),
(304, 4, 23, 0),
(305, 1, 73, 0),
(305, 2, 92, 0),
(305, 3, 39, 0),
(305, 4, 21, 0),
(306, 1, 91, 0),
(306, 2, 89, 0),
(306, 3, 73, 0),
(306, 4, 97, 0),
(307, 1, 64, 0),
(307, 2, 28, 0),
(307, 3, 51, 0),
(307, 4, 72, 0),
(308, 1, 3, 0),
(308, 2, 3, 0),
(308, 3, 8, 0),
(308, 4, 30, 0),
(309, 1, 24, 0),
(309, 2, 32, 0),
(309, 3, 88, 0),
(309, 4, 43, 0),
(310, 1, 53, 0),
(310, 2, 35, 0),
(310, 3, 16, 0),
(310, 4, 76, 0),
(311, 1, 31, 0),
(311, 2, 27, 0),
(311, 3, 42, 0),
(311, 4, 30, 0),
(312, 1, 26, 0),
(312, 2, 39, 0),
(312, 3, 15, 0),
(312, 4, 59, 0),
(313, 1, 48, 0),
(313, 2, 64, 0),
(313, 3, 74, 0),
(313, 4, 78, 0),
(314, 1, 68, 0),
(314, 2, 4, 0),
(314, 3, 21, 0),
(314, 4, 93, 0),
(315, 1, 100, 0),
(315, 2, 18, 0),
(315, 3, 95, 0),
(315, 4, 15, 0),
(316, 1, 96, 0),
(316, 2, 30, 0),
(316, 3, 64, 0),
(316, 4, 28, 0),
(317, 1, 49, 0),
(317, 2, 62, 0),
(317, 3, 63, 0),
(317, 4, 27, 0),
(318, 1, 49, 0),
(318, 2, 63, 0),
(318, 3, 65, 0),
(318, 4, 39, 0),
(319, 1, 0, 0),
(319, 2, 84, 0),
(319, 3, 18, 0),
(319, 4, 41, 0),
(320, 1, 49, 0),
(320, 2, 22, 0),
(320, 3, 66, 0),
(320, 4, 61, 0),
(321, 1, 6, 0),
(321, 2, 51, 0),
(321, 3, 33, 0),
(321, 4, 15, 0),
(322, 1, 76, 0),
(322, 2, 34, 0),
(322, 3, 44, 0),
(322, 4, 16, 0),
(323, 1, 51, 0),
(323, 2, 3, 0),
(323, 3, 66, 0),
(323, 4, 18, 0),
(324, 1, 93, 0),
(324, 2, 9, 0),
(324, 3, 68, 0),
(324, 4, 10, 0),
(325, 1, 50, 0),
(325, 2, 16, 0),
(325, 3, 34, 0),
(325, 4, 19, 0),
(326, 1, 97, 0),
(326, 2, 23, 0),
(326, 3, 28, 0),
(326, 4, 70, 0),
(327, 1, 67, 0),
(327, 2, 24, 0),
(327, 3, 18, 0),
(327, 4, 22, 0),
(328, 1, 54, 0),
(328, 2, 2, 0),
(328, 3, 52, 0),
(328, 4, 54, 0),
(329, 1, 12, 0),
(329, 2, 1, 0),
(329, 3, 70, 0),
(329, 4, 44, 0),
(330, 1, 11, 0),
(330, 2, 25, 0),
(330, 3, 94, 0),
(330, 4, 89, 0),
(331, 1, 64, 0),
(331, 2, 55, 0),
(331, 3, 83, 0),
(331, 4, 46, 0),
(332, 1, 85, 0),
(332, 2, 86, 0),
(332, 3, 76, 0),
(332, 4, 18, 0),
(333, 1, 68, 0),
(333, 2, 82, 0),
(333, 3, 4, 0),
(333, 4, 79, 0),
(334, 1, 82, 0),
(334, 2, 70, 0),
(334, 3, 5, 0),
(334, 4, 17, 0),
(335, 1, 72, 0),
(335, 2, 3, 0),
(335, 3, 5, 0),
(335, 4, 16, 0),
(336, 1, 65, 0),
(336, 2, 74, 0),
(336, 3, 77, 0),
(336, 4, 62, 0),
(337, 1, 79, 0),
(337, 2, 9, 0),
(337, 3, 10, 0),
(337, 4, 22, 0),
(338, 1, 81, 0),
(338, 2, 36, 0),
(338, 3, 38, 0),
(338, 4, 84, 0),
(339, 1, 4, 0),
(339, 2, 71, 0),
(339, 3, 40, 0),
(339, 4, 88, 0),
(340, 1, 17, 0),
(340, 2, 23, 0),
(340, 3, 65, 0),
(340, 4, 56, 0),
(341, 1, 84, 0),
(341, 2, 49, 0),
(341, 3, 97, 0),
(341, 4, 34, 0),
(342, 1, 81, 0),
(342, 2, 0, 0),
(342, 3, 60, 0),
(342, 4, 97, 0),
(343, 1, 5, 0),
(343, 2, 39, 0),
(343, 3, 77, 0),
(343, 4, 66, 0),
(344, 1, 1, 0),
(344, 2, 10, 0),
(344, 3, 46, 0),
(344, 4, 100, 0),
(345, 1, 60, 0),
(345, 2, 99, 0),
(345, 3, 14, 0),
(345, 4, 78, 0),
(346, 1, 46, 0),
(346, 2, 96, 0),
(346, 3, 39, 0),
(346, 4, 11, 0),
(347, 1, 38, 0),
(347, 2, 55, 0),
(347, 3, 61, 0),
(347, 4, 40, 0),
(348, 1, 16, 0),
(348, 2, 60, 0),
(348, 3, 54, 0),
(348, 4, 89, 0),
(349, 1, 81, 0),
(349, 2, 38, 0),
(349, 3, 48, 0),
(349, 4, 27, 0),
(350, 1, 91, 0),
(350, 2, 73, 0),
(350, 3, 91, 0),
(350, 4, 34, 0),
(351, 1, 1, 0),
(351, 2, 3, 0),
(351, 3, 12, 0),
(351, 4, 53, 0),
(352, 1, 26, 0),
(352, 2, 71, 0),
(352, 3, 79, 0),
(352, 4, 79, 0),
(353, 1, 59, 0),
(353, 2, 59, 0),
(353, 3, 18, 0),
(353, 4, 12, 0),
(354, 1, 9, 0),
(354, 2, 9, 0),
(354, 3, 20, 0),
(354, 4, 70, 0),
(355, 1, 91, 0),
(355, 2, 41, 0),
(355, 3, 37, 0),
(355, 4, 59, 0),
(356, 1, 85, 0),
(356, 2, 45, 0),
(356, 3, 70, 0),
(356, 4, 17, 0),
(357, 1, 76, 0),
(357, 2, 26, 0),
(357, 3, 2, 0),
(357, 4, 35, 0),
(358, 1, 69, 0),
(358, 2, 40, 0),
(358, 3, 94, 0),
(358, 4, 47, 0),
(359, 1, 56, 0),
(359, 2, 37, 0),
(359, 3, 16, 0),
(359, 4, 72, 0),
(360, 1, 9, 0),
(360, 2, 33, 0),
(360, 3, 38, 0),
(360, 4, 90, 0),
(361, 1, 32, 0),
(361, 2, 95, 0),
(361, 3, 74, 0),
(361, 4, 86, 0),
(362, 1, 6, 0),
(362, 2, 78, 0),
(362, 3, 69, 0),
(362, 4, 9, 0),
(363, 1, 39, 0),
(363, 2, 71, 0),
(363, 3, 34, 0),
(363, 4, 59, 0),
(364, 1, 93, 0),
(364, 2, 87, 0),
(364, 3, 56, 0),
(364, 4, 19, 0),
(365, 1, 28, 0),
(365, 2, 86, 0),
(365, 3, 41, 0),
(365, 4, 48, 0),
(366, 1, 18, 0),
(366, 2, 47, 0),
(366, 3, 82, 0),
(366, 4, 65, 0),
(367, 1, 79, 0),
(367, 2, 0, 0),
(367, 3, 68, 0),
(367, 4, 36, 0),
(368, 1, 80, 0),
(368, 2, 88, 0),
(368, 3, 100, 0),
(368, 4, 35, 0),
(369, 1, 76, 0),
(369, 2, 74, 0),
(369, 3, 43, 0),
(369, 4, 94, 0),
(370, 1, 40, 0),
(370, 2, 18, 0),
(370, 3, 73, 0),
(370, 4, 6, 0),
(371, 1, 15, 0),
(371, 2, 58, 0),
(371, 3, 44, 0),
(371, 4, 46, 0),
(372, 1, 100, 0),
(372, 2, 60, 0),
(372, 3, 100, 0),
(372, 4, 17, 0),
(373, 1, 91, 0),
(373, 2, 100, 0),
(373, 3, 26, 0),
(373, 4, 33, 0),
(374, 1, 88, 0),
(374, 2, 38, 0),
(374, 3, 26, 0),
(374, 4, 19, 0),
(375, 1, 14, 0),
(375, 2, 17, 0),
(375, 3, 42, 0),
(375, 4, 61, 0),
(376, 1, 76, 0),
(376, 2, 95, 0),
(376, 3, 48, 0),
(376, 4, 56, 0),
(377, 1, 37, 0),
(377, 2, 16, 0),
(377, 3, 70, 0),
(377, 4, 0, 0),
(378, 1, 92, 0),
(378, 2, 58, 0),
(378, 3, 15, 0),
(378, 4, 0, 0),
(379, 1, 58, 0),
(379, 2, 90, 0),
(379, 3, 75, 0),
(379, 4, 3, 0),
(380, 1, 95, 0),
(380, 2, 61, 0),
(380, 3, 22, 0),
(380, 4, 27, 0),
(381, 1, 69, 0),
(381, 2, 65, 0),
(381, 3, 16, 0),
(381, 4, 87, 0),
(382, 1, 85, 0),
(382, 2, 62, 0),
(382, 3, 55, 0),
(382, 4, 92, 0),
(383, 1, 91, 0),
(383, 2, 80, 0),
(383, 3, 27, 0),
(383, 4, 97, 0),
(384, 1, 0, 0),
(384, 2, 15, 0),
(384, 3, 72, 0),
(384, 4, 16, 0),
(385, 1, 64, 0),
(385, 2, 70, 0),
(385, 3, 60, 0),
(385, 4, 88, 0),
(386, 1, 60, 0),
(386, 2, 35, 0),
(386, 3, 99, 0),
(386, 4, 86, 0),
(387, 1, 34, 0),
(387, 2, 12, 0),
(387, 3, 59, 0),
(387, 4, 59, 0),
(388, 1, 17, 0),
(388, 2, 10, 0),
(388, 3, 1, 0),
(388, 4, 74, 0),
(389, 1, 67, 0),
(389, 2, 12, 0),
(389, 3, 62, 0),
(389, 4, 74, 0),
(390, 1, 81, 0),
(390, 2, 82, 0),
(390, 3, 66, 0),
(390, 4, 84, 0),
(391, 1, 23, 0),
(391, 2, 66, 0),
(391, 3, 58, 0),
(391, 4, 94, 0),
(392, 1, 93, 0),
(392, 2, 81, 0),
(392, 3, 27, 0),
(392, 4, 96, 0),
(393, 1, 95, 0),
(393, 2, 87, 0),
(393, 3, 51, 0),
(393, 4, 96, 0),
(394, 1, 24, 0),
(394, 2, 33, 0),
(394, 3, 93, 0),
(394, 4, 65, 0),
(395, 1, 45, 0),
(395, 2, 33, 0),
(395, 3, 31, 0),
(395, 4, 54, 0),
(396, 1, 79, 0),
(396, 2, 28, 0),
(396, 3, 8, 0),
(396, 4, 57, 0),
(397, 1, 57, 0),
(397, 2, 16, 0),
(397, 3, 12, 0),
(397, 4, 10, 0),
(398, 1, 15, 0),
(398, 2, 46, 0),
(398, 3, 83, 0),
(398, 4, 77, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_alta` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competiciones`
--

CREATE TABLE `competiciones` (
  `id` int(11) NOT NULL,
  `localizacion` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `competiciones`
--

INSERT INTO `competiciones` (`id`, `localizacion`, `nombre`) VALUES
(1, 'España', 'La Liga'),
(2, 'Inglaterra', 'Premier League'),
(3, 'Italia', 'Serie A'),
(4, 'Alemania', 'Bundesliga'),
(5, 'Francia', 'Ligue 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`) VALUES
(1, 'Real Madrid'),
(2, 'FC Barcelona'),
(3, 'Atlético Madrid'),
(4, 'Real Sociedad'),
(5, 'Villarreal CF'),
(6, 'Real Betis'),
(7, 'Valencia CF'),
(8, 'Sevilla FC'),
(9, 'Athletic Club'),
(10, 'Celta de Vigo'),
(11, 'RCD Mallorca'),
(12, 'Getafe CF'),
(13, 'Rayo Vallecano'),
(14, 'Deportivo Alavés'),
(15, 'Granada CF'),
(16, 'CA Osasuna'),
(17, 'UD Almería'),
(18, 'UD Las Palmas'),
(19, 'Girona FC'),
(20, 'Elche CF'),
(21, 'Manchester United'),
(22, 'Manchester City'),
(23, 'Liverpool'),
(24, 'Arsenal'),
(25, 'Chelsea'),
(26, 'Tottenham Hotspur'),
(27, 'Everton'),
(28, 'Leeds United'),
(29, 'Aston Villa'),
(30, 'Newcastle United'),
(31, 'West Ham United'),
(32, 'Crystal Palace'),
(33, 'Wolverhampton Wanderers'),
(34, 'Leicester City'),
(35, 'Southampton'),
(36, 'Burnley'),
(37, 'Nottingham Forest'),
(38, 'Sheffield United'),
(39, 'Brighton & Hove Albion'),
(40, 'Fulham'),
(41, 'Juventus'),
(42, 'Inter de Milán'),
(43, 'AC Milan'),
(44, 'Roma'),
(45, 'Napoli'),
(46, 'Lazio'),
(47, 'Atalanta'),
(48, 'Fiorentina'),
(49, 'Torino'),
(50, 'Venezia'),
(51, 'Sampdoria'),
(52, 'Udinese'),
(53, 'Hellas Verona'),
(54, 'Genoa'),
(55, 'Bologna'),
(56, 'Cagliari'),
(57, 'Empoli'),
(58, 'Lecce'),
(59, 'Monza'),
(60, 'Salernitana'),
(61, 'Bayern Munich'),
(62, 'Borussia Dortmund'),
(63, 'RB Leipzig'),
(64, 'Bayer Leverkusen'),
(65, 'Eintracht Frankfurt'),
(66, 'VfL Wolfsburg'),
(67, 'Borussia Mönchengladbach'),
(68, 'Hertha Berlin'),
(69, 'Schalke 04'),
(70, 'SC Freiburg'),
(71, 'VfB Stuttgart'),
(72, '1. FC Köln'),
(73, '1. FSV Mainz 05'),
(74, '1899 Hoffenheim'),
(75, 'Werder Bremen'),
(76, 'Augsburg'),
(77, 'Union Berlin'),
(78, 'Arminia Bielefeld'),
(79, 'Hamburger SV'),
(80, 'Fortuna Düsseldorf'),
(81, 'Paris Saint-Germain'),
(82, 'Olympique de Marseille'),
(83, 'Olympique Lyonnais'),
(84, 'AS Monaco'),
(85, 'Lille OSC'),
(86, 'Stade Rennais'),
(87, 'OGC Nice'),
(88, 'Montpellier HSC'),
(89, 'RC Lens'),
(90, 'Stade de Reims'),
(91, 'FC Nantes'),
(92, 'AS Saint-Étienne'),
(93, 'Toulouse FC'),
(94, 'RC Strasbourg'),
(95, 'Angers SCO'),
(96, 'Clermont Foot'),
(97, 'FC Lorient'),
(98, 'ESTAC Troyes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_competicion`
--

CREATE TABLE `equipo_competicion` (
  `equipo_id` int(11) NOT NULL,
  `competicion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipo_competicion`
--

INSERT INTO `equipo_competicion` (`equipo_id`, `competicion_id`) VALUES
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
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(77, 4),
(78, 4),
(79, 4),
(80, 4),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(88, 5),
(89, 5),
(90, 5),
(91, 5),
(92, 5),
(93, 5),
(94, 5),
(95, 5),
(96, 5),
(97, 5),
(98, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `nombre_archivo` varchar(255) NOT NULL,
  `tipo_mime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `imageable_type`, `imageable_id`, `ruta`, `nombre_archivo`, `tipo_mime`) VALUES
(1, 'App\\Models\\Camiseta', 203, '/img/camisetas/madrid.webp', 'madrid.webp', 'image/webp'),
(2, 'App\\Models\\Camiseta', 204, '/img/camisetas/madrid2.webp', 'madrid2.webp', 'image/webp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_finalizado` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_camiseta_talla`
--

CREATE TABLE `pedido_camiseta_talla` (
  `pedido_id` int(11) NOT NULL,
  `camiseta_id` int(11) NOT NULL,
  `talla_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `dorsal` int(11) DEFAULT NULL,
  `nombre_camiseta` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre_permiso` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre_rol`) VALUES
(2, 'administrador'),
(1, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('02LcIU5YE1DvhpLgF5Q0v6TG2LWVbeDVTHgZCSoc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZllFNHhXU0lmbjY1TU9VRkZSd2lHb3p2cTh1T3ZUWlBRbjhYMjF2WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469788),
('0bTf4i5pgY4PpWKhOSpRdeegaF8BaN1lpQsdyvAV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1JNVkRWMTNEQktZbXBkOVhtVFdrTHQwRHFlQnFtME00U3BCZDdzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469973),
('0Gsy8MPKMHqiufoMCwhOXelTFQs6ofdE0AjGaBBE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUJYMmhDWDNwY3gwZllEZTNwbTNyMHhaMkpqTm85d2ZOMlBCZXh3RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468851),
('0kcFlkS2xaoa164SjcQ43BgJBzRO4YKsahQQhwAq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2JmVE9DUVJzRWdJcUVNME1JU0ZuNlByeWZxUHZ1OE1hN1gzb0MxdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468851),
('0sQjfJQJ3RK20tsAKpZeC4zglLHwcIQjHPo9KOAJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclNuZm53RXlESVQxRkRWc3Y5Q05TWEVKOWJIT3JudjM5bFdHTnVJRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467606),
('0sXxB65PnNhuQa11ecAQf04xelMa3VgWBuQkA8oL', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkc2dVJvQkJQdnRJRklnWTVNclFLVDlWRDJUSmVVWDJ5QlpVTmR1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467756),
('1Neuln3K7tm6DjCGRsLMmP6xoc7GlPxpsUWiM1aV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGZUSHZvdG1TU1FVS0swYjJ4QU9JeGNOMFJQRTFrTGZHUzNIRDVYUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468515),
('2OEvJAR20Tn3TU3YI4iYoHG9QXN4TWSSue1K8p9N', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMVhadVhGUVNXNm0yWWFaQWppVFg3QzRNRVgyQkdPZERNYjJ3SUpYaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472784),
('2YrD5eYXjO1lkHW8YwWrKJ9R5mMK47kdyyaUG7gG', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWnYxVTlocWx6MVNPQlh6dEl2UGtPOWM0a3JmZE5KRVVuTGdwZDBicSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472076),
('340vIGMzvLqjLhiScAWR7T4qip1biIL3GefkTlpO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3I0eE9Gbll5T3BPNHAwQzN0ZUVzdzRENzFBMVNNaXVnMnlGUVN1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468621),
('34c6cpSItMuuswni35WQBsMBwlONee542P69gvua', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzBLRGZUbU54SmowNE9oYTQxblVwUTZtWnByNFFxanBkbFlxTVJRRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469048),
('4AwjfzScqTZ1APmKvM0gt7tUsj7zui2tcw8tiYNI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzBqeXkwdjVEUFZBZVZvSXdkSmhzSWtSTmpmSzlCU3FPTFpWekJ1ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468131),
('4DKipC8VIKh85TcUlhde9TZV2Oc4CZi6e0rD2raf', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0JhOHUwMk8zWDVoMXhoeGRHU29ucmxpbTlIV3hpUXJoWm1RTmpKayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473898),
('4MF5fDwIDxqojbKsz43AZ8K1zDpy7PVYdrpqCoAM', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1kzWGQyM1d1VW5LcFpjT1ZNeTNhaTZqdmVKNnpDeHpXMmh2ekkxRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473832),
('4op78pd4U7wm0P3kWIRzojt47pvY1b4xcNo7DqNU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTE5eW9IYldNSFlncEV6NzZwUDh1cnQxMm16SjRvODR5aHVDT0pSSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470692),
('4QZLVC9y41eDxmsQf2RU26utjzJIilpLldGBBOz8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWkzMm5BeEF3WEpBV3p0c3VtcmRETWZhdng1SWxZWnVPOFhaZURXUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470239),
('4R6gv1enipJud4rDpwAgZ5LsG3f1pqOcjF0iFuPY', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU5oMEw5eDcxZzFjMENDb1k1QUNiS3RJOUFkNmJYOHUyR3JIejhVMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474270),
('5KGVOH8r5lPgyBjMl1ZK6oxA5IlxAoV563PacX1i', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVJkeW4xVEhJSEhsRWlDdFZFdGNCaUhHaDB0clB1RnhXYkdLdUhlcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469973),
('5tJdG2jlGR9mAYK3oLKMR4okxpUE8RG9l3vOFLMC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREdtdFUxZ0cyR0g3elBFbzc0cWpHbzFxaGp3YVVxQ08yR01FWWxQUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469691),
('65ntNOSgvl4fZGGCqIMVr8c6xqhKNThfAazPjK90', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjIwMmtHajFvRXc5R2NnRHJnWTZ5ZEloYldtbmU4alZuMUpVRFRFZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469671),
('69uXHU8QMRPtvX98BcDNYRJSeTIo5gpsCKmq7sU3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTVORGRPQVY2eVV3NkZ1TE1ESlZvTmNsN2JrbjZ1ZU1Ed1RObXFaUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469153),
('7QJUpFp8RkdKDj5RFElZbcG9pIyzJUH97AvcNhQT', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielNjQ011S1RVSmRqRHp3aWZINlRkZzJ2SGt1N2g5b1d6ZHM2cGtVZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474136),
('7YygOcQ14TKD35NZ0V1OakEj8bqapzXFl6uSl5WZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlFabEVJc0NpWGt5NnI4WXBPUEFYRkxzd2dpaHRyMnNHRWZNZnU0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469048),
('7zGdfFaL4h9KM64Kw0l2bsGQHJ1gNHCmosifQhUi', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlNNN29FNUR6UGV0d1ZNZkQxMjFReTVXNGZSVE1IUzVNVlZWdGpTVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474323),
('8fmeoUsdY2b7c7JUEQRzYeiqLHzAyJwhMTP6zYmL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHUyWHh1enMxQ0Z6dzVYSkE2dzNyNVZNVmV3NEVoQ2pXb0RFRU5SWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469784),
('8IDEegGuEgHm6JRGFnCHUwKIDonl5QwqCiJRBkHw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWpMdHJiWDh5bFZvOGcxYTFDaWQzS3p3a2o2ZnY1S1lCQlZqdU1LNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469546),
('8oQUrCANLb8LThfe6hAipUOWEa9ZIctNzbcdWjgk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFRDUFhJd0FUV2YxYTgwbW9uZHlDRU85WWdzQVN6QU4wd1dQUmh0USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468284),
('8v3ALnIRygjLUQMN0IrFuxssuIzmyOq6Tle64wpc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXZwcTg4cFlYalIxczMwTW90a0V3STc0aFFhQmZRM0dmRVZHVkQ1MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469975),
('8Yh25h0RQNVsNHnfYGGzisw1oHhIExfAqAMUqJ9d', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUtvSFNCT2pPbk5uSHJWNDBpMnZtVkR5cmdNWG85RmlPNDhzVlU4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470683),
('978YEl2gkUXMfi0hqIoaf9HHsn9qTWulsvXkSXhp', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNE5mU3kxWks3dzhHTTJrV0xGSjhpVEtyUG9jdnQyQW04SjF3SWRsbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471642),
('9LnFKvpwJdhVYhtQbn89E1p6kxEkqcbm07hhW5M8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXB5dllKYldpTWMyVms4NVY0TkNlTlFwR2lnTm5hbGFjSXBwVkJnVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470060),
('9sqe79Te3y2Q7p8ZIsKcCzSgC25SC8twhPFoYMAA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGlwUVI5a0pNQmhRZTdDbDVKQUVobE9hQjdBMjh2TmloMGNvakxlcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469308),
('ab4gVZhTR33EN2WahQB3WVJOPz9NJlJQ91tjGmOB', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielJwbG1tdExkbTFLaVE4QVAzQ2h5Z1ZneXhFUzVOZ2VycFhDS1dZbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467110),
('AbLqVrbTdtCGcV4OyyHHCOKdfRAfW104t4tBJ2Hb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlBDajVRV2FmQmNVSHlVNHg4UmYwdWRQNUdZRjVhU1hHOEtEZERRdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468392),
('abnAjlRWSW1HsbbZu7lcpqS5WP2dIkheoujEpmwY', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazZsNW5sT01tWllEZDdtYjBjNnl1Rmh5anM4dm1iTFdPbGdxVVRISSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474313),
('ASLsGmzGCrFCHBCDn12mohybYzLMAlSoEmiRpBpC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZRVkdVR1NYaVk0NXdieHNPcVNtdmU5U0xON1ZQUzdRMUdVQ2htaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470101),
('bQdNfYUnS0HDmhNNR58nJLsxaJhXDmnAxsaINLNK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1kyakpRT3Z5dklVVDFaRGFSSjZ5N1ZtajV2Mk5uUDF3TFJIa2twZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468893),
('btBXa3rktx6zj3R5iMGX5rAMUlhtsYmuNjQmSfma', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaXRhaU1RTjFvNDJVQkVXQWhQM0tQcUYwMnU0UXBmNk5oN3VuVDVWYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473127),
('Bvk02zh7JiWNjeiQVyKDAR3M1p9mNxkLfxyYtlZA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2Y3WGEybTlvQnBMVEIyM05VeWRCQkI2d2dUaHcyQkhOMkMxMTJtayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469154),
('bWkuNPT3BgXBB9Mllqnxo2uBVY8Jo6ACq64uHCfm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGpnVnVnY1Q3WVdBVTVGS0lIeTUzZUxUdEE5UW9MNmpMbFA1bkExYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469424),
('c0E8rzPJMtzp0DnG2WXobhzo0L8VwJVhQJgWhmNv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWV2MHYzQk9pbWFxOVZiWDRwYmQyeGFpcEx6cFZxN3NUZUg2VFluUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468392),
('CBQWZEKGsW7rdvbGMIj9Z4YExZ8YsIMJpke3487k', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUs5dmU1TW52ODR0ZTBPVUpBOFVSeXdyZ0kzUnM5TmlKQ2lCQjBjVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732466830),
('CMl0zABJKgoLbfjbwRQ8CaBh6PNgPyNajIZNTYg1', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ViZmZ5aE5xUFJ1U1Z3dktzSnQxY0JVWE9QSXFtdUR6dG14RFZvRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470778),
('CrurpRfA3NfhX2iOAdRWlgVn8lr7yFGHK389kJKF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmFPSmk0aHROTjJHcnpnZEJwZ0tLaWFoakNVenhKTGlCRElTb0tscSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469456),
('CtNHxCtl88u43bAOGy81GawCSNb99lVmu25jdzPh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlJrMjY4dG41RVhXcTN1RkpBOFVieGRENFoxWTZqM3FjQUZjc3pSOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469975),
('D5yrSYuT8YymR8DuI0v30PfEBzheI8CQm4ihYSJS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzRMNTFXanRjZ1ZsbFRkOWdnOGp5ZnJ2VWdOVzVGdnFUdEpXa3IzSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470014),
('dhpyuXjfUqCmETnVm4tAB8uHtboQJXbOmuCMDxbo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnFDeVhDRVRGT0hBbGd1Q09ndVpIWjZqMWYzS1pjYkczOFN0NklmYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469671),
('dyKe3XMSyjQ1hvW8CNxRYOjVq7d9iPv7cMwCGTzo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUwwMVlLaElXZWJEcm9LbkNrcnc5aFRjdGNQOEYycnpDTUtiNkYxNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468128),
('Edwb4Gtqjb6lr95KVpJJioE1s6YEwWP8oOdLg8qA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjZ6WFZESXRmT25sbEFxRmJVajZOTnNab3BQNUc0V3RJamQzSEZ2ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469043),
('eTDHdxmlH9GktsaMhKf2dAczex1SNE25cslyS5sS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHV6QW9Fczc3TVVZRFYzNlFlVGJ6OVZGVk9OU0tpMU12c2JpbmJydiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468852),
('F3bYfb1rnRluqo6ndlLLsSCG2yH7y6FtH2FszFUC', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVBpQ0I0ZUREWk1IcVBvSGNMengwV0RGenlWMk1rbE82MVRpaUdMViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473832),
('f5pyN4BlhhVpgicn5Ph8GTDAO1lLmbGvu2D8rRBW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2tDdjlJVDdWazlROFpRWFRFc0RhU3UwdVFlWElTSW9WY3V3Uk1KaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468260),
('fJkwGNR4ZrOEkm6yV7oGzJ9LWICT1WbnfWdSSGG5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0RLcWRTY2xBRVNneXV3SzdWMHVKM3I3T1FXUXJZaElVWmRtbzVZOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468131),
('fqnCfj1IB1TIIhIAm8jJhk6mmybMyHDpM5INVCXD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTFTdkRCVVlRRE5sQnBmM1VWZEVIRGFBZnd2cGlDODNvNWZ4WFlJVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470036),
('fXBgt8dzziE3Pm5DPFZANpXElE7kLzcL987hHgVn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREVqbkdDWG5zS1dLUEVVN05DcjRQdzQzdGpjcXd3dE41bFZJRUxTMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468259),
('FxHoffQErg2vJJNiKcP6LAquCyPqevVUHqAqGuMM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2thUXdTODN6NkZEZ3pMNWxTNVJ6eFFuZXgxaTIyU1l1YkxqN0t6ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473791),
('fXSfsZ1nXEnIcvqd4MW9C0cdZRLRYMqtMwF4YFgk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTJKSW43clNJcFVUeG5jMDVyb3c0MzhvSEJmOHVFTE0xRTFNZ21uaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469154),
('g8aggOvuxcImsxkf8QuRKC1hdLlBwoOwWgvNkGEY', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUVBuN3k5a0xJc2pnaUxzbGZmWkZwaFZVaDVxUTNMSm1DWUhuRlk2bCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471982),
('gBx10w7v7osNNSpyH9UaXlH5J9qC14UZRuqXy90X', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVFHYlB0OE81Y0ZCa2JHa1lGZjlsV2wwNGcwQzJYaDZYOVJORmhaWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469307),
('GloAAAtRvhXQ4UTzJaDlKGOcx8ElRz3X8wHiA4hv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGdhUEJRNlBGa0xhNmFTUjJUWXZoRVpJVzA4ZnFDaDJhUGxPbEpPUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470784),
('gZvRtUNKqij8U1i8XyWZvT1AOm05rUada9z9Qux6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakpub0t6N0piYmZTZHlhdHRsTWVVUG9aZkdaSktjWG5CMWZVVlpmbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469975),
('h0I7KGyJXc7S1E1GpwlQh6YBGjaiuZkOSOKzho7b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidExlT1p1VXJwR1RrU0VPemYxcFlVUTJZNG43b0pLczR0N3c3a3djeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468392),
('H4A6Pvr8HkhAWLcFqSigD5XqLNBw2XuhSU7mhiEf', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYzM2UVRPdm10bWxZOHBJcVlwc21Xc2ZFUmZGQ0JPdDJNMjF2VlJ1TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472782),
('hmEHQkdvmBNzgjuT5XUgj3qGhCaJLygP9rHi3PYU', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFRGaFY3ZldBV0ZuUHpqSjN6N1FnUE5vWDdvdHVPZWxJRktsdjRCRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732466903),
('hnCrzO0Es6qb6xZglhbyBVMp5VLiUuskYdHhrQoZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWVRZ2ZlQTAxYmhRTFJXaDNlemdXWEdxSk5GWTBHUjl5VGVPQUF4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469425),
('HXsqncUkjHGkngsJD2BXFYBXIwqrZ8NLYHhsUYGu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGQ4ejdDZVpudzdkbktDZjUxdGR4N2hSREJTM21MQ01wZ3pVQ0pEYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469684),
('I1LuHI2XGCMELQ51YKpluYuZEWzIGqT0iqEsMWGa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTZkcW9oTnVQejRNZ25yNzNhR2pJcmhQTVkxUjBLc1lMMTdyb1d5SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469788),
('ipLsIgD4QwOOvab27K1XWvBFoezHQBdcpLeRNM3L', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjZNdUpiWEVoaFFGN0Fhem5xd3hQNmFWSDJYY2laWll0WFNCbHVuOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470036),
('jruKnFsOv9bmuhfpX0NncJfLIvlFMlfgHtK18eCV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3FaaE1BdmhsNlJKNjF4czhyN0hPbFNXZ0ZwQVplUVRPM2pqTGo1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468514),
('jtfQg6XriXfZZqSYA7K8AuX9mggvzKkPxat5ZsSk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEZ0dkkyVnp6R2g1eUluaEZZOEFxTml2ZzNzd2NnMHYyYmVSOFFJSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470061),
('K96qTMWPWez39pld8DNBlGJPbJmwAixGY2btoptF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDNteE41ZEtJT0p1SVBKbTN2WmthdjkzUUE5azU0VDhJWW5PUEFjQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469691),
('KfyAmr6YEjjVXUZ5gPZdaKlT4sqMmybOFM8DTqg9', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV1BOVVhuUlNGR2xVNmZzUXY2SEpqWTFqcE9ZZ0tzRGNHNlM5RDlnWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471710),
('Kmbw0ObSEh7j5zU2ff5cWMCKfn7P9ZhzxF00LLi6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXpURWtLaEx3cThlYXpzS09DWUk2YjN4a2ZXeXp1UFNXZmtpdUdOQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469307),
('KMSJdnUt3k6xWBWFRSkIkx693p0jZLgU2Trc6S1T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYThzYVllS3JRWGFSMXhEOU9xazNGTFNSUE8zaTRjcWNNZFhuVGliTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469424),
('ks4blAq8tOoEERuzVGUxySk7goRynkIuBAH4NLds', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGNvbWMzWmh3TXJzbkFieGM0Nk5qbXc0a25zN21CeXZHWmlqbmNoMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732466682),
('kyRXZjV8dWzo2ht3lVuMXIhlcYHsQNArOmGbZsNc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnlRWDgyY09KRHRrcVpYalRHekZoRlBCdU0wU3QzaENjY1JJVWViViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469048),
('KZbIYslx7fJVDycjhy4OD4QILJmwc38Xu326TZ1B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzNJekFNVnVkS0g0UEY0NGlMcjAwajF1Q1pKOHhHVHRoa202RHVlRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468282),
('LAMBNaaLrqzOBen5ToIvvaBkUtznnEHxuCyZABPT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1JNYlJ0U1Z3M1lBOHBjcnh6SnFSNlV0VkFSMUFocExZQWJJQjBlbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469545),
('LCoGEvDjiAdusJfiONAcBSWwOmiFo6PSPL3qXFa8', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHZhcTdkQUFyREVRbjdVelZoaUJDTFpHRTZwb0poeUxWOVdtdjEybSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473832),
('LeAZmCmr19xgozk40HZmL0nJTLGqu3GIu5Ehw4Xs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFJVYjZRVjRGVjBrcVZKUVlDSHdBVWdWaGk2WkZxWmtYYkQ4NFpMeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468284),
('Lgkzqk3xtqYA4hoQfOc1U9POevZ1YCeeP3LX2cue', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2diTnFZa1hjTzNtRTZ4U2NlN1B1c2NBSFk3TE1lRXo5dXZCdTBZbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468282),
('Lh8ZFGQe4WjHZi8iOL8eOIQUEshOPJeTuIb2eTed', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjltMHhuMUR3a0NwbU5RRHVsdFJ1MU83eWpXeWJpQUlPb3hwOEdiUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467667),
('LKWtE69dGEF7bToMHBBCERe0Z85udfr1WfBzSWqn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFRHWXNVZG83R0g3MEVCUmh3c2RQcnhGS1NteHptNng5V1FCYnVnbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473787),
('LqPUxmG1X0tF80NSKYzo9h57d2oQbiNW3J74eX8o', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid2hxdFQ5T0VLWjZQajhKM0lyeG9iT2tvVmZZdDZpVDVib2g2aXZZaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471983),
('lR8fAUGjqBtdLbw4urpKDeR5RIvtUpCpJ8xgeWY9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSk5sZ1BnNm5kOXlENG10U3A4bDZTNVRzUm1VeW51ZUh5NUloWGRwVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468893),
('LUOXksMA7fwcVdSfHLYwlfOWWxr2prpzd611TcM9', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaE9TaVptNWFMRFJPQVZUNjFPZ3BoaktlODVRYXRDeWQ3M1V6anp0ZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473242),
('lVe648T1gI1LjG8FAcKjT1cGqbhoawcFANe73zM2', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRHFNbGFUbERPQ3JWQ3BPQ25BZGJ1QVluM0RNYm5sbVJBZ1pCTzFGQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473331),
('lYdmwMFosgq0lhMIdaxWkHObrUjMa3DjCbyLm8ru', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ0hHcFQzNXJnVjJXSHFSbUNHWHhQb1M1NzBxaDBDa2FmMzJwTkkwcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472780),
('m4WBzsZrvxL0JVEB2XN7fWJbwuhhwgJ0bKCa06kl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVVyWFhndjNoRkVJNExJMld6RnlhanRNSndvZzJZOG9RekduQk9FTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473819),
('maFr4NYQCoU0ILBGfyCDE8o2TR6vUoysRymVKI2w', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFdKY3l5QkY5VzFjRlF1bDRJYmM5MTFrTzlkUEVabXZmU1FwU1pFSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469456),
('MMSfv2euzoDSOK1YEF5o6pYKFXSJVwDWtLfYSJ9U', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblVHaEVFMlBBZ1kyUTJ5aEk5SWdLRnNCSGdlOWVLQWc2WWQ2WnAzMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468893),
('MtiFLIXkSV1paYmM56GWp83OtflZqY9vkkYt9vpp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjBzZDdOQ0lNUENrSVIyYXJKWUJlN2ozaVRUTkFVeGRmdWtYWm1FUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468130),
('MVk8J5oLmmKJruPI1ivtd3Yp6J9HukwJSB9MXfzL', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUhOaUFQOUpQM2VFbDVCczN5aW5GQ2VHZFF5MHdEVjZHYzRjVE0xMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473624),
('MX5Aisstl6nvh0PIlJgIoZsTnk3xq5rCbttSqS1G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTZyQUFJYVFYVXZYZWJJeHJyRDNWV1ZXRWM5V3p1RDJOZ09hRFh6ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468514),
('Mz6eWxxqWn3tNwYMNbT0qoXPymajxQrtWsg7lLEm', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR1FrVUY0cnNVUmlEeEdnSlVhZTVVNm5ubFhITEZrbXBoWWtXYmpONCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472543),
('n1sROyEmkM2yFjj95Ksb9FFWOny1g9gKzXFW0KXw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDNrOUszUU1hVGRoRHRyekpRV2JvQUtPM3pOZm9ZT0NKNUIzcHB4eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468624),
('n3QbQxc4hLEQ0n7mr4RDqNE3AWIF6QBgokFbDcVI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmZLSUdEUm5jbFZWMlB3dzI0TkxMUWZsemtkNDloVnVZUVpGZ3M4ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470239),
('N4X2LBiRhJNcF4kM22zg1sb1C0z3hPPDKXrVbduD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoick5tc2s4RkprSlZkWDR6VEc0dElKZEhZTGZhSGhtdUFhc2FtenhwVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470240),
('ng06GALYA8MTK2t5cEqNN0gP9s0NXPi3cDwlOxTh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2lsdXdBbDhudWRwRkowREhiNHNEUVZPWDZDM2pHZndyUUFqaWFlYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470014),
('nGcbVdL2SadcbPlmlgyyf63wRQsfPluIunBeXyTH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0s5ZmVxc3RYa0tJaVdLNlVhS0V1c3FPSXkzZWtaYVlRUXA3YTlRRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469974),
('o7Ba82tWMDe4fTvrE0rfEeqV7z7cBlzmqIO54kC8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGJycVFsVldhOTBlaVNGRG92dDlJbFRWZWNicFQ2UHFMWm0zeHQzNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468128),
('o9hiTWr9OfXF4rUCg7riAT0JDIrf0ek5hxCMYwSE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3htOU1PRHlpdXZ0ak8yTTYyazZnUjFTb0kwNHJEMk53VWdrcTU4MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473810),
('Ojtx0HlDP6K5HsJRt2SYN6BtdXyDdch4ciAVW1Vq', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzVlRUY1b3BXNjBKRHA0a2dFckQwQTUwMVRnNjA5c0RKV1RCUEFSbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474035),
('onu3BxcHmagj2Y83z3fiIa2LvGfhKGsdka0q2rwq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUlFSEpwYlVFaHM0VGRqV1N3ZEt0WlhSd2lCcnZYaFFoTXZJSFRJTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468284),
('OwY1PQseMwMK4bVxsnjlreZGX52Ho7i3IcEGiRN6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDJPQjEyNmQ4cDRrN25FcVN4YXNROEZWNkxEQUZvWGIzb3FVeHhWOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468620),
('P0zd3SJwZKnH9GvaIwMAf0LKWZyBgSC8crbRhdt7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHl4dEh5b2VoSnZ4S3JteGVITWFVaEtWMTVsNFdOMld0a1RaUjlHUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469784),
('pI1sReBVpwX26goOqwigVPfUCIhpe13Rkby2HtSv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemg2Q2E4bGFDeGwwSHFWTWVuRDJPQUMzdVNXUUZWVzBubVNwVzN2MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467968),
('pimOJisge0YGaUhH5tIv5tgVt4J3qokLQ4vn3h4N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFo3bFV0cG9mMEhkQXYzbmlQZ3F5QzM0eUdJSlZjU1NhVTQxYTBPOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469683),
('PJqDwaZmNHDPLdNsd3ze7SwMfupwHMx0vWGdIerD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0t6UTdiek12RHpFdU9kZ2VRQjdTcVNyOUt1aE94bWxHcnczQUZPOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468620),
('pjXoiI0WIEddrsOvbxnJerdVYuNMXVgnjm018uH3', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRW03N2xDQjdRWjNlbFZ1U3VmaGtBMUxPMXVzb1FNUUtXMmF6aGhLVyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472968),
('PmSbwoN3yu95i9mJ05wRlgGnmehCDRefbQGRv8LV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWZlUTlpcFhJdVdCM0FHS0wyRk5JdjlmZGw1M2ZmSEFYM3NHSTZhSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469042),
('polzxeW4OPYNI8TgILQ3l9vCwJHSkOtM4tWf4hJ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzVxZHN5VFBCbkgxdmZ2eGJyTkVTS28xQzlmY3VDcjcyZm5wVDRhaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473981);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QmKnGYSVJuPNsKOy8aepiciAaR3NN9PfxOC5EORo', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiR2tubGN2VnI3NWxjSnNtVHpac09iVzV0VHhUd21nSjRVNlRBSG1QQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473286),
('QWssF58QzHvHAVCH7LIw6wE6beFguE7xQubA14jd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGg3MWR1ZU5nbHd5RlloYUpEZ1lPT0pPWWpjZGdYanlzUmhGbGh4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473793),
('RcUqKVC64QzUf2nqfmAfmpWuY7WIGPf0Tlka6oRH', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1VhSlFoSjBOQWpSU2xrdFNEVkl3akk5YkI4SzY4aVBTYW5DQWVYRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470778),
('RlpLAZtgjWogw5jlrsDNIEbKekM2Puil5SpGpbpI', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmFqSVhXYXBMRmo4aUpVRzJadFhFSVJPa3lob01UYmpDYmhiTTFFTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471685),
('Rrm5rtlwiP17dr1sgtjqOce1ETlzMiQ8Hm9wgcm1', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWFwcHc1SFZGMW5tR3BjdUpuTTdIQnNSbzh3RWhWMHJHR1c5QU9taCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732467503),
('rXg9LzJNJT5aVidMSyi1vThtIVLlNFXjNZyIaC6m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDdhUkJkaDF4a1ZSN0FhVXViWW0yZUxUb0luWkN1UzE0NlRnSVZZWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470061),
('SAMr8BRlvJCHBPOgaoBkzgSS7p6zx5ntr51LpiLc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXJLOTAycTE5Sk42UEZ3WXEzTUp3eXhhY0k1ZDFJMjRrRmxYTlFDcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469042),
('SdF2HLulC3p2mA9MXXiTk1gdhDJuWHXggX1OMqhz', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWlrTWdhOTZleFJWMVp1bFJFdmtlSHpjZEVOUFhSRFh1WEpCZ3dIbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474295),
('SEqes2Lv7vlU5zMxPAg8RnPWKwV6Hv4jKQp4RShT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk81RU9qWXRWQ3F3eHU4OFpyeUVpTnZucjVMaHhENnd6QUtEWFUwbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469545),
('sFNkPpl8pYeAncKDQE5JNLBlJzuYXpsUeC6RZTpZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicmxhbkw4SWlKSWU1WjFzTWUxWEpLSklNVTZLTmVzUkhTVXlwZVNPcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471656),
('suXo1TCVmZRRLRvPfAtF9MQOfcjYto0T9VxdQDLf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjFNcVR4MXA2b2hUbGhDUHhHUmRFOGJIZ1FqckVPQlFvT3B3N3NObiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470692),
('SxwOTx99vrlrDbvDnaCL3q5UlVKpDbwpfUb6Oms1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFNoQnA3UlNtejdlbk1md0hWenliUkFmYlBjeU9RYjM2RnF6ZGhvViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473791),
('T5t7XVgoTbdPU8PcDEtSBp8SwnbbiIU4fmW07c7v', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVjd6alFBRWU1eEhEaWhpdzVScXRmVGhweHd1bUZSQ3BDd1F6ZHgwTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472419),
('T9OB9nOn3781N0XZnlWjOKyJygPQwImbIMEknKar', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkNDRURJNEM4cTd5b3N0Tm5CbmdRS2c3WEhvdTkxcHQzM2FFdkNVbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468259),
('TayL9MqHb9j1Ren5hqGV6LnjTJPQQ0r3nUg8Tkqv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHBjZXduaGpmQUlqem54aXNycVFDTjdhRnJYekQyOVFmZHFYZnB1biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470101),
('TcVWJqVacIiHysyD3VPtUDvLg5AEg3SnVET94Ihm', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWHQwMkh4Y3A2cndNa1FWSXN6T2pOeXIzQVVJRnF3dlNBMTdVaUVwdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472893),
('TKvDYoQxQxNz2L5WkPmiKBwFYVLLBUUyMEQ6386P', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGxncTB2cjg2dm1qcXBjVmQxbkxpTlN3akMxUkpQbmhmMkFlVjUwdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474006),
('Tm0jaqqA8lmFbSHHfCjZ6TYv0vGB9bwrgOYW9cMP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWhNODZkOURESmp6SzdEdXowaEdYNU5BQzE4SXMzUmVlWkg0WUdRSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470036),
('tmF5jPvBzoMg4AxdlGZCTtOID5j0lkL0Nl9XkJM9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkpsNUdSOWRyRG9adXk4V1lXNDhpVU1kUW1ROU1vbmtjS1M2SHZOUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468282),
('tqhZyv9sLUqg12XhDmCJdivIAKAIJqMKiwGvuKdF', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidGlkT3VZZDBJZERzVGZkMXZwblNuS0s5QjNEZkZKRVhTN0E3SERONiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472581),
('trl7ZqX3UFXnYO4vk5yqdRE9vXuHwVKwU6KgJn6U', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDVLN21PN1NhMXZ6YURkWW5RaUV2RWpJOGRGcnFvc0o1OWp3eFBDNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469691),
('TsL44kET1ftxeNdgRcqSpJiz9DcnT1YODmiW8PhN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemdwVVVSbXB3aUU2eTNvSkMzMk1VVm1MbUJKMVo3QlZITVZGZ2t4MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469671),
('UCzaM59OBkjKyMn8vmTfNcnw7TcbxnIvXWv5vehN', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHcxa01WNVV0TXpzZ0Z0TFhpdFVrdWtCWHVFYW51ZEU0TXFTUWxaWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470778),
('UgFLB0SWP1ZbvXtrY5ICHoqPdgTBTqeozY9nSb4p', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1lERmpzaDZQMDVIaWxuV1lxb0cyeVJZZFlLNDVuVFJSVktnYXZPViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468624),
('uin6oL5L5ZzCDDBNETks8flBfeXjGlx036xFklFe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkdRVVd3a1JUMjIwemNYTzFQZ3hleWduWVFNTWI3bzZtNnRMNkdVaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468128),
('uqEB81h3RYxG5SonUQHTYOLsA1yKDA9XQf8ne9Bw', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaEtnbGxhSjBsS3RmcXhFVGxMNFN2MU5yclpDanBFck5NaVhWQkVVTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471560),
('UWTc2P0XO5fodpHx0UwR86gR1u1ivI4GA9obzeLG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREhHdTBxYzN1czhod0hIZkRpUVNiV2RBUDhpT2VKR1cxNVdCcGVWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470102),
('vBRX53Rc89SKFJTSl2T5Md2yJzfbZDljhdNVLwEx', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzh5aVk3NTVna3FFcHZWakNSUWNDajd2QWFLUjYzMnRnR3F3THZJVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473825),
('vEXMj78DgsxwCCAgs46FRAd5MCNGajt3ZaemVFQd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGNQU0dzTTM3SG9YeDJ1b3htRVZkSmVBQzVTcXNHcmpDZWQzWEVlUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469788),
('VoTfV2NmOcPQt893MRyNBPePgPkaRrUdh4zbjBI7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakR1S0ZMNnd4aW1pUTk4TnFtSmlHZGdMUkNXcnJBbXVONTJhTjVlViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469784),
('VpGuWT589Hd1LkWGNkQXsFCen0nPO6ZVVJz1TFzk', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1VtME94eUZSYWJFd3dIOWFvR29lUjZ5R25tZm5VOXUxVjBrVjluQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474273),
('VS6IGpfcZbMGtycVG0rn0XORlQT6VBGjEvkymTLH', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclZWMlY4U292bGp0RmFHZ1RLUXhBbkU2R1ZBU1hLU2o5SVZDTVRxZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473032),
('vwVDqs2Hp5hHeDEFXhMwlhO5IytvYksOA4UZqSsL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczl0UTcyQ1pTU2hNWTd0aEE4bjB1NXgzUUlNck1rVjRLZ3d6cDVSTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732468624),
('W51fwCSl8trd0rQyN9IqAQ0IrAhelRfHkeMU4mdy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0dmQzhJNVpMQnZsTXZRaTlDTXRneXI2VzAzNXlUeGxBRDlaNmIxdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473736),
('WBkmAjIcMeWagzVmS4dttlpvSRa9RvyF9EPWK5cV', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSmtZM3NoYjlJVUt2T1VadXZPcHdpTFdaWUtGdEhCTkxCUkZzQW1sYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471610),
('wbq10VIn4hHRVPeZe2YzaYXAHfqjtEaWkuM7Cm7u', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzlHRmU4ZGkwRVZBbk9Db0R1WFNDV0VtcVU1bnBFVHdrS2IxRERUVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474403),
('wHLZqBFy5hjm9CbhwqlYOs78PuhWWzA3oyLtU47W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTdheUNVS21FUE94MUhvYmVuYmd0ZFhMd3FBRm42OFJZY3h5U2RraCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469683),
('WxBd6ZPWOsl4ZmcjuyhEHWXEhJqoqnYjPkDwxwB6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWVuSFllenVjOERod2pEbHlEU25Xc2ZmcFl1UUNFdmFTdENTeGV0byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470683),
('x7kFJ6E3gW8mhYPtDnAvlcb9ts8Ll5k5GzD3Dk3r', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlNLUjNmcGhIRHVidHJPOXZUaHk1QWFlWVNwZmdVMmRVUGJQMTZHeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472584),
('xvhTsSI7UiH5rjCElo7Kk0QFPGWxDh2Xlp38XPfF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlRwQzByRWtuU09SSkY1NkJjZXVwbmtFbW1oWmh2N2lWZWVCaXgzayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732473791),
('XwRBCYSCu2YGwWBfbgLgKRbiYMtkTeNiqdZfxNew', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2xFZVVidjlHVklGOWxTTlk0Nk1oSnljVk05QzNCckJZbUZYNlR3NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21wZXRpY2lvbmVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470014),
('y5gPPwvwm3wo9F3O1mO7ElbbOINOxk5Ipk7dfOeG', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmd5OXd6cko1ZUJFbWFxZ09iYk04ZG11bGRRY0pJR2NiSjFSNk1xaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732474376),
('YHw2pV3jpWissQbZdoijCA8jZTqmyHYfnkOzCqCH', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMFozeVo5enMwc1hneFc1WkVOemRrYmVYRUZFeVFhekdQUGRXYURoZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472583),
('yjCqpCsy4W6K16jYosVX53rdIs7keaidoKstVpvE', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUw5TlNrZ0ZPRExOUWFhR3Uxb2U4SkVOaGlaNlp4OWE1VUV1QTJBSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90YWxsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1732473833),
('YLALq7VZ3TD1JLLCz09XQaEcQKy2a379iuZP6vRF', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTTZod3V3RDNKbUo0RWFSMXAzbXZ0QXN1RjFoMVlmU1ZYdVlrMm5HUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732471994),
('ym7KJbjfP2hRVS00IpKi8KQMi6Ky6CQF8WFKRAXX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXpVbVZ0Mm1oUEhMTVJCNHhRcEk2WDc5MFZtWUNyRGZhUzNuN2lWSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732469456),
('Ynef3MjAGfsY4f2UfSqiptt0CQWzKMJ2mTnHQyYZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzN0Nk1TUFRvd3hDMTQ4UEFuSm9iajA4T2ZsclMyRVlKekpwcmsxMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732466699),
('YqnlU4aqnyxZ1eX6N71CqFHAXeqixkFMLbeMtusi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUpwZGtBWXRpbTEya1JsVmw4OGhDbUMyVmJpMlNmN1BuSjJ4bWw3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470784),
('zAvx6wx0MZrsb5MwfAymwyvUUqDH4ezgCHr0S7dg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT29XT2xrVTJCRUFDOE5FTjJFazBPenpwOEFjMWZYdHI1aWZVbUI0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470693),
('ZEDTfDETg8FhyG2ioIt0tGxc1nW2l2rKCk8LwkRs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU1HTEtSa2JsYVhybDduUENUSThHVTlZOVQxclY1QXFkZFhaZE1xciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9lcXVpcG9zIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470783),
('zlwRVK83V0CzrMW4D1FUJi6YHHUXX2UWchsYjL4m', NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlJVR21QdndvSmNBWDkxZVhGa2VSbXF5dGRUZWxRb0lON1VQWG8xayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732472965),
('ZVi2JqBmkOyMuWGQa0wSdqLCmkqax8MhSbE3FhF9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW5zaTl3NFJHdkREMnNYWHZuZTh0cVNTNkEzQTh2SmlGUjFvMkF5ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZW1wb3JhZGFzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1732470684);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `id` int(11) NOT NULL,
  `talla` varchar(50) NOT NULL,
  `medidas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tallas`
--

INSERT INTO `tallas` (`id`, `talla`, `medidas`) VALUES
(1, 'S', '90-95 cm'),
(2, 'M', '95-100 cm'),
(3, 'L', '100-105 cm'),
(4, 'XL', '105-110 cm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `fecha_ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_permisos`
--

CREATE TABLE `usuarios_permisos` (
  `usuario_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `camisetas`
--
ALTER TABLE `camisetas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `camiseta_talla`
--
ALTER TABLE `camiseta_talla`
  ADD PRIMARY KEY (`camiseta_id`,`talla_id`),
  ADD KEY `talla_id` (`talla_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competiciones`
--
ALTER TABLE `competiciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipo_competicion`
--
ALTER TABLE `equipo_competicion`
  ADD PRIMARY KEY (`equipo_id`,`competicion_id`),
  ADD KEY `competicion_id` (`competicion_id`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imageable_type_id` (`imageable_type`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pedido_camiseta_talla`
--
ALTER TABLE `pedido_camiseta_talla`
  ADD PRIMARY KEY (`pedido_id`,`camiseta_id`,`talla_id`),
  ADD KEY `camiseta_id` (`camiseta_id`,`talla_id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_permisos`
--
ALTER TABLE `usuarios_permisos`
  ADD PRIMARY KEY (`usuario_id`,`permiso_id`),
  ADD KEY `permiso_id` (`permiso_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `camisetas`
--
ALTER TABLE `camisetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT de la tabla `competiciones`
--
ALTER TABLE `competiciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `camisetas`
--
ALTER TABLE `camisetas`
  ADD CONSTRAINT `camisetas_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`);

--
-- Filtros para la tabla `camiseta_talla`
--
ALTER TABLE `camiseta_talla`
  ADD CONSTRAINT `camiseta_talla_ibfk_1` FOREIGN KEY (`camiseta_id`) REFERENCES `camisetas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `camiseta_talla_ibfk_2` FOREIGN KEY (`talla_id`) REFERENCES `tallas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `equipo_competicion`
--
ALTER TABLE `equipo_competicion`
  ADD CONSTRAINT `equipo_competicion_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `equipo_competicion_ibfk_2` FOREIGN KEY (`competicion_id`) REFERENCES `competiciones` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pedido_camiseta_talla`
--
ALTER TABLE `pedido_camiseta_talla`
  ADD CONSTRAINT `pedido_camiseta_talla_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_camiseta_talla_ibfk_2` FOREIGN KEY (`camiseta_id`,`talla_id`) REFERENCES `camiseta_talla` (`camiseta_id`, `talla_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios_permisos`
--
ALTER TABLE `usuarios_permisos`
  ADD CONSTRAINT `usuarios_permisos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `usuarios_permisos_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
