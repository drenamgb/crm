<?php 
require_once ("src/connect/check_sessao.php");

$idOperacao = filter_input(INPUT_POST,'idOperacao',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idOperacao){
    $action = "src/dao/update/update_operacao.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_operacao_idOperacao (:idOperacao)");
    $stmt->bindParam(":idOperacao",$idOperacao);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "";
}
else{
$action = "src/dao/insert/insert_operacao.php";
$tipoPedido = "Novo";
$retorno['nome']    = "";
$retorno['status']  = "";
$retorno['vitalicio']  = "";
$retorno['primeiraParcela']  = "";
$status = "hidden";
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_operacao.php">Operações</a></li>
        <li class="active"><?php echo $tipoPedido ?> Operação</li>
    </ol>
    <form action="<?php echo $action ?>" method="post">
        <div class="col-lg-12">            
            <div class="col-lg-4">
                <label>Operação</label>
                <input name="nome" placeholder="Nome Operação" class="form-control" maxlength="45" required value="<?php echo $retorno['nome'] ?>">
            </div>            
        </div>
        <div class="col-lg-12">   
            <br>
            <div class="col-lg-2" <?php echo $status?> >
                <label>Status</label>
                <select name="status" class="form-control">
                    <option value="<?php echo $retorno['status']?>"><?php echo $retorno['status']?></option>
                    <option>Ativado</option>
                    <option>Desativado</option>
                </select>
            </div>
        </div>
         <div class="col-lg-12">
            <hr>
            <div class="col-lg-4" align="right">
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido?>">  
                <input name="idOperacao" hidden value="<?php echo $idOperacao;?>"> 
            </div>
        </div> 
    </form>
    <a href="list_operacao.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>