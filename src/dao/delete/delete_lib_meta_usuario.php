<?php
    $idMetaUsuario    =   filter_input(INPUT_POST, "idMetaUsuario",    FILTER_VALIDATE_INT);   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("call delete_lib_meta_usuario_idMetaUsuario (:idMetaUsuario)");    
    $stmt->bindParam(":idMetaUsuario",$idMetaUsuario);
    $stmt->execute();    
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_meta_usuario.php");
}