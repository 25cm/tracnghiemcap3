<?php

return array(
	'username' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('Alnum'),
		array('StringLength', array('max' => 20)),
		array('Db_NoRecordExists', array('table' => 'users', 'field' => 'user_name'))
	),
	'password' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => 12, 'min' => 6)),
		array('Alnum')
	),
	'retype_password' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => 12, 'min' => 6)),
		array('Alnum'),
		array('PasswordConfirmation', false, array('token' => 'password'))
	),
    'email' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
    	array('EmailAddress'),
	),
	'phone' => array(
    	My_Filter_Input::ALLOW_EMPTY => true,
		array('PhoneNumber'),
    )	
);