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
			$verificationCd = md5(uniqid(My_Registry::getConfig()->system->constant->random_str, true));
			
			// Create user for insert
			$user = $this->createUser($params, $verificationCd);
			
			try {
				// Add a new user
				Users::getInstance()->add($user);
				// Send an email for registration user
				$this->sendActivationMail($params['email'], $verificationCd);
				
				// Move to complete
				$this->_redirect('/register/complete');
				
			} catch (Exception $e) {
				throw $e;
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
		
	/**
	 * Complete register
	 */
	public function completeAction() {
				
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
	private function sendActivationMail($email, $verificationCd) {
		$html = '<html>';
		$html .= '	<body>';
		$html .= '		<div style="line-height: 200%">';
		$html .= '			Bạn đã đăng ký 1 tài khoản tại <a href="' . My_Registry::getConfig()->system->fqdn . '">www.tracnghiemcap3.com</a>';
		$html .= '			<br>';
		$html .= '			Bạn vui lòng click vào';
		$html .= '			<a href="' . My_Registry::getConfig()->system->fqdn . '/activate/activate?code=' . $verificationCd . '">đây</a>';
		$html .= '			để kích hoạt tài khoản.<br>';
		$html .= '			Chúc bạn một ngày vui vẻ!';
		$html .= '			<div style="margin-left: 400px; margin-top: 30px; font-style: italic">';
		$html .= '				BQT tracnghiemcap3.com';
		$html .= '			</div>';
		$html .= '		</div>';
		$html .= '	</body>';
		$html .= '</html>';
		
		// Subject
		$subject = My_Registry::getConfig()->system->mail->complete_register->subject;
		
		// Send
		$mail = new My_Mail($email, $subject, $html);
		$mail->sendHtml();
	}
}