<?php

/**
 * 
 * @author AnhNV
 *
 */
class RegisterController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {		
//     	$captcha = new Zend_Captcha_Image();
//     	$captcha->setImgDir(CAPTCHA_PATH . '/img');
//     	$captcha->setImgUrl(CAPTCHA_URL . '/img');
//     	$captcha->setWordlen(6);
//     	$captcha->setFont(CAPTCHA_PATH . '/font/tahoma.ttf');
//     	$captcha->setFontSize(30);
//     	$captcha->generate();
//     	$this->view->captcha = $captcha->render($this->view);
//     	$this->view->captchaId = $captcha->getId();
 
//     	$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captcha->getId());
//     	$captchaSession->word = $captcha->getWord();

//     	if ($this->_request->isPost()) {
    		
//     		$captchaId = $this->_request->getParam('captcha_id');
//     		$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captchaId);

//     		echo $captchaSession->word;
//     		$file = CAPTCHA_PATH . '/img/' . $captchaId . $captcha->getSuffix();
//     		unlink($file);
//     	}
	}
	
	/**
	 * doRegisterAction
	 * @throws Exception
	 */
	public function doRegisterAction() {		
		if ($this->_request->isPost()) {
// 			$params = $this->_request->getParams();
// 			$user = $this->CreateUser($params);
// 			try {
// 				$userObj = new Users();
// 				$userObj->add($user);
// 			} catch (Exception $e) {
// 				throw $e;
// 			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * CreateUser
	 * @param array $params
	 * @return Zend_Db_Table_Row
	 */
	private function CreateUser(array $params) {		
		$user = array();
		$user['user_name'] = $params['username'];
		$user['email'] = $params['email'];
		$user['phone_number'] = $params['phone'];
		$user['class_id'] = $params['class_id'];
		$user['password'] = md5($params['password']);
		$user['user_type'] = '0';
		$user['delete_flg'] = '0';
		$user['insert_dt'] = date("Y-m-d H:i:s");
		$user['insert_user'] = '';
		$user['update_dt'] = date("Y-m-d H:i:s");
		$user['update_user'] = '';
		
		return $user;
	}
}