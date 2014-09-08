<?php

class Controller_Plugin_Default extends Zend_Controller_Plugin_Abstract {

	public function dispatchLoopStartup() {
		$redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');

// 		if ($this->getRequest()->getServer('HTTP_HOST') != My_Registry::getConfig()->system->fqdn) {
// 			return $redirector->gotoUrl('http://' . My_Registry::getConfig()->system->fqdn . '/error');
// 		}

		if (!Auth_Info::isLoggedUser()) {
			$loginRequired = true;
			$adminLoginNotRequired = array(
	                'default/auth/login',
	                'default/auth/confirm-login',
					'default/recover/request',	
			        'default/recover/confirm-request',
					'default/recover/confirm'
			);
			$requestResource = $this->getRequest()->getModuleName() . '/' . $this->getRequest()->getControllerName() . '/' . $this->getRequest()->getActionName();
			foreach ($adminLoginNotRequired as $resource) {
				if ($requestResource == $resource) {
					$loginRequired = false;
					break;
				}
			}
// 			if ($loginRequired) {
// 				$redirTo = '/auth/login';
// 				$redirector->gotoUrl($redirTo);
// 			}
		}

		$configPath = pjoin(MODULE_PATH, 'default/configs/controllers') . '/' . $this->getRequest()->getControllerName() . '.ini';
		if(file_exists($configPath)) {
			$config = new Zend_Config_Ini($configPath);
			AX_Registry::setConfig(new Zend_Config($this->merge_recursive(AX_Registry::getConfig()->toArray(), $config->toArray())));
		}

		Zend_Paginator::setDefaultScrollingStyle('Sliding');
		Zend_View_Helper_PaginationControl::setDefaultViewPartial('_partial/pagination.phtml');

	}

	public function preDispatch() {
	}

	private function merge_recursive(array $array1, array $array2) {
		$merge_arary = (array) $array1;
		foreach ($array2 as $key => $val) {
			if (!key_exists($key, $merge_arary)) {
				$merge_arary[$key] = $val;
			} else {
				$r_val = $merge_arary[$key];
				if (!is_array($r_val)) {
					$merge_arary[$key] = $val;
				} else {
					$merge_arary[$key] = $this->merge_recursive($r_val, $val);
				}
			}
		}
		return $merge_arary;
	}

}

?>