<?php
    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",        FILTER_DEFAULT)));
    $cnpj           =   filter_input(INPUT_POST, "cnpj",        FILTER_DEFAULT);
    $endereco       =   strtoupper(trim(filter_input(INPUT_POST, "endereco",    FILTER_DEFAULT)));
    $bairro         =   strtoupper(trim(filter_input(INPUT_POST, "bairro",      FILTER_DEFAULT)));
    $cep            =   filter_input(INPUT_POST, "cep",         FILTER_DEFAULT);
    $cidade         =   strtoupper(trim(filter_input(INPUT_POST, "cidade",      FILTER_DEFAULT)));
    $estado         =   strtoupper(trim(filter_input(INPUT_POST, "estado",      FILTER_DEFAULT)));
    $email          =   filter_input(INPUT_POST, "email",       FILTER_DEFAULT);
    $telefone_1     =   filter_input(INPUT_POST, "telefone_1",  FILTER_DEFAULT);
    $telefone_2     =   filter_input(INPUT_POST, "telefone_2",  FILTER_DEFAULT);
    $ip_pabx        =   filter_input(INPUT_POST, "ip_pabx",     FILTER_DEFAULT);
    $status         =   filter_input(INPUT_POST, "status",      FILTER_DEFAULT);
    $idEmpresa      =   filter_input(INPUT_POST, "idEmpresa",   FILTER_DEFAULT);
   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_empresa ("
            . ":nome,"
            . ":cnpj,"
            . ":endereco,"
            . ":bairro,"
            . ":cep,"
            . ":cidade,"
            . ":estado,"
            . ":email,"
            . ":telefone_1,"
            . ":telefone_2,"
            . ":ip_pabx,"
            . ":status,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":cnpj",$cnpj);
    $stmt->bindParam(":endereco",$endereco);   
    $stmt->bindParam(":bairro",$bairro);
    $stmt->bindParam(":cep",$cep);
    $stmt->bindParam(":cidade",$cidade);
    $stmt->bindParam(":estado",$estado);
    $stmt->bindParam(":email",$email);
    $stmt->bindParam(":telefone_1",$telefone_1);
    $stmt->bindParam(":telefone_2",$telefone_2);
    $stmt->bindParam(":ip_pabx",$ip_pabx);
    $stmt->bindParam(":status",$status);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
}catch(PDOException $e){
        echo json_encode($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_empresa.php");
}