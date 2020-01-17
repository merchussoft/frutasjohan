<?php


class UsuariosModel {

    private $database;

    function __construct() {
        $this->database = new DatabaseConfig();
    }

    function cargaInicialSelect() {

        $query_eps = "SELECT cod_eps, CONCAT(nombre, ' ', regimen) as nombre_eps FROM eps";
        $result['eps'] = $this->database->execute_query($query_eps);

        $query_rh = "SELECT * FROM grupo_sanguineo";
        $result['Rh'] = $this->database->execute_query($query_rh);

        $query_cesantias = "SELECT cod_pension_cesantias, CONCAT(nombre_cesantias, ' ', entidad_pension) as cesantias_pension FROM pension_cesantias";
        $result['cesantias'] = $this->database->execute_query($query_cesantias);

        $query_perfiles = "SELECT cod_perfil, nombre FROM perfiles where cod_perfil NOT IN (1)";
        $result['perfil'] = $this->database->execute_query($query_perfiles);

        return $result;
    }

    function insertUsuarios($data) {
        $table = "usuarios";
        $data_usuario = [
            "nombre" => $data['nombre'],
            "apellido" => $data['apellido'],
            "documento" => $data['documento'],
            "usuario" => $data['usuario'],
            "password" => md5(12345)
        ];
        $data_return = ['valido' => 0, "mensaje" => "Error al registrar usuario", "tiempo" => 2500];
        $insert_usuario = $this->database->insert_update_query($table, $data_usuario);
        if ($insert_usuario > 0) {
            $table = "datos_usuarios";
            $data_datosUsuarios = [
                "direccion" => $data['direccion'],
                "telefono" => $data['telefono'],
                "cumpleanos" => $data['cumpleanos'],
                "email" => $data['email'],
                "cod_perfil" => $data['cod_perfil'],
                "cod_usuario" => $insert_usuario,
                "cod_grupo_sanguineo" => $data['cod_grupo_sanguineo'],
                "cod_eps" => $data['cod_eps'],
                "cod_pension_cesantias" => $data['cesantias'],
                "ip_address" => $_SERVER["REMOTE_ADDR"]
            ];
            $insert_datosUsuario = $this->database->insert_update_query($table, $data_datosUsuarios);
            ($insert_datosUsuario > 0) ? $data_return = ['valido' => 1, "mensaje" => "Usuario creado correctamente", "tiempo" => 2500] : false;
        }
        return $data_return;
    }

    function listarUsuarios(){
        $listar_usuarios = "SELECT u.cod_usuario, u.nombre, apellido, documento, usuario, u.activo, DATE_FORMAT(createAT,'%Y-%m-%d') as creacion, email, "
            ."cumpleanos, telefono, direccion, p.nombre as perfil, tipo_sanguineo_rh as rh, CONCAT(e.nombre, ' ', regimen) as eps, "
            ."CONCAT(nombre_cesantias, ' ', entidad_pension) as cesantias "
        ."FROM usuarios as u "
        ."INNER JOIN datos_usuarios as du ON du.cod_usuario = u.cod_usuario "
        ."INNER JOIN eps as e ON e.cod_eps = du.cod_eps "
        ."INNER JOIN perfiles as p ON p.cod_perfil = du.cod_perfil "
        ."INNER JOIN grupo_sanguineo as gs ON gs.cod_grupo_sanguineo = du.cod_grupo_sanguineo "
        ."INNER JOIN pension_cesantias as pc ON pc.cod_pension_cesantias = du.cod_pension_cesantias "
        ."WHERE du.cod_perfil not in(1) ORDER BY u.nombre asc";

        return $this->database->execute_query($listar_usuarios);
    }

}