<?php
/**
 * surforce-base - Zend Framework project
 *
 * @author Enrique Place
 */

/**
 * Definición de directorios
 */
set_include_path(
    '.' .
    PATH_SEPARATOR . './library' .
    PATH_SEPARATOR . './application/default/models/' .
    PATH_SEPARATOR . get_include_path()
);

/**
 * Carga de clases que se usan constantemente
 */

include "Zend/Loader.php";
Zend_Loader::loadClass('Zend_Controller_Front');
Zend_Loader::loadClass('Zend_Config_Ini');
Zend_Loader::loadClass('Zend_Registry');
Zend_Loader::loadClass('Zend_Db');
Zend_Loader::loadClass('Zend_Db_Table');
Zend_Loader::loadClass('Zend_Auth');
Zend_Loader::loadClass('Zend_Session');

// Surforce
if(Zend_Loader::isReadable('Zsurforce/Generic/Controller.php'))
	Zend_Loader::loadClass('Zsurforce_Generic_Controller');

/**
 * Configuración del sistema que será leída del config.ini
 */
$config_sys = new Zend_Config_Ini('./application/config_sys.ini');
$config_app = new Zend_Config_Ini('./application/config_app.ini');

// Permite registra de forma pública las instancias de estas variables de
// configuración
$registry = Zend_Registry::getInstance();

$registry->set('config_sys', $config_sys);
$registry->set('config_app', $config_app);
$registry->set('base_path', realpath('.') );



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
 * Configuración inicial
 */
error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('America/Montevideo');

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

// Módulos de surforce-modules
$controller->addControllerDirectory('./application/noticias/controllers', 'noticias');
//$controller->addControllerDirectory('./application/contacto/controllers', 'contacto');
//$controller->addControllerDirectory('./application/faqs/controllers', 'faqs');
//$controller->addControllerDirectory('./application/paginas/controllers', 'paginas');
//$controller->addControllerDirectory('./application/usuarios/controllers', 'usuarios');
//$controller->addControllerDirectory('./application/contacto/contactoskype', 'contactoskype');

$controller->throwExceptions(false); // should be turned on in development time

// run!
$controller->dispatch();

/**
 * En el bootstrap (index.php) recomiendan por debug que no se cierre con el tag
 * tradicional de PHP "?>"
 */