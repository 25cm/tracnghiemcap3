<?php
class Zynas_Validate_GreaterThan extends Zend_Validate_GreaterThan {
    protected $_messageTemplates = array(
        self::NOT_GREATER => '%min%よりも大きくありません。'
    );
}
?>