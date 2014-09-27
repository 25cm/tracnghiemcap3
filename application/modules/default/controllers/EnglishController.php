<?php

class EngLishController extends Controller {
	
	public function indexAction() {
		
	}
	
	public function lop10Action() {
		
		if (isset($_GET["id"])) {
			$id = $_GET["id"];
			if (strlen($id) != 7) {
				// Error: Wrong id format
			}
			
			$majorId = substr($id, 0, 2);
			$classId = substr($id, 2, 2);
			$subMajorId = substr($id, 4);
			
			$questions = Questions::getInstance()->getQuestionsByMajorClass($majorId, $subMajorId, $classId);
			if (null === $questions) {
				// Error: Wrong id
			}
			
			$submajors = Submajors::getInstance()->getSubmajorsByKey($majorId, $subMajorId);
			
			$this->view->submajor_name = $submajors->submajor_name; 
			$this->view->questions = $questions;
		}
	}
	
	public function lop11Action() {
		
	}
	
	public function lop12Action() {
		
	}
	
	public function submissionAction() {
		$this->_helper->viewRenderer->setNoRender();
	}
	
	public function errorAction() {
		
	}
}