<?php

/**
 * 
 * @author AnhNV
 *
 */
class ActivateController extends Controller {
	
	/**
	 * 
	 */
	public function indexAction() {
		
		$this->_forward('/activate');
	}
	
	/**
	 * activateAction
	 */
	public function activateAction() {
	
		$code = isset($_GET['code']) ? $_GET['code'] : "";
		$userObj = new Users();
	
		if ($userObj->checkActivateUser($code)) {
			$user = array();
			$user['verified'] = '1';
				
			$userObj->update($user, "verification_code = '{$code}'");
			$this->_forward('/complete');
		} else {
			$this->_forward('/error');
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * completeAction
	 */
	public function completeAction() {
		
	}
	
	/**
	 * errorAction
	 */
	public function errorAction() {
		
	}
}