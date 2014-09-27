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
	protected $_key = array('question_id', 'major_id', 'class_id', 'submajor_id');
	
	/**
	 * @var Users
	 */
	protected static $_instance = null;
	
	/**
	 * @return Users
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
	
	/**
	 * 
	 * @param string $questionId
	 * @param string $majorId
	 * @param string $submajorId
	 * @param string $classId
	 */
	public function getQuestionByKey($questionId = null, $majorId = null, $submajorId = null, $classId = null) {
		
		$sql = $this->select()
				->where("question_id = ?", $questionId)
				->where("major_id = ?", $majorId)
				->where("submajor_id = ?", $submajorId)
				->where("class_id = ?", $classId);
		
		return $this->fetchRow($sql);
	}
	
	/**
	 * 
	 * @param string $majorId
	 * @param string $submajorId
	 * @param string $classId
	 */
	public function getQuestionsByMajorClass($majorId = null, $submajorId = null, $classId = null) {
		
		$sql = $this->select()
				->where("major_id = ?", $majorId)
				->where("submajor_id = ?", $submajorId)
				->where("class_id = ?", $classId);
		
		return $this->fetchAll($sql);
	}
}