<?php
class Zynas_Validate_Identical extends Zend_Validate_Identical {
    protected $_messageTemplates = array(
        self::NOT_SAME      => 'トークンが、マッチしません。',
        self::MISSING_TOKEN => '照合すべきトークンが、ありませんでした。'
    );
}
?>