<?php

/**
 * se hace el requerimiento de toda las constantes del sistema
 * por medio del archivo configuracion
 */
require_once "./configuracion.php";

/**
 * se inicializa el template inicial con el motor twig
 */
echo $twig->render('index.html', ["titulo"=> "Demmo Agricultura", "root"=> ROOT]);