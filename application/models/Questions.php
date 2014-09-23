<?php

/**
 * 
 * @author AnhNV
 *
 */
class Questions extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'questions';
	
	/**
	 *
	 * @var primary key, use array for multiple key
	 */
	protected $_key = 'class_id';
	
	/**
	 * @var Questions
	 */
	protected static $_instance = null;
	
	/**
	 * @return Questions
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
}