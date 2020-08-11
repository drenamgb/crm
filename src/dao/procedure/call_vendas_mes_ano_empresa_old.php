<?php
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    session_start();
    $mes = date('m');
    $ano = date('Y');
    $idEmpresa = $_SESSION['idEmpresa'];

    $stmt       =   $PDO->prepare("call select_vendas_mes_ano_empresa ("
            . ":mes,"
            . ":ano,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    
    $stmt->execute();
    if($stmt->rowCount()>0){
        $retorno = $stmt->fetchall();

        $header[0][0] = "Task";
        $header[0][1] = "Hours per Day";

        $retorno2 = array_merge($header,$retorno);
        echo json_encode($retorno2);
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
