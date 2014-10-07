<?php

class ModuleBootstrap extends Zend_Application_Module_Bootstrap {

    protected $_moduleNameFromRequest;
    protected $_moduleConfigDirectory;
    protected $_request;

    protected function _initModule() {
        if ($this->_isModuleBootstrap()) {
            $this->__initConfig();
        }
    }

    private function __initConfig() {
        $configPath = $this->_getConfigDirectory() . 'module.ini';
        if(file_exists($configPath)) {
            $config = new Zend_Config_Ini($configPath, APPLICATION_ENV, array('allowModifications' => true));
            $this->setOptions($config->toArray());
            My_Registry::setConfig(new Zend_Config(array_merge(My_Registry::getConfig()->toArray(), $config->toArray())));
        }
    }
    
    private function __getModuleNameFromRequest() {
        if (empty($this->_moduleNameFromRequest)) {
            $request = new Zend_Controller_Request_Http();
            Zend_Controller_Front::getInstance()->getRouter()->route($request);
            $this->_moduleNameFromRequest = $request->getModuleName();
            $this->_request = $request;
        }
        return $this->_moduleNameFromRequest;
    }

    protected function _getConfigDirectory() {
        if (empty($this->_moduleConfigDirectory)) {
            $this->_moduleConfigDirectory = MODULE_PATH . '/' . $this->__getModuleNameFromRequest() . '/configs/';
        }
        return $this->_moduleConfigDirectory;
    }

    protected function _isModuleBootstrap() {
        return $this->__getModuleNameFromRequest() == strtolower($this->getModuleName()) ? true : false;
    }

}

?>
