<?php

/**
 * 
 * @author AnhNV
 *
 */
class UserController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		$auth = Zend_Auth::getInstance();
		if (!$auth->hasIdentity()) {
			$this->_redirect('/auth/login');
			return;
		}
		
		$userId = $auth->getIdentity()->user_id;
		$points = Points::getInstance()->getPointsByUserId($userId);
		$this->view->point = $points->point;
	}
	
	/**
	 * changePassAction
	 */
	public function changePassAction() {
		
	}
	
	/**
	 * confirmChangePassAction
	 */
	public function confirmChangePassAction() {
		if ($this->_request->isPost()) {
			$auth = Zend_Auth::getInstance();
			$newPsw = $this->_request->getParam('password');
			$user = array();
			$user['password'] = Utility::getInstance()->getHashCode($newPsw);
			
			try {
				$userObj = new Users();
				$userObj->update($user, "user_name = '{$auth->getIdentity()->user_name}'");
				
				echo '<script>alert("Đổi mật khẩu thành công!");</script>';
				
				$this->_forward('/index');
			} catch (Exception $ex) {
				throw $ex;
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
}