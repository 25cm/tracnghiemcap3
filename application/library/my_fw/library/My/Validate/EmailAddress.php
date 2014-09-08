<?php
class Zynas_Validate_EmailAddress extends Zend_Validate_EmailAddress {
    protected $_messageTemplates = array(
        self::INVALID            => '基本的なメールアドレスのフォーマットではありません。',
        self::INVALID_FORMAT     => 'メールアドレスの形式ではありません。',
        self::INVALID_HOSTNAME   => '%hostname%が、メールアドレスの有効なホスト名ではありません。',
        self::INVALID_MX_RECORD  => '%hostname%が、メールアドレスの有効なMXレコードにはありません。',
        self::DOT_ATOM           => '%localPart%が、ドットフォーマットにマッチしません。',
        self::QUOTED_STRING      => '%localPart%が、二重引用符フォーマットにマッチしません。',
        self::INVALID_LOCAL_PART => '%localPart%は、メールアドレスの有効なローカルではありません。'
    );
}
?>