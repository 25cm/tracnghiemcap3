<?php

/**
 * 
 * @author AnhNV
 *
 */
class Admin_SubmajorController extends Controller {
	
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
		// TODO
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
		foreach ($classes as $c) {
			$classLst[$c->class_id] = $c->class_name;
		}
		$this->view->classes = $classLst;
	}
	
	/**
	 * confirmAddAction
	 */
	public function confirmAddAction() {
		if ($this->_request->isPost()) {
			$params = $this->_request->getParams();
			if ($this->saveMajors($params)) {
				echo '<script>alert("Thêm thành công!");</script>';
			} else {
				echo '<script>alert("Đã có lỗi xảy ra!");</script>';
			}
			
			$this->_forward('/add');
		}
	}
	
	/**
	 * 
	 * @param array $params
	 * @return boolean
	 */
	private function saveMajors(array $params) {
		
		try {
			// Get major by id
			$majors = Majors::getInstance()->getMajorsByKey($params['major_id']);
			
			$row = Submajors::getInstance()->fetchNew();
			$row->major_id = $params['major_id'];
			$row->class_id = $params['class_id'];
			$row->submajor_name = $params['submajor_name'];
			$row->submajor_img = Constants::BASE_IMAGE_PATH . $majors->major_name . $params['class_id'] . Constants::IMAGE_EXT;
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