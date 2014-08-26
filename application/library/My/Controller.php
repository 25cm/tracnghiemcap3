<?php

class My_Controller extends Zend_Controller_Action {
	
	protected $_input;
	
	public function preDispatch() {
		parent::preDispatch();
		$this->view->request = $this->getRequest();
		$this->initFilterInput();
		
		if (!$this->_input->isValid()) {
			$errors = array();
			foreach ($this->_input->getMessages() as $k => $v) {
				$errors[$k] = is_array($v) ? current($v) : $v;
			}
			$this->view->errors = $errors;
// 			$customErrorHandler = 'handleError' . ucfirst(Zynas_Inflector::camelize($this->getRequest()->getActionName(), false, '-'));
// 			if (method_exists($this, $customErrorHandler)) {
// 				$this->$customErrorHandler();
// 			}
// 			else {
// 				$actionStrs = explode('-', $this->getRequest()->getActionName());
// 				if (count($actionStrs) > 1 && $actionStrs[0] == 'confirm') {
// 					$action = substr($this->getRequest()->getActionName(), (strlen($actionStrs[0]) + 1));
// 					return $this->_forward($action);
// 				}
// 				else {
// 					$e->setErrors($this->view->errors);
// 				}
// 			}
		}
	}
	
// 	public function redirectLoginUser($uri = null, $isRelogin = false, $isCampaign = false) {
// 		if (is_null($uri)) $uri = $this->getRequest()->getServer('REQUEST_URI');
// 		$this->_redirect('/auth/login?redir=' . base64_encode($uri) . ($isRelogin ? '&relogin=1' : '') . ($isCampaign ? '&campaign=1' : ''));
// 	}
	
	private function initFilterInput() {
// 		echo "<pre>";
// 		print_r($this->getValidator());
// 		echo "</pre>";
		$filterInput = new Zend_Filter_Input(array(), $this->getValidator(), $this->getRequest()->getParams());
		$filterInput->addValidatorPrefixPath('Validate_', 'Validate/');
		$this->_input = $filterInput;
	}
	
	private function getValidator(){
		$validationConfigPath = MODULE_PATH . '/' . $this->getRequest()->getModuleName() . '/configs/validate/' . $this->getRequest()->getControllerName() . '/' . $this->getRequest()->getActionName() . '.php';
		echo $validationConfigPath;
		$validationRules = file_exists($validationConfigPath) ? Zend_Config::loadFile($validationConfigPath) : new Zend_Config(array());
		return $validationRules ? $validationRules->toArray() : array();
	}
}