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
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			return $this->_redirect('/auth/login');
		} else if ($auth->getIdentity()->user_type !== '1') {
			return $this->_redirect('/error');
		}
		
		$this->_forward('/list');
	}
	
	/**
	 * listAction
	 */
	public function listAction() {
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			return $this->_redirect('/auth/login');
		} else if ($auth->getIdentity()->user_type !== '1') {
			return $this->_redirect('/error');
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * addAction
	 */
	public function addAction() {
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			return $this->_redirect('/auth/login');
		} else if ($auth->getIdentity()->user_type !== '1') {
			return $this->_redirect('/error');
		}
		
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
		
		// Get submajors info getSubmajorsInfo
		$subMajors = Submajors::getInstance()->getSubmajorsInfo();
// 		$subMajors = Submajors::getInstance()->getSubmajorsByClassIdMajorId(key($classLst), key($majorLst));
		$subMajorLst = array();
		foreach ($subMajors as $s) {
			$subMajorLst[$s->submajor_id] = $s->submajor_name;
		}
		$this->view->submajors = $subMajorLst;
	}
	
	/**
	 * confirmAddAction
	 */
	public function confirmAddAction() {
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			return $this->_redirect('/auth/login');
		} else if ($auth->getIdentity()->user_type !== '1') {
			return $this->_redirect('/error');
		}
		
		if ($this->_request->isPost()) {
			$params = $this->_request->getParams();
			if ($this->saveQuestions($params)) {
				echo '<script>alert("Thêm thành công!");</script>';
			} else {
				echo '<script>alert("Đã có lỗi xảy ra!");</script>';
			}
			
			$this->_forward('/add');
		}
	}
	
	public function changeAction() {
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			return $this->_redirect('/auth/login');
		} else if ($auth->getIdentity()->user_type !== '1') {
			return $this->_redirect('/error');
		}
	    
	    if ($this->getRequest()->isXmlHttpRequest()) {
	        $arr = array("a", "b", "c", "d");
	       echo json_encode($arr);
	    }
	    
	    $this->_helper->viewRenderer->setNoRender(true);
// 	    $classId = $this->_request->getParameter('class_id');
// 	    $majorId = $this->_request->getParameter('major_id'); echo $classId;
	    
// 	    // Get submajors info
// 		$subMajors = Submajors::getInstance()->getSubmajorsByClassIdMajorId(key($classLst), key($majorLst));
// 	    $str='';
// 	    foreach ($subMajors as $s) {
// 	        $str=$str . "$s->submajor_name" . ",";
// 	    }
	    
// 	    $str=substr($str,0,(strLen($str)-1)); // Removing the last char , from the string
	    
	    
// 	    echo json_encode($str);
	}
	
	/**
	 * 
	 * @param array $params
	 * @return boolean
	 */
	private function saveQuestions(array $params) {
		try {
			$row = Questions::getInstance()->fetchNew();
			$row->major_id = $params['major_id'];
			$row->submajor_id = $params['submajor_id'];
			$row->class_id = $params['class_id'];
			$row->question = $params['question'];
			$row->answer_1 = $params['answer_1'];
			$row->answer_2 = $params['answer_2'];
			$row->answer_3 = $params['answer_3'];
			$row->answer_4 = $params['answer_4'];
			$row->correct_answer = $params['correct_answer'];
			$row->insert_dt = date('y-m-d');
			$row->insert_user = Constants::ADMIN_NAME;
			$row->update_dt = date('y-m-d');
			$row->update_user = Constants::ADMIN_NAME;
				
			$row->save();
			return true;
		} catch (Exception $e) {
			return false;
		}
	}
}