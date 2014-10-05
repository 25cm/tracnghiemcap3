<?php

return array(
	'current_password' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => 12, 'min' => 6)),
		array('Alnum')
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
	),
);