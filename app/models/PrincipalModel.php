<?php

class PrincipalModel {

    private $conexion;
    function __construct() {
        $this->conexion = new DatabaseConfig();
    }

    function login($data = []){
        $password = md5($data['inputPassword']);
        $query_login ="SELECT u.cod_usuario, nombre, apellido, documento, usuario, "
        ."email, direccion, cumpleanos, telefono, cod_perfil FROM usuarios as u "
        ."INNER JOIN datos_usuarios as du ON du.cod_usuario = u.cod_usuario "
        ."WHERE usuario = '". $data['inputUsuario']."'"
        ." AND password = '". $password."'";
        return $this->conexion->execute_query($query_login);
    }
}