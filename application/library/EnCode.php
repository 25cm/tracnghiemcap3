<?php

class EnCode {
	
	/**
	 * @var EnCode
	 */
	protected static $_instance = null;
	
	/**
	 * @return EnCode
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
	
	/**
	 * 
	 * @param string $str
	 */
	public static function getHashCode($str) {
		return md5($str);
	}
}