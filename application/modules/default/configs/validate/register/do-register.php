<?php

return array(
    'email' => array(
My_Filter_Input::ALLOW_EMPTY => False,
array('StringLength', array('max' => 10)),
array('EmailAddress'),
),
			
);