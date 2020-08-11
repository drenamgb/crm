<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    if($_SESSION['perfil']==="root"){
        $stmt = $PDO->prepare("SELECT * FROM view_lib_usuario_operacao");
        $codHidden = "";
    }else{
        $stmt = $PDO->prepare("call select_lib_usuario_operacao(:idEmpresa)");
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
    case "supervisor":  $hidden    = "";        break;
    case "backoffice":  $hidden    = "hidden";  break;
    case "gerente":     $hidden    = "";        break;
    case "admin":       $hidden    = "";        break;
    case "root":        $hidden    = "hidden";        break;
    
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Liberação Usuário x Operação</li>
    </ol>
     <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
    <a href="form_lib_usuario_operacao.php" <?php echo $hidden ?>><button class="btn btn-primary" value="Novo" id="novo"  title="Novo"  >Nova</button></a>
    <table class="table table-hover table-striped small">
        <thead>
            <th <?php echo $codHidden;?>>#</th>
            <th <?php echo $codHidden;?>>Empresa</th>
            <th>Usuário</th>
            <th>Operação</th>
            <th>Data da Liberação</th>
            <th>Status</th>
        </thead>
        <?php 
        $total = count($retorno);
        for($i=0;$i<$total;$i++){
            echo "<tr>";
            echo "<td {$codHidden}>{$retorno[$i]['idUsuarioOperacao']}</td>";
            echo "<td {$codHidden}>{$retorno[$i]['empresa']}</td>";
            echo "<td>{$retorno[$i]['usuario']}</td>";
            echo "<td>{$retorno[$i]['operacao']}</td>";
            echo "<td>{$retorno[$i]['timestamp']}</td>";
            
            if($retorno[$i]['status']=="ativado"){$corBotao="btn btn-success";}
            else{$corBotao="btn btn-warning";} ?>        
                <td>
                    <form action="src/dao/update/update_lib_usuario_operacao.php" method="post">
                        <input name="status" value="<?php echo ($retorno[$i]['status'])?>" hidden>
                        <input name="idUsuarioOperacao" value="<?php echo ($retorno[$i]['idUsuarioOperacao'])?>" hidden>
                            <button type="submit" class="<?php echo $corBotao;?>" title="Editar"  <?php echo $hidden ?> >
                                <?php echo $retorno[$i]['status'];?>
                                <span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
                            </button>
                    </form>
                </td>
                <td>              
                    <form action="src/dao/delete/delete_lib_usuario_operacao.php" method="post">
                        <input name="idUsuarioOperacao" value="<?php echo ($retorno[$i]['idUsuarioOperacao'])?>" hidden>
                            <button type="submit" class="btn btn-danger" title="Deletar"  <?php echo $hidden ?>   onclick="return confirm('Deseja Excluir?')">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
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