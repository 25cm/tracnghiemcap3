<?php
class Users extends Zend_Db_Table {
    protected $_name = 'users';
    
    public function test()
    {
        $select = $this->select()
        ->from('users');
        return $this->fetchAll($select);
    }

}
?>