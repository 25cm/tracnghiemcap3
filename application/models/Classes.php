<?php

/**
 * 
 * @author AnhNV
 *
 */
class Classes extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'classes';
	
	/**
	 *
	 * @var primary key, use array for multiple key
	 */
	protected $_key = 'class_id';
	
	/**
	 * @var Classes
	 */
	protected static $_instance = null;
	
	/**
	 * @return Classes
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
	
	/**
	 * getClassesInfo
	 */
	public function getClassesInfo() {
		$sql = $this->select()
			->order('class_id');
		
		return $this->fetchAll($sql);
	}
}