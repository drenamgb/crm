<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

//************************** TEMPO PAUSA idAgent x HOJE********************************************
$idAgent = $_SESSION['idAgent'];        
$stmt       =   $PDO->prepare("select * from view_tempo_pausa");
$stmt->execute();
$retorno = $stmt->fetchall();


//************************** TEMPO LINHA idAgent x HOJE
$stmt       =   $PDO->prepare("select * from view_tempo_linha");
$stmt->execute();
$retorno3 = $stmt->fetchall();

switch ($_SESSION['perfil']){
    case "agente":      $disabled    = "disabled";  break;
    case "supervisor":  $disabled    = "disabled";  break;
    case "gerente":     $disabled    = "";          break;
    case "admin":       $disabled    = "";          break;
    
}

switch (date('m')){
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


?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Relatório de Pausa</li>
    </ol>
    <div class="row col-lg-12">
        <form action="src/dao/procedure/select_report_pausa.php" method="post">
            <div class="col-lg-2">
                <label>Data Início</label>
                <input type="date" name="dataInicio" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Data Fim</label>
                <input type="date" name="dataFim" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Tipo</label>
                <select name="tipo" id="tipo" class="form-control" required>
                    <option value="pausa">Tempo de Pausa</option>
                    <option value="linha">Tempo em Linha</option>
                </select>  
            </div>
            <div class="col-lg-2">                
                <div class="col-lg-2">
                    <br>
                    <button type="submit" class="btn btn-success" title="Exportar">
                        Exportar CSV
                    </button>
                </div>
            </div>
        </form>
    </div> 
    <div class="col-lg-12">
        <hr>
        <div class="col-lg-6">
            <label>Relatório de Pausa</label>
            <table class="table table-hover table-striped small">
                <thead>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Qtd Pausa</th>
                    <th>Tempo em Pausa</th>
                </thead>
                <?php 
                $total = count($retorno);
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>".utf8_decode($retorno[$i]['name'])."</td>";
                    echo "<td>".utf8_decode($retorno[$i]['qtdPausa'])."</td>";
                    echo "<td>{$retorno[$i]['tempoPausa']}</td>";     
                   }
                    ?>   
            </table>
        </div>
        <div class="col-lg-6">
            <label>Relatório de Tempo em Linha</label>
            <table class="table table-hover table-striped small">
                <thead>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Qtd Ligações</th>
                    <th>Tempo em Linha</th>
                </thead>
                <?php 
                $total = count($retorno3);
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>".utf8_decode($retorno3[$i]['name'])."</td>";
                    echo "<td>".utf8_decode($retorno3[$i]['qtdLinha'])."</td>";
                    echo "<td>{$retorno3[$i]['tempoLinha']}</td>";     
                   }
                    ?>   
            </table>
        </div>
    </div>
    <div class="col-lg-12">
        
        
    </div>
    
</div>
<?php 
require_once ("src/lib/footer.php");
?>