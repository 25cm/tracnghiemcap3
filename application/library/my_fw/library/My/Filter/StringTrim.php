<?php

class My_Filter_StringTrim extends Zend_Filter_StringTrim {
	
    public function filter($value) {
        if (!is_string($value) || (is_object($value) && !method_exists($value, '__toString'))) return $value;
        return parent::filter($value);
    }
}

?>