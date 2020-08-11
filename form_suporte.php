<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/check_sessao_agente.php");

$idEmpresa = $_SESSION['idEmpresa'];
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idEmpresa){
    $action = "#src/dao/update/update_empresa.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_empresa_idEmpresa (:idEmpresa)");
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->execute();
    $retorno = $stmt->fetch();
    //var_dump($retorno);
    $tipoPedido = "readonly";
}
?>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_empresa.php">Suporte</a></li>
        <li class="active">Solicitar Suporte</li>
    </ol>
    <form action="<?php echo $action;?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-4">
                <label>Empresa</label>
                <input name="nome" placeholder="Nome Completo" class="form-control" readonly maxlength="45" required value="<?php echo $retorno['nome']; ?>">
            </div> 
            <div class="col-lg-2">
                <label>CNPJ</label>
                <input name="cnpj" placeholder="cnpj" class="form-control" readonly maxlength="25" onkeyup="mascara(this,event,'#####################')" value="<?php echo $retorno['cnpj']; ?>">
            </div>
            <div class="col-lg-2"> 
                <label>IP PABX</label>
                <input name="ip_pabx" placeholder="Ip Discadora" required class="form-control" readonly maxlength="15" onkeyup="mascara(this,event, '###############')"  value="<?php echo $retorno['ip_pabx']; ?>">  
            </div>
        </div>
        <div class="col-lg-12" hidden>
            <br>
            <div class="col-lg-2"> 
                <label>Cep</label>
                <input name="cep" placeholder="cep"  class="form-control"  maxlength="8" onkeyup="mascara(this,event,'########')" onblur="pesquisaCep(this.value)" value="<?php echo $retorno['cep']; ?>">
            </div>
        </div>
        <div class="col-lg-12" hidden>
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
        <div class="col-lg-12" hidden>
            <br>
            <div class="col-lg-3">
                <label>Email</label>
                <input name="email" type="email" placeholder="email" class="form-control" maxlength="45" value="<?php echo $retorno['email']; ?>">
            </div>
            <div class="col-lg-3">
                <label>Telefone 1</label>
                <input name="telefone_1" placeholder="Telefone 1" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')"  value="<?php echo $retorno['telefone_1']; ?>">
            </div>
            <div class="col-lg-3">
                <label>Telefone 2</label>
                <input name="telefone_2" placeholder="Telefone 2" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')"  value="<?php echo $retorno['telefone_2']; ?>">
            </div>
            
        </div>  
        <div class="col-lg-12">
            <br>
            <div class="col-lg-3">
                <label>Usuário</label>
                <input name="usuario" placeholder="usuario 2" class="form-control" readonly maxlength="60"  value="<?php echo $_SESSION['usuario']; ?>">
            </div>      
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-2">
                <label>Assunto</label>
                <select name="assunto" class="form-control" required>
                    <option>Dúvida</option>
                    <option>Reclamação</option>
                    <option>Sugestão</option>
                </select>
            </div>          
        </div>
        <div class="col-lg-12">
            <br>
            <div class="col-lg-8">
                <textarea name="mensagem" class="form-control" required maxlength="1000" placeholder="Mensagem" rows="8"></textarea>
            </div>
        </div>
        <div class="col-lg-10">
            <hr>
            <div class="col-lg-10" align="right">
                <input name="idEmpresa" hidden value="<?php echo $retorno['idEmpresa']; ?>">
                <input type="submit" class="btn btn-primary" value="Abrir Chamado" disabled>  
            </div>
        </div>
    </form>
</div>
<?php 
require_once ("src/lib/footer.php");
?>