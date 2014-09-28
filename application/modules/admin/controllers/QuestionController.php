<?php

/**
 * 
 * @author AnhNV
 *
 */
class Admin_QuestionController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		$this->_forward('/list');
	}
	
	/**
	 * listAction
	 */
	public function listAction() {
		echo __METHOD__;
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * addAction
	 */
	public function addAction() {
		// Get majors info
		$majors = Majors::getInstance()->getMajorsInfo();
		$majorLst = array();
		foreach ($majors as $m) {
			$majorLst[$m->major_id] = $m->major_name;
		}
		$this->view->majors = Utility::getInstance()->convertMajorNameEnToVi($majorLst);
		
		// Get classes info
		$classes = Classes::getInstance()->getClassesInfo();
		$classLst = array();
		foreach ($classes as $c) {
			$classLst[$c->class_id] = $c->class_name;
		}
		$this->view->classes = $classLst;
		
		// Get submajors info
		$subMajors = Submajors::getInstance()->getSubmajorsByClassIdMajorId(key($classLst), key($majorLst));
		$subMajorLst = array();
		foreach ($subMajors as $s) {
			$subMajorLst[] = $s->submajor_name;
		}
		$this->view->submajors = $subMajorLst;
	}
	
	/**
	 * confirmAddAction
	 */
	public function confirmAddAction() {
		
	}
}