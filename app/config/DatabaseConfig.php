<?php


class DatabaseConfig {

    static private $_conexion;
    private $_cursor;
    private $log_instancia;

    function __construct() {
//        $this->log_instancia = $instancia;
        $this->conexion();
    }

    function conexion() {
        if (!self::$_conexion) {
            self::$_conexion = newADOConnection('mysqli');
            self::$_conexion->pConnect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
            self::$_conexion->setFetchMode(ADODB_FETCH_ASSOC);
            self::$_conexion->Execute("SET NAMES 'utf8'");
//        self::$_conexion->debug = true;
        }
    }

    function execute_query($sql) {
        $this->_cursor = self::$_conexion->execute($sql);
        return $this->_cursor->GetArray();
    }

    function escribirLog($str) {
        $archivo = LOGS . "log_" . $this->log_instancia . ".txt";
        $fp = fopen($archivo, "a");
        fputs($fp, "IP " . self::$_connection->host . ". Fecha " . date("d-m-Y h:i:s A ") . $str . "\n");
        fclose($fp);
    }

    function insert_update_query($table, $record, $type = "INSERT", $where = "") {
        self::$_conexion->autoExecute($table, $record, $type, $where);
        if ($type = "INSERT") {
            return self::$_conexion->insert_Id();
        } else {
            return array('error' => self::$_conexion->errorMsg());
        }
    }

}