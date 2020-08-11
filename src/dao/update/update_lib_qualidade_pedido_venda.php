<?php
    $apresentacao           =   strtoupper(trim(filter_input(INPUT_POST, "apresentacao",FILTER_VALIDATE_FLOAT)));
    $ritmo                  =   filter_input(INPUT_POST, "ritmo",                       FILTER_VALIDATE_FLOAT);
    $beneficio              =   strtoupper(trim(filter_input(INPUT_POST, "beneficio",   FILTER_VALIDATE_FLOAT)));
    $pergunta               =   strtoupper(trim(filter_input(INPUT_POST, "pergunta",    FILTER_VALIDATE_FLOAT)));
    $valor                  =   filter_input(INPUT_POST, "valor",                       FILTER_VALIDATE_FLOAT);
    $objecao                =   strtoupper(trim(filter_input(INPUT_POST, "objecao",     FILTER_VALIDATE_FLOAT)));
    $pronuncia              =   strtoupper(trim(filter_input(INPUT_POST, "pronuncia",   FILTER_VALIDATE_FLOAT)));
    $intonacao              =   filter_input(INPUT_POST, "intonacao",                   FILTER_VALIDATE_FLOAT);
    $cordialidade           =   filter_input(INPUT_POST, "cordialidade",                FILTER_VALIDATE_FLOAT);
    $conclusao              =   filter_input(INPUT_POST, "conclusao",                   FILTER_VALIDATE_FLOAT);
    $idQualidadePedidoVenda =   (filter_input(INPUT_POST, "idQualidadePedidoVenda",     FILTER_VALIDATE_INT));
try{    
    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call update_lib_qualidade_pedido_venda ("
            . ":apresentacao,"
            . ":ritmo,"
            . ":beneficio,"
            . ":pergunta,"
            . ":valor,"
            . ":objecao,"
            . ":pronuncia,"
            . ":intonacao,"
            . ":cordialidade,"
            . ":conclusao,"
            . ":idQualidadePedidoVenda)");
    $stmt->bindParam(":apresentacao",$apresentacao);
    $stmt->bindParam(":ritmo",$ritmo);
    $stmt->bindParam(":beneficio",$beneficio);   
    $stmt->bindParam(":pergunta",$pergunta);
    $stmt->bindParam(":valor",$valor);
    $stmt->bindParam(":objecao",$objecao);
    $stmt->bindParam(":pronuncia",$pronuncia);
    $stmt->bindParam(":intonacao",$intonacao);
    $stmt->bindParam(":cordialidade",$cordialidade);
    $stmt->bindParam(":conclusao",$conclusao);
    $stmt->bindParam(":idQualidadePedidoVenda",$idQualidadePedidoVenda);
    $stmt->execute();    
}catch(PDOExvalortion $e){
    echo $e->getMessage();  
}finally{
    unset($stmt);
    unset($PDO);
    unset($_REQUEST);
    $dados = base64_encode("idQualidadePedidoVenda={$idQualidadePedidoVenda}");
    header("location:../../../form_lib_qualidade_pedido_venda.php?{$dados}");
}