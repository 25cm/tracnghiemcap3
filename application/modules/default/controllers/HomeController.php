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
		
		// Get list submajors
		$subMajorObj = new SubMajors();
		$class10 = $subMajorObj->getSubmajorsByClassId("10");
		$class11 = $subMajorObj->getSubmajorsByClassId("11");
		$class12 = $subMajorObj->getSubmajorsByClassId("12");
		$this->view->class_10 = $class10;
		$this->view->class_11 = $class11;
		$this->view->class_12 = $class12;
		
		// Get top 5 users
		$top5Points = Points::getInstance()->getTop5Score();
		$this->view->top5 = $top5Points; 
	}
}