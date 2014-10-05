<?php

/**
 * 
 * @author AnhNV
 *
 */
class ReactiveController extends Controller {
	
	/**
	 * indexAction
	 */
	public function indexAction() {
		$this->_forward('/request');
	}
	
	public function requestAction() {
		
	}
	
	public function confirmRequestAction() {
		if ($this->_request->isPost()) {
			// Request param
			$email = $this->_request->getParam('email');
			$username = $this->_request->getParam('username');
			// Get users by verified, name and mail
			$user = Users::getInstance()->getUserByCond($username, $email, "0");
			// User is already verified
			if (null === $user) {
				$this->_redirect('/reactive/error');
			} else {
				// Creating a verification code
				$verificationCd = md5(uniqid(My_Registry::getConfig()->system->constant->random_str, true));
				// Update new verification code
				$newUser = array();
				$newUser['verification_code'] = $verificationCd;
				Users::getInstance()->update($newUser, "user_name = '{$username}'");
				// Send mail
				$this->sendActivationMail($email, $verificationCd);
				$this->_redirect('/reactive/complete');
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * errorAction
	 */
	public function errorAction() {}
	
	/**
	 * completeAction
	 */
	public function completeAction() {}
	
	/**
	 * 
	 * @param string $email
	 * @param string $verificationCd
	 */
	private function sendActivationMail($email = null, $verificationCd = null) {
		$html = '<html>';
		$html .= '	<body>';
		$html .= '		<div style="line-height: 200%">';
		$html .= '			Chúng tôi đã nhận được yêu cầu gửi lại mã kích hoạt tài khoản của bạn.';
		$html .= '			<br>';
		$html .= '			Bạn vui lòng click vào';
		$html .= '			<a href="' . My_Registry::getConfig()->system->fqdn . '/activate/activate?code=' . $verificationCd . '">đây</a>';
		$html .= '			để kích hoạt lại tài khoản.<br>';
		$html .= '			Chúc bạn một ngày vui vẻ!';
		$html .= '			<div style="margin-left: 400px; margin-top: 30px; font-style: italic">';
		$html .= '				BQT tracnghiemcap3.com';
		$html .= '			</div>';
		$html .= '		</div>';
		$html .= '	</body>';
		$html .= '</html>';

		// From admin
		$from = My_Registry::getConfig()->system->mail->setting->username;
		
		// Subject
		$subject = My_Registry::getConfig()->system->mail->reactive_account->subject;
		
		// Send
		$mail = new My_Mail($from, $email, $subject, $html);
		$mail->sendHtml();
	}
}