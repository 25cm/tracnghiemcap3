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

    /**
     * 
     * @param array $user
     */
    public function add(array $user) {
    	
    	$row = $this->fetchNew();
		$row->user_name = $user['user_name'];
		$row->email = $user['email'];
		$row->phone_number = $user['phone_number'];
		$row->class_id = $user['class_id'];
		$row->password = $user['password'];
		$row->user_type = $user['user_type'];
		$row->delete_flg = $user['delete_flg'];
		$row->insert_dt = $user['insert_dt'];
		$row->insert_user = $user['insert_user'];
		$row->update_dt = $user['update_dt'];
		$row->update_user = $user['update_user'];
    	
		// save
    	$row->save();
    }
}
?>