<?php
/**
 * ログイン画面のコントローラークラス
 * <pre>
 * </pre>
 * @author nojiri
 * @package /modules/default/controller
 */

class AuthController extends My_Controller {

//     const COOKIE_KEY_USER_ID = 'user_id';
//     const COOKIE_KEY_USER_PSW = 'user_psw';
//     const SESSION_KEY_USER_ID = 'id';
//     const SESSION_KEY_PSW = 'psw';

	public function indexAction() {
		$db = Zend_Registry::get('dbConnect');
		$auth = Zend_Auth::getInstance();
		$authAdapter = new Zend_Auth_Adapter_DbTable($db);
		$authAdapter->setTableName('users')
					->setIdentityColumn('user_name')
					->setCredentialColumn('password');
		
		// Neu can them dieu kien
// 		$select = $authAdapter->getDbSelect();
// 		$select->where('')
// 			   ->where('');
		
		if ($this->_request->isPost()) {
			$user_name = $this->_request->getParam('user_name');
			$password = $this->_request->getParam('password');
			$authAdapter->setIdentity($user_name);
			$authAdapter->setCredential($password);
			
			// Authenticate
			$result = $auth->authenticate($authAdapter);
			if ($result->isValid()) {
				// Login success
				$userInfo = $authAdapter->getResultRowObject();
				// Set session
				$auth->getStorage()->write($data);
				// Lay thong tin
				$auth->getIdentity();
			} else {
				// Login fail: User name and password do not match
			}
		}
		
		//$this->_redirect('auth/login');
	}
	
    /**
     * 初期化処理
     * <pre>
     * </pre>
     */
    public function loginAction() {
    	
    	// Kiem tra login hay chua
    	$auth = Zend_Auth::getInstance();
    	if ($auth->hasIdentity()) {
    		// da login
    	} else {
    		// chua login
    	}
    }
    	
    public function logOutAction() {
    	Zend_Auth::getInstance()->clearIdentity();
    	$this->_redirect('auth/login');
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