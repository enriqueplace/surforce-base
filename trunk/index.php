<?php
/**
 * SURFORCE-BASE - Zend Framework project
 * @author surforce.com 
 */

/**
 * Definición de rutas por defecto
 */
set_include_path(	'.' .
    PATH_SEPARATOR . './library/' .
    PATH_SEPARATOR . './application/' .
    PATH_SEPARATOR . './application/models/' .
    PATH_SEPARATOR . './public/' .
    PATH_SEPARATOR . get_include_path()
);

/**
 * Carga de clases que se usan constantemente
 * Nota: se hace la carga a demanda
 */
include "Zend/Loader.php";
Zend_Loader::registerAutoload();

/**
 * Configuración del sistema que será leída del config.ini
 * - Se dividen en dos, uno solo para el sistema (conexión base de datos, 
 * timezone, etc) y otra para personalización. 
 */
$config_sys = new Zend_Config_Ini('./application/config_sys.ini');
$config_app = new Zend_Config_Ini('./application/config_app.ini');

/* 
 * Permite registrar de forma pública las instancias de estas variables de
 * configuración  
*/  
$registry = Zend_Registry::getInstance();

/*
 * DEBUG
 */
if($config_sys->debug === 'on'){
	error_reporting(E_ALL|E_STRICT);	
}

/* TIMEZONE */
date_default_timezone_set($config_sys->timezone);

/*
 * Dejar disponible en el sistema variables 
 * que generalmente se requieren 
 */
$registry->set('config_sys', $config_sys);
$registry->set('config_app', $config_app);
$registry->set('base_path', realpath('.') );
$registry->set('debug', $config_sys->debug === 'on');

/* START SESSION
 * En caso de necesitar el manejo de sesiones, 
 * descomentar esta parte 
*/ 
//$session = new Zend_Session_Namespace('app');
//$registry->set('session', $session);

/**
 * Zend_Layout
 */
Zend_Layout::startMvc(array(
    'layoutPath' => $registry->get('base_path') . '/html/scripts'
));
$view = Zend_Layout::getMvcInstance()->getView();

/**
 * Configuración Base de Datos
 */
$db = Zend_Db::factory(
    $config_sys->database->db->adapter,
    $config_sys->database->db->config->toArray()
);
Zend_Db_Table::setDefaultAdapter($db);
Zend_Registry::set('dbAdapter', $db);

/**
 * Setup controller
 *
 */
$controller = Zend_Controller_Front::getInstance();
$controller->setControllerDirectory('./application/default/controllers');

/*
 * Todos los módulos que se creen dentro de nuestra aplicación deben de tener
 * una entrada aquí, en el bootstrap.
 *
 * Por ejemplo, si copiamos un módulo del proyecto surforce-modules en nuestro
 * proyecto, deberá crearse una nueva línea que especifique donde encontrar el
 * controller que maneja toda la acción del módulo.
 *
 * Nota: el módulo noticias verdadero debe tomarse del proyecto surforce-modules,
 * ya que se agregó temporalmente a surforce-base para poder hacer pruebas.
 */

/* Módulos de surforce-modules */
 
//$controller->addControllerDirectory('./application/noticias/controllers', 'noticias');
//$controller->addControllerDirectory('./application/contacto/controllers', 'contacto');
//$controller->addControllerDirectory('./application/faqs/controllers', 'faqs');
//$controller->addControllerDirectory('./application/paginas/controllers', 'paginas');
//$controller->addControllerDirectory('./application/usuarios/controllers', 'usuarios');
//$controller->addControllerDirectory('./application/contacto/contactoskype', 'contactoskype');

$controller->throwExceptions(true); // should be turned on in development time

/* run!
 * Se atrapan las  excepciones y en caso de existir alguna se muestran
 * separadas por lineas.
 */ 
try {
	$controller->dispatch();
} catch(Exception $e) {
	echo nl2br($e->__toString());
}

/**
 * En el bootstrap (index.php) recomiendan por debug que no se cierre con el tag
 * tradicional de PHP "?>"
 */