<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    if($_POST){

        $idPedidoVenda  = filter_input(INPUT_POST, "idPedidoVenda",  FILTER_VALIDATE_INT);

        //$stmt = $PDO->prepare("call select_pedido_venda_data_pagamento(:idEmpresa,:idPedidoVenda)");
        $stmt = $PDO->prepare("call select_pedido_venda_idPedidoVenda_idEmpresa(:idPedidoVenda,:idEmpresa)");
        $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $stmt->execute();
        $retorno = $stmt->fetchall();
    }else{
        $stmt       =   $PDO->prepare("call select_pedido_venda_idEmpresa_idStatus (:idEmpresa,:idStatus)");
        $idStatus   = 1;
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $stmt->bindParam(":idStatus",$idStatus);
        $stmt->execute();
        $retorno = $stmt->fetchall();
    }
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
    case "root":        $disabled    = "hidden";    break;
    
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
            console.log(retorno);
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
        console.log(retorno);
    }); 
</script>
<div id="container">   
    <div class="row col-lg-12">
        <ol class="breadcrumb">
            <li class="active" ><a href="list_pedido_venda_comissao.php">Pagamentos</a></li>
        </ol>
    </div>
    <div class="row col-lg-12">
        <form action="list_pedido_venda_comissao.php" method="post">
            <div class="col-lg-2">
                <label>Nº Pedido</label>
                <input name="idPedidoVenda" id="idPedidoVenda" maxlength="5" placeholder="Localizar" onkeyup="mascara(this,event,'#####')" required class="form-control">               
            </div>
            <div class="col-lg-1">
                <br>
                <button type="submit" class="btn btn-default" title="Filtrar"  >
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </div>
        </form>
<!--        <form action="list_pedido_venda_comissao_data.php" method="post">
            <div class="col-lg-2">
                <label>Data Início</label>
                <input type="date" name="dataInicio" required value="<?php //echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Data Fim</label>
                <input type="date" name="dataFim" required value="<?php //echo date("Y-m-d");?>" class="form-control">
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
                <select name="idOperacao" id="idOperacao" class="form-control">
                    <option value="">TODOS</option>        
                </select>   
            </div>
            <div class="col-lg-1"> 
                <br>
                <button type="submit" class="btn btn-default" title="Filtrar"  >
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </div>            
        </form>        -->
    </div>
    <div class="row col-lg-12">
        <hr>
                <label> Total <span class="badge"><?php echo count($retorno) ?></span></label> <font size="1" color="gray"> (Últimos Pagamentos)</font>

        <table class="table table-hover table-striped small">
        <thead>
            <th>Pedido</th>
            <th>Cliente</th>
            <th>CPF</th>
            <th>Vendedor</th>
            <th>Produto</th>            
            <th>R$</th>            
            <th>Ficha Pagamentos</th>            
        </thead>
        <?php 
        $total = count($retorno);
        $soma = 0;
        $subtrai=0;
        $subtrai2=0;
        for($i=0;$i<$total;$i++){
            
            
            echo "<tr>";
            echo "<td>{$retorno[$i]['idPedidoVenda']}</td>";
            echo "<td>{$retorno[$i]['cliente']}</td>";
            echo "<td>{$retorno[$i]['cpf']}</td>";
            echo "<td>{$retorno[$i]['usuario']}</td>";
            echo "<td>{$retorno[$i]['produto']}</td>";            
            echo "<td>".number_format($retorno[$i]['precoVenda'],2,",",".")."</td>";           
            
            ?>        
                
                <td>
                    <form action="list_lib_pedido_venda_comissao.php" method="post">
                        <input name="idPedidoVenda" value="<?php echo ($retorno[$i]['idPedidoVenda'])?>" hidden>
                            <button type="submit" class="btn btn-primary" title="Ficha de Pagamento">
                                <span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
                            </button>
                    </form>        
                </td>
                <?php
        }         
        ?>
    </table>
    </div>

    
</div>
<?php 
require_once ("src/lib/footer.php");
?>