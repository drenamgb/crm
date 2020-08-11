<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt = $PDO->prepare("SELECT * FROM view_parentesco");
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
        <li class="active">Parentesco</li>
    </ol>
    
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>

    <table class="table table-hover table-striped small">
        <thead>
            <th>#</th>
            <th>Nome</th>
            <th>Status</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td>{$retorno[$i]['idParentesco']}</td>";
            echo "<td>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['status']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
        }
        ?>
    </table>
</div>
<?php 
require_once ("src/lib/footer.php");
?>