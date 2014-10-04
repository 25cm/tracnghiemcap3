<?php

return array(
	'username' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('Alnum'),
		array('StringLength', array('max' => 24, 'min' => 6)),
		array('Db_NoRecordExists', array('table' => 'users', 'field' => 'user_name'))
	),
    'email' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
    	array('EmailAddress'),
	),
	'message' => array(
    	My_Filter_Input::ALLOW_EMPTY => true,
		array('StringLength', array('max' => 1000)),
    )	
);