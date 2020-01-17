<?php

class Principal {
    public $principalModel;

    function __construct() {
        $this->principalModel = new PrincipalModel();
    }

    function index($data = []) {
        $result = $this->principalModel->login($data)[0];
        $count_result = count($result);
        $return_data = ["validate" => 0, "data" => "Usuario o contraseña incorrectos"];
        if ($count_result) {
            foreach ($result as $key => $value) {
                $_SESSION[$key] = $value;
            }
            $return_data = ["validate" => 1, "data" => ""];
        }
        header('Content-Type: application/json');
        echo json_encode($return_data);
    }

    function cerrarSesion() {
        if (isset($_SESSION['cod_usuario'])) {
            session_destroy();
        }
    }

}