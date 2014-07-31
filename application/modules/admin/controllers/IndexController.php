<?php
/**
 * 
 * @author AnhNV
 *
 */
class Admin_IndexController extends Zend_Controller_Action
{
    /**
     * 
     */
    public function indexAction()
    {
        $user = new MUsers();
        $result = $user->test();
        echo "<pre>";
        print_r($result);
        echo "</pre>";
    }
}