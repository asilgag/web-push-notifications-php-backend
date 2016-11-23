-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 21, 2016 at 05:06 PM
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
(2, 'Trabajando con Sketch e Invisión', '2016-11-25 09:10:00', 'Sala 1', 'Aritz Oiaga', '/images/programa/aritz-oiaga.jpg'),
(3, 'Cómo creamos un e-commerce para el sector de la restauración', '2016-11-25 09:10:00', 'Sala 2', 'Virgilio Echauri y Carmelo Martínez', '/images/programa/virgilio-echauri.jpg'),
(4, 'Atom.io, el editor definitivo VS PhpStorm, el editor definitivo', '2016-11-25 09:10:00', 'Sala 3', 'David Gallego y Pablo Albizu', '/images/programa/gallego-pablo.jpg'),
(5, 'Conectando el online con el offline en una experiencia omnicanal. 3 casos: Carrefour, Movistar y Museo Guggenheim', '2016-11-25 10:00:00', 'Sala 1', 'Juan Narro y Wila', '/images/programa/narro-wila.jpg'),
(6, 'Computational design', '2016-11-25 10:00:00', 'Sala 2', 'karlos g liberal', '/images/programa/patxangas.jpg'),
(7, 'Adios float, hola Flex Box! Maquetación de layouts para los navegadores de hoy', '2016-11-25 10:00:00', 'Sala 3', 'Rubén Bernárdez', '/images/programa/ruben-bernardez.jpg'),
(8, 'La última apuesta de Google: Physical Web', '2016-11-25 10:15:00', 'Sala 2', 'karlos g liberal', '/images/programa/patxangas.jpg'),
(9, 'Cómo creamos un App que reconoce piezas de un catálogo de miles de referencias', '2016-11-25 10:15:00', 'Sala 3', 'Virgilio Echauri y Carmelo Martínez', '/images/programa/virgilio-echauri.jpg'),
(10, 'Triplica la conversión de tu landing page', '2016-11-25 10:50:00', 'Sala 1', 'Susana Heredia y Aritz Oiaga', '/images/programa/susana-oiaga.jpg'),
(11, 'El futuro de la web móvil: Progressive Web Apps', '2016-11-25 10:50:00', 'Sala 2', 'Alberto Silva', '/images/programa/alberto-silva.jpg'),
(12, 'Cómo trabajar con código legado', '2016-11-25 10:50:00', 'Sala 3', '540', '/images/programa/540.png'),
(13, 'DESCANSO', '2016-11-25 11:35:00', '', '', ''),
(14, 'El proceso de transformación digital del museo Thyssen-Bornemisza', '2016-11-25 12:15:00', 'Sala principal', 'Museo Thyssen-Bornemisza', '/images/programa/museo.png'),
(15, 'Las claves de la transformación digital. ¿Qué podemos aprender de la experiencia del Grupo Prisa para nuestras empresas?', '2016-11-25 13:30:00', 'Sala principal', 'Noelia Fernández', '/images/programa/noelia.jpg'),
(16, 'COCKTAIL', '2016-11-25 14:30:00', '', '', '');

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

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`id`, `endpoint`, `p256dh`, `auth`) VALUES
(1, 'https://fcm.googleapis.com/fcm/send/fAcnhLopspE:APA91bFwyqUbpoSKdcq5QI6EflMFKs-amrYxT4KEOO8oz6USsczxINQ3hf_-QkPLQdDEggy16Bkz7XBYD6vvmxlT07zwZCI_s-HQyiwU42Ce6JfHJepofmOrLM-72TyobksKmh4kx_QT', 'BBAEko3idjQNuSafM33g--6cxnRu9oYg_ah25nZY6K3y8eZXcUOJWqYCdALN396qHxZ9SKgkeT68uAm0ktFA4rM=', 'CWHZXw6Dj8Kq_uylRGGzzQ=='),
(2, 'https://fcm.googleapis.com/fcm/send/feem0PjtkJs:APA91bEgzpdfeFmnGI0J4mY5P1P0lIFBpTaeVgSiLm0Im2tkV_dkF14fOFijFBH8Eco9ouzp-Poyx1M3L9TLceH_tOVdJ8E1dgb4CNc-IFDdv_kbgEIE6mcyFFy9SrpUsO6MfOpJBf2q', 'BAsQvNqQGFhuZ1F9tAWbg9PC8dIeVFfyrnzh6WlFwNoEXgEYrPju6_5U0p57XepHz0EKAZHFxTP-5X_jE2tzDYo=', '-a1Az_RmSosZERMsQ19tyQ=='),
(3, 'https://fcm.googleapis.com/fcm/send/di3jlFXQvgE:APA91bG2eGk8FRK9tBZU9CGT-ebkitvCrnIpQRKewlz5Nv-fM10ycZRk3vl4-0N7ATLtuzSNLZEySBfV3K9svtpDGVI0LEfWWpnPGmL2oJn_tNQxNJlzncEl7AILf_oysg3ies64j6gZ', 'BIStYaH8IOkAiXfsTgrloVvkR163HFnZgtB-j3gG2h2M5Gobh5b9d58F20B7qdAKK4MQy4ABNSMQu4eU04S6SrY=', 'IC88Gtk9W_Nqp7CPrDixIA==');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_event`
--

CREATE TABLE `subscription_event` (
  `subscription_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscription_event`
--

INSERT INTO `subscription_event` (`subscription_id`, `group_id`) VALUES
(1, 5),
(1, 12),
(1, 13),
(2, 2),
(2, 3),
(3, 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
