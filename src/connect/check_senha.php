<?php
    $cpf        = filter_input(INPUT_POST,'cpf',FILTER_DEFAULT);
try{    
    require_once ("config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    
    $stmt       =   $PDO->prepare("call select_cpf (:cpf)");
    $stmt->bindParam(":cpf",$cpf);
    $stmt->execute();
    $retorno = $stmt->fetch();    
    echo json_encode($retorno);    
}
catch(PDOException $e){
        echo json_encode($e->getMessage());
 }finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    session_start(); //preciso inicializar, para destruir tudo que esta em sessao, para depois iniciar uma nova sessao!!!
    session_destroy();
    session_start();
 }
 