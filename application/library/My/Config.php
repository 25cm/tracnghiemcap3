<?php

class My_Config extends Zend_Config {
	
	public function __construct(array $array, $allowModifications = false) {
		$this->_allowModifications = (boolean) $allowModifications;
		$this->_loadedSection = null;
		$this->_index = 0;
		$this->_data = array();
		foreach ($array as $key => $value) {
			if (is_array($value)) {
				$this->_data[$key] = new self($value, $this->_allowModifications);
			} else {
				$this->_data[$key] = $value;
			}
		}
		$this->_count = count($this->_data);
	}
	
	public static function loadFile($path, $allowModifications = false) {
		if (file_exists($path)) {
			return new My_Config(require($path), $allowModifications);
		}
	}
}