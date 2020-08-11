<?php
    $cpf = filter_input(INPUT_REQUEST,'cpf',   FILTER_VALIDATE_INT);
try{
    require_once ("../../connect/config.php");
    $PDO    =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt   =   $PDO->prepare("call select_cpf_usuario (:cpf)");
    $stmt->bindParam(":cpf",$cpf);
    $stmt->execute();
    if($stmt->rowCount()===1){
        //se retornar mais de um, tem duplicidade na base de login com esse cpf
         echo json_encode($stmt->rowCount());
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
    
