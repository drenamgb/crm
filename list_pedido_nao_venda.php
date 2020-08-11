<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_pedido_nao_venda(:idEmpresa)");
    $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
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
</script>
<div id="container">
    <div class="row col-lg-12">
        <ol class="breadcrumb">
            <li class="active">Não Venda</li>
        </ol>
        <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    </div>    
    <div class="row col-lg-12">
            <form action="list_pedido_nao_venda_data.php" method="post">
                <div class="col-lg-2">
                    <input type="date" name="dataInicio" required value="<?php echo date("Y-m-d");?>" class="form-control">
                </div>
                <div class="col-lg-2">
                    <input type="date" name="dataFim" required value="<?php echo date("Y-m-d");?>" class="form-control">
                </div>                
                <div class="col-lg-2">
                    <select name="idUsuario" id="idUsuario" class="form-control" required>
                        <option value="">Vendedor</option>
                    </select>  
                </div>
                <div class="col-lg-2">                
                    <div class="col-lg-2">
                        <button type="submit" class="btn btn-default" title="Pesquisar">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>                
            </form>
        </div>    
    <div class="row col-lg-12">
        <hr>
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
                echo "<td>{$retorno[$i]['motivo']}</td>";
                ?>        
    <!--                <td>
                        <a href="src/dao/delete/update_pedido_nao_venda.php?idPedidoNaoVenda=<?php echo ($retorno[$i]['idPedidoNaoVenda'])?>" <?php echo $disabled ?>>
                            <button type="button" class="btn btn-default" title="Editar"   >
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