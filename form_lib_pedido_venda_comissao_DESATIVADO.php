<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$idPedidoVenda  = filter_input(INPUT_POST, "idPedidoVenda",  FILTER_VALIDATE_IP);


    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt = $PDO->prepare("call select_pedido_venda_idPedidoVenda_idEmpresa(:idPedidoVenda,:idEmpresa)");
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
    $stmt->execute();
    $retorno = $stmt->fetchall();
    $msg    ="";
    $msg2    ="";
    $disabled    ="";
    $hidden ="";
    if(empty(!$retorno)){
        $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
        $PDO->exec("set names utf8");  
        $stmt = $PDO->prepare("call select_pedido_venda_data_pagamento(:idEmpresa,:idPedidoVenda)");
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
        $stmt->execute();
        $retorno2 = $stmt->fetchall();
        if(empty(!$retorno2)){
            $msg2 = "Pedido ja tem o primeiro Pagamento";
            $disabled = "disabled";
        }
    }else{     
        
        $msg = "Pedido não existe no Sistema";
        $hidden = "hidden";
        
    }
    $action="src/dao/insert/insert_lib_pedido_venda_comissao.php";
?>

<div id="container">
     <ol class="breadcrumb">
         <li><a href="list_pedido_venda_comissao.php">Pagamentos</a></li>
        <li class="active">Lançamento</li>
    </ol>
    <form action="<?php echo $action;?>" method="post">
        <div class="col-lg-12" <?php echo $msg ?>> 
            <div class="col-lg-6" <?php echo $hidden ?>>
                <label>Detalhes do Pedido</label>
                <table class="table table-hover table-striped small">
                    <tr>
                        <td><b>Pedido Nº</b></td>
                        <td><?php echo $idPedidoVenda?></td>
                        <td><b>Vendedor</b></td>
                        <td><?php echo $retorno[0]['usuario']?></td>
                    </tr>
                    <tr>
                        <td><b>Cliente</b></td>
                        <td><?php echo $retorno[0]['cliente']?></td>
                        <td><b>CPF</b></td>
                        <td><?php echo $retorno[0]['cpf']?></td>
                    </tr>
                    <tr>
                        <td><b>Produto</b></td>
                        <td><?php echo $retorno[0]['produto']?></td>
                        <td><b>Valor</b></td>
                        <td>R$ <?php echo number_format($retorno[0]['precoVenda'],2,",",".")?></td>
                    </tr>
                    <tr>
                        <td><b>Status</b></td>
                        <td><?php echo $retorno[0]['nomeStatus']?></td>
                    </tr>
                    <tr>
                        <td><b>Data Venda</b></td>
                        <td><?php echo $retorno[0]['timestamp']?></td>
                    </tr>
                </table>
            </div>
            
            
            
            <div class="col-lg-3"> 
                <label>Data do 1º Pagamento</label>
                <div class='input-group date'>
                    <input id="dataPagamento" type="date" name="dataPagamento" class="form-control" <?php echo $disabled; ?> value="<?php echo date("Y-m-d");?>" required />
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <?php echo $msg2?>
                </div>
            </div>                    
            <div class="col-lg-2"> <br>
                <input id="idPedidoVenda"  name="idPedidoVenda" value="<?php echo $idPedidoVenda;?>" hidden />
                <input type="submit" class="btn btn-primary" value="Adicionar">  
            </div>
        </div>
    </form>
</div>
<?php 
require_once ("src/lib/footer.php");
?>