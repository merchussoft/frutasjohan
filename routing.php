<?php

require_once "./configuracion.php";
require_once("./autoload.php");
spl_autoload_register('__autoload');
session_start();
//global $twig;

$PARAMETROS = array_merge($_POST, $_GET);
$functions = (isset($PARAMETROS["funcion"])) ? $PARAMETROS["funcion"] : "index";
$controller = (!isset($PARAMETROS["modulo"])) ? "Principal" : $PARAMETROS["modulo"];

$db_conexion = new DatabaseConfig();

if ($controller != "Principal" && isset($_SESSION['cod_usuario'])) {
    $query_modulos = "SELECT m.nombre as modulo FROM permiso_modulos as pm "
        . "INNER JOIN modulos as m ON m.cod_modulo = pm.cod_modulo "
        . "WHERE pm.cod_modulo ='" . $controller . "' AND pm.cod_usuario = '" . $_SESSION['cod_usuario'] . "'";

    $controller = $db_conexion->execute_query($query_modulos)[0]['modulo'];
    $PARAMETROS["actual"] = $controller;

    $query_modulos_usuario = "SELECT m.nombre as nombre, pm.cod_modulo, m.icono as icono FROM permiso_modulos as pm "
        . "INNER JOIN modulos as m ON m.cod_modulo = pm.cod_modulo "
        . "WHERE pm.cod_usuario = '" . $_SESSION['cod_usuario'] . "' AND visible = 1";
    $PARAMETROS["modulos"] = $db_conexion->execute_query($query_modulos_usuario);

    if ($controller == "") {
        echo $twig->render('404.html');
        return false;
    }
}


$controllers = new $controller();
if (method_exists($controllers, $functions)) {
    $controllers->$functions($PARAMETROS);
}