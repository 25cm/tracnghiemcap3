<?php

/**
 * 
 * @author AnhNV
 *
 */
class Answers extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'answers';
	
	/**
	 *
	 * @var primary key, use array for multiple key
	 */
	protected $_key = 'answer_id';
	
	/**
	 * @var Answers
	 */
	protected static $_instance = null;
	
	/**
	 * @return Answers
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
}