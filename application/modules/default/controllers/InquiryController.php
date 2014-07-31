<?php

/**
 * Class InquiryController
 * <pre>
 * </pre>
 * @author AnhNV
 * @package /modules/default/controller
 *
 */

class InquiryController extends Controller
{

    /**
     * Index action
     */
    public function indexAction()
    {
        $this->_forward('/inquiry');
    }

    /**
     * Inquiry action
     */
    public function inquiryAction()
    {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

    /**
     * Form action
     */
    public function formAction()
    {
        Log::infoLog('method='.__FUNCTION__.';user_id='. Auth_Info::getUser()->user_id.';Start action;',$this->getRequest()->getParams());

        //デフォルト値にログインユーザーの情報を設定する。
        $custRow = MCustomers::getInstance()->getEntryByCode(Auth_Info::getUser()->customer_code);
        $this->getRequest()->setParam('email',Auth_Info::getUser()->email);
        $this->getRequest()->setParam('phone',$custRow->tel);

        $department = Auth_Info::getUser()->unit_name;
        if (!Zynas_String::isEmpty($department)) $department .= ' ';
        $department = Auth_Info::getUser()->name_jp;
        $this->getRequest()->setParam('department',$department);

        Log::infoLog('method='.__FUNCTION__.';user_id='. Auth_Info::getUser()->user_id.';End action;',$this->getRequest()->getParams());
    }

    /**
     * Confirm form action
     *
     *
     */
    public function confirmFormAction()
    {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        if ($this->_request->isPost('btSave'))
        {
            $data = array('email'         => $this->_input->email,
		                  'phone'         => $this->_input->phone,
		                  'department'    => $this->_input->department,
		                  'content'       => $this->_input->content
            );
            $replace = array('name' => array('{$email}', '{$phone}', '{$department}', '{$content}'),
		                        'value' => array($data['email'], $data['phone'], $data['department'], $data['content']));
            $to = Zynas_Registry::getConfig()->system->mail->admin_to_email;
            $toName = Zynas_Registry::getConfig()->system->mail->admin_to_name;
            Mail::getInstance('contact', $this->view)->sendFromName($to, $toName, null, null, $replace, $data['email'], $data['department']);
            Log::infoLog('Send mail inquiry method='.__FUNCTION__.';user_id='.$user->user_id.';Sender='.Zynas_Registry::getConfig()->system->mail->setting->username.';Receiver='.$to.';Mail body='.$data['content'].';End action;',$this->getRequest()->getParams());
        }
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

    /**
     * Complete action
     * Display result when send inquiry completed
     */
    public function completeAction()
    {
        $user = Auth_Info::getUser();
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';Start action;',$this->getRequest()->getParams());
        Log::infoLog('method='.__FUNCTION__.';user_id='.$user->user_id.';End action;',$this->getRequest()->getParams());
    }

}

?>
