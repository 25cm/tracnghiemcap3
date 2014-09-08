<?php
class Zynas_Validate_File_MimeType extends Zend_Validate_File_MimeType {
    protected $_messageTemplates = array(
        self::FALSE_TYPE   => 'ファイル形式が正しくありません。',
        self::NOT_DETECTED => 'ファイル形式を検出出来ません。',
        self::NOT_READABLE => 'ファイルを読み込めませんでした。'
    );
}
?>