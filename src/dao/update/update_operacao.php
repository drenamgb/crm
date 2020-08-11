<?php
    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",        FILTER_DEFAULT)));
    $status         =   filter_input(INPUT_POST, "status",      FILTER_DEFAULT);
    $idOperacao     =   filter_input(INPUT_POST, "idOperacao",  FILTER_VALIDATE_INT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_operacao ("
            . ":nome,"
            . ":status,"
            . ":idOperacao)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idOperacao",$idOperacao);
    $stmt->execute();    
}catch(PDOException $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($PDO);
    unset($stmt);
    unset($_REQUEST);
    header("location:../../../list_operacao.php");
}