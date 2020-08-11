<?php
    session_start();
      
    $nome       =   strtoupper(trim(filter_input(INPUT_POST, "nome",    FILTER_DEFAULT)));
    $cpf        =   filter_input(INPUT_POST, "cpf",                     FILTER_DEFAULT);
    $login      =   strtoupper(trim(filter_input(INPUT_POST, "login",   FILTER_DEFAULT)));
    $senha      =   filter_input(INPUT_POST, "senha",                   FILTER_DEFAULT);
    $perfil     =   filter_input(INPUT_POST, "perfil",                  FILTER_DEFAULT);
    $meta       =   filter_input(INPUT_POST, "meta",                    FILTER_DEFAULT);
    $idEmpresa  =   $_SESSION['idEmpresa'];
    
   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_usuario ("
            . ":nome,"
            . ":cpf,"
            . ":login,"
            . ":senha,"
            . ":perfil,"
            . ":idEmpresa,"
            . ":meta)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":cpf",$cpf);
    $stmt->bindParam(":login",$login);   
    $stmt->bindParam(":senha",$senha);
    $stmt->bindParam(":perfil",$perfil);
    $stmt->bindParam(":meta",$meta);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
}
catch(PDOException $e){
    echo ($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_usuario.php");
}
    