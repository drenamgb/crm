<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$idPedidoVenda  =   filter_input(INPUT_POST, "idPedidoVenda", FILTER_VALIDATE_INT);
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_pedido_venda_idPedidoVenda_idEmpresa (:idPedidoVenda,:idEmpresa)");
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
    $stmt->execute();
    $retorno = $stmt->fetch();
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($PDO);
    unset($stmt);
}

?>
<div id="container">   
    <div class="row col-lg-12">
         <ol class="breadcrumb">
            <li class="active">Pedido</li>
        </ol>
        <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    </div>      
    <div class="row col-lg-12">
        <hr>
        <table class="table table-hover table-striped small">
        <thead>
            <th>Pedido</th>
            <th>Data Venda</th>
            <th>Cliente</th>
            <th>CPF</th>
            <th>Vendedor</th>
            <th>R$</th>
            <th>Status</th>
        </thead>
        <?php         
            echo "<tr>";
            echo "<td>{$retorno['idPedidoVenda']}</td>";
            echo "<td>{$retorno['timestamp']}</td>";
            echo "<td>{$retorno['cliente']}</td>";
            echo "<td>{$retorno['cpf']}</td>";
            echo "<td>{$retorno['usuario']}</td>";
            echo "<td>".number_format($retorno['precoVenda'],2,",",".")."</td>";
            echo "<td>{$retorno['nomeStatus']}</td>";           
            ?>        
                
                <td>
                    <form action="report_pdf.php" method="post" target="_blank">
                        <input name="idPedidoVenda" value="<?php echo ($retorno['idPedidoVenda'])?>" hidden>
                            <button type="submit" class="btn btn-primary" title="Download">
                                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                            </button>
                    </form>        
                </td>                
    </table>
    </div>

    
</div>
<?php 
require_once ("src/lib/footer.php");
?>