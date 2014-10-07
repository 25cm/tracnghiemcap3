<?php

class Utility {
	
	/**
	 * @var Utility
	 */
	protected static $_instance = null;
	
	/**
	 * @return Utility
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
	
		return self::$_instance;
	}
	
	/**
	 * convertMajorNameEnToVi
	 * @param array $majorsArr
	 * @return array
	 */
	public function convertMajorNameEnToVi($majorsArr = array()) {
		$majorVi = array();
		foreach ($majorsArr as $key => $val) {
			switch ($val) {
				case Constants::DIA_LY:
					$majorVi[$key] = 'Địa lý';
					break;
				case Constants::HOA_HOC:
					$majorVi[$key] = 'Hóa học';
					break;
				case Constants::SINH_HOC:
					$majorVi[$key] = 'Sinh học';
					break;
				case Constants::TIENG_ANH:
					$majorVi[$key] = 'Tiếng Anh';
					break;
				case Constants::VAT_LY:
					$majorVi[$key] = 'Vật lý';
					break;
			}
		}
		
		return $majorVi;
	}
	
	/**
	 *
	 * @param string $str
	 */
	public function getHashCode($str) {
		return md5($str);
	}
}