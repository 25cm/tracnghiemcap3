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
		if ($this->_request->isPost()) {
			// Request params
			$params = $this->_request->getParams();
			try {
				$this->sendContactMail($params['email'], $params['message']);
		
				// Move to complete
				$this->_redirect('/contact/complete');
		
			} catch (Exception $e) {
				throw $e;
			}
		}
		
		$this->_helper->viewRenderer->setNoRender();
	}
	
	/**
	 * completeAction
	 */
	public function completeAction() {}
	
	/**
	 * 
	 * @param string $emailFrom
	 * @param string $message
	 */
	private function sendContactMail($emailFrom = null, $message = null) {
		$html = '<html>';
		$html .= '	<body>';
		$html .= '		<div style="line-height: 200%">';
		$html .= '		<p>' . $message . '</p>';
		$html .= '		</div>';
		$html .= '	</body>';
		$html .= '</html>';
			
		// To admin
		$emailTo = My_Registry::getConfig()->system->mail->contact->to;
		
		// Subject
		$subject = My_Registry::getConfig()->system->mail->contact->subject;
			
		// Send
		$mail = new My_Mail($emailFrom, $emailTo, $subject, $html);
		$mail->sendHtml();
	}
}