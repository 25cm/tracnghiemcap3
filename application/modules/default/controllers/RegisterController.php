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
		$this->_forward('/register');
	}
	
	/**
	 * 
	 */
	public function registerAction() {
		
	}
	
	/**
	 * confirmRegisterAction
	 * @throws Exception
	 */
	public function confirmRegisterAction() {
				
		if ($this->_request->isPost()) {
			// Request params
			$params = $this->_request->getParams();
			
			// Creating a verification code
			$verificationCd = md5(uniqid("randomstringtogetverificationcode", true));
			$verificationLink = My_Registry::getConfig()->system->fqdn . "/register/activate?code=" . $verificationCd;
			// Create user for insert
			$user = $this->createUser($params, $verificationCd);
			try {
				$userObj = new Users();
				
				// User has already exist!
				if ($userObj->checkExistUser($params['username'])) {
// 					$this->_forward('/error');
				} else {
					$userObj->add($user);
					// Send an email for registration user
					//$this->sendActivationMail($params['email'], $verificationCd, $verificationLink);
					
					// Move to complete
					$this->_redirect('/register/complete');
				}
			} catch (Exception $e) {
				throw $e;
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * 
	 */
	public function activateAction() {
		
		$code = $_GET['code'];
		$userObj = new Users();
		
		if ($userObj->checkActivateUser($code)) {
			$user = array();
			$user['verified'] = '1';
			
			$userObj->update($user, "verification_code = '{$code}'");
		}
	}
	
	/**
	 * Complete register
	 */
	public function completeAction() {
				
	}
	
	/**
	 * Error
	 */
	public function errorAction() {
		
	}
	
	/**
	 * CreateUser
	 * @param array $params
	 * @return Zend_Db_Table_Row
	 */
	private function createUser(array $params, $verificationCd) {
		
		$user = array();
		$user['user_name'] = $params['username'];
		$user['email'] = $params['email'];
		$user['verified'] = '0'; // not activate
		$user['verification_code'] = $verificationCd;
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
	
	/**
	 * 
	 * @param unknown $email
	 * @param unknown $verificationLink
	 * @throws Zend_Mail_Transport_Exception
	 */
	private function sendActivationMail($email, $verificationLink) {
		
		try {
			$config = array('auth' => 'login',
				'username' => My_Registry::getConfig()->system->mail->complete_register->from,
				'password' => My_Registry::getConfig()->system->mail->complete_register->password,
				'ssl' => 'ssl',
				'port' => '587'
			);
			
			$trans = new Zend_Mail_Transport_Smtp('mail.google.com', $config);
			Zend_Mail::setDefaultTransport($trans);
			
			$mail = new Zend_Mail();
			$mail->setFrom(My_Registry::getConfig()->system->mail->complete_register->from, My_Registry::getConfig()->system->mail->complete_register->from_name);
			$mail->addTo($email);
			$mail->setSubject(My_Registry::getConfig()->system->mail->complete_register->subject);
			$mail->setBodyText("Bạn vui lòng click vào link dưới đây để kích hoạt tài khoản \n" . $verificationLink);
			
			$mail->send();
		} catch (Zend_Mail_Transport_Exception $e) {
			throw $e;
		}
	}
}