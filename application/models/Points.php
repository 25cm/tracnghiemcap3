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
	
	/**
	 * getTop5Score
	 */
	public function getTop5Score() {
		$sql = $this->select()
					->from(array('p' => 'Points'))->setIntegrityCheck(false)
					->join(array('u' => 'Users'), 'p.user_id = u.user_id')
					->order('p.point desc');
		
		return $this->fetchAll($sql);
	}
	
	/**
	 * 
	 * @param string $userId
	 */
	public function getPointsByUserId($userId = null) {
		$sql = $this->select()
				->where('user_id = ?', $userId);
		
		return $this->fetchRow($sql);
	}
}