<?php

return array(
	'username' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => 20)),
	),
	'password' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => 12, 'min' => 6)),
	),
	'retype_password' => array(
			My_Filter_Input::ALLOW_EMPTY => false,
			array('StringLength', array('max' => 12, 'min' => 6)),
	),
    'email' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
    	array('EmailAddress'),
	),
			
);