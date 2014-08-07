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

define('APP_BASE', APPLICATION_PATH . '/../');
define('APP_HOME', APPLICATION_PATH . '/');

set_include_path(implode(PATH_SEPARATOR, array(
APPLICATION_PATH . '/library',
get_include_path()))
);

require_once 'Zend/Application.php';
$application = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
$application->bootstrap()->run();
?>