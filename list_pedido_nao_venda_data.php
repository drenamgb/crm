<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$dataInicio     =   filter_input(INPUT_POST,'dataInicio',  FILTER_DEFAULT);
$dataFim        =   filter_input(INPUT_POST,'dataFim',     FILTER_DEFAULT);
$idUsuario      =   filter_input(INPUT_POST,'idUsuario',   FILTER_VALIDATE_INT);

$dataFim.=" 23:59:59";
$dataInicio.=" 00:00:00";

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_pedido_nao_venda_data_idUsuario (:dataInicio,:dataFim,:idUsuario)");
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":dataInicio",$dataInicio);
    $stmt->bindParam(":dataFim",$dataFim);
    $stmt->execute();
    $retorno = $stmt->fetchall();
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($PDO);
    unset($stmt);
}   
    
switch ($_SESSION['perfil']){
    case "agente":      $disabled    = "hidden";    break;
    case "supervisor":  $disabled    = "";          break;
    case "backoffice":  $disabled    = "";          break;
    case "gerente":     $disabled    = "";          break;
    case "admin":       $disabled    = "";          break;
    case "root":        $disabled    = "";          break;
    
}
?>
<div id="container">
    <div class="row col-lg-12">
        <ol class="breadcrumb">
            <li class="active">Não Venda</li>
        </ol>
        <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    </div>
    <div class="row col-lg-12">
        <table class="table table-hover table-striped small">
        <thead>
            <th>#</th>
            <th>Data</th>
            <th>Cliente</th>
            <th>CPF</th>
            <th>Vendedor</th>
            <th>Motivo</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td>{$retorno[$i]['idPedidoNaoVenda']}</td>";            
            echo "<td>{$retorno[$i]['timestamp']}</td>";
            echo "<td>{$retorno[$i]['cliente']}</td>";
            echo "<td>{$retorno[$i]['cpf']}</td>";
            echo "<td>{$retorno[$i]['usuario']}</td>";
            echo "<td>{$retorno[$i]['motivo']}</td>";?>        
<!--                <td>
                    <a href="form_status_pedido_venda.php?idPedidoVenda=<?php echo ($retorno[$i]['idPedidoNaoVenda'])?>"  <?php echo $disabled ?>>
                        <button type="button" class="btn btn-default" title="Atualizar Status"  >
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                        </button>
                    </a>
                    <a href="form_pedido_venda.php?idPedidoVenda=<?php echo ($retorno[$i]['idPedidoNaoVenda'])?>"  <?php echo $disabled ?>>
                        <button type="button" class="btn btn-default" title="Editar"  >
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        </button>
                    </a>
                </td>-->
                <?php
        }
        ?>
    </table>
    </div>
</div>
<?php 
require_once ("src/lib/footer.php");
?>