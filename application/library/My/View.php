<?php

class My_View extends Zend_View {
	
	protected static $_instance;
	
	public static function factory($suffix, $scriptPath, $helperPath) {
		$class = 'My_View_' . $suffix;
		if (!class_exists($class)) throw new My_View_Exception('No My_View class found: ' . $class);
		if (!self::$_instance instanceof My_View) {
			self::$_instance = new $class();
			self::$_instance->setScriptPath($scriptPath);
			foreach ((array) $helperPath as $p) self::$_instance->addHelperPath($p[0], $p[1]);
			self::$_instance->addHelperPath(APPLICATION_PATH . '/library/My/View/Helper/', 'My_View_Helper_');
		}
		return self::$_instance;
	}
	
	public function render($name) {
		error_reporting(E_ALL ^ E_NOTICE);
		return parent::render($name);
	}
}
?>