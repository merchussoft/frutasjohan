<?php

function __autoload($class_name){

    if (file_exists(CONFIG . "{$class_name}.php")) {
        include_once(CONFIG . "{$class_name}.php");
    }

    if (file_exists(CONTROLLERS . "{$class_name}.php")) {
        include_once(CONTROLLERS . "{$class_name}.php");
    }

    if (file_exists(MODELS . "{$class_name}.php")) {
        include_once(MODELS . "{$class_name}.php");
    }
}
