<?php
    session_start();
    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",        FILTER_DEFAULT)));
    $idEmpresa      =   $_SESSION['idEmpresa'];
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_motivo_pedido_nao_venda ("
            . ":nome,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally{
    header("location:../../../list_motivo_pedido_nao_venda.php");
}