<?php 
require_once ("src/connect/config.php");
require_once ("src/connect/check_sessao.php");

$idEmpresa  = $_SESSION['idEmpresa'];
$idUsuario  = $_SESSION['idUsuario'];


 switch ($_SESSION['perfil']){
    case "agente":      $disabled    = "";          break;
    case "supervisor":  $disabled    = "hidden";    break;
    case "backoffice":  $disabled    = "hidden";    break;
    case "gerente":     $disabled    = "hidden";    break;
    case "admin":       $disabled    = "hidden";    break;
    case "root":        $disabled    = "hidden";    break;
    
}

$dia = date('d');
$mes = date('m');
$ano = date('Y');
switch (date('m')){
    case '01': $nomeMes =  "Janeiro";    break;
    case '02': $nomeMes =  "Fevereiro";  break;
    case '03': $nomeMes =  "Março";      break;
    case '04': $nomeMes =  "Abril";      break;
    case '05': $nomeMes =  "Maio";       break;
    case '06': $nomeMes =  "Junho";      break;
    case '07': $nomeMes =  "Julho";      break;
    case '08': $nomeMes =  "Agosto";     break;
    case '09': $nomeMes =  "Setembro";   break;
    case '10': $nomeMes =  "Outubro";    break;
    case '11': $nomeMes =  "Novembro";   break;
    case '12': $nomeMes =  "Dezembro";   break;
    default:$nomeMes="";
} 

 
//******************************* VENDAS x DIA  - RANKING DO DIA **************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");   
    $stmt       =   $PDO->prepare("call select_vendas_ranking_dia_usuarios (:dia,:mes,:ano,:idEmpresa)");
    $stmt->bindParam(":dia",$dia);
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
    $retorno = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: VENDAS x DIA  - RANKING DO DIA - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);
    unset($PDO);
}
//******************************* VENDAS x MES - HISTORICO DE VENDAS*************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_vendas_historico_idUsuario (:idUsuario,:mes,:ano,:idEmpresa)");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }
    else{$stmt       =   $PDO->prepare("call select_vendas_historico_empresa (:mes,:ano,:idEmpresa)");}

    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
    $retorno2 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: VENDAS x MES - HISTORICO DE VENDAS - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);
    unset($PDO);
}

//********************************* VENDAS x USUARIO  - RANKING DO MES**********************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_ranking_mes_usuarios (:mes,:ano,:idEmpresa)");   
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();   
    $retorno3 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: VENDAS x USUARIO  - RANKING DO MES - ".$e->getMessage()."<br/>"; 
}finally{
    unset($stmt);  
    unset($PDO);
}
//*******************************NAO VENDAS x MES **************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    // obs nao estou usando!!!!!!!!!!
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_nao_vendas_idUsuario (:idUsuario,:mes,:ano,:idEmpresa)");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }
    else{$stmt       =   $PDO->prepare("call select_nao_vendas_usuarios (:mes,:ano,:idEmpresa)");}

    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
    $retorno4 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: NAO VENDAS x MES - ".$e->getMessage()."<br/>";
} finally {
    unset($stmt);  
    unset($PDO);
}
//******************************** Qualidade Venda idUsuario ************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_qualidade_idUsuario(:idUsuario,:idEmpresa)");  
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();   
    $retorno5 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: Qualidade Venda idUsuario - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}
//******************************** Qualidade Venda por Usuario ************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_qualidade_usuarios (:idEmpresa)");
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();   
    $retorno6 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Qualidade Venda por Usuario - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//******************************** Quantidade Venda Pendentes idUsuario ************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_pendentes_usuario_idUsuario (:idEmpresa,:idUsuario)");
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->execute();   
    $retorno7 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: Quantidade Venda Pendentes idUsuario - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}
//******************************** Quantidade Venda Pendentes por Usuario ************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_pendentes_usuarios (:idEmpresa)");  
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();   
    $retorno8 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Quantidade Venda Pendentes por Usuario - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//******************************** Quantidade Venda Sexo ************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_vendas_sexo_idUsuario (:idUsuario,:idEmpresa)"); 
        $stmt->bindParam(":idUsuario",$idUsuario);
        $stmt->bindParam(":idEmpresa",$idEmpresa);
    }
    else{
        $stmt       =   $PDO->prepare("call select_vendas_sexo (:idEmpresa)");
        $stmt->bindParam(":idEmpresa",$idEmpresa);
        }
    $stmt->execute();   
    $retorno9 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Quantidade Venda Sexo - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//******************************************************************************
//mecanismo para tratar quando o vendedor não tiver feito vendas par ao sexo M ou F, pois a query pode retornar vazio e o php entende como undefined
if(isset($retorno9[0]['total'])){
    $male = $retorno9[0]['total'];
}else{
    $male = 0;
}
if(isset($retorno9[1]['total'])){
    $female = $retorno9[1]['total'];
}else{
    $female = 0;
}


//******************************* VENDAS x USUARIO  - RANKING DE VENADS REPROVADAS *****************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_vendas_reprovadas_usuarios (:mes,:ano,:idEmpresa)");
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();   
    $retorno10 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: VENDAS x USUARIO  - RANKING DE VENADS REPROVADAS - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}

//************************** TEMPO PAUSA idAgent ********************************************
try{       
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_tempo_pausa_idAgent(:idAgent)");
    $stmt->bindParam(":idAgent",$idAgent);
    $stmt->execute();
    $retorno11 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: TEMPO PAUSA idAgent - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//************************** TEMPO LINHA idAgent *******************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_tempo_linha_idAgent(:idAgent)");
    $stmt->bindParam(":idAgent",$idAgent);
    $stmt->execute();
    $retorno12 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: TEMPO LINHA idAgent - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//************************** Qtd vendas x Dia x mes x Ano x Status ******************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_venda_status_dia_idUsuario (:idEmpresa,:ano,:mes,:dia,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }
    else{$stmt       =   $PDO->prepare("call select_pedido_venda_status_dia (:idEmpresa,:ano,:mes,:dia);");}
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":dia",$dia);
    $stmt->execute();
    $retorno13 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Qtd vendas x Dia x mes x Ano x Status - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}

//************************** Qtd vendas x Mes x Ano x Status *************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_venda_status_mes_idUsuario (:idEmpresa,:ano,:mes,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);

    }else{
        $stmt       =   $PDO->prepare("call select_pedido_venda_status_mes (:idEmpresa,:ano,:mes);");
    }
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":mes",$mes);
    $stmt->execute();
    $retorno14 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Qtd vendas x Mes x Ano x Status - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);  
    unset($PDO);
}
//************************** Qtd vendas x Ano x Status **********************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_venda_status_ano_idUsuario (:idEmpresa,:ano,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }else{$stmt       =   $PDO->prepare("call select_pedido_venda_status_ano (:idEmpresa,:ano);");}
    
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->execute();
    $retorno15 = $stmt->fetchall();
}catch(Exception $e){
    echo "Erro: Qtd vendas x Ano x Status  - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}
//************************** Qtd NAO vendas Dia x Mes x Ano ***************************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_nao_venda_dia_idUsuario (:idEmpresa,:ano,:mes,:dia,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }else{$stmt       =   $PDO->prepare("call select_pedido_nao_venda_dia (:idEmpresa,:ano,:mes,:dia);");}
    
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":mes",$mes);
    $stmt->bindParam(":dia",$dia);
    $stmt->execute();
    $retorno16 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: Qtd NAO vendas Dia x Mes x Ano  - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}
//************************** Qtd NAO vendas x Mes x Ano ************************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_nao_venda_mes_idUsuario (:idEmpresa,:ano,:mes,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }else{$stmt       =   $PDO->prepare("call select_pedido_nao_venda_mes (:idEmpresa,:ano,:mes);");}
    
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->bindParam(":mes",$mes);
    $stmt->execute();
    $retorno17 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: Qtd NAO vendas Dia x Mes x Ano  - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt);   
    unset($PDO);
}
//************************** Qtd NAO vendas x Mes x Ano ***************************************
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    if($_SESSION['perfil']==="agente"){
        $stmt       =   $PDO->prepare("call select_pedido_nao_venda_ano_idUsuario (:idEmpresa,:ano,:idUsuario);");
        $stmt->bindParam(":idUsuario",$idUsuario);
    }else{$stmt       =   $PDO->prepare("call select_pedido_nao_venda_ano (:idEmpresa,:ano);");}
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":ano",$ano);
    $stmt->execute();
    $retorno18 = $stmt->fetch();
}catch(Exception $e){
    echo "Erro: Qtd NAO vendas x Mes x Ano  - ".$e->getMessage()."<br/>";
}finally{
    unset($stmt); 
    unset($PDO);
}    
?>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
     
//****************************** RANKING DO DIA ******************************
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],          
          <?php 
          $total = count($retorno);
          for($i=0;$i<$total;$i++){
              echo "['".$retorno[$i]['usuario']."',".$retorno[$i]['soma_mes']."],";                    
                }
          ?>
        ]);        

        var chart = new google.visualization.PieChart(document.getElementById('rankingDia'));
        chart.draw(data);
      }
      
     //****************************** RANKING MES **********************************
      google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],          
          <?php 
          $total = count($retorno3);
          for($i=0;$i<$total;$i++){
              echo "['".$retorno3[$i]['usuario']."',".$retorno3[$i]['soma_mes']."],";                    
                }
          ?>
        ]);        

        var chart = new google.visualization.PieChart(document.getElementById('rankingMes'));
        chart.draw(data);
      }
      
      
      //**************************** HISTORICO DE VENDAS ********************************            
        google.charts.load('current', {'packages':['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {        
        var chartDiv = document.getElementById('chart_div');
        var data = google.visualization.arrayToDataTable([
          ['Por Dia ','R$', 'Quantidade'],
          <?php 
          $total = count($retorno2);
          for($i=0;$i<$total;$i++){
              echo "['".$retorno2[$i]['dia']."',".$retorno2[$i]['soma_mes'].",".$retorno2[$i]['qtd_mes']."],";
            }
          ?>
        ]);

        var materialOptions = {
          width: 1100,
          height:300,
          chart: {
            title: 'Histórico de Vendas',
            subtitle: '<?php echo $nomeMes." de ".Date("Y");?> '
          },
          series: {
            0: { axis: 'R$' }, // Bind series 0 to an axis named 'distance'.
            1: { axis: 'Qtd' } // Bind series 1 to an axis named 'brightness'.
          }          
        };       

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));         
        }
        drawMaterialChart();
    };
      
       //$('.rb-rating').rating();      
    </script>
    
 
<div id="container">
    <div class="row col-lg-12">
         <ol class="breadcrumb">
             <li class="active"><b>Resumo de Vendas</b></li>
         </ol>        
    </div> 
    
    <div class="col-lg-12" <?php echo $disabled; ?>> 
        <div class="col-lg-3">
            <label>Você tem <span class="badge"><?php echo $retorno7['total']; ?></span> pedidos em análise.</label>
        </div>
        <div class="col-lg-3">
            <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> <?php echo $retorno12['qtdLinha']; ?><font size="1" color="gray"> ligações </font> <?php echo $retorno12['tempoLinha']; ?>  
            <br> <span class="glyphicon glyphicon-phone-alt" aria-hidden="true"></span><?php echo " ".$retorno11['qtdPausa']; ?><font size="1" color="gray">pausas </font>   <?php echo $retorno11['tempoPausa']; ?> 
        </div>
        <div class="col-lg-2">
            <label>Vendas</label>
            <span class="badge"><?php echo $male; ?></span> <img src="src/lib/img/male.png" width="15" alt="homem">
                <span class="badge"><?php echo $female; ?></span> <img src="src/lib/img/female.png" width="15" alt="mulher">
        </div>
        <div class="col-lg-4 small" align="right">Qualidade das Vendas - Nota: <?php echo round($retorno5['mediaTotal'],2);?> <input value="<?php echo $retorno5['mediaTotal'];?>"  disabled class="rating" data-size="xs"></div>
    </div>
    <div class="col-lg-12"> 
        <div class="col-lg-3">
            <button class="btn btn-primary">
                <font size="4"><strong>Hoje</strong></font><br>
                <?php                
                    $total = count($retorno13);
                    $totalQtdDia = 0;
                    $totalSomaDia = 0;
                    for($i=0;$i<$total;$i++){
                        echo "<b>R$ ".number_format($retorno13[$i]['soma_dia'],2,",",".")."</b> - <font size=1>".$retorno13[$i]['status']." (".$retorno13[$i]['qtd_dia'].")</font><br>";
                        $totalQtdDia = $totalQtdDia+ $retorno13[$i]['qtd_dia'];
                        $totalSomaDia = $totalSomaDia+ $retorno13[$i]['soma_dia'];
                    }
                    echo "<b>Total</b> R$ ".number_format($totalSomaDia,2,",",".")." - <b>Qtd</b> ".$totalQtdDia."";
                ?>
            </button>
        </div>
        <div class="col-lg-3">
            <button class="btn btn-success">
                <font size="4"><strong><?php echo $nomeMes;?></strong></font><br>
                <?php                
                    $total = count($retorno14);
                    $totalQtdMes = 0;
                    $totalSomaMes = 0;
                    for($i=0;$i<$total;$i++){
                        echo "<b>R$ ".number_format($retorno14[$i]['soma_mes'],2,",",".")."</b> - <font size=1>".$retorno14[$i]['status']." (".$retorno14[$i]['qtd_mes'].")</font><br>";
                        $totalQtdMes = $totalQtdMes+ $retorno14[$i]['qtd_mes'];
                        $totalSomaMes = $totalSomaMes+ $retorno14[$i]['soma_mes'];
                    }
                    echo "<b>Total</b> R$ ".number_format($totalSomaMes,2,",",".")." - <b>Qtd</b> ".$totalQtdMes;
                ?>
            </button>
        </div>
        <div class="col-lg-3">
            <button class="btn btn-warning">
                <font size="4"><strong><?php echo Date("Y");?></strong></font><br>
                <?php                
                    $total = count($retorno15);
                    $totalQtdAno = 0;
                    $totalSomaAno = 0;
                    for($i=0;$i<$total;$i++){
                        echo "<b>R$ ".number_format($retorno15[$i]['soma_ano'],2,",",".")."</b> - <font size=1>".$retorno15[$i]['status']."(".$retorno15[$i]['qtd_ano'].")</font><br>";
                        $totalQtdAno = $totalQtdAno+ $retorno15[$i]['qtd_ano'];
                        $totalSomaAno = $totalSomaAno+ $retorno15[$i]['soma_ano'];
                    }
                    echo "<b>Total</b> R$ ".number_format($totalSomaAno,2,",",".")." - <b>Qtd</b> ".$totalQtdAno;
                ?>
            </button>
        </div>
        <div class="col-lg-3">
            <button class="btn btn-danger">
                <font size="4"><strong>Não Vendas</strong></font>
<!--                <font size="2"> (tabuladas)</font>-->
                <br>
            <?php
                echo "<b>Hoje</b> - ".number_format($retorno16['qtd_dia'],0,".",".")."<br>";
                echo "<b>".$nomeMes."</b> - ".number_format($retorno17['qtd_mes'],0,".",".")."<br>";
                echo "<b>".Date("Y")."</b> - ".number_format($retorno18['qtd_ano'],0,".",".");
            ?>
            </button>
        </div>
    </div>
    
    <div class="col-lg-12"> 
        <hr>
        <div class="col-lg-6">
            <label>Ranking de Hoje - </label><font color="gray" size="2"> (aprovados)</font>      
            <table class="table table-hover table-striped small" border="0" >
                <thead>
                    <th>#</th>
                    <th>Usuário</th>
                    <th>Quantidade</th>
                    <th>R$ Total</th>
                </thead>
                <?php 
                $total = count($retorno);
                $totalQtdMes = 0;
                $totalSomaMes = 0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>{$retorno[$i]['usuario']}</td>";                    
                    echo "<td>{$retorno[$i]['qtd_mes']}</td>";
                    echo "<td>".number_format($retorno[$i]['soma_mes'],2,",",".")."</td>";
                    $totalQtdMes = $totalQtdMes+ $retorno[$i]['qtd_mes'];
                    $totalSomaMes = $totalSomaMes+ $retorno[$i]['soma_mes'];
                }
                    echo "<tr>";
                    echo "<td colspan=2><strong>TOTAL</strong></td>";
                    echo "<td><strong>{$totalQtdMes}</strong></td>";
                    echo "<td><strong>".number_format($totalSomaMes,2,",",".")."<strnong></td>";
                    echo "</tr>";
                ?>
            </table> 
            <label>Relação Pedido Pendentes</label>   
            <table class="table table-hover table-striped small" border="0">
                <thead>
                    <th>#</th>
                    <th>Usuário</th>
                    <th>Quantidade</th>
                    <th></th>
                </thead>
                <?php 
                $total = count($retorno8);
                $totalQtdMes = 0;
                $totalSomaMes = 0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>{$retorno8[$i]['usuario']}</td>";
                    echo "<td>".($retorno8[$i]['total'])."</td>";
                    $totalQtdMes = $totalQtdMes+ $retorno8[$i]['total'];
                }
                    echo "<tr>";
                    echo "<td colspan=2><strong>TOTAL</strong></td>";
                    echo "<td><strong>".$totalQtdMes."</strong></td>";
                    echo "</tr>";
                ?>
            </table>
        </div>
         <div class="col-lg-6">
             <label>Ranking de <?php echo $nomeMes; ?> - </label><font color="gray" size="2"> (aprovados)</font>   
            <table class="table table-hover table-striped small" border="0">
                <thead>
                    <th>#</th>
                    <th>Usuário</th>
                    <th>Quantidade</th>
                    <th>R$ Total</th>
                </thead>
                <?php 
                $total = count($retorno3);
                $totalQtdMes = 0;
                $totalSomaMes = 0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>{$retorno3[$i]['usuario']}</td>";
                    echo "<td>{$retorno3[$i]['qtd_mes']}</td>";
                    echo "<td>".number_format($retorno3[$i]['soma_mes'],2,",",".")."</td>";
                    $totalQtdMes = $totalQtdMes+ $retorno3[$i]['qtd_mes'];
                    $totalSomaMes = $totalSomaMes+ $retorno3[$i]['soma_mes'];
                }
                    echo "<tr>";
                    echo "<td colspan=2><strong>TOTAL</strong></td>";
                    echo "<td><strong>{$totalQtdMes}</strong></td>";
                    echo "<td><strong>".number_format($totalSomaMes,2,",",".")."<strnong></td>";
                    echo "</tr>";
                ?>
            </table>
        </div>        
    </div>
    
    <div class="col-lg-12">
        <div class="col-lg-6">
            <div id="rankingDia" style="width: 600px; height: 300px;"></div>
        </div>
        <div class="col-lg-6">
            <div id="rankingMes" style="width: 600px; height: 300px;"></div>
        </div>
    </div>
    <div class="col-lg-12">
        <hr>
         <div id="chart_div"></div>
    </div>
    <div class="col-lg-12">
        <hr>
         <div class="col-lg-6">
            <label>Ranking de Qualidade</label>   
            <table class="table table-hover table-striped small" border="0">
                <thead>
                    <th>#</th>
                    <th>Usuário</th>
                    <th>Nota</th>
                    <!--<th></th>-->
                </thead>
                <?php 
                $total = count($retorno6);
                $totalQtdMes = 0;
                $totalSomaMes = 0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>{$retorno6[$i]['usuario']}</td>";
                    echo "<td>".round($retorno6[$i]['mediaTotal'],2)."</td>";
                   // echo "<td><input value='".$retorno6[$i]['mediaTotal']."'  disabled class='rating' data-size='xs'></td>";
                    $totalQtdMes = $totalQtdMes+ $retorno6[$i]['mediaTotal'];
                    $totalSomaMes = $totalSomaMes+ $retorno6[$i]['mediaTotal'];
                }
//                    echo "<tr>";
//                    echo "<td colspan=2><strong>TOTAL</strong></td>";
//                    echo "<td><strong>{$totalQtdMes}</strong></td>";
//                    echo "<td><input value='".$totalSomaMes."'  disabled class='rating' data-size='xs'></td>";
//                    echo "</tr>";
                ?>
            </table>
        </div> 
         <div class="col-lg-6">  
             <label><font color="red" size="2">Ranking de Pedido Reprovados</font></label>   
            <table class="table table-hover table-striped small" border="0">
                <thead>
                    <th>#</th>
                    <th>Usuário</th>
                    <th>Quantidade</th>
                    <th>R$ Total</th>
                </thead>
                <?php 
                $total = count($retorno10);
                $totalQtdMes = 0;
                $totalSomaMes = 0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>".($i+1)."º</td>";
                    echo "<td>{$retorno10[$i]['usuario']}</td>";
                    echo "<td>{$retorno10[$i]['qtd_mes']}</td>";
                    echo "<td>".number_format($retorno10[$i]['soma_mes'],2,",",".")."</td>";
                    $totalQtdMes = $totalQtdMes+ $retorno10[$i]['qtd_mes'];
                    $totalSomaMes = $totalSomaMes+ $retorno10[$i]['soma_mes'];
                }
                    echo "<tr>";
                    echo "<td colspan=2><strong>TOTAL</strong></td>";
                    echo "<td><strong>{$totalQtdMes}</strong></td>";
                    echo "<td><strong>".number_format($totalSomaMes,2,",",".")."<strnong></td>";
                    echo "</tr>";
                ?>
            </table>
        </div>   
    </div>
    
  
    
    
</div>
<?php 
require_once ("src/lib/footer.php");
?>