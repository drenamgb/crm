<?php 
require_once ("src/connect/check_sessao.php");

?>
<div id="container">
     <ol class="breadcrumb">
        <li><a href="list_motivo_pedido_nao_venda.php">Motivos</a></li>
        <li class="active">Novo Motivo</li>
    </ol>
    <form action="src/dao/insert/insert_motivo_pedido_nao_venda.php" method="post">
        <div class="col-lg-12">
            <div class="col-lg-4">
                <label>Motivo</label>
                <input name="nome" placeholder="Nome" class="form-control" maxlength="45" required>
            </div>
            <div class="col-lg-3">
                <br>
                <input type="submit" class="btn btn-primary" value="Adicionar">    
            </div>
        </div>   
    </form>
    <a href="list_motivo_pedido_nao_venda.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>