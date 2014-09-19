<?php

return array(
    'username' => array(
        My_Filter_Input::ALLOW_EMPTY => false,
        array('Alnum'),
    	array('Db_RecordExists' , array('table' => 'users', 'field' => 'user_name'))
    ),
    'password' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('Alnum'),
		array('StringLength', array('min' => 4, 'max' => 20)),
	),
    'remember' => array(
		My_Filter_Input::ALLOW_EMPTY => true
	)
);

?>
