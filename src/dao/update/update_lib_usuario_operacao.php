<?php
    $status                 =   filter_input(INPUT_POST, "status",              FILTER_DEFAULT);
    $idUsuarioOperacao      =   filter_input(INPUT_POST, "idUsuarioOperacao",   FILTER_VALIDATE_INT);
    $status==="ativado"?$status="desativado":$status="ativado";
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_lib_usuario_operacao ("            
            . ":status,"
            . ":idUsuarioOperacao)");
    
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idUsuarioOperacao",$idUsuarioOperacao);
    $stmt->execute();
}catch(PDOException $e){
    echo $e->getMessage();  
}finally{
    unset($PDO);
    unset($stmt);
    unset($stmt);
    header("location:../../../list_lib_usuario_operacao.php");
}