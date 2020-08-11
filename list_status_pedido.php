<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$stmt = $PDO->prepare("SELECT * FROM view_status_pedido");
$stmt->execute();
$retorno = $stmt->fetchall();
$hidden = "hidden";
switch ($_SESSION['perfil']){
    case "agente":      $hidden    = "hidden";  break;
    case "supervisor":  $hidden    = "hidden";  break;
    case "backoffice":  $hidden    = "hidden";  break;
    case "gerente":     $hidden    = "hidden";  break;
    case "admin":       $hidden    = "hidden";  break;
    case "root":        $disabled    = "";          break;
    
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Status Pedido</li>
    </ol>
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    <a href="form_status_pedido.php" <?php echo $hidden ?> ><button class="btn btn-primary" value="Novo" id="novo" title="Novo">Novo</button></a>

    <table class="table table-hover table-striped small">
        <thead>
            <th>#</th>
            <th>nome</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td>{$retorno[$i]['idStatus']}</td>";
            echo "<td>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
        }
        ?>
    </table>
</div>
<?php 
require_once ("src/lib/footer.php");
?>