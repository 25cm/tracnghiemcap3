<?php

/**
 * 
 * @author AnhNV
 *
 */
class Points extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'points';
	
	/**
	 *
	 * @var primary key, use array for multiple key
	 */
	protected $_key = 'class_id';
	
	/**
	 * @var Points
	 */
	protected static $_instance = null;
	
	/**
	 * @return Points
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
}