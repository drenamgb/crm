<?php
session_start();
    $idPedidoVenda      =   filter_input(INPUT_POST,  "idPedidoVenda",   FILTER_VALIDATE_INT);
    $tipoComissao       =   "pago";
    $idUsuario      =   $_SESSION['idUsuario'];
    $dataPagamento      =   filter_input(INPUT_POST,  "dataPagamento",    FILTER_DEFAULT);

try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call insert_lib_pedido_venda_comissao ("
            . ":idPedidoVenda,"
            . ":idUsuario,"
            . ":tipoComissao,"
            . ":dataPagamento)");
    
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":tipoComissao",$tipoComissao);
    $stmt->bindParam(":dataPagamento",$dataPagamento);
    $stmt->execute();
}catch(PDOException $e){
    echo($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    header("location:../../../list_lib_pedido_venda_comissao.php?idPedidoVenda=".$idPedidoVenda);
}