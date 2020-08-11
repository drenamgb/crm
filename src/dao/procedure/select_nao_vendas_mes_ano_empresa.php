<?php
ini_set('memory_limit', '512M');
session_start();
$idEmpresa  = $_SESSION['idEmpresa'];

$mes        = filter_input(INPUT_POST,'mes',  FILTER_VALIDATE_INT);
$ano        = filter_input(INPUT_POST,'ano',  FILTER_VALIDATE_INT);

    require_once ("../../connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_nao_vendas_mes_ano_empresa ("
            . ":mes,"
            . ":ano,"
            . ":idEmpresa)");
    
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    
    $stmt->execute();
    
    $retorno = $stmt->fetchall();
    
    if(!$retorno){
        echo "Erro de sessão: ".$_SESSION['idEmpresa'];
        exit;
    }
    
$table = "CLIENTE;"
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
        . "TELEFONE_2;"
        . "OCUPACAO;"
        . "PESO;"
        . "ALTURA;"
        . "RENDA;"
        . "BANCO;"
        . "AGENCIA;"
        . "CONTA;"
        . "MOTIVO\n";


$max = count($retorno);
for($i=0;$i<$max;$i++){
    $table .=$retorno[$i]['cliente'].";";
    $table .=$retorno[$i]['cpf'].";";
    $table .=$retorno[$i]['rg'].";";
    $table .=$retorno[$i]['orgaoEmissor'].";";
    $table .=$retorno[$i]['sexo'].";";
    $table .=$retorno[$i]['dataNascimento'].";";
    $table .=$retorno[$i]['estadoCivil'].";";
    $table .=$retorno[$i]['endereco'].";";
    $table .=$retorno[$i]['complemento'].";";
    $table .=$retorno[$i]['bairro'].";";
    $table .=$retorno[$i]['cep'].";";
    $table .=$retorno[$i]['cidade'].";";
    $table .=$retorno[$i]['estado'].";";
    $table .=$retorno[$i]['email'].";";
    $table .=$retorno[$i]['telefone_1'].";";
    $table .=$retorno[$i]['telefone_2'].";";
    $table .=$retorno[$i]['ocupacao'].";";
    $table .=$retorno[$i]['peso'].";";
    $table .=$retorno[$i]['altura'].";";
    $table .=$retorno[$i]['renda'].";";
    $table .=$retorno[$i]['banco'].";";
    $table .=$retorno[$i]['agencia'].";";
    $table .=$retorno[$i]['conta'].";";
    $table .=$retorno[$i]['motivo']."\n";
}

switch ($mes){
    case 01: $nomeMes =  "Janeiro";    break;
    case 02: $nomeMes =  "Fevereiro";  break;
    case 03: $nomeMes =  "Março";      break;
    case 04: $nomeMes =  "Abril";      break;
    case 05: $nomeMes =  "Maio";       break;
    case 06: $nomeMes =  "Junho";      break;
    case 07: $nomeMes =  "Julho";      break;
    case 08: $nomeMes =  "Agosto";     break;
    case 09: $nomeMes =  "Setembro";   break;
    case 10: $nomeMes =  "Outubro";    break;
    case 11: $nomeMes =  "Novembro";   break;
    case 12: $nomeMes =  "Dezembro";   break;
} 

header('Content-disposition: attachment;filename=Retrabalho-Mailing-'.$nomeMes.'-'.$ano.'.csv');
echo $table;