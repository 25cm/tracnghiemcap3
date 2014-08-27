<?php

class My_Validate extends Zend_Validate {
	public function addValidator(Zend_Validate_Interface $validator, $breakChainOnFailure = true)
	{
		$this->_validators[] = array(
				'instance' => $validator,
				'breakChainOnFailure' => (boolean) $breakChainOnFailure
		);
		return $this;
	}
	
	public function getMessage() {
		return current($this->getMessages());
	}
}