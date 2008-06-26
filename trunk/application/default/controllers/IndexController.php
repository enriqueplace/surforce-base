<?php

/**
 * IndexController - The default controller class
 * 
 * @author
 * @version 
 */

require_once 'Zend/Controller/Action.php';

class IndexController extends Zsurforce_Generic_Controller 
{
	/**
	 * The default action - show the home page
	 */
    public function indexAction() 
    {
        // TODO Auto-generated IndexController::indexAction() action
        $this->view->headTitle('SURFORCE-BASE');        
        $this->view->scriptaculous = TRUE;
    }
}
