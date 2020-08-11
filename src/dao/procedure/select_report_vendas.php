<?php
require_once ("../../connect/config.php");
session_start();


$idStatus   =   filter_input(INPUT_POST,'idStatus',     FILTER_VALIDATE_INT);
$dataInicio =   filter_input(INPUT_POST,'dataInicio',   FILTER_DEFAULT);
$dataFim    =   filter_input(INPUT_POST,'dataFim',      FILTER_DEFAULT);
$idUsuario  =   filter_input(INPUT_POST,'idUsuario',    FILTER_VALIDATE_INT);
$idOperacao =   filter_input(INPUT_POST,'idOperacao',   FILTER_VALIDATE_INT);
$idQualidadePedidoVendaInicio   =   filter_input(INPUT_POST,'idQualidadePedidoVendaInicio', FILTER_VALIDATE_INT);
$idQualidadePedidoVendaFim      =   filter_input(INPUT_POST,'idQualidadePedidoVendaFim',    FILTER_VALIDATE_INT);

if($idOperacao){
    $query_idOperacao = "lpo.idOperacao = {$idOperacao} and ";
}else{$query_idOperacao="";}

if($idStatus){
    $query_idStatus = "pv.idStatus = {$idStatus} and ";
}else{$query_idStatus="";}

if($idUsuario){
    $query_idUsuario = "pv.idUsuario = {$idUsuario} and ";
}else{$query_idUsuario="";}

$query_idQualidade = "lqpv.mediaPonderada between {$idQualidadePedidoVendaInicio} and {$idQualidadePedidoVendaFim} and";


    $stmt       =   $PDO->prepare("select 
pv.idUsuario,
pv.idStatus,
pv.timestamp,
pv.obs,
sp.nome as nomeStatus,
lqpv.mediaPonderada,
u.nome as usuario,
c.idCliente as idCliente,
c.nome as cliente,
c.cpf,
c.rg,
c.dataNascimento,
c.orgaoEmissor,
c.sexo,
c.estadoCivil,
c.endereco,
c.complemento,
c.bairro,
c.cidade,
c.estado,
c.cep,
c.email,
c.telefone_1,
prod.idProduto as idProduto,
prod.nome as produto,
prod.precoVenda as precoVenda
from pedido_venda pv join
cliente c on c.idCliente = pv.idCliente join
usuario u on u.idUsuario = pv.idUsuario join
status_pedido sp on sp.idStatus = pv.idStatus join
 lib_pedido_produto lpp on lpp.idPedido = pv.idPedidoVenda join 
 lib_produto_operacao lpo on lpo.idProduto = lpp.idProduto join
 produto prod on prod.idProduto = lpp.idProduto join
 lib_qualidade_pedido_venda lqpv on lqpv.idPedidoVenda = pv.idPedidoVenda
 where
 {$query_idOperacao}
 {$query_idStatus}
 {$query_idUsuario}
 {$query_idQualidade}    
 pv.timestamp between '{$dataInicio} 00:00:00' and '{$dataFim} 23:59:59' and
     pv.idEmpresa = {$_SESSION['idEmpresa']}
 order by pv.timestamp desc ");
    
    $rs = $stmt->execute();
    
    $retorno = $stmt->fetchall();
    
    if(!$retorno){
       // echo $stmt->queryString;
        echo "Não encontrado resultados";
        exit;
    }
    
$table = "DATA_VENDA;"
        . "VENDEDOR;"
        . "NOTA;"
        . "PRODUTO;"
        . "VALOR;"
        . "STATUS;"
        . "CLIENTE;"
        . "CPF;"
        . "RG;"    
        . "ORGAO_EMISSOR;"    
        . "SEXO;"    
        . "DATA_NASCIMENTO;"    
        . "ESTADO_CIVIL;"    
        . "ENDERECO;"    
        . "COMPLEMENTO;"    
        . "BAIRRO;"    
        . "CEP;"    
        . "CIDADE;"    
        . "ESTADO;"    
        . "EMAIL;"
        . "TELEFONE_1;"
        . "\n";


$max = count($retorno);
for($i=0;$i<$max;$i++){
    $table .=$retorno[$i]['timestamp'].";";
    $table .=utf8_decode($retorno[$i]['usuario']).";";
    $table .=utf8_decode($retorno[$i]['mediaPonderada']).";";
    $table .=utf8_decode($retorno[$i]['produto']).";";
    $table .=number_format($retorno[$i]['precoVenda'],2,",",".").";";
    $table .=utf8_decode($retorno[$i]['nomeStatus']).";";
    $table .=utf8_decode($retorno[$i]['cliente']).";";
    $table .=$retorno[$i]['cpf'].";";
    $table .=$retorno[$i]['rg'].";";
    $table .=utf8_decode($retorno[$i]['orgaoEmissor']).";";
    $table .=$retorno[$i]['sexo'].";";
    $table .=$retorno[$i]['dataNascimento'].";";
    $table .=utf8_decode($retorno[$i]['estadoCivil']).";";
    $table .=utf8_decode($retorno[$i]['endereco']).";";
    $table .=utf8_decode($retorno[$i]['complemento']).";";
    $table .=utf8_decode($retorno[$i]['bairro']).";";
    $table .=$retorno[$i]['cep'].";";
    $table .=utf8_decode($retorno[$i]['cidade']).";";
    $table .=$retorno[$i]['estado'].";";
    $table .=$retorno[$i]['email'].";";
    $table .=$retorno[$i]['telefone_1'].";";
    $table .="\n";
}


header('Content-disposition: attachment;filename=relatorio.csv');
echo $table;