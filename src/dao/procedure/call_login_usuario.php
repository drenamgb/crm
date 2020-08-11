<?php
    $login = filter_input(INPUT_POST,'login',   FILTER_DEFAULT);
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_login_usuario (:login)");
    $stmt->bindParam(":login",$login);
    $stmt->execute();
    if($stmt->rowCount()>0){
        $retorno = $stmt->fetch();    
        echo json_encode($retorno);
    }else{
        echo json_encode(false);
    }    
}catch(Exception $e){
    echo json_encode($e->getMessage());    
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
}
    
