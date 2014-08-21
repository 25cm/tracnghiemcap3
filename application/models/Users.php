<?php
class Users extends My_Db_Table {
	
    protected $_name = 'users';
    protected $_key = 'user_id';
    // Bang co nhieu key
    //protected $_key = array('id1', 'id2');
    
    public function test() {
        $select = $this->select()
        ->from('users');
        return $this->fetchAll($select);
    }

    public function add() {
//     	$data = array('column name' => 'value');
//     	$row = $this->createRow($data);
//     	$row->save();		

    	$row = $this->fetchNew();
    	$row->user_id = '1';
    	
    	//...
    	$row->save();
    }
}
?>