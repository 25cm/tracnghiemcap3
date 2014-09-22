<?php

/**
 * 
 * @author AnhNV
 *
 */
class RecoverController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		
		$this->_forward('/request');
	}
	
	public function requestAction() {
		
	}
	
	/**
	 * confirmRecoverPassword
	 */
	public function confirmRequestAction() {
		
		if ($this->_request->isPost()) {
			// Request param
			$email = $this->_request->getParam('email');
			$username = $this->_request->getParam('username');
			// Get users by verified, name and mail
			$user = Users::getInstance()->getUserByCond($username, $email, "1");
			// User is not verified
			if (null === $user) {
				$this->_redirect('/recover/error');
			} else {
				// Randomize a new password
				$newPsw = substr(str_shuffle(My_Registry::getConfig()->system->constant->random_str) , 0 , 10 ); 
				$newUser = array();
				$newUser['password'] = $newPsw;
				Users::getInstance()->update($newUser, "user_name = '{$username}'");
				// Send mail
				$this->sendRecoverMail($email, $newPsw);
				$this->_redirect('/recover/complete');
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * completeAction
	 */
	public function completeAction() {}
	
	/**
	 * errorAction
	 */
	public function errorAction() {}
	
	/**
	 * 
	 * @param string $email
	 * @param string $password
	 * @throws Zend_Mail_Transport_Exception
	 */
	private function sendRecoverMail($email = null, $password = null) {
		try {
			// Mail body
			$html = '<html>';
			$html .= '	<body>';
			$html .= '		<div style="line-height: 200%">';
			$html .= '			Bạn đã yêu cầu thay đổi mật khẩu tài khoản tại <a href="' . My_Registry::getConfig()->system->fqdn . '">www.tracnghiemcap3.com</a>';
			$html .= '			<br>';
			$html .= '			Mật khẩu mới của bạn là: ' . $password . '<br>';
			$html .= '			Chúc bạn một ngày vui vẻ!';
			$html .= '			<div style="margin-left: 400px; margin-top: 30px; font-style: italic">';
			$html .= '				BQT tracnghiemcap3.com';
			$html .= '			</div>';
			$html .= '		</div>';
			$html .= '	</body>';
			$html .= '</html>';
			
			// Subject
			$subject = My_Registry::getConfig()->system->mail->recover_password->subject;
			
			// Send
			$mail = new My_Mail($email, $subject, $html);
			$mail->sendHtml();
		} catch (Zend_Mail_Transport_Exception $e) {
			throw $e;
		}
	}
}