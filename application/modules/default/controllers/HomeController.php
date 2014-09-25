<?php

/**
 * 
 * @author AnhNV
 *
 */
class HomeController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		
		$subMajorObj = new SubMajors();
		$class10 = $subMajorObj->getSubmajorsByClassId("10");
		$class11 = $subMajorObj->getSubmajorsByClassId("11");
		$class12 = $subMajorObj->getSubmajorsByClassId("12");
		$this->view->class_10 = $class10;
		$this->view->class_11 = $class11;
		$this->view->class_12 = $class12;
	}
}