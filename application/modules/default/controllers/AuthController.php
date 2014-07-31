<?php
/**
 * ログイン画面のコントローラークラス
 * <pre>
 * </pre>
 * @author nojiri
 * @package /modules/default/controller
 */

class AuthController extends Zend_Controller_Action {

//     const COOKIE_KEY_USER_ID = 'user_id';
//     const COOKIE_KEY_USER_PSW = 'user_psw';
//     const SESSION_KEY_USER_ID = 'id';
//     const SESSION_KEY_PSW = 'psw';

    /**
     * 初期化処理
     * <pre>
     * </pre>
     */
    public function loginAction() {
        $user = new MUsers();
        $user->test();
    }

    /**
     * ログイン処理
     * <pre>
     * </pre>
     */
//     public function confirmLoginAction() {
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';Start action;',$this->getRequest()->getParams());
// 		$auth = Auth_User::getInstance();
//         $cookie = new Zynas_CookieManager();
//         $mailAdress = $this->_input->mailAdress;
//         $password = $this->_input->password;
//         $remember = $this->_input->remember;
//         if ($auth->authenticate($mailAdress, $password)) {
//             if (strcmp($remember,MUsers::REMEMBER) === 0 ) {
//                 $cookie->setData($mailAdress, self::COOKIE_KEY_USER_ID, '', 30, true);
//             } else {
//                 $cookie->removeData(self::COOKIE_KEY_USER_ID);
//             }
//             Log::infoLog('method='.__FUNCTION__.';user_id'.';End action;',$this->getRequest()->getParams());
//             return $this->_redirect('/top/list');
//         } else {
//             return $this->handleErrorDoLogin();
//         }
//     }

    /**
     * ログアウト処理
     * <pre>
     *
     * </pre>
     */
//     public function logoutAction(){
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';Start action;',$this->getRequest()->getParams());
//         Auth_User::getInstance()->clear();
//         Zynas_SessionManager::destory();
//         $this->_redirect('/auth/login?out=' . (isset($_GET['out']) ? $_GET['out'] : '1'));
//         Log::infoLog('method='.__FUNCTION__.';user_id'.';End action;',$this->getRequest()->getParams());
//     }

//     public function handleErrorDoLogin() {
//         $this->view->errors = array('login' => E068V);
//         return $this->_forward('login');
//     }
}
?>