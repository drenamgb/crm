<?php
    $idEmpresaOperacao    =   filter_input(INPUT_POST, "idEmpresaOperacao",    FILTER_VALIDATE_INT);   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("call delete_lib_empresa_operacao_idEmpresaOperacao (:idEmpresaOperacao)");    
    $stmt->bindParam(":idEmpresaOperacao",$idEmpresaOperacao);
    $stmt->execute();    
}catch(PDOException $e){
    echo ($e->getMessage());    
}finally {
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_empresa_operacao.php");    
}