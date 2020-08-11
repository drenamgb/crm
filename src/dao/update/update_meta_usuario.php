<?php   
    $idUsuario      =   filter_input(INPUT_POST, "idUsuario",   FILTER_VALIDATE_INT);
    $meta           =   filter_input(INPUT_POST, "meta",        FILTER_VALIDATE_FLOAT); 
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_meta_usuario ("
            . ":idUsuario,"
            . ":meta)");
    
    
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":meta",$meta);
    $stmt->execute();    
}catch(PDOException $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($PDO);
    unset($stmt);
    unset($_REQUEST);
    header("location:../../../list_meta_usuario.php");
}