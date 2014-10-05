<?php

return array(
	'username' => array(
		My_Filter_Input::ALLOW_EMPTY => false
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