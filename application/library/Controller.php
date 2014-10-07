<?php

class Controller extends My_Controller_Action {

    protected $_input;

    protected $session;
    
    protected $logger;

    public function init() {
        parent::init();
    }

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
            $customErrorHandler = 'handleError' . ucfirst(My_Inflector::camelize($this->getRequest()->getActionName(), false, '-'));
                        
            if (method_exists($this, $customErrorHandler)) {
                $this->$customErrorHandler();
            }
            else {
                $actionStrs = explode('-', $this->getRequest()->getActionName());
                if (count($actionStrs) > 1 && $actionStrs[0] == 'confirm') {
                    $action = substr($this->getRequest()->getActionName(), (strlen($actionStrs[0]) + 1));
                    return $this->_forward($action);
                }
                else {
                    $e = new My_Exception();
                    $e->setErrors($this->view->errors);
                    throw $e;
                }
            }
        }
    }

    public function redirectLoginUser($uri = null, $isRelogin = false, $isCampaign = false) {
        if (is_null($uri)) $uri = $this->getRequest()->getServer('REQUEST_URI');
        $this->_redirect('/auth/login?redir=' . base64_encode($uri) . ($isRelogin ? '&relogin=1' : '') . ($isCampaign ? '&campaign=1' : ''));
    }

    private function initFilterInput(){
        $filterInput = new My_Filter_Input(array(), $this->getValidator(), $this->getRequest()->getParams());
        $filterInput->addValidatorPrefixPath('Validate_', 'Validate/');
        $this->_input = $filterInput;
    }

    private function getValidator(){
        $validationConfigPath = MODULE_PATH . '/' . $this->getRequest()->getModuleName() . '/configs/validate/' . $this->getRequest()->getControllerName() . '/' . $this->getRequest()->getActionName() . '.php';
        $validationRules = file_exists($validationConfigPath) ? My_Config::loadFile($validationConfigPath) : new My_Config(array());
        echo "<pre>";
        print_r($validationRules);
        echo "</pre>";
        
        return $validationRules ? $validationRules->toArray() : array();
    }

}

?>