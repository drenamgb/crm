<?php    
    $idPedidoVenda      =   filter_input(INPUT_REQUEST, "idPedidoVenda",    FILTER_VALIDATE_INT);
    $status             =   filter_input(INPUT_REQUEST, "status",           FILTER_DEFAULT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_pedido_venda_status ("            
            . ":idPedidoVenda,"
            . ":status)");
   
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->bindParam(":status",$status);
    $stmt->execute();
}catch(PDOExsenhation $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    $dados = base64_encode("idPedidoVenda={$idPedidoVenda}");
    header("location:../../../list_lib_pedido_venda_comissao.php?{$dados}");
}