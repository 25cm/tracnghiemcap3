<?php

/**
 * 
 * @author AnhNV
 *
 */

class AuthController extends Controller {
	
	/**
	 * 
	 */	
	public function indexAction() {
		$this->_helper->viewRenderer->setNoRender();
		return $this->_forward('/login');
	}
	
    /**
     * 
     */
    public function loginAction() {
    	
    	// Session check
    	$ns = new Zend_Session_Namespace('login');
    	    	
    	$auth = Zend_Auth::getInstance();
    	if ($auth->hasIdentity() || !empty($ns->username)) {
    		return $this->_redirect('home/');
    	} else {
    		
    	}
    }
    
    public function confirmLoginAction() {
    	if ($this->_request->isPost()) {
    		// Get username and password
    		$username = $this->_request->getParam('username');
    		$password = EnCode::getInstance()->getHashCode($this->_request->getParam('password'));
    		$remember = $this->_request->getParam('remember');
    		
    		// Authenticate
    		//$auth = Auth_User::getInstance();
    		$result = Auth_User::getInstance()->authenticate($username, $password);
    		
    		if ($result) {
    			// Remember user
    			if ($remember = '1') {
    				$ns = new Zend_Session_Namespace('login');
    				$ns->username = $username;
    				$ns->password = $password;
    				$ns->setExpirationSeconds(1*60*60); // Life for 1 hour
    			}    			
    			
    			$this->_redirect('home/');
    		} else {
    			// Login failed!
    			$this->_forward('/login');
    		}
    	}
    	
    	$this->_helper->viewRenderer->setNoRender();
    }
    	
    public function logoutAction() {
    	// Remove session
    	$ns = new Zend_Session_Namespace('login');
    	unset($ns->username);
    	unset($ns->password);
    	
    	Zend_Auth::getInstance()->clearIdentity();
    	$this->_redirect('/auth/login');
    	$this->_helper->viewRenderer->setNoRender();
    }
}
?>