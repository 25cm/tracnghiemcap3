<?php

/**
 * 
 * @author AnhNV
 *
 */
class My_Db_Table extends Zend_Db_Table {
	
	/**
	 * 
	 * @var My_Db_Table
	 */
	protected static $_instance = null;
	
	/**
	 * 
	 * @return My_Db_Table
	 */
	public static function getInstance() {
		return self::$_instance === null ? new self() : self::$_instance;
	}
}