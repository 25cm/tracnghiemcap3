<?php

/**
 * 
 * @author AnhNV
 * 
 */
class Submajors extends Zend_Db_Table {
	
	/**
	 *
	 * @var table name
	 */
	protected $_name = 'submajors';
	
	/**
	 *
	 * @var primary key
	 */
	protected $_key = array('major_id', 'class_id', 'submajor_id');
	
	/**
	 * @var Submajors
	 */
	protected static $_instance = null;
	
	/**
	 * @return Submajors
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
	
	/**
	 * return Zend_Db_Table_Rows
	 */
	public function getSubmajorsInfo() {
		$sql = $this->select()
			->from(array('s' => 'Submajors'))->setIntegrityCheck(false)
			->joinLeft(array('m' => 'Majors'), 's.major_id = m.major_id');
		
		return $this->fetchAll($sql);
	}
	
	/**
	 * 
	 * @param string $classId
	 */
	public function getSubmajorsByClassId($classId = null) {
		$sql = $this->select(false)
				->from(array('sm' => 'Submajors'))->setIntegrityCheck(false)
				->joinLeft(array('m' => 'Majors'), 'sm.major_id = m.major_id')
				->where("class_id = ?", $classId);
		
		return $this->fetchAll($sql);
	}
	
	/**
	 * 
	 * @param string $majorId
	 * @param string $submajorId
	 */
	public function getSubmajorsByKey($majorId = null, $submajorId = null) {
		$sql = $this->select()
				->where("major_id = ?", $majorId)
				->where("submajor_id = ?", $submajorId);
		
		return $this->fetchRow($sql);
	}
	
	/**
	 * 
	 * @param string $classId
	 * @param string $majorId
	 */
	public function getSubmajorsByClassIdMajorId($classId = null, $majorId = null) {
		$sql = $this->select()
				->where("class_id = ?", $classId)
				->where("major_id = ?", $majorId);
		
		return $this->fetchAll($sql);
	}
}