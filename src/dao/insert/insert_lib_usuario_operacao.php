<?php
    $idUsuario     =   filter_input(INPUT_POST,  "idUsuario",   FILTER_VALIDATE_INT);
    $idOperacao    =   filter_input(INPUT_POST, "idOperacao",   FILTER_VALIDATE_INT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_lib_usuario_operacao ("
            . ":idUsuario,"
            . ":idOperacao)");
    
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idOperacao",$idOperacao);
    $stmt->execute();
}catch(PDOException $e){
    echo($e->getMessage());  
}finally{
    header("location:../../../list_lib_usuario_operacao.php");
}