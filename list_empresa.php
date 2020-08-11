<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");    
    if($_SESSION['perfil']==="root"){
        $stmt = $PDO->prepare("SELECT * FROM view_empresa");
        $codHidden = "";
        $naoDuplica = "";
    }else{
        $stmt = $PDO->prepare("call select_empresa(:idEmpresa)");
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $codHidden = "hidden";
        $naoDuplica = "hidden";
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
    case "backoffice":  $hidden    = "hidden";  break;
    case "gerente":     $hidden    = "";          break;
    case "admin":       $hidden    = "";          break;
    case "root":        $hidden    = "";          break;
    
}

?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Empresas</li>
    </ol>
    
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    <a href="form_empresa.php"  <?php echo $naoDuplica ;?> ><button class="btn btn-primary" value="Novo"   title="Novo" <?php echo $hidden; ?>  >Nova</button></a>

    <table class="table table-hover table-striped small">
        <thead>
            <th <?php echo $codHidden;?> >#</th>
            <th <?php echo $codHidden;?>>Nome</th>
            <th>IP Pabx</th>
            <th>Status</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td {$codHidden}>{$retorno[$i]['idEmpresa']}</td>";
            echo "<td {$codHidden}>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['ip_pabx']}</td>";
            echo "<td>{$retorno[$i]['status']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
        ?>
            <td>
                <form action="form_empresa.php" method="post">
                    <input name="idEmpresa" value="<?php echo ($retorno[$i]['idEmpresa'])?>" hidden>
                        <button type="submit" class="btn btn-default" title="Editar" <?php echo $hidden ?>>
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                        </button>
                </form>           
            </td>
            <?php
        }
        ?>
    </table>
</div>
<?php 
require_once ("src/lib/footer.php");
?>