<?php
try{
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("SELECT nome FROM view_cidade");
    $stmt->execute();
    if($stmt->rowCount()>0){
        $retorno = $stmt->fetchall();
        //ajusta para o javascript   na chamada ajax
        foreach($retorno as $key=>$valor){
            $cidade[] = $valor['nome'];
        }
        echo json_encode($cidade);
    }else{
        echo json_encode(false);
    }    
}catch(Exception $e){
    echo json_encode($e->getMessage());    
}finally{
    unset($stmt);
    unset($PDO); 
}