<?php 
require_once ("src/connect/check_sessao.php");

$idEmpresa = filter_input(INPUT_POST,'idEmpresa',FILTER_VALIDATE_INT);
//mecanismo para proteger o action e controlar o form para INSERT e UPDATE
if($idEmpresa){
    $action = "src/dao/update/update_empresa.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_empresa (:idEmpresa)");
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "Atualizar";
    $status = "";
}
else{
$action = "src/dao/insert/insert_empresa.php";
$tipoPedido = "Novo";
$retorno['nome']        = "";
$retorno['cnpj']        = "";
$retorno['cep']         = "";
$retorno['endereco']    = "";
$retorno['bairro']      = "";
$retorno['cidade']      = "";
$retorno['estado']      = "";
$retorno['email']       = "";
$retorno['telefone_1']  = "";
$retorno['telefone_2']  = "";
$retorno['ip_pabx']     = "";
$retorno['status']      = "";
$retorno['idEmpresa']   = "";

$status = "hidden";
}

if($_SESSION['perfil']!=="root"){
    $status="hidden";
}


?>
<script>
 $.ajax({
        url: "src/dao/select/view_estado.php",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        $("#estado").append("<option></option>");
            for(i=0; i < retorno.length; i++){
                $("#estado").append("<option value="+retorno[i]['sigla']+">"+retorno[i]['descricao']+"</option>");                           
            }
        //console.log(retorno);
    });
</script>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_empresa.php">Empresas</a></li>
        <li class="active"><?php echo $tipoPedido?> Empresa</li>
    </ol>
    <form action="<?php echo $action;?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-4">
                <label>Empresa</label>
                <input name="nome" placeholder="Nome da Empresa" class="form-control" maxlength="45" required value="<?php echo $retorno['nome']; ?>">
            </div> 
            <div class="col-lg-2">
                <label>CNPJ</label>
                <input name="cnpj" placeholder="cnpj" class="form-control" maxlength="25" onkeyup="mascara(this,event,'#####################')" value="<?php echo $retorno['cnpj']; ?>">
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-2"> 
                <label>Cep</label>
                <input name="cep" placeholder="cep"  class="form-control"  maxlength="8" onkeyup="mascara(this,event,'########')" onblur="pesquisaCep(this.value)" value="<?php echo $retorno['cep']; ?>">
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-3">
                <label>Endereço</label>
                <input name="endereco" placeholder="endereco" id="endereco" class="form-control" maxlength="100" value="<?php echo $retorno['endereco']; ?>">
            </div>
            <div class="col-lg-3">
                <label>Bairro</label>
                <input name="bairro" placeholder="bairro" id="bairro" class="form-control" maxlength="45" value="<?php echo $retorno['bairro']; ?>">
            </div>
            <div class="col-lg-3">
                <label>Cidade</label>
                <input name="cidade" placeholder="cidade" id="cidade" class="form-control" maxlength="45" value="<?php echo $retorno['cidade']; ?>">
            </div>
            <div class="col-lg-2">
                <label>UF</label>
                <select name="estado"       id="estado"                 class="form-control"><option value="<?php echo $retorno['estado']; ?>"><?php echo $retorno['estado']; ?></option></select>
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-3">
                <label>Email</label>
                <input name="email" type="email" placeholder="email" class="form-control" maxlength="45" value="<?php echo $retorno['email']; ?>">
            </div>
            <div class="col-lg-2">
                <label>Telefone 1</label>
                <input name="telefone_1" placeholder="Telefone 1" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')"  value="<?php echo $retorno['telefone_1']; ?>">
            </div>
            <div class="col-lg-2">
                <label>Telefone 2</label>
                <input name="telefone_2" placeholder="Telefone 2" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')"  value="<?php echo $retorno['telefone_2']; ?>">
            </div>
            <div class="col-lg-2" <?php echo $status?>> 
                <label>IP PABX</label>
                <input name="ip_pabx" placeholder="Ip Discadora" required class="form-control" maxlength="15" value="<?php echo $retorno['ip_pabx']; ?>">  
            </div>
        </div>
        <div class="col-lg-12" <?php echo $status?> >
            <br>
            <div class="col-lg-2">
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
            <div class="col-lg-12" align="right">
                <input name="idEmpresa" hidden value="<?php echo $retorno['idEmpresa']; ?>">
                <input type="submit" class="btn btn-primary" value="<?php echo $tipoPedido?>">  
            </div>
        </div>
    </form>
    <a href="list_empresa.php"><button class="btn btn-default">Voltar</button></a>

</div>
<?php 
require_once ("src/lib/footer.php");
?>