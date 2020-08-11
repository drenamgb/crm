<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");   
$dataInicio     =   filter_input(INPUT_POST,'dataInicio',   FILTER_DEFAULT);
$dataFim        =   filter_input(INPUT_POST,'dataFim',      FILTER_DEFAULT);
$idStatus       =   filter_input(INPUT_POST,'idStatus',     FILTER_VALIDATE_INT);
$idUsuario      =   filter_input(INPUT_POST,'idUsuario',    FILTER_VALIDATE_INT);
$idOperacao     =   filter_input(INPUT_POST,'idOperacao',   FILTER_VALIDATE_INT);
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
pv.idPedidoVenda,
pv.obs,
sp.nome as nomeStatus,
lqpv.idQualidadePedidoVenda,
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
 pv.idEmpresa = '{$_SESSION['idEmpresa']}'   
 order by pv.timestamp desc");
 
    // analisar a query
   // echo $stmt->queryString;
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
<script>
    $.ajax({
            url: "src/dao/select/view_status_pedido.php",
            dataType:'json',
            async : true
        }).done(function(retorno) {
            console.log(retorno);
            $("#idStatus").append("<optgroup>");
                for(i=0; i < retorno.length; i++){
                    $("#idStatus").append("<option value="+retorno[i]['idStatus']+">"+retorno[i]['nome']+"</option>");                           
                }
            $("#idStatus").append("</optgroup>");
           // console.log(retorno);
        });
    $.ajax({
            url: "src/dao/procedure/select_usuario.php",
            dataType: "json",
            type:"POST",
            data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
            async : true
        }).done(function(retorno) {
            $("#idUsuario").append("<optgroup>");
                for(i=0; i < retorno.length; i++){
                    $("#idUsuario").append("<option value="+retorno[i]['idUsuario']+">"+retorno[i]['nome']+"</option>");                           
                }
            $("#idUsuario").append("</optgroup>");
           // console.log(retorno);
        });
      
     $.ajax({
        url: "src/dao/procedure/select_operacao.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idOperacao").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idOperacao").append("<option value="+retorno[i]['idOperacao']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idOperacao").append("</optgroup>");
        //console.log(retorno);
    }); 
</script>
<div id="container">
    <div class="row col-lg-12">
         <ol class="breadcrumb">
            <li class="active">Consulta Pedidos Detalhada </li>
        </ol>
        <div align="right">
            <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
        </div>
    </div>
    <div class="row col-lg-12">
        <form action="list_pedido_venda_detalhada.php" method="post">
            <div class="col-lg-2">
                <label>Data Início</label>
                <input type="date" name="dataInicio" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Data Fim</label>
                <input type="date" name="dataFim" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            
            <input value="2"  hidden name="idStatus" >       
            <div class="col-lg-2">
                <label>Vendedor</label>
                <select name="idUsuario" id="idUsuario" class="form-control">
                    <option value="">TODOS</option>
                </select>  
            </div>
            <div class="col-lg-2">
                <label>Operação</label>
                <select name="idOperacao" id="idOperacao" class="form-control" >
                    <option value="">TODOS</option>        
                </select>   
            </div>
            <div class="col-lg-1">
                <label>Nota</label> <font size="1" color="gray">(min)</font>
                <select name="idQualidadePedidoVendaInicio" id="idQualidadePedidoVendaInicio" class="form-control" >
                    <option value="0">0</option> 
                    <optgroup></optgroup> 
                    <option value="1">1</option> 
                    <option value="2">2</option> 
                    <option value="3">3</option> 
                    <option value="4">4</option> 
                    <option value="5">5</option> 
                </select>
            </div>
            <div class="col-lg-1">
                <font size="1" color="gray">(max)</font>
                 <select name="idQualidadePedidoVendaFim" id="idQualidadePedidoVendaFim" class="form-control" >
                    <option value="5">5</option> 
                    <optgroup></optgroup> 
                    <option value="0">0</option> 
                    <option value="1">1</option> 
                    <option value="2">2</option> 
                    <option value="3">3</option> 
                    <option value="4">4</option>
                </select>
            </div>
            <div class="col-lg-12">
                <div class="col-lg-2">
                    <label>Status</label>
                    <select name="idStatus" id="idStatus" class="form-control">
                        <option value="">TODOS</option>
                    </select>  
                </div>  
                <div class="col-lg-4">
                    <br>
                    <button type="submit" class="btn btn-warning" title="Filtrar"  >
                        Consultar
                    </button>
                </div>
            </div>            
        </form>
    </div>
    <div class="row col-lg-12">
        
        <table class="table table-hover table-striped small">
        <thead>
            <th>Pedido</th>
            <th>Data Venda</th>
            <th>Cliente</th>
            <th>CPF</th>
            <th>Vendedor</th>
            <th>R$</th>
            <th>Produto</th>
            <th>Nota <span class="glyphicon glyphicon-star" aria-hidden="true"></span></th>
        </thead>
        <?php 
        $total = count($retorno);
        $soma=0;
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td>{$retorno[$i]['idPedidoVenda']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
            echo "<td>{$retorno[$i]['cliente']}</td>";
            echo "<td>{$retorno[$i]['cpf']}</td>";
            echo "<td>{$retorno[$i]['usuario']}</td>";            
            echo "<td>".number_format($retorno[$i]['precoVenda'],2,",",".")."</td>";
            echo "<td>{$retorno[$i]['produto']}</td>";
            echo "<td>{$retorno[$i]['mediaPonderada']}</td>";
            $soma +=$retorno[$i]['precoVenda'];
            ?>        
               <td>
                    <form action="form_lib_qualidade_pedido_venda.php" method="post">
                        <input name="idQualidadePedidoVenda" value="<?php echo ($retorno[$i]['idQualidadePedidoVenda'])?>" hidden>
                        <input name="idPedidoVenda" value="<?php echo ($retorno[$i]['idPedidoVenda'])?>" hidden>
                            <button type="submit" class="btn btn-info" title="Escutar">
                                <span class="glyphicon glyphicon-volume-up" aria-hidden="true"></span>
                            </button>
                    </form>    
                </td>
                <td  <?php echo $disabled ?> >
                    <form action="form_pedido_venda.php" method="post">
                        <input name="idPedidoVenda" value="<?php echo ($retorno[$i]['idPedidoVenda'])?>" hidden>
                            <button type="submit" class="btn btn-default" title="Editar" >
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </button>
                    </form>        
                </td>
                 <td>
                    <form action="report_pdf.php" method="post" target="_blank">
                        <input name="idPedidoVenda" value="<?php echo ($retorno[$i]['idPedidoVenda'])?>" hidden>
                            <button type="submit" class="btn btn-primary" title="Editar">
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                            </button>
                    </form>        
                </td>
                <?php
        }
            echo "</tr>";
            echo "<tr>";
            echo "<td colspan=5 align=right><strong>TOTAL</strong></td>";
            echo "<td><strong>".number_format($soma,2,",",".")."</strong></td>";
            echo "<td colspan=4></td>";
            echo "</tr>";
            ?>
    </table>
    </div>
</div>
<?php 
require_once ("src/lib/footer.php");
?>