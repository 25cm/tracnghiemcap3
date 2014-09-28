<?php

return array(
    'class_id' => array(
        My_Filter_Input::ALLOW_EMPTY => false,
    ),
    'major_id' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
	),
    'submajor_id' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
	),
	'question' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
	),
	'answer_1' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => '255'))
	),
	'answer_2' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => '255'))
	),
	'answer_3' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => '255'))
	),
	'answer_4' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
		array('StringLength', array('max' => '255'))
	),
	'correct_answer' => array(
		My_Filter_Input::ALLOW_EMPTY => false,
	),
);
