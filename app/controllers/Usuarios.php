<?php


class Usuarios {

    private $twig;
    private $usuarios_model;
    function __construct() {
        global $twig;
        $this->twig = $twig;
        $this->usuarios_model = new UsuariosModel();
    }

    function index($data = []){
        $parametros = ["titulo"=> "Demmo Agricultura",
            "root"=> ROOT, "modulos"=> $data['modulos'],
            "pagina_actual"=>$data['actual'],
            "active"=>$data['modulo'],
            "VERSIONJSCSS"=> VERSIONJSCSS,
            "carga_inicial"=>$this->usuarios_model->cargaInicialSelect()
        ];
        echo $this->twig->render('usuarios.html', $parametros);
    }

    function insertUser($data = []){
        $result_insertUsuario = $this->usuarios_model->insertUsuarios($data);
        header('Content-Type: application/json');
        echo json_encode($result_insertUsuario);
    }

    function listarUsuarios(){
       $return_data =  $this->usuarios_model->listarUsuarios();
        header('Content-Type: application/json');
        echo json_encode($return_data);
    }

}