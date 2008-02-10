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

/**
 * Configuración del sistema que será leída del config.ini
 */
$config_database = new Zend_Config_Ini('./application/config_system.ini', 'database');
$config_personalizacion = new Zend_Config_Ini('./application/config_general.ini', 'personalizacion');

// Permite registra de forma pública las instancias de estas variables de
// configuración
$registry = Zend_Registry::getInstance();

$registry->set('config_database', $config_database);
$registry->set('config_personalizacion', $config_personalizacion);

/**
 * Configuración inicial
 */
error_reporting(E_ALL|E_STRICT);
date_default_timezone_set('America/Montevideo');

/**
 * Setup controller
 */
$controller = Zend_Controller_Front::getInstance();
$controller->setControllerDirectory('./application/default/controllers');

/**
 * Todos los módulos que se creen dentro de nuestra aplicación deben de tener
 * una entrada aquí, en el bootstrap
 */
$controller->addControllerDirectory('./application/frontend/controllers', 'frontend');
$controller->addControllerDirectory('./application/backend/controllers', 'backend');
$controller->addControllerDirectory('./application/install/controllers', 'install');

$controller->throwExceptions(false); // should be turned on in development time

// run!
$controller->dispatch();

/**
 * En el bootstrap (index.php) recomiendan por debug que no se cierre con el tag
 * tradicional de PHP "?>"
 */
