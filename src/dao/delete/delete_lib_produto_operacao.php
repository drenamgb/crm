<?php
    $idProdutoOperacao    =   filter_input(INPUT_POST, "idProdutoOperacao",    FILTER_VALIDATE_INT);   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call delete_lib_produto_operacao_idProdutoOperacao (:idProdutoOperacao)");    
    $stmt->bindParam(":idProdutoOperacao",$idProdutoOperacao);
    $stmt->execute();    
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally {
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_produto_operacao.php");        
}