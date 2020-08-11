<?php
    $idEmpresa     =   filter_input(INPUT_POST,  "idEmpresa",    FILTER_VALIDATE_INT);
    $idOperacao    =   filter_input(INPUT_POST,  "idOperacao",   FILTER_VALIDATE_INT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_lib_empresa_operacao ("
            . ":idEmpresa,"
            . ":idOperacao)");
    
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":idOperacao",$idOperacao);
    $stmt->execute();    
}catch(PDOException $e){
    echo($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_empresa_operacao.php");
}