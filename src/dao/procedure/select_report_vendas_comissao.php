<?php
require_once ("../../connect/config.php");
session_start();

    $stmt       =   $PDO->prepare("truncate transposta;");
    $stmt->execute();
    
    $idUsuario      = filter_input(INPUT_POST,'idUsuario',  FILTER_DEFAULT);
    $idOperacao     = filter_input(INPUT_POST,'idOperacao', FILTER_DEFAULT);
    $dataInicio     = filter_input(INPUT_POST,'dataInicio', FILTER_DEFAULT);
    $dataFim        = filter_input(INPUT_POST,'dataFim',    FILTER_DEFAULT);
    
    //pega TODOS
    if($idUsuario){
        $queryUsuario = " pv.idUsuario = {$idUsuario} and";
    }else{$queryUsuario="";}

    //pega TODOS
    if($idOperacao){
        $queryOperacao = " lpo.idOperacao = {$idOperacao} and";
    }else{$queryOperacao="";}
    
    
    $stmt       =   $PDO->prepare("select count(*) as qtd, sum(precoVenda) as soma,idPedidoVenda from 
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
        . "1_PARCELA;"
        . "N_PARCELAS;"
        . "A_RECEBER;"
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
        $primeiraParcela=0;
        for($j=0;$j<$max;$j++){            
            if($j==0){
                $primeiraParcela +=($retorno2[$j]['precoVenda']*$retorno2[$j]['primeiraParcela'])/100;  
            }
            else{   
                $primeiraParcela +=($retorno2[$j]['precoVenda']*$retorno2[$j]['vitalicio'])/100;  
            }     
            if($retorno2[0]['tipoComissao']=="estorno"){
                $primeiraParcela -=($retorno2[$j]['precoVenda']); 
            }
        }
            $table .=utf8_decode($retorno2[0]['dataVenda']).";";
            $table .=utf8_decode($retorno2[0]['usuario']).";";
            $table .=utf8_decode($retorno2[0]['idPedidoVenda']).";";
            $table .=utf8_decode($retorno2[0]['numeroProposta']).";";
            $table .=utf8_decode($retorno2[0]['cliente']).";";
            $table .=utf8_decode($retorno2[0]['cpf']).";";
            $table .=utf8_decode($retorno2[0]['telefone_1']).";";
            $table .=utf8_decode($retorno2[0]['dataPagamento']).";";
            $table .=utf8_decode($retorno2[0]['timestamp']).";";
            $table .=utf8_decode($retorno2[0]['tipoComissao']).";";
            $table .=utf8_decode($retorno2[0]['operacao']).";";
            $table .=utf8_decode($retorno2[0]['produto']).";";
            $table .=utf8_decode(number_format($retorno2[0]['precoVenda'],2,",",".")).";";
            $table .=utf8_decode($retorno2[0]['vitalicio']." %").";";
            $table .=utf8_decode($retorno2[0]['primeiraParcela']." %").";";
            $table .=utf8_decode($max).";";
             $table .=utf8_decode(number_format($primeiraParcela,2,",",".")).";";
             $table .="\n";
    }

//precisa limpar a tabela para poder deletar pgtos    
$stmt       =   $PDO->prepare("truncate transposta;");
$stmt->execute();
    


header('Content-disposition: attachment;filename=relatorio.csv');
echo $table;