<?php

return array(
    'class_id' => array(
        My_Filter_Input::ALLOW_EMPTY => false,
    ),
    'major_id' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
	),
    'submajor_name' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
    	array('StringLength', array('max' => 255)),
	)
);
