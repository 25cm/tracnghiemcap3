<?php
// define('APPLICATION_ENV', getenv('APPLICATION_ENV'));
// define('APPLICATION_PATH', getenv('APPLICATION_PATH'));

// Define path to application directory
defined('APPLICATION_PATH')
|| define('APPLICATION_PATH',
realpath(dirname(__FILE__) . '/../application'));
// Define application environment
defined('APPLICATION_ENV')
|| define('APPLICATION_ENV',
(getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV')
: 'production'));
define('MODULE_PATH', APPLICATION_PATH . '/modules');
define('PUBLIC_PATH', realpath(dirname(__FILE__) . '/../public'));
define('CAPTCHA_PATH', PUBLIC_PATH . '/captcha');
define('APPLICATION_URL', '/tracnghiemcap3');
define('CAPTCHA_URL', APPLICATION_URL . '/public/captcha');
define('APP_BASE', APPLICATION_PATH . '/../');
define('APP_HOME', APPLICATION_PATH . '/');
?>