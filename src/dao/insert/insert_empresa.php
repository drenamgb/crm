<?php
    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",        FILTER_DEFAULT)));
    $cnpj           =   strtoupper(trim(filter_input(INPUT_POST, "cnpj",        FILTER_DEFAULT)));
    $endereco       =   strtoupper(trim(filter_input(INPUT_POST, "endereco",    FILTER_DEFAULT)));
    $bairro         =   strtoupper(trim(filter_input(INPUT_POST, "bairro",      FILTER_DEFAULT)));
    $cep            =   strtoupper(trim(filter_input(INPUT_POST, "cep",         FILTER_DEFAULT)));
    $cidade         =   strtoupper(trim(filter_input(INPUT_POST, "cidade",      FILTER_DEFAULT)));
    $estado         =   strtoupper(trim(filter_input(INPUT_POST, "estado",      FILTER_DEFAULT)));
    $email          =   strtoupper(trim(filter_input(INPUT_POST, "email",       FILTER_DEFAULT)));
    $telefone_1     =   strtoupper(trim(filter_input(INPUT_POST, "telefone_1",  FILTER_DEFAULT)));
    $telefone_2     =   strtoupper(trim(filter_input(INPUT_POST, "telefone_2",  FILTER_DEFAULT)));
    $ip_pabx        =   strtoupper(trim(filter_input(INPUT_POST, "ip_pabx",     FILTER_DEFAULT)));
   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_empresa ("
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
            . ":ip_pabx)");
    
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
    $stmt->execute();
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally {
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_empresa.php");        
}