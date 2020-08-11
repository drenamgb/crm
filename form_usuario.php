<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$idUsuario = filter_input(INPUT_POST,'idUsuario',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
$updateSenhaAgente="";
if($idUsuario){
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $action = "src/dao/update/update_usuario.php";
    $stmt       =   $PDO->prepare("call select_usuario_idUsuario (:idUsuario)");
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->execute();
    $retorno = $stmt->fetch();
    $tipoPedido = "Atualizar";
    $status = "";
    $retorno['senha']   = "";
}
else{
$action = "src/dao/insert/insert_usuario.php";
$tipoPedido = "Novo";
$retorno['nome']        = "";
$retorno['cpf']         = "";
$retorno['login']       = "";
$retorno['senha']       = "";
$retorno['perfil']      = "";
$retorno['status']      = "";
$retorno['meta']        = "";
$retorno['nomeEmpresa'] = $_SESSION['empresa'];
$status = "hidden";
}

if($_SESSION['perfil']==='agente'){
    $idUsuario = $_SESSION['idUsuario'];
    $action = "src/dao/update/update_usuario.php";  
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_usuario_idUsuario (:idUsuario)");
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->execute();
    $retorno = $stmt->fetch();
    $retorno['senha']   = "";
    $tipoPedido = "Atualizar";
    $status = "hidden";
    $updateSenhaAgente = "hidden";
}

if($_SESSION['perfil']=='root'){    
    $updatePerfilAdmin = "";
}else{
    $updatePerfilAdmin="hidden";
}
//************************** TEMPO PAUSA idAgent x MES********************************************
//$stmt       =   $PDO->prepare("select * from call_center.agent where name REGEXP BINARY '[a-zA-Z]' order by name;");
//$stmt->execute();
//$retorno2 = $stmt->fetchall();

?>
<script>


function validaCPF2(strCPF){
// if(strCPF===null || strCPF==""){alert("NULO"); return false;}
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace(' ','');
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace('-','');
strCPF = strCPF.replace('/','');
if(strCPF.length<11){
//alert("CPF Inválido");
document.getElementById('msg').innerHTML = "<img src='src/lib/img/error.png' width='20px'></img>";
return false;
}
if(strCPF.length>11){
//alert("CPF Inválido");
return true;
}
var Soma;
var Resto;
Soma = 0;
if (strCPF == "00000000000" || strCPF == "11111111111" || strCPF == "22222222222" ||
strCPF == "33333333333" || strCPF == "44444444444" || strCPF == "55555555555" || 
strCPF == "66666666666" || strCPF == "77777777777" ||
strCPF == "88888888888" || strCPF == "99999999999" ) { 
// alert("CPF Inválido");
document.getElementById('msg').innerHTML = "<img src='src/lib/img/error.png' width='20px'></img>";
return false;
}
for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
Resto = (Soma * 10) % 11;

if ((Resto == 10) || (Resto == 11))  Resto = 0;
if (Resto != parseInt(strCPF.substring(9, 10)) ) { 
document.getElementById('msg').innerHTML = "<img src='src/lib/img/error.png' width='20px'></img>";
return false;
}
Soma = 0;
for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
Resto = (Soma * 10) % 11;

if ((Resto == 10) || (Resto == 11))  Resto = 0;
if (Resto != parseInt(strCPF.substring(10, 11) ) ) {
document.getElementById('msg').innerHTML = "<img src='src/lib/img/error.png' width='20px'></img>";
return false;
}
document.getElementById('msg').innerHTML = "<img src='src/lib/img/check.png' width='20px'></img>";
return true;
}

 $(document).ready(function() {        
     // alterar protudos quando trocar o vendedor !!!
        $("#cpf").blur(function(){
            var cpf = $("#cpf").val();
              $.ajax({
                url: "src/dao/procedure/call_cpf_usuario.php",
                dataType: "json",
                type:'POST',
                data:{ cpf :cpf},
                async : true
            }).done(function(retorno) {
                if(retorno!==0){
                   // alert("CPF ja cadastrado");
                    $("#cpf").val('');
                };                                     
                //console.log(retorno);
            });        
        });
        $("#login").blur(function(){
            var login = $("#login").val();
              $.ajax({
                url: "src/dao/procedure/call_login_usuario.php",
                dataType: "json",
                type:'POST',
                data:{ login :login},
                async : true
            }).done(function(retorno) {
                if(retorno.length!==0){
                    if(retorno[0]['login']===login){
                       // alert("Login ja cadastrado");
                        $("#login").val('');
                    }
                    <?php echo "$('#login').val('".$retorno['login']."')";?>
                };                                     
               // console.log(retorno);
            });        
        });
    });
    

    
</script>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_usuario.php">Usuários</a></li>
        <li class="active"><?php echo $tipoPedido?> Usuário</li>
    </ol>
    <form action="<?php echo $action?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-4">                
                <label>Nome Empresa</label>
                <input name="nomeEmpresa" placeholder="Nome Empresa"  class="form-control" disabled value="<?php echo $retorno['nomeEmpresa']?>">
               
            </div>
        </div>
        <div class="col-lg-12">
            <div class="col-lg-4">                
                <label>Nome Usuário</label>
                <input name="nome" placeholder="Nome Completo"  class="form-control" maxlength="45" required value="<?php echo $retorno['nome']?>">
               
            </div>        
            <div class="col-lg-2" >
                <label>CPF</label>
                <input name="cpf" placeholder="cpf" id="cpf" class="form-control" maxlength="11" onblur="validaCPF2(this.value);"  onkeyup="mascara(this,event,'###########')" required  value="<?php echo $retorno['cpf']?>">
            </div>
            <div class="col-lg-1"><br>
                <span id="msg"></span>
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-2">
                <label>Login</label>
                <input name="login" placeholder="login" id="login"  class="form-control" maxlength="20" required  value="<?php echo $retorno['login']?>">
            </div>
            <div class="col-lg-2">
                <label>Senha</label>
                <input name="senha" type="password" placeholder="senha"  class="form-control" maxlength="20" required  value="<?php echo $retorno['senha']?>">
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
                <select name="perfil" class="form-control" required>
                    <option value="<?php echo $retorno['perfil']?>"><?php echo $retorno['perfil']?></option>
                    <optgroup></optgroup>
                    <option>agente</option>
                    <option>backoffice</option>
                    <option>supervisor</option>
                    <option>gerente</option>
                    <option <?php echo $updatePerfilAdmin;?>>admin</option>
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
        </div>
        <div class="col-lg-12" align="right">
            <br>
            <div class="col-lg-6">
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido?>">   
                <input name="idUsuario" hidden value="<?php echo $idUsuario?>">   
            </div>
        </div>
    </form>
    <a href="list_usuario.php"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>