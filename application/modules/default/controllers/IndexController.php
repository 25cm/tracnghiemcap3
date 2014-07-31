<?php

class IndexController extends Zend_Controller_Action {

    /**
     * トップページのコントローラークラス
     * <pre>
     * </pre>
     * @author foo
     * @package /modules/default/controller
     */

    /**
     * 初期化処理
     * <pre>
     * </pre>
     */
//     public function init(){
//         parent::init();
//     }

    /**
     * インデックス
     * <pre>
     * </pre>
     */
    public function indexAction() {
        $user = new Users();
        $result = $user->test();
        
//         echo "<pre>";
//         print_r($result);
//         echo "</pre>";
    }

    /**
     *
     *
     * <pre>
     * </pre>
     */
//     public function loginAction() {
//         Log::infoLog('method='.__FUNCTION__.';user_id='.';Start action');
//         Log::infoLog('method='.__FUNCTION__.';user_id='.';Start action');
//     }
     
}
?>