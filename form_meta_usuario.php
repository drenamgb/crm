<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");
$idUsuario = filter_input(INPUT_POST,'idUsuario',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE

$updateSenhaAgente="";
if($idUsuario){
    $action = "src/dao/update/update_meta_usuario.php";
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_usuario_idUsuario (:idUsuario)");
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->execute();
    $retorno = $stmt->fetch();
    $tipoPedido = "Atualizar";
    $status = "";
    $retorno['senha']   = "";
}else{
    $tipoPedido = "Novo";
}


if($_SESSION['perfil']=='root'){    
    $updatePerfilAdmin = "";
}else{
    $updatePerfilAdmin="hidden";
}

?>

<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_usuario.php">Usuários</a></li>
        <li class="active"><?php echo $tipoPedido?> Usuário</li>
    </ol>
    <form action="<?php echo $action?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-4">                
                <label>Nome Usuário</label>
                <input name="nome" placeholder="Nome Completo"  class="form-control" maxlength="45" disabled value="<?php echo $retorno['nome']?>">
               
            </div>        
            <div class="col-lg-2" >
                <label>CPF</label>
                <input name="cpf" placeholder="cpf" id="cpf" class="form-control" maxlength="11" disabled value="<?php echo $retorno['cpf']?>">
            </div>
            <div class="col-lg-1"><br>
                <span id="msg"></span>
            </div>
        </div>
                
        <div class="col-lg-12">
            <br>
            <div class="col-lg-2" <?php echo $updateSenhaAgente?>>
                <label>Meta</label>
                <input name="meta"  placeholder="meta"  class="form-control" maxlength="6" required  value="<?php echo $retorno['meta']?>">
            </div>
            <div class="col-lg-2"  <?php echo $updateSenhaAgente?>>
                <label>Perfil de Acesso</label>
                <select name="perfil" class="form-control" disabled>
                    <option value="<?php echo $retorno['perfil']?>"><?php echo $retorno['perfil']?></option>
                    <optgroup></optgroup>
                    <option>agente</option>
                    <option>backoffice</option>
                    <option>supervisor</option>
                    <option>gerente</option>
                    <option <?php echo $updatePerfilAdmin;?>>admin</option>
                </select>
            </div>
            
        </div>
        <div class="col-lg-12" align="right">
            <br>
            <div class="col-lg-6">
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido?>">   
                <input name="idUsuario" hidden value="<?php echo $idUsuario?>">   
            </div>
        </div>
    </form>
    <a href="list_meta_usuario.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>