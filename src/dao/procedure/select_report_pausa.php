<?php
require_once ("../../connect/config.php");
session_start();


$dataInicio =   filter_input(INPUT_POST,'dataInicio',   FILTER_DEFAULT);
$dataFim    =   filter_input(INPUT_POST,'dataFim',      FILTER_DEFAULT);
$tipo       =   filter_input(INPUT_POST,'tipo',         FILTER_DEFAULT);

if($tipo=="pausa"){
    $queryTipo="`au`.`id_break` IS NOT NULL";
    $tempo = "TEMPO_PAUSA";
    $qtd="QTD_PAUSAS";}
else{
    $queryTipo="ISNULL(`au`.`id_break`)";
    $tempo = "TEMPO_LINHA";
    $qtd="QTD_LIGAÇÕES";    
}

    $stmt       =   $PDO->prepare("        
    SELECT 
        SEC_TO_TIME(SUM(TIME_TO_SEC(`au`.`duration`))) AS `tempo`,
        count(*) as total,
        `a`.`name` AS `name`
    FROM
        `call_center`.`audit` `au`
        JOIN `call_center`.`agent` `a` ON `a`.`id` = `au`.`id_agent`
    WHERE
        {$queryTipo}
            AND EXTRACT(DAY FROM `au`.`datetime_init`) = DAYOFMONTH(NOW())
            AND EXTRACT(MONTH FROM `au`.`datetime_init`) = MONTH(NOW())
            AND EXTRACT(YEAR FROM `au`.`datetime_init`) = YEAR(NOW())
            and au.datetime_init between '{$dataInicio} 00:00:00' and '{$dataFim} 23:59:59'
    GROUP BY `a`.`name`
    ORDER BY `tempo` DESC;");     
            
    $rs = $stmt->execute();    
    $retorno = $stmt->fetchall();
   
    if(!$retorno){
       // echo $stmt->queryString;
        echo "Não encontrado resultados";
        exit;
    }
    
$table = "VENDEDOR;"
        . utf8_decode($qtd).";"
        . $tempo.";"
        . "\n";


$max = count($retorno);
for($i=0;$i<$max;$i++){
    $table .=utf8_decode($retorno[$i]['name']).";";
    $table .=$retorno[$i]['total'].";";
    $table .=$retorno[$i]['tempo'].";";
    $table .="\n";
}


header('Content-disposition: attachment;filename=relatorio.csv');
echo $table;