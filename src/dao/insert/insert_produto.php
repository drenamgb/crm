<?php
    session_start();
    $nome               =   strtoupper(trim(filter_input(INPUT_POST, "nome",            FILTER_DEFAULT)));
    $descricao          =   strtoupper(trim(filter_input(INPUT_POST, "descricao",       FILTER_DEFAULT)));
    $precoVenda         =   filter_input(INPUT_POST, "precoVenda",                      FILTER_DEFAULT);
    $vitalicio          =   strtoupper(trim(filter_input(INPUT_POST, "vitalicio",       FILTER_DEFAULT)));
    $primeiraParcela    =   strtoupper(trim(filter_input(INPUT_POST, "primeiraParcela", FILTER_DEFAULT)));
    $idEmpresa          =   $_SESSION['idEmpresa'];
   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_produto ("
            . ":nome,"
            . ":descricao,"
            . ":precoVenda,"
            . ":vitalicio,"
            . ":primeiraParcela,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":descricao",$descricao);
    $stmt->bindParam(":precoVenda",$precoVenda);
    $stmt->bindParam(":vitalicio",$vitalicio);
    $stmt->bindParam(":primeiraParcela",$primeiraParcela);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();            
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_produto.php");    
}