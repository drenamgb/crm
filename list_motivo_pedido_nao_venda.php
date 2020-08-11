<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    if($_SESSION['perfil']==="root"){
        $stmt = $PDO->prepare("SELECT * FROM view_motivo_pedido_nao_venda");
        $codHidden="";
    }else{
        $stmt = $PDO->prepare("call select_motivo_pedido_nao_venda(:idEmpresa)");
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);    
        $codHidden="hidden";
    }
   $stmt->execute();
   $retorno = $stmt->fetchall();
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($PDO);
    unset($stmt);
}
switch ($_SESSION['perfil']){
    case "agente":      $hidden    = "hidden";  break;
    case "supervisor":  $hidden    = "hidden";  break;
    case "backoffice":  $hidden    = "";          break;
    case "gerente":     $hidden    = "";          break;
    case "admin":       $hidden    = "";          break;
    case "root":        $hidden    = "hidden";          break;
    
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Motivos</li>
    </ol>
    
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>

    <a href="form_motivo_pedido_nao_venda.php" <?php echo $hidden ?>><button class="btn btn-primary" value="Novo" id="novo"  title="Novo">Novo</button> </a>
    <table class="table table-hover table-striped small">
        <thead>
            <th <?php echo $codHidden;?>>#</th>
            <th <?php echo $codHidden;?>>Empresa</th>
            <th>Motivo</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td {$codHidden}>{$retorno[$i]['idMotivo']}</td>";
            echo "<td {$codHidden}>{$retorno[$i]['empresa']}</td>";
            echo "<td>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
        }
        ?>
    </table>
</div>
<?php 
require_once ("src/lib/footer.php");
?>