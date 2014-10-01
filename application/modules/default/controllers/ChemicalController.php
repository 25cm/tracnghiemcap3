<?php

/**
 *
 * @author AnhNV
 *
 */
class ChemicalController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		// Login check
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			$this->_redirect('auth/login');
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * lop10Action
	 */
	public function lop10Action() {
		// Login check
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			$this->_redirect('auth/login');
		}
		
		if ($this->_request->isGet()) {
			$id = $this->getParam('id');
			if (strlen($id) != 6) {
				return $this->_forward('/error');
			}
			
			$majorId = substr($id, 0, 2);
			$classId = substr($id, 2, 2);
			$subMajorId = substr($id, 4);
			
			$questions = Questions::getInstance()->getQuestionsByMajorClass($majorId, $subMajorId, $classId);
			if (null === $questions) {
				return $this->_forward('/error');
			}
			
			$submajors = Submajors::getInstance()->getSubmajorsByKey($majorId, $subMajorId);
			$majorNameVi = Majors::getInstance()->getMajorNameViById($majorId);
			$majorNameEn = Majors::getInstance()->getMajorNameById($majorId);
			
			$this->view->submajor_name = $submajors->submajor_name;
			$this->view->major_name_vi = $majorNameVi;
			$this->view->major_name_en = $majorNameEn;
			$this->view->questions = $questions;
			$ns = new Zend_Session_Namespace('info');
			$ns->info = array(
								'submajor_name' => $submajors->submajor_name,
								'major_name_vi' => $majorNameVi,
								'class_id' => $classId
			);
		}
	}
	
	/**
	 * lop11Action
	 */
	public function lop11Action() {
		// Login check
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			$this->_redirect('auth/login');
		}
		
	if ($this->_request->isGet()) {
			$id = $this->getParam('id');
			if (strlen($id) != 6) {
				return $this->_forward('/error');
			}
			
			$majorId = substr($id, 0, 2);
			$classId = substr($id, 2, 2);
			$subMajorId = substr($id, 4);
			
			$questions = Questions::getInstance()->getQuestionsByMajorClass($majorId, $subMajorId, $classId);
			if (null === $questions) {
				return $this->_forward('/error');
			}
			
			$submajors = Submajors::getInstance()->getSubmajorsByKey($majorId, $subMajorId);
			$majorNameVi = Majors::getInstance()->getMajorNameViById($majorId);
			$majorNameEn = Majors::getInstance()->getMajorNameById($majorId);
			
			$this->view->submajor_name = $submajors->submajor_name;
			$this->view->major_name_vi = $majorNameVi;
			$this->view->major_name_en = $majorNameEn;
			$this->view->questions = $questions;
			$ns = new Zend_Session_Namespace('info');
			$ns->info = array(
								'submajor_name' => $submajors->submajor_name,
								'major_name_vi' => $majorNameVi,
								'class_id' => $classId
			);
		}
	}
	
	/**
	 * lop12Action
	 */
	public function lop12Action() {
		// Login check
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			$this->_redirect('auth/login');
		}
		
	if ($this->_request->isGet()) {
			$id = $this->getParam('id');
			if (strlen($id) != 6) {
				return $this->_forward('/error');
			}
			
			$majorId = substr($id, 0, 2);
			$classId = substr($id, 2, 2);
			$subMajorId = substr($id, 4);
			
			$questions = Questions::getInstance()->getQuestionsByMajorClass($majorId, $subMajorId, $classId);
			if (null === $questions) {
				return $this->_forward('/error');
			}
			
			$submajors = Submajors::getInstance()->getSubmajorsByKey($majorId, $subMajorId);
			$majorNameVi = Majors::getInstance()->getMajorNameViById($majorId);
			$majorNameEn = Majors::getInstance()->getMajorNameById($majorId);
			
			$this->view->submajor_name = $submajors->submajor_name;
			$this->view->major_name_vi = $majorNameVi;
			$this->view->major_name_en = $majorNameEn;
			$this->view->questions = $questions;
			$ns = new Zend_Session_Namespace('info');
			$ns->info = array(
								'submajor_name' => $submajors->submajor_name,
								'major_name_vi' => $majorNameVi,
								'class_id' => $classId
			);
		}
	}
	
	/**
	 * submissionAction
	 */
	public function submissionAction() {
		
		if ($this->_request->isPost()) {
			$params = $this->_request->getParams();
			$questions = Questions::getInstance()->getQuestionsByMajorClass($params['major_id'], $params['submajor_id'], $params['class_id']);
			$points = $this->getPoints($params, $questions);
			$this->savePoints($params, $points);
			$ns = new Zend_Session_Namespace('point');
			$ns->point = $points;
			
			$this->_forward('/result');
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * resultAction
	 */
	public function resultAction() {
		$sn = new Zend_Session_Namespace('info');
		$p = new Zend_Session_Namespace('point');
		$this->view->info = $sn->info;
		$this->view->point = $p->point;
		
		// Clear session
		unset($sn->info);
		unset($p->point);
	}
	
	/**
	 * errorAction
	 */
	public function errorAction() {
		
	}
	
	/**
	 *
	 * @param array $params
	 * @param mixed $questions
	 * @return string
	 */
	private function getPoints(array $params, $questions) {
		// Number of correct answer
		$correct = 0;
		$points = 0;
		for ($i = 1; $i <= 10; $i++) {
			if (isset($params["answer_$i"])) {
				if ($params["answer_$i"] == $questions[$i-1]->correct_answer) {
					$points++; // 1 points foreach correct answer!
					$correct++; // 1 correct answer
				}
			}
		}
		
		// Bonus 1 point if all answers are correct
		return $correct == 10 ? $points + 1 : $points;
	}
	
	/**
	 * 
	 * @param array $params
	 * @param decimal $points
	 * @return boolean
	 */
	private function savePoints(array $params, $points) {
		try {
			// Get login info
			$auth = Zend_Auth::getInstance();
			// Login user id
			$userId = $auth->getIdentity()->user_id;
			// Get Points by userId
			$pointsObj = Points::getInstance()->getPointsByUserId($userId);
			
			// The user has not join any exam yet?
			if ($pointsObj === null) {
				$row = Points::getInstance()->fetchNew();
				$row->user_id = $userId;
				$row->class_id = $params['class_id'];
				$row->point = $points;
				$row->insert_dt = date('y-m-d');
				$row->insert_user = $auth->getIdentity()->user_name;
				$row->update_dt = date('y-m-d');
				$row->update_user = $auth->getIdentity()->user_name;
				$row->save();
			} else {
				$updatePoint = array();
				$updatePoint['point'] = $pointsObj->point + $points;
				$updatePoint['update_dt'] = date('y-m-d');
				Points::getInstance()->update($updatePoint, "user_id = '{$userId}'");
			}
			
			return true;
		} catch (Exception $e) {
			return false;
		}
	}
}