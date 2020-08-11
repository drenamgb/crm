<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    if($_SESSION['perfil']==="root"){
        $stmt = $PDO->prepare("SELECT * FROM view_operacao");
        $codHidden = "";    
    }else{
        $stmt = $PDO->prepare("call select_operacao(:idEmpresa)");
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $codHidden = "hidden";    
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
    case "gerente":     $hidden    = "";        break;
    case "admin":       $hidden    = "";        break;
    case "root":        $hidden    = "hidden";  break;
    
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Operações</li>
    </ol>
    
    <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>

    <a href="form_operacao.php" <?php echo $hidden ?>><button class="btn btn-primary" value="Novo" id="novo"  title="Novo" >Nova</button></a>
    <table class="table table-hover table-striped small">
        <thead>
            <th <?php echo $codHidden;?>>#</th>
            <th <?php echo $codHidden;?>>Empresa</th>
            <th>Nome</th>
            <th>Status</th>
            <th>Data Cadastro</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td {$codHidden}>{$retorno[$i]['idOperacao']}</td>";
            echo "<td {$codHidden}>{$retorno[$i]['empresa']}</td>";
            echo "<td>{$retorno[$i]['nome']}</td>";
            echo "<td>{$retorno[$i]['status']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";?>        
                <td>
                    <form action="form_operacao.php" method="post">
                        <input name="idOperacao" value="<?php echo ($retorno[$i]['idOperacao'])?>" hidden>
                        <button type="submit" class="btn btn-default" title="Editar">
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