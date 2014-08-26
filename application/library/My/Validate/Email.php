<?php

class My_Validate_Email extends Zend_Validate_Abstract {
	
	const INVALID = 'invalid';
	
	protected $_messageTemplates = array(
		self::INVALID => 'Email bạn nhập không chính xác'
	);
	
	public function isValid($value) {
		
		$validator = new Zend_Validate_EmailAddress();
		if (!$validator->isValid($value)) {
			$this->_errors(self::INVALID);
			return false;
		}
		
		return true;
	}
}
