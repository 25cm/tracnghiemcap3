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
	 * return Zend_Db_Table_Rows
	 */
	public function getSubmajorsInfo() {
		return $this->fetchAll($this->select());
	}
	
	/**
	 * 
	 * @param string $classId
	 */
	public function getSubmajorsByClassId($classId = null) {
		$sql = $this->select()
				->where("class_id = ?", $classId);
		
		return $this->fetchAll($sql);
	}
}