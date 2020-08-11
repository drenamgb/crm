<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");
 
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt = $PDO->prepare("SELECT * FROM view_banco");
    $stmt->execute();
    $retorno = $stmt->fetchall();
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($PDO);
    unset($stmt);
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Bancos</li>
    </ol>
    
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>

    <table class="table table-hover table-striped small">
        <thead>
<!--            <th>#</th>-->
            <th>Código</th>
            <th>Nome</th>
            <th>Status</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
//            echo "<td>{$retorno[$i]['idBanco']}</td>";
            echo "<td>{$retorno[$i]['codigo']}</td>";
            echo "<td>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['status']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
            ?>
<!--            <td>
                <a href="src/dao/delete/update_banco.php?idBanco=<?php //echo ($retorno[$i]['idBanco'])?>">
                    <button type="button" class="btn btn-default" title="Editar">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </button>
                </a>
                <a href="src/dao/delete/delete_banco.php?idBanco=<?php //echo ($retorno[$i]['idBanco'])?>">
                    <button type="button" class="btn btn-danger" title="Deletar">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    </button>
                </a>
            </td>-->
            <?php
        }
        ?>
    </table>
</div>
<?php 
require_once ("src/lib/footer.php");
?>