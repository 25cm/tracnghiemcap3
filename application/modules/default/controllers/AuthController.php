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
    	$auth = Zend_Auth::getInstance();
    	if ($auth->hasIdentity()) {
    		return $this->_redirect('index/index');
    	} else {
    		
    	}
    }
    
    public function confirmLoginAction() {
    	if ($this->_request->isPost()) {
    		// Get username and password
    		$username = $this->_request->getParam('username');
    		$password = $this->_request->getParam('password');
    		
    		// Authenticate
    		$result = My_Auth_Info::authenticate($username, $password);
    		if ($result) {
    			$this->_redirect('index/index');
    		} else {
    			// Login failed!
    			$this->_forward('login');
    		}
    	}
    	
    	$this->_helper->viewRenderer->setNoRender();
    }
    	
    public function logOutAction() {
    	Zend_Auth::getInstance()->clearIdentity();
    	$this->_redirect('auth/login');
    }
    
    public function handleErrorDoLogin() {
    	
    }
    
    	
    	
    	
    	
    	
    	
    	
    	// CAPTCHA
    	
//     	$captcha = new Zend_Captcha_Image();
//     	$captcha->setImgDir(CAPTCHA_PATH . '/img');
//     	$captcha->setImgUrl(CAPTCHA_URL . '/img');
//     	$captcha->setWordlen(6);
//     	$captcha->setFont(CAPTCHA_PATH . '/font/tahoma.ttf');
//     	$captcha->setFontSize(30);
//     	$captcha->generate();
//     	$this->view->captcha = $captcha->render($this->view);
//     	$this->view->captchaId = $captcha->getId(); 
    	
// //     	$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captcha->getId());
// //     	$captchaSession->word = $captcha->getWord();
    	    	
//     	if ($this->_request->isPost()) {
//     		echo "<pre>";
//     		print_r($this->_request->getParams());
//     		echo "</pre>";
//     		$captchaId = $this->_request->getParam('captcha_id');
//     		$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captchaId);
    		
//     		echo $captchaSession->word;
//     		$file = CAPTCHA_PATH . '/img/' . $captchaId . $captcha->getSuffix();
//     		unlink($file);
//     	}
    	
//     	echo "<pre>";
//     	print_r($captcha);
//     	echo "</pre>";
//     }

    /**
     * ログイン処理
     * <pre>
     * </pre>
     */
//     public function confirmLoginAction() {
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';Start action;',$this->getRequest()->getParams());
// 		$auth = Auth_User::getInstance();
//         $cookie = new Zynas_CookieManager();
//         $mailAdress = $this->_input->mailAdress;
//         $password = $this->_input->password;
//         $remember = $this->_input->remember;
//         if ($auth->authenticate($mailAdress, $password)) {
//             if (strcmp($remember,MUsers::REMEMBER) === 0 ) {
//                 $cookie->setData($mailAdress, self::COOKIE_KEY_USER_ID, '', 30, true);
//             } else {
//                 $cookie->removeData(self::COOKIE_KEY_USER_ID);
//             }
//             Log::infoLog('method='.__FUNCTION__.';user_id'.';End action;',$this->getRequest()->getParams());
//             return $this->_redirect('/top/list');
//         } else {
//             return $this->handleErrorDoLogin();
//         }
//     }

    /**
     * ログアウト処理
     * <pre>
     *
     * </pre>
     */
//     public function logoutAction(){
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';Start action;',$this->getRequest()->getParams());
//         Auth_User::getInstance()->clear();
//         Zynas_SessionManager::destory();
//         $this->_redirect('/auth/login?out=' . (isset($_GET['out']) ? $_GET['out'] : '1'));
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';End action;',$this->getRequest()->getParams());
//     }

//     public function handleErrorDoLogin() {
//         $this->view->errors = array('login' => E068V);
//         return $this->_forward('login');
//     }
}
?>