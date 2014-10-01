<?php

/**
 * 
 * @author AnhNV
 *
 */
class Users extends Zend_Db_Table {
	
	/**
	 * 
	 * @var table name
	 */
    protected $_name = 'users';
    
    /**
     * 
     * @var primary key, use array for multiple key
     */
    protected $_key = 'user_id';
    
    /**
     * @var Users
     */
    protected static $_instance = null;
    
    /**
     * @return Users
     */
    public static function getInstance() {
    	if (null === self::$_instance) {
    		self::$_instance = new self();
    	}
    
    	return self::$_instance;
    }
    
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
     * @param string $name
     * @param string $email
     * @param string $verified
     */
    public function getUserByCond($name = null, $email = null, $verified = null) {
    	
    	$sql = $this->select()
    			->where("user_name = ?", $name)
    			->where("email = ?", $email)
    			->where("verified = ?", $verified);
    	
    	
    	return $this->fetchRow($sql);
    }
    
    /**
     * 
     * @param string $activationCd
     * @return boolean
     */
    public function checkActivateUser($activationCd = null) {
    	
    	$sql = $this->select()
    			->where("verified = '0'")
    			->where("verification_code = ?", $activationCd);
    	return count($this->fetchAll($sql)) > 0 ? true : false;
    }
    
    /**
     * 
     * @param string $userId
     */
    public function getUsersById($userId = null) {
    	$sql = $this->select()
    			->where('user_id = ?', $userId);
    	
    	return $this->fetchRow($sql);
    }
}
?>