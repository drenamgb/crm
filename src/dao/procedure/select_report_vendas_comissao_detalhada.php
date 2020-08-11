<?php
require_once ("../../connect/config.php");
session_start();


    $stmt       =   $PDO->prepare("truncate transposta;");
    $stmt->execute();
   
    
    $idUsuario      = filter_input(INPUT_POST,'idUsuario',  FILTER_DEFAULT);
    $idOperacao     = filter_input(INPUT_POST,'idOperacao', FILTER_DEFAULT);
    $dataInicio     = filter_input(INPUT_POST,'dataInicio', FILTER_DEFAULT);
    $dataFim        = filter_input(INPUT_POST,'dataFim',    FILTER_DEFAULT);
    
    if($idUsuario){
        $queryUsuario = " pv.idUsuario = {$idUsuario} and";
    }else{$queryUsuario="";}

    if($idOperacao){
        $queryOperacao = " lpo.idOperacao = {$idOperacao} and";
    }else{$queryOperacao="";}

    
    $stmt       =   $PDO->prepare("select count(*) as qtd, sum(a.precoVenda) as soma,a.idPedidoVenda from 
    (SELECT 
        u.nome AS usuario,
        c.nome AS cliente,
        c.cpf AS cpf,
        lpvc.dataPagamento AS dataPagamento,
        lpvc.timestamp AS timestamp,
        lpvc.idComissao AS idComissao,
        lpvc.tipoComissao AS tipoComissao,
        prod.nome AS produto,
        prod.precoVenda AS precoVenda,
        o.nome AS operacao,
        prod.vitalicio AS vitalicio,
        prod.primeiraParcela AS primeiraParcela,
        pv.idPedidoVenda AS idPedidoVenda
    FROM
        lib_pedido_venda_comissao lpvc
        JOIN pedido_venda pv ON pv.idPedidoVenda = lpvc.idPedidoVenda
        JOIN usuario u ON u.idUsuario = pv.idUsuario
        JOIN cliente c ON c.idCliente = pv.idCliente
        JOIN lib_pedido_produto lpp ON lpp.idPedido = pv.idPedidoVenda
        JOIN produto prod ON prod.idProduto = lpp.idProduto
        JOIN lib_produto_operacao lpo ON lpo.idProduto = lpp.idProduto
        JOIN operacao o ON o.idOperacao = lpo.idOperacao
        where 
        {$queryUsuario}
        {$queryOperacao} 
        lpvc.dataPagamento between '{$dataInicio}' and '{$dataFim}' and
        pv.idEmpresa = {$_SESSION['idEmpresa']}
    ORDER BY lpvc.dataPagamento DESC) as a group by a.idPedidoVenda;");
       
    $stmt->execute();
    $retorno = $stmt->fetchall();
    
    
    $total = count($retorno);
    for($i=0;$i<$total;$i++){
        $stmt = $PDO->prepare("call select_pedido_venda_comissoes(:idEmpresa,:idPedidoVenda)");
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $stmt->bindParam(":idPedidoVenda",$retorno[$i]['idPedidoVenda']);
        $stmt->execute();
        $retorno2 = $stmt->fetchall();
        for($j=0;$j<count($retorno2);$j++){
            $stmt = $PDO->prepare("call insert_transposta(:idPedidoVenda,:idComissao,:soma,:qtd)");
            $stmt->bindParam(":idPedidoVenda",$retorno[$i]['idPedidoVenda']);
            $stmt->bindParam(":idComissao",$retorno2[$j]['idComissao']);
            $stmt->bindParam(":qtd",$retorno[$i]['qtd']);
            $stmt->bindParam(":soma",$retorno[$i]['soma']);   
            $stmt->execute();            
        }        
    }
    
    
    
    
    if(!$retorno){
       // echo $stmt->queryString;
        echo "Não encontrado resultados";
        exit;
    }
    $table = "DATA_VENDA;"
        . "VENDEDOR;"
        . "PEDIDO;"
        . "PROPOSTA;"
        . "CLIENTE;"
        . "CPF;"
        . "TELEFONE_1;"
        . "DATA_MOVIMENTACAO;"
        . "DATA_BAIXA;"    
        . "TIPO;"    
        . "OPERACAO;"   
        . "PRODUTO;"    
        . "PRECO_VENDA;"  
        . "VITALICIO_%;"
        . "1_PARCELA_%;"
        . "PARCELAS;"
        . "A_RECEBER%;"
        . "\n";
    
    //pega os idPedidos Venda Para rodar
    $stmt       =   $PDO->prepare("select idPedidoVenda from transposta group by(idPedidoVenda)");
    $stmt->execute();
    $retorno = $stmt->fetchall();
    $total = count($retorno);
    for($i=0;$i<$total;$i++){
        $stmt       =   $PDO->prepare("call select_transposta_idPedidovenda (:idPedidoVenda)");
        $stmt->bindParam(":idPedidoVenda",$retorno[$i]['idPedidoVenda']);
        $stmt->execute();
        $retorno2 = $stmt->fetchall();  
        $max = count($retorno2);
        $vitalicio=0;
        $primeiraParcela=0;
        for($j=0;$j<$max;$j++){
            $table .=$retorno2[$j]['dataVenda'].";";
            $table .=utf8_decode($retorno2[$j]['usuario']).";";
            $table .=utf8_decode($retorno2[0]['idPedidoVenda']).";";
            $table .=utf8_decode($retorno2[$j]['numeroProposta']).";";
            $table .=utf8_decode($retorno2[$j]['cliente']).";";
            $table .=utf8_decode($retorno2[$j]['cpf']).";";
            $table .=utf8_decode($retorno2[$j]['telefone_1']).";";
            $table .=utf8_decode($retorno2[$j]['dataPagamento']).";";
            $table .=utf8_decode($retorno2[$j]['timestamp']).";";
            $table .=utf8_decode($retorno2[$j]['tipoComissao']).";";
            $table .=utf8_decode($retorno2[$j]['operacao']).";";
            $table .=utf8_decode($retorno2[$j]['produto']).";";
            $table .=utf8_decode(number_format($retorno2[$j]['precoVenda'],2,",",".")).";";
            $table .=utf8_decode($retorno2[$j]['vitalicio']." %").";";
            $table .=utf8_decode($retorno2[$j]['primeiraParcela']." %").";";
            $table .=utf8_decode(($j+1)."º").";";
            if($j==0){
                $primeiraParcela +=($retorno2[$j]['precoVenda']*$retorno2[$j]['primeiraParcela'])/100;  
                $table .=utf8_decode(number_format($primeiraParcela,2,",",".")).";";
            }
            else{   
                $a = number_format(  ($retorno2[$j]['precoVenda']*$retorno2[$j]['vitalicio'])/100   ,2,",",".");
                 $table .=utf8_decode($a).";";
            }
            $table .="\n";
        }
    }
    
//precisa limpar a tabela para poder deletar pgtos    
$stmt       =   $PDO->prepare("truncate transposta;");
$stmt->execute();
    


header('Content-disposition: attachment;filename=relatorio.csv');
echo $table;