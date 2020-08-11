<?php
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("SELECT nome FROM view_banco");
    $stmt->execute();
    if($stmt->rowCount()>0){
        $retorno = $stmt->fetchall();        
        //ajusta para o javascript   na chamada ajax
        foreach($retorno as $key=>$valor){
            $banco[] = $valor['nome'];
        }
        echo json_encode($banco);
    }else{
        echo json_encode(false);
    }
}catch(Exception $e){
    echo json_encode($e->getMessage());    
}finally{
    unset($stmt);
    unset($PDO);
}