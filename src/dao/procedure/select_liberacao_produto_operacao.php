<?php
    $idProduto          = filter_input(INPUT_POST,'idProduto',    FILTER_VALIDATE_INT);
    $idOperacao         = filter_input(INPUT_POST,'idOperacao',   FILTER_VALIDATE_INT);
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_liberacao_produto_operacao (:idProduto,:idOperacao)");
    $stmt->bindParam(":idProduto",$idProduto);
    $stmt->bindParam(":idOperacao",$idOperacao);   
    $stmt->execute();
    $retorno = $stmt->fetchall();
    echo json_encode($retorno);
}catch(Exception $e){
    echo json_encode($e->getMessage());    
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
}