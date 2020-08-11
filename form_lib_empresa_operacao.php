<?php 
require_once ("src/connect/check_sessao.php");

$idEmpresaOperacao  = filter_input(INPUT_POST,'idEmpresaOperacao',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idEmpresaOperacao){
    $action = "src/dao/update/update_lib_empresa_operacao.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_lib_empresa_operacao_idEmpresaOperacao (:idEmpresaOperacao)");
    $stmt->bindParam(":idEmpresaOperacao",$idEmpresaOperacao);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "disabled";
}
else{
$action = "src/dao/insert/insert_lib_empresa_operacao.php";
$tipoPedido = "Novo";
$retorno['idEmpresa']    = "";
$retorno['idOperacao']  = "";
$retorno['operacao']  = "";
$retorno['empresa']  = "";
$status = "hidden";
}
?>
<script>
    $.ajax({
        url: "src/dao/select/view_empresa_ativado.php",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        $("#idEmpresa").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idEmpresa").append("<option value="+retorno[i]['idEmpresa']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idEmpresa").append("</optgroup>");
        console.log(retorno);
    });
    
    $.ajax({
        url: "src/dao/select/view_operacao_ativado.php",
        dataType: "json",
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
        $("#idEmpresa").change(function(){
            $("#erroLiberacao").hide(); 
            idEmpresa  = $("#idEmpresa").val();
            idOperacao = $("#idOperacao").val();
            $.ajax({
               url: "src/dao/procedure/select_empresa_operacao_idEmpresa_idOperacao.php",
               dataType: "json",
               type:"POST",
               data:{idEmpresa:idEmpresa,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                      $("#idEmpresa").val('');
                      $("#idOperacao").val('');
                      $("#erroLiberacao").show();
                  };
               });  
        });
        $("#idOperacao").change(function(){
            $("#erroLiberacao").hide(); 
            idEmpresa  = $("#idEmpresa").val();
            idOperacao = $("#idOperacao").val();
            $.ajax({
               url: "src/dao/procedure/select_empresa_operacao_idEmpresa_idOperacao.php",
               dataType: "json",
               type:"POST",
               data:{idEmpresa:idEmpresa,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                      $("#idEmpresa").val('');
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
         <li><a href="list_lib_empresa_operacao.php">Liberação Empresa x Operação</a></li>
        <li class="active"><?php echo $tipoPedido ?> Liberação Empresa x Operação</li>
    </ol>
    <form action="<?php echo $action; ?>" method="post"> 
        <div class="col-lg-12">
            <div class="col-lg-3">
                <label>Empresa</label>
                <select name="idEmpresa" id="idEmpresa" class="form-control" required <?php echo $status?>>
                    <option value="<?php echo $retorno['idEmpresa']?>"><?php echo $retorno['empresa']?></option>
                </select>
            </div>
            <div class="col-lg-3">
                <label>Operação</label>
                <select name="idOperacao" id="idOperacao" class="form-control" required <?php echo $status?>>
                    <option value="<?php echo $retorno['idOperacao']?>"><?php echo $retorno['operacao']?></option>
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
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido ?>"> 
                <input name="idEmpresaOperacao" hidden value="<?php echo $idEmpresaOperacao ?>"> 
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
</div>
<?php 
require_once ("src/lib/footer.php");
?>