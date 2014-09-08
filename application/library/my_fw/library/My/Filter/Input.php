<?php

class My_Filter_Input extends Zend_Filter_Input {
    const KEY_FILTER = 'filter';
    const KEY_VALIDATE = 'validate';
    public function __construct($filterRules, $validatorRules, $data = array(), $options = array()) {
        $filterRules = array_merge(array('*' => new My_Filter_StringTrim()), $filterRules);
        $defaultOptions = array(
            self::ALLOW_EMPTY => false,
            self::BREAK_CHAIN => true,
            self::ESCAPE_FILTER => 'StringTrim',
            self::MISSING_MESSAGE => 'is required.',
            self::NOT_EMPTY_MESSAGE => 'is required.',
            self::PRESENCE => self::PRESENCE_REQUIRED
        );
        parent::__construct(array('*' => new My_Filter_StringTrim()), $validatorRules, $data, array_merge($defaultOptions, $options));
        $this->addFilterPrefixPath('My_Filter_', 'My/Filter/');
        $this->addValidatorPrefixPath('My_Validate_', 'My/Validate/');
    }
}

?>