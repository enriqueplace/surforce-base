<?php
require_once 'Zend/Controller/Action.php';

// FIXME!
require_once './application/noticias/models/Noticias.php';

class Noticias_IndexController extends Zsurforce_Generic_Controller{

    function indexAction()
    {
        $noticias = new Noticias();
        $where = array();
        $order = "id";
        $this->view->noticias = $noticias->fetchAll($where, $order);

        $this->view->base_path = Zend_Registry::get('base_path');

        $this->render();
    }
    function agregarAction()
    {
    }
    function modificarAction()
    {
    }
    function eliminarAction()
    {
    }
    function verAction()
    {
    }
}
?>
