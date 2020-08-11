<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");


$PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
$PDO->exec("set names utf8");  
$stmt = $PDO->prepare("call select_comissao(:idEmpresa)");
$stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);  
$stmt->execute();
$retorno = $stmt->fetchall();
switch ($_SESSION['perfil']){
    case "agente":      $disabled    = "hidden";    break;
    case "supervisor":  $disabled    = "";          break;
    case "backoffice":  $disabled    = "";          break;
    case "gerente":     $disabled    = "";          break;
    case "admin":       $disabled    = "";          break;
    case "root":        $disabled    = "hidden";    break;
    
}
?>

<div id="container">   
    <div class="row col-lg-12">
        <ol class="breadcrumb">
            <li class="active">Localizador de Pedidos</li>
        </ol>
    </div>
    <div class="row col-lg-12">
        <form action="list_localizador_pedido.php" method="post">
            <div class="col-lg-2">
                <label>Nº Pedido</label>
                <input name="idPedidoVenda" id="idPedidoVenda" maxlength="5" placeholder="Localizar" onkeyup="mascara(this,event,'#####')" required class="form-control">               
            </div>
            <div class="col-lg-1">
                <br>
                <button type="submit" class="btn btn-default" title="Filtrar"  >
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </div>
        </form>
    </div>    
</div>
<?php 
require_once ("src/lib/footer.php");
?>