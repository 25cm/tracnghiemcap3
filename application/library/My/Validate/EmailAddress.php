<?php

class My_Validate_EmailAddress extends Zend_Validate_EmailAddress {
	
	protected $_messageTemplates = array(
        self::INVALID            => 'Email bạn nhập không chính xác',
        self::INVALID_FORMAT     => 'Email bạn nhập không chính xác',
    );
}
