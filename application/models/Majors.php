<?php

/**
 * 
 * @author AnhNV
 *
 */
class Majors extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'majors';
	
	/**
	 *
	 * @var primary key, use array for multiple key
	 */
	protected $_key = 'major_id';
	
	/**
	 * @var Majors
	 */
	protected static $_instance = null;
	
	/**
	 * @return Majors
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
}