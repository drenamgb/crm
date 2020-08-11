<?php
    $status                 =   filter_input(INPUT_POST, "status",              FILTER_DEFAULT);
    $idProdutoOperacao      =   filter_input(INPUT_POST, "idProdutoOperacao",   FILTER_VALIDATE_INT);
        
    $status==="ativado"?$status="desativado":$status="ativado";

try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_lib_produto_operacao ("            
            . ":status,"
            . ":idProdutoOperacao)");
    
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idProdutoOperacao",$idProdutoOperacao);
    $stmt->execute();    
}catch(PDOException $e){
        echo json_encode($e->getMessage());  
}finally {
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_produto_operacao.php");    
}