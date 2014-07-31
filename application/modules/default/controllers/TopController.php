<?php
/**
 * <pre>
 * </pre>
 * @author ThinhNh
 * @package /modules/default/controller
 */

class TopController extends Controller {


    /**
     * The first action
     * <pre>
     * 1)Redirect to top page list
     * </pre>
     */
    public function indexAction() {        
        $this->session->removeData(self::SESSION_KEY_RETURN_DETAIL);        
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
        $limit = Zynas_Registry::getConfig()->constants->max_display_record;
        $this->view->role = Auth_Info::getUser()->user_type;
        $this->view->max_display_char = Zynas_Registry::getConfig()->constants->max_display_char;
       
        //count number of information
        $number_record_infor = MInformations::getInstance()->count();
        if($number_record_infor>$limit){            
            $this->view->infListMore = true;
            $this->view->infList = MInformations::getInstance()->getLimitList(null, $limit);
        } else {            
            $this->view->infListMore = false;
            $this->view->infList = MInformations::getInstance()->getLimitList(null, $limit);
        }
        $number_record_faq = MFaqs::getInstance()->count();        
        if($number_record_faq>$limit) {
            $this->view->faqListMore = true;
            $this->view->faqList = MFaqs::getInstance()->getLimitList(null, $limit);    
        } else {
            $this->view->faqListMore = false;
            $this->view->faqList = MFaqs::getInstance()->getLimitList(null, $limit);
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

}
?>