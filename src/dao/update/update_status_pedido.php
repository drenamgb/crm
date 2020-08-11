<?php    
    session_start();   
    $idUsuario              =   $_SESSION['idUsuario'];
    $idPedidoVenda          =   filter_input(INPUT_POST, "idPedidoVenda",           FILTER_VALIDATE_INT);
    $idQualidadePedidoVenda =   filter_input(INPUT_POST, "idQualidadePedidoVenda",  FILTER_VALIDATE_INT);
    $idStatus               =   filter_input(INPUT_POST, "idStatus",                FILTER_VALIDATE_INT);
    $obs                    =   filter_input(INPUT_POST, "obs",                     FILTER_DEFAULT);
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_status_pedido_venda ("            
            . ":idPedidoVenda,"
            . ":idUsuario,"
            . ":idStatus,"
            . ":obs)");
    
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idStatus",$idStatus);
    $stmt->bindParam(":obs",$obs);
    $stmt->execute();    
}catch(PDOExsenhation $e){
    echo json_encode($e->getMessage());  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);  
    $dados = base64_encode("idPedidoVenda={$idPedidoVenda}");
    header("location:../../../form_lib_qualidade_pedido_venda.php?{$dados}");
}