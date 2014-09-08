<?php
class Zynas_Validate_StringLength extends Zend_Validate_StringLength {
    protected $_messageTemplates = array(
        self::TOO_SHORT => '%min%文字以上で入力してください。',
        self::TOO_LONG  => '%max%文字以内で入力してください。'
    );
}
?>