<?php

class RecoverController extends Controller{

    public function indexAction()
    {        
        $this->_forward('/request');
    }

    public function confirmRequestAction()
    {
        
        Log::infoLog('method='.__FUNCTION__.';Start action;',$this->getRequest()->getParams());
        $email = $this->_input->mailAddress;

        if(strcmp($email, '') !== 0) {
            $user = MUsers::getInstance()->getUserByUserId($email);
            if ($user) {
                $fqdn = Zynas_Registry::getConfig()->system->fqdn;
                $contact = Zynas_Registry::getConfig()->constants->contact_text;
                $password = $user->passwd;
                $replace = array('name' => array('{$passwd}', '{$fqdn}', '{$contact}'), 'value' => array($password, $fqdn, $contact));
                Mail::getInstance('recover_password', $this->view)->send($email, $user->name_jp, null, null, $replace);
                Log::infoLog('method='.__FUNCTION__.';Email recover='.$email.';End action;',$this->getRequest()->getParams()); 
            }
            
            $this->_redirect('/recover/complete');
        } else {            
            $this->_redirect('/recover/confirm-request');
        }
        Log::infoLog('method='.__FUNCTION__.';Email recover='.$email.';End action;',$this->getRequest()->getParams());
    }

    public function completeAction()
    {
         
    }

    public function requestAction()
    {
         
    }
}

?>