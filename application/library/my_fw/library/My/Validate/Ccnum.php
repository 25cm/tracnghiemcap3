<?php
class Zynas_Validate_Ccnum extends Zend_Validate_Ccnum {
    protected $_messageTemplates = array(
        self::LENGTH   => '13~19字含む必要があります。',
        self::CHECKSUM => 'ルーン式チェック(mod-10 チェックサム)に失敗しました。'
    );
}
?>