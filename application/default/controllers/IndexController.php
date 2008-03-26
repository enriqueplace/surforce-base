<?php

/**
 * IndexController - The default controller class
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';

/**
 * La clase IndexController al igual que las clases de los modulos 
 * puede heredar de Zsurforce_Generic_Controller en cuyo caso no 
 * sería necesario redefinir el método init. 
 * IndexController hereda de Zend_Controller_Action para que el
 * proyecto base no sea dependiente de librería.
**/
//class IndexController extends Zsurforce_Generic_Controller
class IndexController extends Zend_Controller_Action 
{
	/**
	 * The default action - show the home page
	 */
	
	public function init(){        
		$this->initView();
        $this->view->baseUrl = $this->_request->getBaseUrl();
        $this->view->addBasePath('./html/','');
        $this->view->addHelperPath('./application/views/helpers/', 'Helper');
        $this->registry = Zend_Registry::getInstance();
	}
	
    public function indexAction() 
    {
        // TODO Auto-generated IndexController::indexAction() action
    }
}
