<?php

$ruta = explode("/", $_SERVER['REQUEST_URI']);
$pagina_interna = "http://".$_SERVER['HTTP_HOST'].'/'.$ruta[1].'/';

@define("ROOT", $pagina_interna);
@define("RAIZ", __dir__);
@define("APP", RAIZ."/app/");
@define("SYSTEM", RAIZ."/system/");
@define("VENDOR", RAIZ."/vendor/");
@define("VIEWS", APP."views/");
@define("CACHE", RAIZ."cache/");
@define("CACHE_TWIG", RAIZ."/cache/cache_twig/");
@define("CONTROLLERS", APP."controllers/");
@define("CONFIG", APP."config/");
@define("MODELS", APP."models/");
@define("LOGS", RAIZ."logs/");
@define('ADODB', VENDOR.'adodb/adodb-php/');


/**
 * Constantes para la conexion a la base de datos
 */
@define("DB_HOST", "agropecuaria-demo.c8wbfonri86l.us-east-1.rds.amazonaws.com");
@define("DB_USER", "admin");
@define("DB_PASS", "Cuervo2018");
@define("DB_NAME", "fructusdeosas");


include(ADODB.'adodb.inc.php');

/**
 * se crea un random para las versiones de los js y css
 */
@define("VERSIONJSCSS", rand(1,99999));

/**
 * instaciamos el autoload de vendor composer
 */
require_once VENDOR.'autoload.php';
/**
 * inicializamos el motor de plantillas tiwg
 */
$loader = new \Twig\Loader\FilesystemLoader(VIEWS);
$twig = new \Twig\Environment($loader, [
    'cache' => CACHE_TWIG,
    'debug' => true
]);

