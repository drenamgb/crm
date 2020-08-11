<?php
    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",    FILTER_DEFAULT)));
    $cpf            =   filter_input(INPUT_POST, "cpf",                     FILTER_DEFAULT);
    $login          =   strtoupper(trim(filter_input(INPUT_POST, "login",   FILTER_DEFAULT)));
    $senha          =   filter_input(INPUT_POST, "senha",                   FILTER_DEFAULT);
    $perfil         =   filter_input(INPUT_POST, "perfil",                  FILTER_DEFAULT);
    $status         =   filter_input(INPUT_POST, "status",                  FILTER_DEFAULT);
    $idUsuario      =   filter_input(INPUT_POST, "idUsuario",               FILTER_VALIDATE_INT);
    $meta           =   filter_input(INPUT_POST, "meta",                    FILTER_DEFAULT);
   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_usuario ("
            . ":nome,"
            . ":cpf,"
            . ":login,"
            . ":senha,"
            . ":perfil,"
            . ":status,"
            . ":idUsuario,"
            . ":meta)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":cpf",$cpf);
    $stmt->bindParam(":login",$login);   
    $stmt->bindParam(":senha",$senha);
    $stmt->bindParam(":perfil",$perfil);
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":meta",$meta);
    $stmt->execute();
}catch(PDOExsenhation $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_usuario.php");
}