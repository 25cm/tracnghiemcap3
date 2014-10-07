<?php

/**
 * 
 * @author AnhNV
 *
 */
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected $_moduleName;
    
    /**
     * _initSession
     */
    protected function _initSession() {
    	Zend_Session::start();
    }    

    /**
     * _initAutoload
     */
    protected function _initAutoload() {
        Zend_Loader_Autoloader::getInstance()->setFallbackAutoloader(true);
        require_once(FRAMEWORK_PATH . '/etc/func.php');
    }

    /**
     * _initView
     * @return Zend_View
     */
    protected function _initView() {
        $view = new Zend_View();
        $view->setEncoding('utf-8');
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->setView($view);
        return $view;
    }

    /**
     * _initDatabase
     */
    protected function _initDatabase() {
        $config = $this->getOptions();
        $db = Zend_Db::factory($config['resources']['db']['adapter'], $config['resources']['db']['params'], $config['resources']['db']['params']['profiler']);
        My_Registry::set('dbConnect', $db);
        Zend_Db_Table::setDefaultAdapter($db);
    }

    /**
     * _initConfig
     */
    protected function _initConfig() {
        My_Registry::setConfig(new My_Config($this->getApplication()->getOptions(), true));
    }

    /**
     * _initMail
     */
    protected function _initMail() {
        $configPath = APPLICATION_PATH . '/configs/mail.ini';
        $config = new Zend_Config_Ini($configPath, APPLICATION_ENV, array('allowModifications' => true));
        My_Registry::setConfig(new Zend_Config($this->fArray_merge(My_Registry::getConfig()->toArray(), $config->toArray())));
    }

    /**
     * 
     * @param unknown $aOld
     * @param unknown $aNew
     * @return unknown
     */
    function fArray_merge ($aOld, $aNew) {
        if(is_array($aOld)) {
            if(is_array($aNew)) {
                foreach($aNew as $sKey => $mValue) {
                    if(isset($aOld[$sKey]) && is_array($mValue) && is_array($aOld[$sKey])) {
                        $aOld[$sKey] = $this->fArray_merge($aOld[$sKey], $mValue);
                    }
                    else{
                        $aOld[$sKey] = $mValue;
                    }
                }
            }
        }
        elseif(!is_array($aOld) && (strlen($aOld) == 0 || $aOld == 0)) {
            $aOld = $aNew;
        }
                
        return($aOld);
    }

}

?>