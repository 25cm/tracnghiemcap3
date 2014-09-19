<?php

/**
 * 
 * @author AnhNV
 *
 */
class Users extends Zend_Db_Table {
	
    protected $_name = 'users';
    protected $_key = 'user_id';
    // Bang co nhieu key
    //protected $_key = array('id1', 'id2');
        
    /**
     * 
     * @param array $user
     */
    public function add(array $user) {
    	
    	$row = $this->fetchNew();
		$row->user_name = $user['user_name'];
		$row->email = $user['email'];
		$row->verified = $user['verified'];
		$row->verification_code = $user['verification_code'];
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
    
    /**
     * 
     * @param string $activationCd
     * @return boolean
     */
    public function checkActivateUser($activationCd) {
    	
    	$sql = $this->select()
    			->where("verified = '0'")
    			->where("verification_code = ?", $activationCd);
    	return count($this->fetchAll($sql)) > 0 ? true : false;
    }
    
    /**
     * 
     * @param string $username
     * @return boolean
     */
    public function checkExistUser($username) {
    	
    	$sql = $this->select()->where('user_name = ?', $username);
    	return count($this->fetchAll($sql)) > 0 ? true : false;
    }
}
?>