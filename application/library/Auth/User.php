<?php

class Auth_User {
	
	/**
	 * @var Auth_User
	 */
	protected static $_instance = null;
	
	/**
	 * @return Auth_User
	 */
	public static function getInstance() {
		if (null === self::$_instance) {
			self::$_instance = new self();
		}
		
		return self::$_instance;
	}
	
	/**
	 * 
	 * @param string $username
	 * @param string $password
	 * @return boolean
	 */
	public static function authenticate($username, $password) {
		
		// Db connection
		$db = My_Registry::get("dbConnect");
		$auth = Zend_Auth::getInstance();
		$authAdapter = new Zend_Auth_Adapter_DbTable($db);
		
		// Set table name
		$authAdapter->setTableName('users')
					->setIdentityColumn('user_name')
					->setCredentialColumn('password');
		// Select
		$select = $authAdapter->getDbSelect();
		$select->where('verified = 1 and delete_flg <> 1');
		
		// Bind value to adapter
		$authAdapter->setIdentity($username);
		$authAdapter->setCredential($password);
		
		// Authenticate
		$result = $auth->authenticate($authAdapter);
		
		// Login success
		if ($result->isValid()) {
			// Storage user info
			$data = $authAdapter->getResultRowObject(array('user_id', 'user_name', 'user_type', 'email', 'class_id', 'insert_dt', 'password'));
			$auth->getStorage()->write($data);
			// Get user info
			//$auth->getIdentity()->user_name;
			
			return true;
		}
		
		// Login failed
		return false;
	}
}