<?php

/**
 * 
 * @author AnhNV
 *
 */
class Validate_PhoneNumber extends Zend_Validate_Abstract {
	
    const NOT_PHONENUMBER = 'phoneNumberNotPhoneNumber';
    const STRING_EMPTY = 'phoneNumberStringEmpty';
    
    protected $_messageTemplates = array(
    	self::NOT_PHONENUMBER => "Không đúng định dạng số điện thoại",
    );
    
    public function isValid($value) {
        if ('' === $value) {
            $this->_error(self::STRING_EMPTY);
            return false;
        }
        if (!preg_match('/^0(\d{1,4}-\d{1,4}-\d{4}|\d{9,10})$/', $value)) {
            $this->_error(self::NOT_PHONENUMBER);
            return false;
        }
        return true;
    }
}