-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-01-2008 a las 02:18:10
-- Versión del servidor: 5.0.45
-- Versión de PHP: 5.2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--

--
CREATE DATABASE `surforce-base` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `surforce-base`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faqs`
--

CREATE TABLE `faqs` (
  `id` int(50) NOT NULL auto_increment,
  `pregunta` varchar(250) character set utf8 collate utf8_unicode_ci NOT NULL,
  `respuesta` varchar(250) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `faqs`
--

INSERT INTO `faqs` (`id`, `pregunta`, `respuesta`, `fecha`) VALUES
(1, '¿Cómo se hace para conseguir el login del sistema?', 'Deberá contactarse con el owner del proyecto a través de un email', '2007-10-14 00:21:14'),
(2, '¿qué otra pregunta puedo hacer en una FAQ?', 'Cómo preguntar bien y ser entendido', '2008-01-27 00:36:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item` varchar(45) collate utf8_spanish_ci NOT NULL,
  `destino` varchar(255) collate utf8_spanish_ci NOT NULL,
  `posicion` smallint(4) NOT NULL default '0',
  `privado` char(1) collate utf8_spanish_ci NOT NULL default '1',
  `estado` char(1) character set latin1 collate latin1_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=15 ;

--
-- Volcar la base de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `item`, `destino`, `posicion`, `privado`, `estado`) VALUES
(1, 'ABM Noticias', '/noticias/noticias/', 1, '1', '1'),
(2, 'ABM FAQ', '/faqs/faqs/', 30, '1', '1'),
(5, 'home', '/', 0, '0', '1'),
(6, 'Introducción', '/paginas/paginas/ver/id/7', 4, '0', '1'),
(7, 'Investigación', '/paginas/paginas/ver/id/8', 5, '0', '1'),
(8, 'ABM Menú Principal', '/menu/menu/', 9, '1', '1'),
(9, 'prueba item deshabilitado', '/noticias/noticias/', 8, '1', '0'),
(10, 'ABM Páginas', '/paginas/paginas/', 7, '1', '1'),
(11, 'ABM Usuarios', '/usuarios/usuarios/', 12, '1', '1'),
(14, 'ABM Cuadro Menú', '/menus/menus/', 10, '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_sitio` int(10) unsigned NOT NULL,
  `nombre` varchar(150) collate utf8_unicode_ci NOT NULL,
  `titulo` varchar(50) collate utf8_unicode_ci default NULL,
  `descripcion` varchar(255) collate utf8_unicode_ci default NULL,
  `posicion` tinyint(2) NOT NULL default '1',
  `privado` char(1) collate utf8_unicode_ci NOT NULL,
  `estado` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `id_sitio`, `nombre`, `titulo`, `descripcion`, `posicion`, `privado`, `estado`) VALUES
(1, 0, 'Administrador', 'Menú Administrador', 'menu admin', 2, '1', '1'),
(2, 0, 'Sitios amigos', 'Nuestros sitios amigos', 'Enlaces a sitios amigos', 1, '0', '1'),
(3, 0, 'Ayudas', 'Todas las ayudas', 'Esta es la ayuda principal del sitio', 10, '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus_items`
--

CREATE TABLE `menus_items` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_menu` int(10) unsigned NOT NULL,
  `item` varchar(50) collate utf8_unicode_ci NOT NULL,
  `destino` varchar(255) collate utf8_unicode_ci NOT NULL,
  `posicion` tinyint(2) unsigned NOT NULL,
  `privado` char(1) collate utf8_unicode_ci NOT NULL,
  `estado` char(1) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `menus_items`
--

INSERT INTO `menus_items` (`id`, `id_menu`, `item`, `destino`, `posicion`, `privado`, `estado`) VALUES
(1, 1, 'Menus', '/menus/menus', 1, '0', '1'),
(2, 2, 'Google', 'http://www.google.com', 1, '0', '1'),
(3, 1, 'Usuarios', '/usuarios/usuarios', 2, '1', '1'),
(4, 2, 'Inmobiliarias', 'http://rtnils.com', 5, '0', '1'),
(5, 3, 'prueba', 'http://www.php.net/', 1, '0', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_spanish_ci NOT NULL,
  `contenido` text collate utf8_spanish_ci NOT NULL,
  `contenido_ext` text collate utf8_spanish_ci NOT NULL,
  `contenido_ext3` text collate utf8_spanish_ci NOT NULL,
  `contenido_ext2` varchar(100) collate utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `contenido`, `contenido_ext`, `contenido_ext3`, `contenido_ext2`, `fecha`, `id_usuario`) VALUES
(11, 'Otra noticia nueva', '<p>Problemos el nuevo m&oacute;dulo para noticias</p>', '<p>Y esta es la noticia extendida</p>', '', '', '2008-01-26 20:58:18', 0),
(9, 'Cienpies exports Card Reader to France', '<p>Cienpies Design is a good example of young, talented Uruguayan people who seek to make their way through the international market.</p>', '<p>adfadf ad fadf adsf ad f</p>', '', '', '2008-01-08 20:46:37', 0),
(10, 'Nueva noticia extendida', '<p>Contenido simple</p>', '<p>contenido extendido y con t&iacute;ldes!</p>', '', '', '2008-01-08 22:01:00', 0),
(12, 'Buscan a Maddie en Chile', '<p><span id="_ctl5_lblNota">La polic&iacute;a dijo el viernes que est&aacute; investigando un informe sobre el supuesto avistamiento en el norte de Chile de la ni&ntilde;a brit&aacute;nica Madeleine McCann, desaparecida el 3 de mayo del a&ntilde;o pasado en una playa en Portugal.<br />\r\n</span></p>', '<p>El detective Segundo Leyton, jefe de la brigada especializada en la b&uacute;squeda de personas desaparecidas, dijo a medios locales que la investigaci&oacute;n se inici&oacute; luego de que un ciudadano no identificado dijo a la polic&iacute;a haber visto una pareja de extranjeros con una ni&ntilde;a parecida a la peque&ntilde;a.</p>\r\n<p>El denunciante &quot;se&ntilde;ala que hab&iacute;a visto a una menor de similares caracter&iacute;sticas a la peque&ntilde;a Madeleine y que estaba acompa&ntilde;ada de una persona adulta y una mujer&quot;, dijo Leyton.</p>\r\n<p>Agreg&oacute; que &quot;le llama m&aacute;s la atenci&oacute;n la presencia del sujeto, que lo encuentra muy similar a la persona que aparece en la prensa&quot;, aludiendo a un sospechoso cuyo retrato hablado fue entregado por los padres de la ni&ntilde;a recientemente.</p>\r\n<p>Agreg&oacute; que el hombre dijo que la pareja hablaba un idioma extranjero.<br />\r\nEl informante dijo que la menor estaba en la ciudad de Vicu&ntilde;a, 500 kil&oacute;metros al norte, y que el hombre con ella correspond&iacute;a al retrato hablado del supuesto secuestrador divulgado este mes por los padres de la menor.</p>\r\n<p>El hombre que alert&oacute; a la polic&iacute;a, del que s&oacute;lo se dijo que es un t&eacute;cnico en refrigeraci&oacute;n, dijo a la polic&iacute;a que vio a la pareja y la ni&ntilde;a en el museo de la poetisa chilena Gabriela Mistral.</p>\r\n<p>(AP)</p>', '', '', '2008-01-26 23:19:20', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

CREATE TABLE `paginas` (
  `id` int(10) NOT NULL auto_increment,
  `titulo` varchar(150) collate utf8_spanish_ci NOT NULL,
  `contenido` text collate utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `paginas`
--

INSERT INTO `paginas` (`id`, `titulo`, `contenido`, `fecha`, `id_usuario`) VALUES
(1, 'Declaran esencialidad de servicios quirúrgicos', 'Tras el Consejo de Ministros', '2007-08-01 01:15:13', 1),
(3, 'pagina2', 'contenido de la segunda pagina', '2007-08-01 01:25:40', 0),
(5, 'Primer página con TinyMCE', 'Mmm... c&oacute;mo se ve esto?', '2007-08-13 20:32:18', 0),
(6, 'Sin festejos, Fidel cumple años', '<img src="http://www.elpais.com.uy/07/08/13/33742_298.JPG" alt="Fidel" title="Fidel Castro" width="298" height="255" align="right" />La Habana', '2007-08-14 01:23:57', 0),
(7, 'Introducción', 'Uruguay explota recursos naturales pesqueros del Oc&eacute;ano Atl&aacute;ntico Sud Occidental', '2007-08-16 02:22:55', 0),
(8, 'Investigación', 'La Investigaci&oacute;n Cient&iacute;fica de los Recursos Pesqueros', '2007-08-16 02:28:01', 0),
(9, 'Página de 14/10/2007', '<p><em>Nueva p&aacute;gina del d&iacute;a de hoy<img alt="" src="/surforce-cms/public/scripts/fckeditor/editor/images/smiley/msn/cry_smile.gif" /></em></p>', '2007-10-14 00:29:37', 0),
(10, 'Mi CV vitae', '<p>Esto es una prueba mia de CV</p>', '2007-12-03 01:52:35', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades`
--

CREATE TABLE `styles_propiedades` (
  `id_propiedad` int(11) NOT NULL auto_increment,
  `propiedad` varchar(32) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id_propiedad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=122 ;

--
-- Volcar la base de datos para la tabla `styles_propiedades`
--

INSERT INTO `styles_propiedades` (`id_propiedad`, `propiedad`) VALUES
(1, 'azimuth'),
(2, 'background'),
(3, 'background-attachment'),
(4, 'background-color'),
(5, 'background-image'),
(6, 'background-position'),
(7, 'background-repeat'),
(8, 'border'),
(9, 'border-collapse'),
(10, 'border-color'),
(11, 'border-spacing'),
(12, 'border-style'),
(13, 'border-top'),
(14, 'border-right'),
(15, 'border-bottom'),
(16, 'border-left'),
(17, 'border-right-color'),
(18, 'border-top-color'),
(19, 'border-bottom-color'),
(20, 'border-left-color'),
(21, 'border-top-style'),
(22, 'border-right-style'),
(23, 'border-bottom-style'),
(24, 'border-left-style'),
(25, 'border-top-width'),
(26, 'border-right-width'),
(27, 'border-bottom-width'),
(28, 'border-left-width'),
(29, 'border-width'),
(30, 'bottom'),
(31, 'caption-side'),
(32, 'clear'),
(33, 'clip'),
(34, 'color'),
(35, 'content'),
(36, 'counter-increment'),
(37, 'counter-reset'),
(38, 'cue'),
(39, 'cue-after'),
(40, 'cue-before'),
(41, 'cursor'),
(42, 'direction'),
(43, 'display'),
(44, 'elevation'),
(45, 'empty-cells'),
(46, 'float'),
(47, 'font'),
(48, 'font-family'),
(49, 'font-size'),
(50, 'font-size-adjust'),
(51, 'font-stretch'),
(52, 'font-style'),
(53, 'font-variant'),
(54, 'heightfont-weight'),
(55, 'left'),
(56, 'letter-spacing'),
(57, 'line-height'),
(58, 'list-style'),
(59, 'list-style-image'),
(60, 'list-style-position'),
(61, 'list-style-type'),
(62, 'margin'),
(63, 'margin-top'),
(64, 'margin-right'),
(65, 'margin-bottom'),
(66, 'margin-left'),
(67, 'marker-offset'),
(68, 'marks'),
(69, 'max-height'),
(70, 'max-width'),
(71, 'min-height'),
(72, 'min-width'),
(73, 'orphans'),
(74, 'outline'),
(75, 'outline-color'),
(76, 'outline-style'),
(77, 'outline-width'),
(78, 'overflow'),
(79, 'padding'),
(80, 'padding-top'),
(81, 'padding-right'),
(82, 'padding-bottom'),
(83, 'padding-left'),
(84, 'page'),
(85, 'page-break-after'),
(86, 'page-break-before'),
(87, 'age-break-inside'),
(88, 'pause'),
(89, 'pause-after'),
(90, 'pause-before'),
(91, 'pitch'),
(92, 'pitch-range'),
(93, 'play-during'),
(94, 'position'),
(95, 'quotes'),
(96, 'richness'),
(97, 'right'),
(98, 'size'),
(99, 'speak'),
(100, 'speak-header'),
(101, 'speak-numeral'),
(102, 'speak-punctuation'),
(103, 'speech-rate'),
(104, 'tress'),
(105, 'table-layout'),
(106, 'text-align'),
(107, 'text-decoration'),
(108, 'text-indent'),
(109, 'text-shadow'),
(110, 'text-transform'),
(111, 'top'),
(112, 'unicode-bidi'),
(113, 'vertical-align'),
(114, 'visibility'),
(115, 'voice-family'),
(116, 'volume'),
(117, 'white-space'),
(118, 'widows'),
(119, 'width'),
(120, 'word-spacing'),
(121, 'z-index');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_propiedades_x_selectores`
--

CREATE TABLE `styles_propiedades_x_selectores` (
  `id_selector` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  `valor` varchar(64) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id_selector`,`id_propiedad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcar la base de datos para la tabla `styles_propiedades_x_selectores`
--

INSERT INTO `styles_propiedades_x_selectores` (`id_selector`, `id_propiedad`, `valor`) VALUES
(1, 62, '5px'),
(1, 48, 'Verdana, Arial, Helvetica, sans-serif'),
(1, 49, '11px'),
(2, 49, '22px'),
(3, 62, '0 auto'),
(4, 66, '10px'),
(4, 79, '0'),
(5, 46, 'left'),
(5, 78, 'hidden'),
(5, 119, '150px'),
(6, 16, '1px solid #CCCCCC'),
(6, 46, 'left'),
(6, 79, '15px'),
(6, 119, '550px'),
(7, 13, '1px solid #CCCCCC'),
(7, 32, 'both'),
(7, 106, 'center'),
(7, 119, '100%'),
(8, 4, '#CCCC00'),
(8, 79, '0 3px 0 3px'),
(9, 14, '1px solid #f0f0f0'),
(9, 15, '1px solid #f0f0f0'),
(9, 79, '2px'),
(10, 43, 'block'),
(10, 46, 'left'),
(10, 106, 'right'),
(10, 119, '150px'),
(11, 66, '100px'),
(12, 34, '#FF0000'),
(12, 62, '10px'),
(13, 119, '205px'),
(14, 46, 'right');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `styles_selectores`
--

CREATE TABLE `styles_selectores` (
  `id_selector` int(11) NOT NULL auto_increment,
  `selector` varchar(64) collate utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) collate utf8_spanish_ci default NULL,
  PRIMARY KEY  (`id_selector`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `styles_selectores`
--

INSERT INTO `styles_selectores` (`id_selector`, `selector`, `descripcion`) VALUES
(1, 'BODY', 'Cuerpo principal de la pagina.'),
(2, 'H1', 'Titulos'),
(3, 'DIV#contenedor', ''),
(4, 'DIV#menu ul, DIV#menu li', ''),
(5, 'DIV#menu', ''),
(6, 'DIV#contenido', ''),
(7, 'DIV#pie', ''),
(8, 'TH', ''),
(9, 'TD', ''),
(10, 'label', ''),
(11, 'DIV#formbutton', ''),
(12, 'DIV#mensaje', ''),
(13, 'DIV#boton_formulario', ''),
(14, 'DIV#boton_formulario INPUT', 'Botones de formularios'),
(15, 'DIV#logueado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `usuario` varchar(32) collate utf8_spanish_ci NOT NULL,
  `password` varchar(32) collate utf8_spanish_ci NOT NULL,
  `nombre` varchar(40) collate utf8_spanish_ci NOT NULL,
  `apellido` varchar(40) collate utf8_spanish_ci NOT NULL,
  `mail` varchar(64) collate utf8_spanish_ci default NULL,
  `estado` int(2) NOT NULL,
  `creado` datetime NOT NULL,
  `modificado` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `apellido`, `mail`, `estado`, `creado`, `modificado`) VALUES
(1, 'homero', 'clave', 'Homero''s', 'Simpson', 'homero@springfield.com', 1, '2007-07-03 21:11:50', '2007-07-26 01:17:25'),
(2, 'apu', 'clave', 'Apu', 'Nahasapeemapetilon', 'apu@springfield.com', 1, '2007-07-03 23:22:09', '2007-07-03 23:32:19'),
(4, 'montgomery', 'clave', 'Montgomery', 'Burns', 'montgomery@springfield.com', 0, '2007-07-03 23:25:26', '2007-07-03 23:25:26'),
(5, 'kent', 'clave', 'Kent', 'Brockman', 'kent@springfield.com', 1, '2007-07-03 23:25:26', '2007-07-03 23:25:26'),
(6, 'eplace', 'pepe', 'Enrique', 'Place de Cuadro', 'enriqueplace@gmail.com', 1, '2007-07-25 23:45:28', '2007-10-15 22:43:16'),
(7, 'admin', 'pepe', 'Admin', 'Admin', 'admin@surforce.com', 1, '2008-01-26 21:38:25', '2008-01-26 20:38:26');





DROP TABLE IF EXISTS `contacto`;
CREATE TABLE `contacto` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `nombre` varchar(50) collate utf8_spanish_ci default NULL,
  `email` varchar(50) collate utf8_spanish_ci NOT NULL,
  `comentario` varchar(500) collate utf8_spanish_ci default NULL,
  `fecha` datetime NOT NULL,
  `telefono` varchar(30) collate utf8_spanish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

INSERT INTO `contacto` (`id`, `nombre`, `email`, `comentario`, `fecha`, `telefono`) VALUES
(1, 'Evariste', 'evari@yahoo.com', 'Fracciones continuas', '2007-01-10 00:00:00', '12'),
(2, 'nombre', 'mail', 'comentario', '2008-01-08 21:04:48', '12');
