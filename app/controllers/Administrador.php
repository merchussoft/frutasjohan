<?php

class Administrador {

    public $twig;
    function __construct() {
        global $twig;
        $this->twig = $twig;
    }

    function index($data=[]){
        $parametros = ["titulo"=> "Demmo Agricultura", "root"=> ROOT, "modulos"=> $data['modulos'], "pagina_actual"=>$data['actual'], "active"=>$data['modulo'], "VERSIONJSCSS"=> VERSIONJSCSS];
        echo $this->twig->render('administrador.html', $parametros);
    }

}