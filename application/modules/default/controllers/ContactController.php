<?php

/**
 * 
 * @author AnhNV
 *
 */
class ContactController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		$this->_helper->viewRenderer->setNoRender();
		$this->_forward('/request');
	}
	
	/**
	 * requestAction
	 */
	public function requestAction() {}
	
	/**
	 * confirmRequestAction
	 */
	public function confirmRequestAction() {
		
	}
	
	/**
	 * completeAction
	 */
	public function completeAction() {}
}