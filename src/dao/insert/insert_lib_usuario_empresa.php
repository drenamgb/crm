<?php
    $idUsuario     =   filter_input(INPUT_POST,  "idUsuario",   FILTER_VALIDATE_INT);
    $idEmpresa     =   filter_input(INPUT_POST,  "idEmpresa",   FILTER_VALIDATE_INT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_lib_usuario_empresa ("
            . ":idUsuario,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
}catch(PDOException $e){
    echo($e->getMessage());  
}finally {
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_usuario_empresa.php");        
}