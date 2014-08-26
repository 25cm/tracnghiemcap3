<?php

class Captcha {
	
	
	
	public static function generate() {
	
    	$captcha = new Zend_Captcha_Image();
    	$captcha->setImgDir(CAPTCHA_PATH . '/img');
    	$captcha->setImgUrl(CAPTCHA_URL . '/img');
    	$captcha->setWordlen(6);
    	$captcha->setFont(CAPTCHA_PATH . '/font/tahoma.ttf');
    	$captcha->setFontSize(30);
    	$captcha->generate();
    	$this->view->captcha = $captcha->render($this->view);
    	$this->view->captchaId = $captcha->getId();
 
    	$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captcha->getId());
    	$captchaSession->word = $captcha->getWord();

    	if ($this->_request->isPost()) {
//     		echo "<pre>";
//     		print_r($this->_request->getParams());
//     		echo "</pre>";
    		$captchaId = $this->_request->getParam('captcha_id');
    		$captchaSession = new Zend_Session_Namespace('Zend_Form_Captcha_' . $captchaId);

    		echo $captchaSession->word;
    		$file = CAPTCHA_PATH . '/img/' . $captchaId . $captcha->getSuffix();
    		unlink($file);
    	}
	}
}