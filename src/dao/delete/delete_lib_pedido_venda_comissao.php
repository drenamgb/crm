<?php
    $idComissao     =   filter_input(INPUT_POST, "idComissao",    FILTER_VALIDATE_INT);
    $idPedidoVenda  =   filter_input(INPUT_POST, "idPedidoVenda", FILTER_VALIDATE_INT);   
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call delete_lib_pedido_venda_comissao_idComissao (:idComissao)");
    $stmt->bindParam(":idComissao",$idComissao);
    $stmt->execute();   
}catch(PDOException $e){
    echo ($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    $dados = base64_encode("idPedidoVenda={$idPedidoVenda}");
    header("location:../../../list_lib_pedido_venda_comissao.php?{$dados}");
}