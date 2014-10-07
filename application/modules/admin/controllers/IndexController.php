<?php

/**
 * 
 * @author AnhNV
 *
 */
class Admin_IndexController extends Controller {
	
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
	}
}