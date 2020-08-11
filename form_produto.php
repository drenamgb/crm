<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");


$idProduto = filter_input(INPUT_POST,'idProduto',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idProduto){
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $action = "src/dao/update/update_produto.php";
    $stmt       =   $PDO->prepare("call select_produto_idProduto (:idProduto)");
    $stmt->bindParam(":idProduto",$idProduto);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "";
}
else{
$action = "src/dao/insert/insert_produto.php";
$retorno['nome']            = "";
$retorno['descricao']       = "";
$retorno['status']          = "";
$retorno['precoVenda']      = "";
$retorno['vitalicio']  = "";
$retorno['primeiraParcela']  = "";
$tipoPedido                 = "Novo";
$status                     = "hidden";
}

?>

<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_produto.php">Produtos</a></li>
        <li class="active">Novo Produto</li>
    </ol>
    <form action="<?php echo $action ?>" method="post">
        <div class="col-lg-12">            
            <div class="col-lg-8">
                <label>Produto</label>
                <input name="nome" placeholder="Nome Produto"  class="form-control" maxlength="200" required value="<?php echo $retorno['nome']?>">
            </div>
        </div>        
        <div class="col-lg-12">        
            <br>
            <div class="col-lg-8">
                <label>Descrição do Produto</label>
                <textarea name="descricao" placeholder="Descrição"  class="form-control" maxlength=600 rows="5" ><?php echo $retorno['descricao']?></textarea>
            </div>
        </div> 
        <div class="col-lg-12">  
            <br>
            <div class="col-lg-4">   
                <label>Preço de Venda</label>     
                <div class="input-group">
                    <span class="input-group-addon">$</span>
                    <input class="form-control" placeholder="Ex 35.12" value="<?php echo $retorno['precoVenda']?>" name="precoVenda" maxlength="9" required>
                </div>  
            </div>  
            <div class="col-lg-2">
                <label>Vitalício <font size="1" color="gray">(porcentagem - %)</font></label>
                <input name="vitalicio" placeholder="Vitalício %" class="form-control" maxlength="3" onkeyup="mascara(this,event,'###')" required value="<?php echo $retorno['vitalicio'] ?>">
                
            </div>
            <div class="col-lg-2">
                <label>1º Parcela <font size="1" color="gray">(porcentagem - %)</font></label>
                <input name="primeiraParcela" placeholder="primeiraParcela %" class="form-control" maxlength="3" onkeyup="mascara(this,event,'###')" required value="<?php echo $retorno['primeiraParcela'] ?>">
                
            </div> 
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
            <div class="col-lg-8" align="right">   
                <input type="submit" class="btn btn-primary" value="<?php  echo $tipoPedido?>"> 
                <input name="idProduto" hidden value="<?php  echo $idProduto?>"> 
            </div>
        </div>
    </form>
    <a href="list_produto.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>