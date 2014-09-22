<?php

return array(
	'username' => array(
			My_Filter_Input::ALLOW_EMPTY => false,
			array('Db_RecordExists', array('table' => 'users', 'field' => 'user_name'))
	),
	'email' => array(
			My_Filter_Input::ALLOW_EMPTY => false,
			array('EmailAddress')
	)
);