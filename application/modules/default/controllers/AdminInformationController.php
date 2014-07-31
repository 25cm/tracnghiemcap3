<?php
/**
 * <pre>
 * </pre>
 * @author ThinhNh
 * @package /modules/default/controller
 */

class AdminInformationController extends Controller {

    const SESSION_KEY_SEARCH = 'search';
    const SESSION_KEY_PAGE = 'page';
    const SESSION_KEY_RETURN_DETAIL = 'return';

    /**
     * 初期表示のアクション
     * <pre>
     * 1)一覧表示アクションにフォワードする
     * </pre>
     */
    public function indexAction() {
        $this->_forward('/list');
    }

    /**
     * Process list informations
     * <pre>
     * 1) get data list
     *   	- If search value not null
     *   			-> return list data search
     *   	- If padding order
     *   			-> return data list with page number order
     * 2)1) Get data from (1) to View
     * </pre>
     */
    public function listAction(){
    	$user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());

        $this->session->removeData(self::SESSION_KEY_PAGE);
        $this->session->removeData(self::SESSION_KEY_RETURN_DETAIL);
        $role = Auth_Info::getUser()->user_type;
        if(strcmp($role, 'DA'))

        $this->_redirect('/error');

        $page = null;
        if ($this->getRequest()->isPost()) {
            $where = $this->_input->getEscaped();
            if(isset($this->getRequest()->title) && !isset($where['title'])){
                $where = array();
            }
        } else {
            $where = $this->session->getData(self::SESSION_KEY_SEARCH);
            if (is_null($where)) {
                $where = array();
            }
            $page = isset($this->_input->page) ? $this->_input->page : $this->session->getData(self::SESSION_KEY_PAGE);
        }

        $this->getRequest()->setParams($where);
        $this->session->setModuleScope(self::SESSION_KEY_SEARCH, $where);
        $this->session->setModuleScope(self::SESSION_KEY_PAGE, $page);

        $select = MInformations::getInstance()->getListSelect($where);
        $this->view->max_display_char = Zynas_Registry::getConfig()->constants->max_display_char;
        $this->view->paginator = Zynas_Paginator::factoryWithOptions($select, $page, $this->view);
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

    /**
     * Add information data
     * <pre>
     * 	- Get data form add view input
     * 			-> get data and put to confirm add action
     *
     * </pre>
     */
    public function addAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        $role = Auth_Info::getUser()->user_type;
        if(strcmp($role, 'DA'))
        $this->_redirect('/error');

        $this->view->token = Csrf::getToken();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

    /**
     * Action process register informations
     * <pre>
     * 1) Get data from add View
     * 2) Set Dataset information
     * 3) Query data to insert database
     * </pre>
     */
    public function confirmAddAction() {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if(!Csrf::checkToken($this->_input->token)) {
            FlashMessenger::addError(E061V);
            Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Error Message='.E061V,$this->getRequest()->getParams());
            $this->_redirect('/admin-information/list');
        }

        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            $row = MInformations::getInstance()->createRow();
            $row->create_date = Zynas_Date::dbDatetime();
            $row ->create_user =  Auth_Info::getUser()->user_id;
            $row = $this->setInfoData($row);
            $row->save();
			Log::infoLog('Add information action='.__FUNCTION__.';user_id='.$user->user_id.';End action'.$row,$this->getRequest()->getParams());
            FlashMessenger::addSuccess(E065V);
            $db->commit();
        } catch (Exception $e) {
            $db->rollBack();
            FlashMessenger::addError($e->getMessage());
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
        $this->_redirect('/admin-information/list');
    }

    /**
     *
     */
    public function doAddAction(){
         
    }

    private function setInfoData($row){
         
        $row->title = $this->_input->title;
        $row->detail = $this->_input->detail;
        return $row;
    }

    /**
     * Initial of edit action
     * <pre>
     * 1)Do nothing if data is not get from form via GET method
     * 2)Based on the input values to retrieve record in database
     * 3)2)process edit data from (2)
     * </pre>
     */
    public function editAction(){        
        $role = Auth_Info::getUser()->user_type;
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if(strcmp($role, 'DA'))
        $this->_redirect('/error');

        $this->view->token = Csrf::getToken();
        $id = $this->_input->id;
        $row = MInformations::getInstance()->getEntryById($id);
        $this->getRequest()->setParams($row->toArray());
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());

    }

    /**
     *
     */
    public function confirmEditAction() {
    	$user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if(!Csrf::checkToken($this->_input->token)) {
            FlashMessenger::addError(E061V);
            Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Error Message='.E061V,$this->getRequest()->getParams());
            $this->_redirect('/admin-information/list');
        }
        //変更画面から入力内容を取得する
        $id = $this->_input->id;

        //対象レコードを取得
        $informationRow = MInformations::getInstance()->getEntryById($id);

        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
        	
            $informationRow = $this->setInfoData($informationRow);
            $informationRow->update_date = Zynas_Date::dbDatetime();
            $informationRow->update_user = Auth_Info::getUser()->user_id;
            $informationRow->save();
            Log::infoLog('Edit information action='.__FUNCTION__.';user_id='.$user->user_id.';End action'.$row,$this->getRequest()->getParams());
            $db->commit();
            
            FlashMessenger::addSuccess(E074V);
        } catch (Exception $e) {
            $db->rollBack();
            FlashMessenger::addError($e->getMessage());
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
        return $this->_redirect('/admin-information/list');
    }

    /**
     * Change user action
     * <pre>
     * 1)Based on the input values to update record in database
     * </pre>
     */
    public function doEditAction(){

    }


    /*
     * Do detail Information
     * <pre>
     * 1) Get information id
     * 2) Get data information by Id
     * 3) Display data to view detail
     * </pre>
     **/
    public function detailAction(){        
        $role = Auth_Info::getUser()->user_type;
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if(strcmp($role, 'DA'))
        $this->_redirect('/error');

        $this->view->token = Csrf::getToken();
        $id = $this->_input->id;
        $row = MInformations::getInstance()->getEntryById($id);
        $this->view->infDetail = $row;
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());

    }



    /**
     * Delete action
     * <pre>
     * 1)Do nothing if data is not get from form via POST method
     * 1-1)Get Id from request parameter
     * </pre>
     */
    public function deleteAction() {        
        $role = Auth_Info::getUser()->user_type;
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if(strcmp($role, 'DA'))
        $this->_redirect('/error');

        if (!$this->getRequest()->isPost()){
            FlashMessenger::addError(E062V);
            $this->_redirect('/admin-information/list');
        }

        $id = $this->_input->id;
        $row = MInformations::getInstance()->getEntryById($id);

        if (is_Null($row)) {
            // error
            $this -> handleErrorDelete();
        }
        $db = Zynas_Db_Table::getDefaultAdapter();
        $db->beginTransaction();
        try {
            $row->delete_flg = MInformations::DELETE_FLG_ON;
            $row->delete_date = Zynas_Date::dbDatetime();
            $row->delete_flg_update_user = Auth_Info::getUser()->user_id;
            $row->save();
            Log::infoLog('Delete information action='.__FUNCTION__.';user_id='.$user->user_id.';End action'.$row,$this->getRequest()->getParams());
            $db->commit();
            FlashMessenger::addSuccess(I002V);

        } catch (Exception $e) {
            $db->rollBack();
            Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Error Message='.$e->getMessage(),$this->getRequest()->getParams());
            FlashMessenger::addError($e->getMessage());
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
        $this->_redirect('/admin-information/list');
    }

    /**
     *	Preview function
     *	Get data from add form -> Prevew
     **/
    public function addpreviewAction(){
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        $create_date = "";
        if ($this->getRequest()->isGet()){
            $id = $this->_input->id;
            $create_date = Zynas_Date::dbDatetime();
        }
        
        $this->view->create_date = Zynas_Date::dbDatetime();
        if ($this->getRequest()->isPost()){
            $array = array('title'=>$this->_input->title, 'detail'=>$this->_input->detail, 'create_date'=>Zynas_Date::dbDatetime());
            $this->getRequest()->setParams($array);
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }
    
    /**
     *  Preview function
     *  Get data from edit form -> Preview
     **/
    public function editpreviewAction(){
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        $create_date = "";
        if (!$this->getRequest()->isGet()){
            $id = $this->_input->id;
            $create_date = MInformations::getInstance()->getEntryById($id)->create_date;
        }        
        
        if ($this->getRequest()->isPost()){
            $array = array('title'=>$this->_input->title, 'detail'=>$this->_input->detail, 'create_date'=>$create_date);
            $this->getRequest()->setParams($array);
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
    }
    /**
     *ID取得失敗時の表示処理
     * <pre>
     * </pre>
     */
    public function handleErrorDelete() {
        FlashMessenger::addError(E075V);
        $this->_redirect('/information/list');
    }

    public function handleErrorDetail() {
        FlashMessenger::addError(E076V);
        $this->_redirect('/information/list');
    }

    public function handleErrorEdit() {
        FlashMessenger::addError(E076V);
        $this->_redirect('/information/list');
    }

    
    public function handleErrorList() {
    }    
}
?>