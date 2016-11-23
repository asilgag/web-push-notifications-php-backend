-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 23, 2016 at 03:01 AM
-- Server version: 5.7.16
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `symfony`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--
CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `venue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `speaker` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `start_date`, `venue`, `speaker`, `icon`) VALUES
(1, 'APERTURA XII OPEN BIKO', '2016-11-25 09:00:00', '', '', ''),
(2, 'Trabajando con Sketch e Invisión', '2016-11-25 09:10:00', 'Sala Carpa', 'Aritz Oiaga', '/images/programa/aritz-oiaga.jpg'),
(3, 'Cómo creamos un e-commerce para el sector de la restauración', '2016-11-25 09:10:00', 'Sala Barquerillos 1', 'Virgilio Echauri y Carmelo Martínez', '/images/programa/virgilio-echauri.jpg'),
(4, 'Atom vs PhpStorm, el editor definitivo', '2016-11-25 09:10:00', 'Sala Barquerillos 2', 'David Gallego y Pablo Albizu', '/images/programa/gallego-pablo.jpg'),
(5, 'Conectando el online con el offline en una experiencia omnicanal. 3 casos: Carrefour, Movistar y Museo Guggenheim', '2016-11-25 10:00:00', 'Sala Carpa', 'Juan Narro y Wila', '/images/programa/narro-wila.jpg'),
(6, 'El futuro de la web móvil: Progressive Web Apps', '2016-11-25 10:00:00', 'Sala Barquerillos 1', 'Alberto Silva', '/images/programa/alberto-silva.jpg'),
(7, 'Cómo trabajar con código legado', '2016-11-25 10:00:00', 'Sala Barquerillos 2', '540', '/images/programa/540.png'),
(8, 'Triplica la conversión de tu landing page', '2016-11-25 10:50:00', 'Sala Carpa', 'Susana Heredia y Aritz Oiaga', '/images/programa/susana-oiaga.jpg'),
(9, 'Computational design, hacia un diseño mestizo', '2016-11-25 10:50:00', 'Sala Barquerillos 1', 'karlos g liberal', '/images/programa/patxangas.jpg'),
(10, 'Adios float, hola Flex Box! Maquetación de layouts para los navegadores de hoy', '2016-11-25 10:50:00', 'Sala Barquerillos 2', 'Rubén Bernárdez', '/images/programa/ruben-bernardez.jpg'),
(11, 'Cómo creamos un App que reconoce piezas de un catálogo de miles de referencias', '2016-11-25 11:05:00', 'Sala Barquerillos 2', 'Virgilio Echauri y Carmelo Martínez', '/images/programa/virgilio-echauri.jpg'),
(12, 'DESCANSO', '2016-11-25 11:35:00', 'Sala Carpa', '', ''),
(13, 'El proceso de transformación digital del museo Thyssen-Bornemisza', '2016-11-25 12:15:00', 'Capilla', 'Museo Thyssen-Bornemisza', '/images/programa/museo.png'),
(14, 'Las claves de la transformación digital. ¿Qué podemos aprender de la experiencia del Grupo Prisa para nuestras empresas?', '2016-11-25 13:30:00', 'Capilla', 'Noelia Fernández', '/images/programa/noelia.jpg'),
(15, 'COCKTAIL', '2016-11-25 15:00:00', 'Sala Carpa', '', '');
(16, 'Taller de Risoterapia', '2016-11-25 17:00:00', 'Sala Capilla', '', '');
(17, 'FIESTA', '2016-11-25 19:00:00', 'Bar Txintxarri', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`) VALUES
('20161120043016');

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `endpoint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `p256dh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_event`
--
CREATE TABLE `subscription_event` (
  `subscription_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A3C664D3C4420F7B` (`endpoint`),
  ADD UNIQUE KEY `UNIQ_A3C664D3C4EA91FC` (`p256dh`),
  ADD UNIQUE KEY `UNIQ_A3C664D3F8DEB059` (`auth`);

--
-- Indexes for table `subscription_event`
--
ALTER TABLE `subscription_event`
  ADD PRIMARY KEY (`subscription_id`,`group_id`),
  ADD KEY `IDX_C1960BD49A1887DC` (`subscription_id`),
  ADD KEY `IDX_C1960BD4FE54D947` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscription_event`
--
ALTER TABLE `subscription_event`
  ADD CONSTRAINT `FK_C1960BD49A1887DC` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`),
  ADD CONSTRAINT `FK_C1960BD4FE54D947` FOREIGN KEY (`group_id`) REFERENCES `event` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
