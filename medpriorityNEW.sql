-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2024 a las 04:52:59
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `medpriority`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_agendadas`
--

CREATE TABLE `citas_agendadas` (
  `id_citas` int(11) NOT NULL,
  `id_preagendamiento` int(11) NOT NULL,
  `FechaAsignada` varchar(255) NOT NULL,
  `HoraAsignado` varchar(255) NOT NULL,
  `id_DoctorAsignado` int(11) NOT NULL,
  `Prioridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `citas_agendadas`
--

INSERT INTO `citas_agendadas` (`id_citas`, `id_preagendamiento`, `FechaAsignada`, `HoraAsignado`, `id_DoctorAsignado`, `Prioridad`) VALUES
(4, 6, '2024-03-10', '11:00:00', 2, 1),
(5, 7, '2024-03-10', '11:00:00', 3, 3),
(6, 10, '2024-03-10', '11:00:00', 4, 4),
(7, 12, '2024-03-11', '11:00:00', 1, 5),
(8, 11, '2024-03-07', '07:30:00', 1, 6),
(9, 13, '2024-03-07', '08:30:00', 2, 2),
(10, 14, '2024-05-22', '07:00:00', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `id` int(11) NOT NULL,
  `nombre_consultorio` varchar(200) NOT NULL,
  `id_especialidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`id`, `nombre_consultorio`, `id_especialidad`) VALUES
(1, 'Unidad 1', 1),
(2, 'Unidad 2 ', 1),
(3, 'Unidad 3 ', 1),
(4, 'Unidad 4', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id_doctor` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id_doctor`, `id_usuario`, `id_especialidad`, `estado`) VALUES
(1, 2, 1, 'Activo'),
(2, 3, 1, 'Activo'),
(3, 4, 2, 'Activo'),
(4, 5, 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_consultorio`
--

CREATE TABLE `doctor_consultorio` (
  `id_consultorio` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctor_consultorio`
--

INSERT INTO `doctor_consultorio` (`id_consultorio`, `id_doctor`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor_horario`
--

CREATE TABLE `doctor_horario` (
  `id_doctor` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edades_rango`
--

CREATE TABLE `edades_rango` (
  `id_edadrango` int(11) NOT NULL,
  `inicial` int(11) NOT NULL,
  `final` int(11) NOT NULL,
  `id_puntaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `edades_rango`
--

INSERT INTO `edades_rango` (`id_edadrango`, `inicial`, `final`, `id_puntaje`) VALUES
(1, 0, 5, 10),
(2, 65, 100, 10),
(3, 6, 18, 6),
(4, 19, 64, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidad`, `especialidad`) VALUES
(1, 'Medicina General'),
(2, 'Odontolodia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `estado`, `puntuacion`) VALUES
(1, 'Emabarazada', 10),
(2, 'No aplica', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `id_historia` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_patologia` int(11) NOT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `numero_folio` int(11) DEFAULT NULL,
  `causa_ingreso` varchar(400) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historia_clinica`
--

INSERT INTO `historia_clinica` (`id_historia`, `id_usuario`, `id_patologia`, `fecha_ingreso`, `numero_folio`, `causa_ingreso`, `id_estado`) VALUES
(4, 1, 101, NULL, NULL, NULL, 2),
(5, 6, 101, NULL, NULL, NULL, 2),
(6, 7, 11, '2024-03-05 11:52:22', 1, 'Presenta sintomas comunes de Chikungunya, fiebre, dolor muscular, nauses y fatiga', 1),
(7, 8, 101, NULL, NULL, NULL, 2),
(8, 9, 101, '2024-03-01 11:56:42', 1, 'presenta sintomas de embarazos: nauseas al momento de ingerir alimentos, fatiga', 1),
(9, 10, 2, '2024-03-04 12:00:12', 2, 'presenta dificultad respiratoria, dolor muscular', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL,
  `hora_inicio` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horario`, `hora_inicio`) VALUES
(1, '07:00:00'),
(2, '07:15:00'),
(3, '07:30:00'),
(4, '07:45:00'),
(5, '08:00:00'),
(6, '08:15:00'),
(7, '08:30:00'),
(8, '08:45:00'),
(9, '09:00:00'),
(10, '09:15:00'),
(11, '09:30:00'),
(12, '09:45:00'),
(13, '10:00:00'),
(14, '10:15:00'),
(15, '10:30:00'),
(16, '10:45:00'),
(17, '11:00:00'),
(18, '11:15:00'),
(19, '11:30:00'),
(20, '11:45:00'),
(21, '12:00:00'),
(22, '14:00:00'),
(23, '14:15:00'),
(24, '14:30:00'),
(25, '14:45:00'),
(26, '15:00:00'),
(27, '15:15:00'),
(28, '15:30:00'),
(29, '15:45:00'),
(30, '16:00:00'),
(31, '16:15:00'),
(32, '16:30:00'),
(33, '16:45:00'),
(34, '17:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenamiento_precitas`
--

CREATE TABLE `ordenamiento_precitas` (
  `id_preagendamiento` int(11) NOT NULL,
  `numero_lista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologias`
--

CREATE TABLE `patologias` (
  `id_patologia` int(11) NOT NULL,
  `nombre_patologia` varchar(200) NOT NULL,
  `puntuacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `patologias`
--

INSERT INTO `patologias` (`id_patologia`, `nombre_patologia`, `puntuacion`) VALUES
(1, 'Infeccion respiratoria aguda', 4),
(2, 'Hipertension arterial', 2),
(3, 'Infeccion urinaria', 3),
(4, 'Diabetes mellitus tipo 2', 4),
(5, 'Dengue clasico', 5),
(6, 'VIH/SIDA', 6),
(7, 'Tuberculosis pulmonar', 7),
(8, 'Hepatitis B aguda', 8),
(9, 'Hepatitis C cronica', 9),
(10, 'Zika virus', 10),
(11, 'Chikungunya fiebre', 3),
(12, 'Malaria vivax', 2),
(13, 'Leptospirosis icterohemorragica', 3),
(14, 'Sifilis primaria', 4),
(15, 'Gonorrea uretral', 5),
(16, 'Leishmaniasis cutanea', 6),
(17, 'Chagas agudo', 7),
(18, 'Varicela zoster', 8),
(19, 'Sarampion Rubeola', 9),
(20, 'Rubeola congenita', 10),
(21, 'Gripe estacional', 1),
(22, 'Neumonia bacteriana', 2),
(23, 'Bronquitis cronica', 3),
(24, 'Asma bronquial', 4),
(25, 'Artritis reumatoide juvenil', 5),
(26, 'Osteoartritis degenarativa', 6),
(27, 'Cancer de estomago avanzado', 7),
(28, 'Cancer de mama temprano', 8),
(29, 'Cancer de pr?stata localizado', 9),
(30, 'Cancer de colon metastasico', 10),
(31, 'Cancer de piel melanoma', 4),
(32, 'Cancer cervicouterino in situ', 4),
(33, 'Linfoma no Hodgkin', 3),
(34, 'Leucemia linfocitica aguda', 6),
(35, 'Epilepsia refractaria', 5),
(36, 'Migra?a cronica', 6),
(37, 'Enfermedad de Alzheimer temprana', 7),
(38, 'Enfermedad de Parkinson avanzada', 8),
(39, 'Depresion mayor', 9),
(40, 'Ansiedad generalizada', 7),
(41, 'Esquizofrenia paranoide', 1),
(42, 'Trastorno bipolar I', 2),
(43, 'Dermatitis atopica', 3),
(44, 'Psoriasis en placas', 4),
(45, 'Alergias estacionales', 5),
(46, 'Obesidad morbida', 6),
(47, 'Desnutrici?n severa', 7),
(48, 'Anemia ferropenica', 8),
(49, 'Hipotiroidismo subclinico', 9),
(50, 'Hipertiroidismo grave', 10),
(51, 'Insuficiencia renal cr?nica terminal', 5),
(52, 'Cistitis intersticial', 2),
(53, 'Piedras en el ri?on calcicas', 3),
(54, 'Hernia discal lumbar', 4),
(55, 'Apendice aguda', 7),
(56, 'Colecistitis cronica', 6),
(57, 'Pancreatitis aguda severa', 7),
(58, 'Hepatitis A fulminante', 8),
(59, 'Faringitis estreptococica', 9),
(60, 'Amigdalitis recurrente', 10),
(61, 'Conjuntivitis alergica', 2),
(62, 'Cataratas seniles', 2),
(63, 'Glaucoma de angulo abierto', 3),
(64, 'Miopia alta', 4),
(65, 'Hipermetropia severa', 5),
(66, 'Astigmatismo irregular', 6),
(67, 'Presbicia temprana', 7),
(68, 'Otitis media aguda', 8),
(69, 'Sinusitis cronica', 9),
(70, 'Caries dental profunda', 7),
(71, 'Periodontitis avanzada', 3),
(72, 'Orzuelo recurrente', 2),
(73, 'Ulcera peptica perforada', 3),
(74, 'Gastritis erosiva', 4),
(75, 'Enfermedad celiaca no tratada', 5),
(76, 'Enfermedad de Crohn moderada', 6),
(77, 'Colitis ulcerosa severa', 7),
(78, 'Intoxicacion alimentaria bacteriana', 8),
(79, 'Gastroenteritis viral', 9),
(80, 'Insuficiencia cardiaca congestiva', 10),
(81, 'Infarto de miocardio reciente', 7),
(82, 'Arritmias cardiacas complejas', 2),
(83, 'Hipotermia grave', 6),
(84, 'Golpe de calor critico', 4),
(85, 'Deshidratacion severa', 5),
(86, 'Quemaduras de tercer grado', 8),
(87, 'Fracturas multiples', 7),
(88, 'Esguinces recurrentes', 8),
(89, 'Lumbalgia cronica', 9),
(90, 'Ciatica incapacitante', 10),
(91, 'Fibromialgia severa', 4),
(92, 'Insomnio cronico', 2),
(93, 'Sindrome de piernas inquietas severo', 3),
(94, 'Apnea del sue?o obstructiva', 4),
(95, 'Hiperplasia benigna de prostata moderada', 5),
(96, 'VIH/SIDA fase 1', 9),
(97, 'Gonorrea fase 2', 6),
(98, 'Diabetes mellitus tipo 1', 7),
(99, 'Hipertension arterial sistolica', 5),
(100, 'Tuberculosis extrapulmonar', 8),
(101, 'No Aplica', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preagendamiento`
--

CREATE TABLE `preagendamiento` (
  `id_preagendamiento` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` varchar(200) NOT NULL,
  `valoracion` int(11) NOT NULL,
  `hora_fin` varchar(200) NOT NULL,
  `registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_tipo_cita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `preagendamiento`
--

INSERT INTO `preagendamiento` (`id_preagendamiento`, `id_usuario`, `fecha`, `hora_inicio`, `valoracion`, `hora_fin`, `registro`, `id_tipo_cita`) VALUES
(6, 7, '2024-03-10', '17', 18, '24', '2024-05-02 03:29:54', 1),
(7, 9, '2024-03-10', '17', 15, '24', '2024-05-02 03:29:53', 1),
(10, 9, '2024-03-10', '17', 15, '24', '2024-05-02 03:29:54', 1),
(11, 1, '2024-03-07', '3', 5, '15', '2024-05-02 03:29:53', 1),
(12, 1, '2024-03-11', '17', 6, '20', '2024-05-02 03:29:53', 1),
(13, 1, '2024-03-07', '7', 17, '9', '2024-05-02 03:29:54', 1),
(14, 1, '2024-05-22', '1', 5, '3', '2024-05-02 03:29:53', 1),
(15, 1, '2024-05-15', '22', 5, '34', '2024-05-06 03:06:20', 2),
(16, 1, '2024-05-15', '22', 5, '34', '2024-05-06 03:08:11', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntuacion`
--

CREATE TABLE `puntuacion` (
  `id_puntacion` int(11) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'admin'),
(2, 'usuario'),
(3, 'doctor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcita_especialidad`
--

CREATE TABLE `tcita_especialidad` (
  `idtcita_especialidad` int(11) NOT NULL,
  `id_tcita` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tcita_especialidad`
--

INSERT INTO `tcita_especialidad` (`idtcita_especialidad`, `id_tcita`, `id_especialidad`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cita`
--

CREATE TABLE `tipo_cita` (
  `id` int(11) NOT NULL,
  `enombre` varchar(205) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_cita`
--

INSERT INTO `tipo_cita` (`id`, `enombre`) VALUES
(1, 'Cita externa'),
(2, 'Lectura de exámenes'),
(3, 'Odontología general');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(12) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `edad` int(3) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `tipo_documento` varchar(255) NOT NULL,
  `estado_civil` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `tipo_afiliacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `edad`, `telefono`, `correo`, `genero`, `tipo_documento`, `estado_civil`, `direccion`, `id_rol`, `tipo_afiliacion`) VALUES
(1, 'Kevin Stiven Monroy Narvaez', 21, '3437393191', 'keev03.@gmail.com', 'Masculino', 'Cedula de Ciudadania', 'Soltero', 'Carrera 22#28-1', 2, 'Contributivo'),
(2, 'Diego Cruz Cruz', 55, '3199104160', 'diego.cruz@hotmail.com', 'Femenino', 'Cedula de Ciudadania', 'Soltero', 'Carrera 22#28-1', 3, 'Contributivo'),
(3, 'Camila Hernandez Cruz', 39, '3647881339', 'camila.cruz@gmail.com', 'Masculino', 'Cedula de Ciudadania', 'Soltero', 'Calle 2#45-19', 3, 'Contributivo'),
(4, 'Daniel Lopez Ramirez', 67, '3366258028', 'daniel.ramirez@gmail.com', 'Otro', 'Cedula de Extranjeria', 'Viudo', 'Calle 2#16-9', 3, 'Contributivo'),
(5, 'Camila Lopez Garcia', 9, '3487055902', 'camila.garcia@gmail.com', 'Femenino', 'Tarjeta de Identidad', 'Soltero', 'Avenida 67#40-29', 3, 'Contributivo'),
(6, 'Isabella Hernandez Martinez', 64, '3437393191', 'isabella.martinez@gmail.com', 'Femenino', 'Registro Civil', 'Soltero', 'Carrera 17#36-17', 2, 'Contributivo'),
(7, 'Camila Cruz Garcia', 32, '3430732861', 'camila.garcia@hotmail.com', 'Masculino', 'Registro Civil', 'Casado', 'Avenida 26#27-24', 2, 'Contributivo'),
(8, 'Matias Rodriguez Gonzalez', 40, '3503377769', 'matias.gonzalez@hotmail.com', 'Femenino', 'Cedula de Ciudadania', 'Divorciado', 'Calle 23#1-22', 2, 'Contributivo'),
(9, 'Sofia Martinez Perez', 57, '3068132112', 'sofia.perez@gmail.com', 'Femenino', 'Cedula de Ciudadania', 'Divorciado', 'Carrera 40#5-39', 2, 'Contributivo'),
(10, 'Sofia Lopez Rodriguez', 66, '3947081428', 'sofia.rodriguez@hotmail.com', 'Femenino', 'Cedula de Ciudadania', 'Casado', 'Avenida 11#25-17', 2, 'Contributivo'),
(11, 'Diego Martinez Hernandez', 26, '3364239141', 'diego.hernandez@gmail.com', 'Masculino', 'Cedula de Ciudadania', 'Viudo', 'Carrera 50#3-41', 2, 'Contributivo'),
(12, 'Matias Perez Gonzalez', 44, '3394367829', 'matias.gonzalez@hotmail.com', 'Otro', 'Cedula de Ciudadania', 'Divorciado', 'Carrera 28#32-14', 2, 'Contributivo'),
(13, 'Santiago Cruz Perez', 28, '3848153834', 'santiago.perez@hotmail.com', 'Masculino', 'Cedula de Ciudadania', 'Viudo', 'Avenida 96#14-43', 2, 'Contributivo'),
(14, 'Matias Martinez Martinez', 50, '3174321823', 'matias.martinez@gmail.com', 'Femenino', 'Cedula de Ciudadania', 'Soltero', 'Carrera 8#8-41', 2, 'Contributivo'),
(15, 'Valentina Sanchez Hernandez', 64, '3736222270', 'valentina.hernandez@gmail.com', 'Otro', 'Cedula de Extranjeria', 'Divorciado', 'Calle 63#12-43', 2, 'Contributivo'),
(16, 'Martin Hernandez Gonzalez', 33, '3959093474', 'martin.gonzalez@gmail.com', 'Masculino', 'Cedula de Extranjeria', 'Soltero', 'Carrera 37#29-50', 2, 'Contributivo'),
(17, 'Sofia Rodriguez Garcia', 28, '3396319428', 'sofia.garcia@hotmail.com', 'Masculino', 'Cedula de Ciudadania', 'Casado', 'Carrera 2#1-6', 2, 'Subsidiado'),
(18, 'Santiago Ramirez Hernandez', 27, '3220350965', 'santiago.hernandez@gmail.com', 'Otro', 'Registro Civil', 'Casado', 'Carrera 17#29-36', 2, 'Subsidiado'),
(19, 'Matias Garcia Lopez', 66, '3669984596', 'matias.lopez@hotmail.com', 'Otro', 'Registro Civil', 'Divorciado', 'Carrera 7#20-4', 2, 'Subsidiado'),
(20, 'Isabella Garcia Garcia', 48, '3147394387', 'isabella.garcia@gmail.com', 'Masculino', 'Cedula de Ciudadania', 'Soltero', 'Calle 78#19-35', 2, 'Subsidiado'),
(21, 'Matias Sanchez Hernandez', 57, '3999781319', 'matias.hernandez@hotmail.com', 'Masculino', 'Cedula de Ciudadania', 'Viudo', 'Avenida 10#21-44', 2, 'Subsidiado'),
(22, 'Lucia Perez Garcia', 52, '3094559158', 'lucia.garcia@gmail.com', 'Femenino', 'Registro Civil', 'Soltero', 'Avenida 64#7-47', 2, 'Subsidiado'),
(23, 'Camila Gonzalez Gonzalez', 40, '3261910214', 'camila.gonzalez@gmail.com', 'Otro', 'Cedula de Extranjeria', 'Casado', 'Carrera 51#13-24', 2, 'Subsidiado'),
(24, 'Martin Ramirez Garcia', 58, '3201858461', 'martin.garcia@gmail.com', 'Femenino', 'Registro Civil', 'Viudo', 'Carrera 77#10-33', 2, 'Subsidiado'),
(25, 'Santiago Martinez Martinez', 20, '3216430214', 'santiago.martinez@hotmail.com', 'Masculino', 'Cedula de Extranjeria', 'Viudo', 'Calle 90#11-30', 2, 'Subsidiado'),
(26, 'Valentina Lopez Martinez', 45, '3687072756', 'valentina.martinez@hotmail.com', 'Masculino', 'Cedula de Ciudadania', 'Soltero', 'Calle 2#45-35', 2, 'Subsidiado'),
(27, 'Matias Sanchez Ramirez', 33, '3543651241', 'matias.ramirez@hotmail.com', 'Masculino', 'Cedula de Ciudadania', 'Divorciado', 'Carrera 73#40-46', 2, 'Subsidiado'),
(28, 'Isabella Hernandez Cruz', 29, '3626390642', 'isabella.cruz@gmail.com', 'Femenino', 'Cedula de Ciudadania', 'Soltero', 'Avenida 44#16-33', 2, 'Subsidiado'),
(29, 'Isabella Perez Sanchez', 22, '3102402098', 'isabella.sanchez@gmail.com', 'Otro', 'Cedula de Ciudadania', 'Soltero', 'Avenida 58#38-31', 2, 'Subsidiado'),
(30, 'Sofia Sanchez Martinez', 15, '3354789446', 'sofia.martinez@gmail.com', 'Masculino', 'Tarjeta de Identidad', 'Viudo', 'Calle 45#40-49', 2, 'Subsidiado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas_agendadas`
--
ALTER TABLE `citas_agendadas`
  ADD PRIMARY KEY (`id_citas`),
  ADD KEY `id_preagendamiento` (`id_preagendamiento`),
  ADD KEY `id_doctor` (`id_DoctorAsignado`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id_doctor`),
  ADD KEY `id_usuario` (`id_usuario`,`id_especialidad`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `doctor_consultorio`
--
ALTER TABLE `doctor_consultorio`
  ADD KEY `id_consultorio` (`id_consultorio`,`id_doctor`),
  ADD KEY `id_doctor` (`id_doctor`);

--
-- Indices de la tabla `doctor_horario`
--
ALTER TABLE `doctor_horario`
  ADD KEY `id_doctor` (`id_doctor`,`id_horario`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Indices de la tabla `edades_rango`
--
ALTER TABLE `edades_rango`
  ADD PRIMARY KEY (`id_edadrango`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id_historia`),
  ADD KEY `historia_id_user` (`id_usuario`),
  ADD KEY `id_patologia` (`id_patologia`),
  ADD KEY `id_embarazo` (`id_estado`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horario`);

--
-- Indices de la tabla `ordenamiento_precitas`
--
ALTER TABLE `ordenamiento_precitas`
  ADD KEY `id_preagendamiento` (`id_preagendamiento`);

--
-- Indices de la tabla `patologias`
--
ALTER TABLE `patologias`
  ADD PRIMARY KEY (`id_patologia`);

--
-- Indices de la tabla `preagendamiento`
--
ALTER TABLE `preagendamiento`
  ADD PRIMARY KEY (`id_preagendamiento`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_tipo_cita` (`id_tipo_cita`);

--
-- Indices de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  ADD PRIMARY KEY (`id_puntacion`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tcita_especialidad`
--
ALTER TABLE `tcita_especialidad`
  ADD PRIMARY KEY (`idtcita_especialidad`),
  ADD KEY `id_tcita` (`id_tcita`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `tipo_cita`
--
ALTER TABLE `tipo_cita`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `user_id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas_agendadas`
--
ALTER TABLE `citas_agendadas`
  MODIFY `id_citas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `edades_rango`
--
ALTER TABLE `edades_rango`
  MODIFY `id_edadrango` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  MODIFY `id_historia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `patologias`
--
ALTER TABLE `patologias`
  MODIFY `id_patologia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `preagendamiento`
--
ALTER TABLE `preagendamiento`
  MODIFY `id_preagendamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `puntuacion`
--
ALTER TABLE `puntuacion`
  MODIFY `id_puntacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tcita_especialidad`
--
ALTER TABLE `tcita_especialidad`
  MODIFY `idtcita_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_cita`
--
ALTER TABLE `tipo_cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas_agendadas`
--
ALTER TABLE `citas_agendadas`
  ADD CONSTRAINT `citas_agendadas_ibfk_1` FOREIGN KEY (`id_DoctorAsignado`) REFERENCES `doctores` (`id_doctor`);

--
-- Filtros para la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD CONSTRAINT `consultorio_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD CONSTRAINT `doctores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `doctores_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`);

--
-- Filtros para la tabla `doctor_consultorio`
--
ALTER TABLE `doctor_consultorio`
  ADD CONSTRAINT `doctor_consultorio_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`),
  ADD CONSTRAINT `doctor_consultorio_ibfk_2` FOREIGN KEY (`id_consultorio`) REFERENCES `consultorio` (`id`);

--
-- Filtros para la tabla `doctor_horario`
--
ALTER TABLE `doctor_horario`
  ADD CONSTRAINT `doctor_horario_ibfk_2` FOREIGN KEY (`id_horario`) REFERENCES `horarios` (`id_horario`),
  ADD CONSTRAINT `doctor_horario_ibfk_3` FOREIGN KEY (`id_doctor`) REFERENCES `doctores` (`id_doctor`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `historia_clinica_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `historia_clinica_ibfk_2` FOREIGN KEY (`id_patologia`) REFERENCES `patologias` (`id_patologia`),
  ADD CONSTRAINT `historia_clinica_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `preagendamiento`
--
ALTER TABLE `preagendamiento`
  ADD CONSTRAINT `preagendamiento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `preagendamiento_ibfk_2` FOREIGN KEY (`id_tipo_cita`) REFERENCES `tipo_cita` (`id`);

--
-- Filtros para la tabla `tcita_especialidad`
--
ALTER TABLE `tcita_especialidad`
  ADD CONSTRAINT `tcita_especialidad_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id_especialidad`),
  ADD CONSTRAINT `tcita_especialidad_ibfk_2` FOREIGN KEY (`id_tcita`) REFERENCES `tipo_cita` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
