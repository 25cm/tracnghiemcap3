<?php

class Admin_Bootstrap extends ModuleBootstrap {

    protected function _initDefault() {
        if ($this->_isModuleBootstrap()) {
            Zend_Controller_Front::getInstance()->registerPlugin(new Controller_Plugin_Default());
            Zend_Controller_Front::getInstance()->registerPlugin(new Controller_Plugin_SslRedirect());
        }
    }
}

?>