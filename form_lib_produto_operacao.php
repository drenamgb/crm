<?php 
require_once ("src/connect/check_sessao.php");

$idProdutoOperacao  = filter_input(INPUT_POST,'idProdutoOperacao',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idProdutoOperacao){
    $action = "src/dao/update/update_lib_produto_operacao.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_lib_produto_operacao_idProdutoOperacao (:idProdutoOperacao)");
    $stmt->bindParam(":idProdutoOperacao",$idProdutoOperacao);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "disabled";
}
else{
$action = "src/dao/insert/insert_lib_produto_operacao.php";
$tipoPedido = "Novo";
$retorno['idOperacao']      = "";
$retorno['idProduto']       = "";
$retorno['produto']         = "";
$retorno['operacao']        = "";
$status = "hidden";
}
?>
<script> 
    $.ajax({
        url: "src/dao/procedure/select_produto.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idProduto").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idProduto").append("<option value="+retorno[i]['idProduto']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idProduto").append("</optgroup>");
    });
    
    $.ajax({
        url: "src/dao/procedure/select_operacao.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idOperacao").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idOperacao").append("<option value="+retorno[i]['idOperacao']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idOperacao").append("</optgroup>");
        console.log(retorno);
    }); 
    
      $(document).ready(function() {
        $("#idProduto").blur(function(){
            $("#erroLiberacao").hide();
            idProduto     = $("#idProduto").val();
            idOperacao   = $("#idOperacao").val();
            $.ajax({
               url: "src/dao/procedure/select_liberacao_produto_operacao.php",
               dataType: "json",
               type:"POST",
               data:{idProduto:idProduto,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                      $("#idProduto").val('');
                      $("#idOperacao").val('');
                      $("#erroLiberacao").show();
                  };
               });  
        });
        $("#idOperacao").change(function(){
            $("#erroLiberacao").hide();
            idProduto     = $("#idProduto").val();
            idOperacao   = $("#idOperacao").val();            
            $.ajax({
               url: "src/dao/procedure/select_liberacao_produto_operacao.php",
               dataType: "json",
               type:"POST",
               data:{idProduto:idProduto,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                       $("#idProduto").val('');
                       $("#idOperacao").val('');
                       $("#erroLiberacao").show();
                  };
               });  
        });
        $("#erroLiberacao").hide();
    });
</script>
<div id="container">
    <ol class="breadcrumb">
         <li><a href="list_lib_produto_operacao.php">Liberação Produto x Operação</a></li>
        <li class="active"><?php echo $tipoPedido; ?> Liberação Produto x Operação</li>
    </ol>
    <form action="<?php echo $action; ?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-3">
                <label>Produto</label>
                <select name="idProduto" id="idProduto" class="form-control" required <?php echo $status; ?>>
                    <option value="<?php echo $retorno['idProduto']?>"><?php echo $retorno['produto'];?></option>
                </select>  
            </div>
            <div class="col-lg-3">
                <label>Operação</label>
                <select name="idOperacao" id="idOperacao" class="form-control" required <?php echo $status; ?>>
                    <option value="<?php echo $retorno['idOperacao']?>"><?php echo $retorno['operacao'];?></option>
                </select>   
            </div>
            <div class="col-lg-2" <?php echo $status?> >
                <label>Status</label>
                <select name="status" class="form-control">
                    <option value="<?php echo $retorno['status']?>"><?php echo $retorno['status']?></option>
                    <option>Ativado</option>
                    <option>Desativado</option>
                </select>
            </div> 
            <div class="col-lg-3"><br>
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido; ?>"> 
                <input name="idProdutoOperacao"  hidden value="<?php echo $idProdutoOperacao; ?>">  
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            <div class="alert alert-warning alert-dismissable fade in col-lg-6" id="erroLiberacao" >
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Desculpe!</strong> Essa liberação ja existe.
            </div>
        </div>
    </form>  
    <a href="list_lib_produto_operacao.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>