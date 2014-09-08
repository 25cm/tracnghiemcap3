<?php
class Zynas_Validate_File_ImageSize extends Zend_Validate_File_ImageSize {
    protected $_messageTemplates = array(
        self::WIDTH_TOO_BIG    => '画像の幅が、許可されたものより大きいです。',
        self::WIDTH_TOO_SMALL  => '画像の幅が、許可されたものより小さいです。',
        self::HEIGHT_TOO_BIG   => '画像の縦が、許可されたものより大きいです。',
        self::HEIGHT_TOO_SMALL => '画像の縦が、許可されたものより小さいです。',
        self::NOT_DETECTED     => '画像サイズを、検出出来ませんでした。',
        self::NOT_READABLE     => '画像ファイルを読み込めませんでした。'
    );
}
?>