<?php

class Controller_Plugin_SslRedirect extends Zend_Controller_Plugin_Abstract {

    public function dispatchLoopStartup() {
        $redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('redirector');
        if (My_Registry::getConfig()->system->ssl->available) {
            $sslPort = My_Registry::getConfig()->system->ssl->port;
            $appPort = $this->getRequest()->getServer('APPLICATION_PORT');
            $controllerName = $this->getRequest()->getControllerName();
            $sslActions = isset(My_Registry::getConfig()->sslRequired->{$controllerName}) ? My_Registry::getConfig()->sslRequired->{$controllerName}->toArray() : array();
            $isSsl = in_array($this->getRequest()->getActionName(), $sslActions) ? true : false;
            if ($isSsl && $appPort != $sslPort) {
                return $redirector->gotoUrl('https://' . My_Registry::getConfig()->system->fqdn . $this->getRequest()->getServer('REQUEST_URI'));
            }
            else if (!$isSsl && $appPort == $sslPort) {
                return $redirector->gotoUrl('http://' . My_Registry::getConfig()->system->fqdn . $this->getRequest()->getServer('REQUEST_URI'));
            }
        }
    }

}

?>