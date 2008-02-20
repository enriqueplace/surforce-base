<?php

// FIXME!
require_once './application/noticias/models/Noticias.php';

class Noticias_AdminController extends Zsurforce_Generic_Controller {

	public function indexAction() {
		$noticias = new Noticias();
		$where = array();
		$order = "id";
		$this->view->noticias = $noticias->fetchAll($where, $order);

		$this->view->base_path = Zend_Registry::get('base_path');

		$this->render();
	}
	function agregarAction()
	{
		if ($this->_request->isPost()) {
			$p = $this->getPostsFiltered();
			
			$noticias = new Noticias();
			
			if(isset($p['titulo'])&&isset($p['fecha'])){
				$resultado = 
					$noticias->insert(array(
						'titulo'=>$p['titulo'],
						'fecha'=>$p['fecha']
					));
			}
			
			echo $resultado;
		}
	}
	function modificarAction()
	{
	}
	function eliminarAction()
	{
	}
	function getPostsFiltered(){
		
		$parmsPost = array();
		
		Zend_Loader::loadClass('Zend_Filter_StripTags');
		$f = new Zend_Filter_StripTags();
		
		foreach ($this->_request->getParams() as $key => $value){
			$parmsPost[$key]=$f->filter($value);
		}
		
		return $parmsPost;
	}
}
