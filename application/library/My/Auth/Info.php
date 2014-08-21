<?php

class My_Auth_Info
{
	const TABLE_NAME = 'users';
	const IDENTITY_COLUMN = 'user_name';
	const CREDENTIAL_COLUMN = 'password';
	
	/**
	 * 
	 * @param unknown $username
	 * @param unknown $password
	 * @throws Exception
	 * @return boolean
	 */
	public static function authenticate($username, $password)
	{
		$isValid = false;
		
		try
		{
			$db = Zend_Registry::get('dbConnect');
			$auth = Zend_Auth::getInstance();
			$authAdapter = new Zend_Auth_Adapter_DbTable($db);
			$authAdapter->setTableName(self::TABLE_NAME)
						->setIdentityColumn(self::IDENTITY_COLUMN)
						->setCredentialColumn(self::CREDENTIAL_COLUMN);
			
			$authAdapter->setIdentity($username);
			$authAdapter->setCredential($password);
			
			$result = $auth->authenticate($authAdapter);
			if ($result->isValid())
			{
				// Set session
				$auth->getStorage()->write($data);
				$isValid = true;
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}
		
		return $isValid;
	}
	
	/**
	 * 
	 * @return mixed
	 */
	public static function getUser()
	{
		return Zend_Auth::getInstance()->getIdentity();
	}
}