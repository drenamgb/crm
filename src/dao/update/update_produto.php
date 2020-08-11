<?php
    $nome            =   strtoupper(trim(filter_input(INPUT_POST, "nome",       FILTER_DEFAULT)));
    $descricao       =   strtoupper(trim(filter_input(INPUT_POST, "descricao",  FILTER_DEFAULT)));
    $precoVenda      =   filter_input(INPUT_POST, "precoVenda",                 FILTER_DEFAULT);
    $status          =   filter_input(INPUT_POST, "status",                     FILTER_DEFAULT);
    $vitalicio       =   filter_input(INPUT_POST, "vitalicio",                  FILTER_DEFAULT);
    $primeiraParcela =   filter_input(INPUT_POST, "primeiraParcela",            FILTER_DEFAULT);
    $idProduto       =   filter_input(INPUT_POST, "idProduto",                  FILTER_VALIDATE_INT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_produto ("
            . ":nome,"
            . ":descricao,"
            . ":precoVenda,"
            . ":vitalicio,"
            . ":primeiraParcela,"
            . ":status,"
            . ":idProduto)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":descricao",$descricao);
    $stmt->bindParam(":precoVenda",$precoVenda);
    $stmt->bindParam(":vitalicio",$vitalicio);
    $stmt->bindParam(":primeiraParcela",$primeiraParcela);
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idProduto",$idProduto);
    $stmt->execute();
}catch(PDOException $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_produto.php");
}