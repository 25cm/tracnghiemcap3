<?php

class AdminSearchCustomerController extends Controller
{
    const SESSION_KEY_SEARCH = 'search';
    const SESSION_KEY_PAGE = 'page';
    const SESSION_KEY_RETURN_DETAIL = 'return';
    const FROM_ADMIN_ISSUE_HIST = 1;
    const FROM_DISCO_ISSUE_HIST = 2;
    const FROM_DISCO_REQUEST_ISSUE = 4;

    /**
     *
     *
     */
    public function indexAction(){
        $this->_forward('/list');
    }

    /**
     *
     *
     */
    public function listAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
       
        $this->session->removeData(self::SESSION_KEY_PAGE);
        $this->session->removeData(self::SESSION_KEY_RETURN_DETAIL);
        $page = null;
        $targetUrl = '';
        if ($this->getRequest()->isPost()) {
            $where = $this->_input->getEscaped();

        } else {
            if (isset($this -> _input -> target)) {
                $target = $this -> _input -> target;
                if (strcmp($target, self::FROM_ADMIN_ISSUE_HIST) === 0) {
                    $targetUrl = "/da-issued-hist/add-customer";
                } else if (strcmp($target, self::FROM_DISCO_ISSUE_HIST) === 0) {
                    $targetUrl = "/du-issued-hist/add-customer";
                } else if (strcmp($target, self::FROM_DISCO_REQUEST_ISSUE) === 0) {
                    $targetUrl = "/du-issue/add-customer";
                }
            }
            $where = $this->session->getData(self::SESSION_KEY_SEARCH);
            if (is_null($where)) {
                $where = array();
            }
            $page = isset($this->_input->page) ? $this->_input->page : $this->session->getData(self::SESSION_KEY_PAGE);
            if(!isset($where['target'])) {
                $where['target'] = $targetUrl;
            }
        }
        $this->getRequest()->setParams($where);
        $this->session->setModuleScope(self::SESSION_KEY_SEARCH, $where);
        $this->session->setModuleScope(self::SESSION_KEY_PAGE, $page);

        $select = MCustomers::getInstance()->getSelectDABySearchkey($where);
        $this->view->max_display_char = Zynas_Registry::getConfig()->constants->max_display_char;
        $this->view->paginator = Zynas_Paginator::factoryWithOptions($select, $page, $this->view);
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }
    public function handleErrorList() {
        //$this->view->errors = array('login' => E002V);
        //return $this->_forward('login');
    }

}

?>