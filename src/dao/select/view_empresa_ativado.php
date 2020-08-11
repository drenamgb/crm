<?php
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("SELECT * FROM view_empresa_ativado");
    $stmt->execute();
    if($stmt->rowCount()>0){
        $retorno = $stmt->fetchall();        
        echo json_encode($retorno);
    }else{
        echo json_encode(false);
    }
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($stmt);
    unset($PDO);
}