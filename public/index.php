<?php

require 'define.php';

set_include_path(implode(PATH_SEPARATOR, array(
APPLICATION_PATH . '/library',
get_include_path()))
);

require_once 'Zend/Application.php';
$application = new Zend_Application(APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini');
$application->bootstrap()->run();
?>