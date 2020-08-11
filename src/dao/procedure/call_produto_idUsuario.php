<?php
    $idUsuario = filter_input(INPUT_POST,'idUsuario',   FILTER_VALIDATE_INT);
    $idEmpresa = filter_input(INPUT_POST,'idEmpresa',   FILTER_VALIDATE_INT);
    //$idEmpresa = $_SESSION['idEmpresa'];
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_produto_idUsuario (:idUsuario,:idEmpresa)");
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
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
    unset($_REQUEST);
}