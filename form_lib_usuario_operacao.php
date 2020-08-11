<?php 
require_once ("src/connect/check_sessao.php");

$idUsuarioOperacao  = filter_input(INPUT_POST,'idUsuarioOperacao',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idUsuarioOperacao){
    $action = "src/dao/update/update_lib_usuario_operacao.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_lib_usuario_operacao_idUsuarioOperacao (:idUsuarioOperacao)");
    $stmt->bindParam(":idUsuarioOperacao",$idUsuarioOperacao);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "disabled";
}
else{
$action = "src/dao/insert/insert_lib_usuario_operacao.php";
$tipoPedido = "Novo";
$retorno['idOperacao']      = "";
$retorno['idUsuario']       = "";
$retorno['usuario']         = "";
$retorno['operacao']        = "";
$status = "hidden";
}
?>
<script> 
    $.ajax({
        url: "src/dao/procedure/select_usuario.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idUsuario").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idUsuario").append("<option value="+retorno[i]['idUsuario']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idUsuario").append("</optgroup>");
        console.log(retorno);
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
        $("#idUsuario").change(function(){
            $("#erroLiberacao").hide();
            idUsuario     = $("#idUsuario").val();
            idOperacao   = $("#idOperacao").val();
            $.ajax({
               url: "src/dao/procedure/select_liberacao_usuario_operacao.php",
               dataType: "json",
               type:"POST",
               data:{idUsuario:idUsuario,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                      $("#idUsuario").val('');
                      $("#idOperacao").val('');
                      $("#erroLiberacao").show();
                  };
               });  
        });
        $("#idOperacao").change(function(){
            $("#erroLiberacao").hide();
            idUsuario     = $("#idUsuario").val();
            idOperacao   = $("#idOperacao").val();            
            $.ajax({
               url: "src/dao/procedure/select_liberacao_usuario_operacao.php",
               dataType: "json",
               type:"POST",
               data:{idUsuario:idUsuario,idOperacao:idOperacao},
               async : true
               }).done(function(retorno) {
                  if(retorno.length){
                       $("#idUsuario").val('');
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
         <li><a href="list_lib_usuario_operacao.php">Liberação Usuário x Operação</a></li>
        <li class="active"><?php echo $tipoPedido; ?>  Liberação Usuário x Operação</li>
    </ol>
    <form action="<?php echo $action; ?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-3">
                <label>Usuário</label>
                <select name="idUsuario" id="idUsuario" class="form-control" required <?php echo $status; ?>>
                    <option value="<?php echo $retorno['idUsuario']?>"><?php echo $retorno['usuario'];?></option>
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
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido; ?> ">  
                <input name="idUsuarioOperacao"  hidden value="<?php echo $idUsuarioOperacao; ?>">  
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
    <a href="list_lib_usuario_operacao.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>