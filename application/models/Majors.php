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
	
	/**
	 * no param
	 */
	public function getMajorsInfo() {
		$sql = $this->select()
				->order('major_id');
		
		return $this->fetchAll($sql);
	}
	
	/**
	 * 
	 * @param string $majorId
	 */
	public function getMajorsByKey($majorId = null) {
		$sql = $this->select()
				->where('major_id = ?', $majorId);
		
		return $this->fetchRow($sql);
	}
	
	/**
	 * 
	 * @param string $majorId
	 * @return string
	 */
	public function getMajorNameViById($majorId = null) {
		$majorNameVi = '';
		$sql = $this->select()
				->where('major_id = ?', $majorId);
		
		$majorNameEn = $this->fetchRow($sql)->major_name;
		switch ($majorNameEn) {
			case Constants::DIA_LY:
				$majorNameVi = 'Địa lý';
				break;
			case Constants::HOA_HOC:
				$majorNameVi = 'Hóa học';
				break;
			case Constants::SINH_HOC:
				$majorNameVi = 'Sinh học';
				break;
			case Constants::TIENG_ANH:
				$majorNameVi = 'Tiếng Anh';
				break;
			case Constants::VAT_LY:
				$majorNameVi = 'Vật lý';
				break;
		}
		
		return $majorNameVi;
	}
	
	/**
	 *
	 * @param string $majorId
	 * @return string
	 */
	public function getMajorNameById($majorId = null) {
		$sql = $this->select()
		->where('major_id = ?', $majorId);
		
		return $this->fetchRow($sql)->major_name;
	}
}