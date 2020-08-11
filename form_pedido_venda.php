<?php 
require_once ("src/connect/check_sessao.php");

$idPedidoVenda = filter_input(INPUT_POST,'idPedidoVenda',FILTER_VALIDATE_INT);
$NaoVenda="";
//mecanismo para proteger o action e controlar o form para INSER e UPDATE
if($idPedidoVenda){
    $action = "src/dao/update/update_pedido_venda.php";
    require_once ("src/connect/config.php");
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_pedido_venda_idPedido (:idPedidoVenda)");
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->execute();
    $retorno = $stmt->fetch();
    $tipoPedido = "Atualizar";
    $NaoVenda = "hidden";
    if ($retorno['sexo'] == "F"){
        $sexo = "Mulher";
    }
    else {        
        $sexo = "Homem"; 
    }
    if($retorno['parentePolitico']  == "sim"){
        $sim    = "checked";
        $nao    ="";
    }else{
        $nao    = "checked";
        $sim    ="";
    }
}
else{
    $action = "src/dao/insert/insert_pedido_venda.php";
    $retorno['idUsuario']       = $_SESSION['idUsuario'];
    $retorno['usuario']         = $_SESSION['usuario'];
    $retorno['mailing']         = filter_input(INPUT_GET,'mailing',         FILTER_DEFAULT);
    $retorno['cliente']         = filter_input(INPUT_GET,'cliente',         FILTER_DEFAULT);
    $retorno['cpf']             = filter_input(INPUT_GET,'cpf',             FILTER_DEFAULT);
    $retorno['dataNascimento']  = filter_input(INPUT_GET,'dataNascimento',  FILTER_DEFAULT);
    
    //corrige data de nascimento
    if(strripos($retorno['dataNascimento'],"/")){
        $retorno['dataNascimento']  = substr( $retorno['dataNascimento'],6,4)."-".substr( $retorno['dataNascimento'],3,2)."-".substr( $retorno['dataNascimento'],0,2);

    }else
        if(strripos($retorno['dataNascimento'],"-")){
        $retorno['dataNascimento']  = substr( $retorno['dataNascimento'],0,4)."-".substr( $retorno['dataNascimento'],5,2)."-".substr( $retorno['dataNascimento'],8,2);

    }else{
        $retorno['dataNascimento']="2010-10-10";
    }
    
    $retorno['sexo']            = filter_input(INPUT_GET,'sexo',            FILTER_DEFAULT);
    $retorno['rg']              = filter_input(INPUT_GET,'rg',              FILTER_DEFAULT);
    $retorno['orgaoEmissor']    = filter_input(INPUT_GET,'orgaoEmissor',    FILTER_DEFAULT);
    $retorno['estadoCivil']     = filter_input(INPUT_GET,'estadoCivil',     FILTER_DEFAULT);
    $retorno['cep']             = filter_input(INPUT_GET,'cep',             FILTER_DEFAULT);
    $retorno['endereco']        = filter_input(INPUT_GET,'endereco',        FILTER_DEFAULT);
    $retorno['complemento']     = filter_input(INPUT_GET,'end_num',         FILTER_DEFAULT);
    $retorno['bairro']          = filter_input(INPUT_GET,'bairro',          FILTER_DEFAULT);
    $retorno['cidade']          = filter_input(INPUT_GET,'municipio',       FILTER_DEFAULT);
    $retorno['estado']          = filter_input(INPUT_GET,'estado',          FILTER_DEFAULT);
    $retorno['email']           = filter_input(INPUT_GET,'email',           FILTER_DEFAULT);
    $retorno['telefone_1']      = filter_input(INPUT_GET,'telefone_1',      FILTER_DEFAULT);
    $retorno['telefone_2']      = filter_input(INPUT_GET,'telefone_2',      FILTER_DEFAULT);
    $retorno['ocupacao']        = filter_input(INPUT_GET,'ocupacao',        FILTER_DEFAULT);   
    $retorno['banco']           = filter_input(INPUT_GET,'banco',           FILTER_DEFAULT);
    $retorno['agencia']         = filter_input(INPUT_GET,'agencia',         FILTER_DEFAULT);
    $retorno['conta']           = filter_input(INPUT_GET,'conta',           FILTER_DEFAULT);
    $retorno['renda']           = filter_input(INPUT_GET,'renda',           FILTER_DEFAULT);
    $retorno['peso']            = "";
    $retorno['altura']          = "";
    $retorno['nome_benef_1']    = "";
    $retorno['nome_benef_2']    = "";
    $retorno['nome_benef_3']    = "";
    $retorno['nome_benef_4']    = "";
    $retorno['nome_benef_5']    = "";
    $retorno['parentesco_benef_1']= "";
    $retorno['parentesco_benef_2']= "";
    $retorno['parentesco_benef_3']= "";
    $retorno['parentesco_benef_4']= "";
    $retorno['parentesco_benef_5']= "";    
    $retorno['idProduto']       = "";
    $retorno['produto']         = "";
    $retorno['precoVenda']      = "";
    $retorno['idCliente']       = "";
    $retorno['nomeMae']         = "";
    $retorno['cpf_benef_1']     = "";
    $retorno['cpf_benef_2']     = "";
    $retorno['cpf_benef_3']     = "";
    $retorno['cpf_benef_4']     = "";
    $retorno['cpf_benef_5']     = "";
    $retorno['nome_mae_benef_1']     = "";
    $retorno['nome_mae_benef_2']     = "";
    $retorno['nome_mae_benef_3']     = "";
    $retorno['nome_mae_benef_4']     = "";
    $retorno['nome_mae_benef_5']     = "";
    $retorno['data_nascimento_benef_1']     = "";
    $retorno['data_nascimento_benef_2']     = "";
    $retorno['data_nascimento_benef_3']     = "";
    $retorno['data_nascimento_benef_4']     = "";
    $retorno['data_nascimento_benef_5']     = "";
    $retorno['numeroProposta']              = "";
    $sim  = "";
    $nao  = "checked";
    $retorno['deficienteFisico']   = "";
    $sexo = "";
    $tipoPedido = "Adicionar";
}

switch ($_SESSION['perfil']){
    case "agente":      $hidden    = "hidden";    break;
    case "supervisor":  $hidden    = "";          break;
    case "backoffice":  $hidden    = "";          break;
    case "gerente":     $hidden    = "";          break;
    case "admin":       $hidden    = "";          break;
    
}
//var_dump($retorno);
?>
<script>
    
function isDate(txtDate)
{
    var currVal = txtDate;
    if(currVal == '')
        return false;

    var rxDatePattern = /^(\d{4})(\/|-)(\d{1,2})(\/|-)(\d{1,2})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null) 
        return false;

    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[3];
    dtDay= dtArray[5];
    dtYear = dtArray[1];        

    if (dtMonth < 1 || dtMonth > 12) 
        return false;
    else if (dtDay < 1 || dtDay> 31) 
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
        return false;
    else if (dtMonth == 2) 
    {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap)) 
                return false;
    }
    return true;
}

    


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


  $.ajax({
        url: "src/dao/select/view_estado_civil.php",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        $("#idEstadoCivil").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idEstadoCivil").append("<option>"+retorno[i]['nome']+"</option>");                           
            }
        $("#idEstadoCivil").append("</optgroup>");
       // console.log(retorno);
    });
    
    $.ajax({
        url: "src/dao/select/view_estado.php",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        $("#estado").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#estado").append("<option value="+retorno[i]['sigla']+">"+retorno[i]['descricao']+"</option>");                           
            }
        $("#estado").append("</optgroup>");
       // console.log(retorno);
    });
    
    $.ajax({
        url: "src/dao/select/view_parentesco.php",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        $("#parentesco_benef_1").append("<option></option>");
        $("#parentesco_benef_2").append("<option></option>");
        $("#parentesco_benef_3").append("<option></option>");
        $("#parentesco_benef_4").append("<option></option>");
        $("#parentesco_benef_5").append("<option></option>");
            for(i=0; i < retorno.length; i++){
                $("#parentesco_benef_1").append("<option>"+retorno[i]['nome']+"</option>");                           
                $("#parentesco_benef_2").append("<option>"+retorno[i]['nome']+"</option>");                           
                $("#parentesco_benef_3").append("<option>"+retorno[i]['nome']+"</option>");                           
                $("#parentesco_benef_4").append("<option>"+retorno[i]['nome']+"</option>");                           
                $("#parentesco_benef_5").append("<option>"+retorno[i]['nome']+"</option>");                           
            }
        $("#parentesco_benef_1").append("</optgroup>");
        $("#parentesco_benef_2").append("</optgroup>");
        $("#parentesco_benef_3").append("</optgroup>");
        $("#parentesco_benef_4").append("</optgroup>");
        $("#parentesco_benef_5").append("</optgroup>");    
            
       // console.log(retorno);
    });
    
    $.ajax({
        url: "src/dao/procedure/call_produto_idUsuario.php",
        dataType: "json",
        type:'POST',
        data:{ idUsuario :<?php echo $_SESSION['idUsuario'];?>,idEmpresa :<?php echo $_SESSION['idEmpresa'];?>},
        async : true
    }).done(function(retorno) {
        $("#idProduto").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idProduto").append("<option value="+retorno[i]['idProduto']+">"+retorno[i]['produto']+" - R$ "+retorno[i]['precoVenda']+"</option>");                        
            }            
        $("#idProduto").append("</optgroup>");    
       // console.log(retorno);
    });
    
       
   
        $.ajax({
            url: "src/dao/select/view_orgao_emissor.php",
            dataType: "json",
            async : true
        }).done(function(retorno) {       
          // var orgaoEmissor =  console.log(orgaoEmissor);
        $( "#orgaoEmissor" ).autocomplete({source: retorno});

            //console.log(retorno);
        });    
    
// PESA MUITO NO SISTEMA!    
//        $.ajax({
//            url: "src/dao/select/view_cidade.php",
//            dataType: "json",
//            async : true
//        }).done(function(retorno) {       
//           var orgaoEmissor =  
//                console.log(orgaoEmissor);
//        $( "#cidade" ).autocomplete({
//          source: retorno
//        });
//
//            console.log(retorno);
//        });    
    
    
        $.ajax({
            url: "src/dao/select/view_banco.php",
            dataType: "json",
            async : true
        }).done(function(retorno) {       
         //  var orgaoEmissor =  console.log(orgaoEmissor);
        $( "#banco" ).autocomplete({source: retorno});
            //  console.log(retorno);
        });    
    
    
     
//        $.ajax({
//            url: "src/dao/select/view_ocupacao.php",
//            dataType: "json",
//            async : true
//        }).done(function(retorno) {       
//           var orgaoEmissor =  
//                console.log(orgaoEmissor);
//        $( "#ocupacao" ).autocomplete({
//          source: retorno
//        });
//
//            console.log(retorno);
//        });    
//   
    
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
       // console.log(retorno);
    });
    
    
    
    $.ajax({
       url: "src/dao/procedure/select_motivo_pedido_nao_venda.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idMotivo").append("<option></option>");
            for(i=0; i < retorno.length; i++){
                $("#idMotivo").append("<option value="+retorno[i]['idMotivo']+">"+retorno[i]['nome']+"</option>");                           
            }
       // console.log(retorno);
    });
    
    $(document).ready(function() { 
        
        $("#dataNascimento").change(function(){
           var dataNascimento = $("#dataNascimento").val();           
           if(!isDate(dataNascimento)){
               alert("Data de Nascimento Inválida!");
               $("#dataNascimento").val('0000-00-00');
           }
           
        });
        
     // alterar protudos quando trocar o vendedor !!!
        $("#idUsuario").change(function(){
            var idUsuario = $("#idUsuario").val();
              $.ajax({
                url: "src/dao/procedure/call_produto_idUsuario.php",
                dataType: "json",
                type:'POST',
                data:{ idUsuario :idUsuario,idEmpresa :<?php echo $_SESSION['idEmpresa'];?>},
                async : true
            }).done(function(retorno) {
                document.getElementById('idProduto').innerHTML = "";
                $("#idProduto").append("<optgroup>");
                    for(i=0; i < retorno.length; i++){
                        $("#idProduto").append("<option value="+retorno[i]['idProduto']+">"+retorno[i]['produto']+" - R$ "+retorno[i]['precoVenda']+"</option>");                        
                    }            
                $("#idProduto").append("</optgroup>");
               console.log(retorno);
            });        
        });
    
    
        
        $("#naoInteressa").attr('disabled', 'disabled');

        $('#idMotivo').change(function() {
            $("#naoInteressa").removeAttr('disabled');
        });
        
         $('#dependentes').click(function() {
            $("#benef_1").toggle();
            $("#benef_2").toggle();
            $("#benef_3").toggle();
            $("#benef_4").toggle();
            $("#benef_5").toggle();
        });
        
        
        
        
        $("#benef_1").attr('hidden', 'true');
        $("#benef_2").attr('hidden', 'true');
        $("#benef_3").attr('hidden', 'true');
        $("#benef_4").attr('hidden', 'true');
        $("#benef_5").attr('hidden', 'true');
        
        
       
        
        $('#naoInteressa').click(function() {
            //mecanismo importante para o botao "NÃO TEVE INTERESSE" mandar para o form_pedido_nao_venda
            //usando o mesmo formulario de form_pedido_venda (inset e update)
          
          $("#idProduto").removeAttr('required');
          $("#idEstadoCivil").removeAttr('required');
        });
        
        
        $('#add').click(function() {
           $('#idMotivo').val("");         
        });
    });
</script>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_pedido_venda_pendente.php">Pedido Venda</a></li>
        <li class="active"><?php echo $tipoPedido; ?> Pedido</li>
    </ol>
    <form action="<?php echo $action;?>" method="post">
        <div class="col-lg-12">
            <div class="col-lg-1">  
                <label>Pedido</label>
                <input value="<?php echo $idPedidoVenda?>"readonly name="idPedido" class="form-control" placeholder="#">
            </div>
            <div class="col-lg-3"  <?php echo $hidden?>>  
                <label>Vendedor</label>          
                <select name="idUsuario" id="idUsuario" class="form-control">
                    <option value="<?php echo $retorno['idUsuario'];?>"><?php echo $retorno['usuario'];?></option>
                </select>        
            </div>
            <div class="col-lg-2">  
                <label>Nº Proposta</label>
                <input name="numeroProposta" placeholder="numeroProposta"  class="form-control" maxlength="20"  onkeyup="mascara(this,event,'########')"  value="<?php echo $retorno['numeroProposta'];?>"> 
            </div>
            <div class="col-lg-2">  
                <label>Mailing</label>
                <input name="mailing" placeholder="mailing"  class="form-control" maxlength="100" value="<?php echo $retorno['mailing'];?>"> 
            </div>
            <div class="col-lg-3" <?php echo $NaoVenda;?>>   
                <label>Motivo</label>
                <select name="idMotivo" id="idMotivo" class="form-control" >
                    
                </select>
            </div>
            <div class="col-lg-3" <?php echo $NaoVenda;?>>   <br>
                <button class="btn btn-danger" id="naoInteressa" onclick="return  confirm('Deseja registrar não venda?');" >Nao teve Interesse</button>
            </div>
        </div>
        <div class="col-lg-12">  
            <hr>
            <div class="col-lg-6">   
                <label>Cliente</label>
                <input name="nome" placeholder="Nome Completo" id="nome"  class="form-control" maxlength="60" value="<?php echo $retorno['cliente'];?>" required>
            </div>
            <div class="col-lg-2">   
                <label>CPF</label>
                <input name="cpf" placeholder="cpf" class="form-control" maxlength="11"  onblur="validaCPF2(this.value);" onkeyup="mascara(this,event,'###########')"  value="<?php echo $retorno['cpf'];?>" required>
            </div>
            <div class="col-lg-1"><br>
                <span id="msg"></span>
            </div>
            <div class="col-lg-2">
                <label>Data Nascimento</label>
                <div class='input-group date'>
                    <input type="date" id="dataNascimento" name="dataNascimento" class="form-control" value="<?php echo $retorno['dataNascimento'];?>" required/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <div class="col-lg-12"> 
            <br>
            <div class="col-lg-2">   
                <label>Sexo</label>
                <select name="sexo" class="form-control" required>
                    <option value="<?php echo $retorno['sexo'];?>"><?php echo $sexo;?></option>
                    <option value="F">Mulher</option>
                    <option value="M">Homem</option>
                </select>
            </div>
            <div class="col-lg-2"> 
                <label>RG</label>
                <input name="rg" placeholder="rg" class="form-control" maxlength="15" value="<?php echo $retorno['rg'];?>">
            </div>
            <div class="col-lg-2">                 
                <label>Orgão Emissor</label>
                <input name="orgaoEmissor" placeholder="Orgão Emissor" id="orgaoEmissor" class="form-control" maxlength="20" value="<?php echo $retorno['orgaoEmissor'];?>">
            </div>
            <div class="col-lg-2">   
                <label>Estado Civíl</label>
                <select name="estadoCivil"  id="idEstadoCivil"          class="form-control">
                    <option><?php echo $retorno['estadoCivil'];?></option>
                </select>          
            </div>            
            <div class="col-lg-4">   
                <label>Nome da Mãe</label>
                <input name="nomeMae"  id="nomeMae"   value="<?php echo $retorno['nomeMae'];?>" maxlength="60" placeholder="Nome completo da Mãe"      class="form-control">
                          
            </div>            
        </div>
        <div class="col-lg-12"> 
            <hr>
            <div class="col-lg-2">   
                <label>Cep</label>
                <input name="cep"           placeholder="cep"           class="form-control" maxlength="8" onkeyup="mascara(this,event,'########')" onblur="pesquisaCep(this.value)"  value="<?php echo $retorno['cep'];?>">
            </div>
            <div class="col-lg-4">
                <label>Endereço</label>
                <input name="endereco"      placeholder="Endereço"      id="endereco" class="form-control" maxlength="100"  value="<?php echo $retorno['endereco'];?>">
            </div>
        </div>
        <div class="col-lg-12">
            <br>
            
            <div class="col-lg-2">
                <label>Complemento</label>
                <input name="complemento"   placeholder="complemento"   class="form-control" maxlength="45"  value="<?php echo $retorno['complemento'];?>">
            </div>
            <div class="col-lg-3">
                <label>Bairro</label>
                <input name="bairro"        placeholder="bairro"        id="bairro" class="form-control" maxlength="45" value="<?php echo $retorno['bairro'];?>">    
            </div>
            <div class="col-lg-2">
                <label>Cidade</label>
                <input name="cidade"        placeholder="cidade"        id="cidade" class="form-control" maxlength="45" value="<?php echo $retorno['cidade'];?>">
            </div>
            <div class="col-lg-2">
                <label>Estado</label>
                <select name="estado"       id="estado"                 class="form-control">
                    <option><?php echo $retorno['estado'];?></option>
                </select>
            </div>
        </div>        
        
        <div class="col-lg-12">
            <br>
            <div class="col-lg-4">
                <label>Email</label>
                <div class="input-group">
                    <span class="input-group-addon">@</span>
                    <input name="email" class="form-control" placeholder="Emaiil"  maxlength="45"  value="<?php echo $retorno['email'];?>">
                </div>            </div>
            <div class="col-lg-2">
                <label>Número Discado</label>
                <input name="telefone_1"    placeholder="(ddd) + número" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')" value="<?php echo $retorno['telefone_1'];?>" required>
            </div>
            <div class="col-lg-3">
                <label>Telefone 2</label>
                <input name="telefone_2"    placeholder="(ddd) + número" class="form-control" maxlength="13" onkeyup="mascara(this,event,'#############')" value="<?php echo $retorno['telefone_2'];?>">
            </div>            
        </div>
        
        <div class="col-lg-12">
            <br>
            <div class="col-lg-4">
                <label>Profissão</label>
               <input name="ocupacao"    id="ocupacao"  placeholder="ocupação"      class="form-control" maxlength="100" value="<?php echo $retorno['ocupacao'];?>">    
            </div>
            <div class="col-lg-1">
                <label>Peso</label>
                <input name="peso"          placeholder="60 kg"          class="form-control" maxlength="3" onkeyup="mascara(this,event,'###')" value="<?php echo $retorno['peso'];?>">    
            </div>
            <div class="col-lg-1">
                <label>Altura</label>
                <input name="altura"        placeholder="1.65 m"        class="form-control" maxlength="4" onkeyup="mascara(this,event,'#.##')" value="<?php echo $retorno['altura'];?>">    
            </div> 
            <div class="col-lg-2">
                <label>Parente Político</label>
                <div class="radio">
                    <label><input type="radio" name="parentePolitico" value="sim" <?php echo $sim;?>>Sim</label>
                    <label><input type="radio" name="parentePolitico" value="nao" <?php echo $nao;?>>Não</label>
                </div>                  
            </div>            
        </div>
        
        <div class="col-lg-12">   
            <div class="col-lg-10">
                <label>Deficiência Física</label>
                <div class="radio">                    
                    <input name="deficienteFisico"        placeholder="Se houver, Qual?"        class="form-control" value="<?php echo $retorno['deficienteFisico'];?>">    
                </div>                  
            </div> 
        </div> 
        <div class="col-lg-12">    
            <hr> 
            <div class="col-lg-4">
            
                <div class="checkbox">
                    <label>
                      <input type="checkbox" id="dependentes"> Dependentes
                    </label>
                  </div>
            </div>
        </div>
        <div class="col-lg-12" id="benef_1">
                       
            <div class="col-lg-3">
                <label>Nome</label>
                <input name="nome_benef_1"  placeholder="nome_benef_1"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_benef_1'];?>">  
            </div>
            <div class="col-lg-2">
                <label>CPF</label>
                <input name="cpf_benef_1"  placeholder="cpf_benef_1"  class="form-control" maxlength="11"  onkeyup="mascara(this,event,'###########')" value="<?php echo $retorno['cpf_benef_1'];?>">  
            </div>
            <div class="col-lg-2">
                <label>Parentesco</label>
                <select name="parentesco_benef_1" id="parentesco_benef_1"   class="form-control">
                    <option><?php echo $retorno['parentesco_benef_1'];?></option>
                </select> 
            </div>
            <div class="col-lg-3">
                <label>Nome Mãe</label>
                <input name="nome_mae_benef_1"  placeholder="nome_mae_benef_1"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_mae_benef_1'];?>">  
            </div>
            <div class="col-lg-2">
                <label>Data Nascimento</label>
                <input name="data_nascimento_benef_1" type="date" placeholder="data_nascimento_benef_1"  class="form-control" value="<?php echo $retorno['data_nascimento_benef_1'];?>">  
            </div>
            
        </div>

        <div class="col-lg-12" id="benef_2">
            <br>            
            <div class="col-lg-3">
                <input name="nome_benef_2"  placeholder="nome_benef_2" class="form-control" maxlength="45" value="<?php echo $retorno['nome_benef_2'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="cpf_benef_2"  placeholder="cpf_benef_2"  class="form-control" maxlength="11"  onkeyup="mascara(this,event,'###########')" value="<?php echo $retorno['cpf_benef_2'];?>">  
            </div>
            <div class="col-lg-2">
                <select name="parentesco_benef_2" id="parentesco_benef_2" class="form-control">
                    <option><?php echo $retorno['parentesco_benef_2'];?></option>
                </select> 
            </div>
            <div class="col-lg-3">
                <input name="nome_mae_benef_2"  placeholder="nome_mae_benef_2"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_mae_benef_2'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="data_nascimento_benef_2" type="date" placeholder="data_nascimento_benef_2"  class="form-control" value="<?php echo $retorno['data_nascimento_benef_2'];?>">  
            </div>
        </div>
        
        <div class="col-lg-12" id="benef_3">
            <br>            
            <div class="col-lg-3">
                <input name="nome_benef_3"  placeholder="nome_benef_3" class="form-control" maxlength="45" value="<?php echo $retorno['nome_benef_3'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="cpf_benef_3"  placeholder="cpf_benef_3"  class="form-control" maxlength="11"  onkeyup="mascara(this,event,'###########')" value="<?php echo $retorno['cpf_benef_3'];?>">  
            </div>
            <div class="col-lg-2">
                <select name="parentesco_benef_3" id="parentesco_benef_3" class="form-control">
                    <option><?php echo $retorno['parentesco_benef_3'];?></option>
                </select>
            </div>
            <div class="col-lg-3">
                <input name="nome_mae_benef_3"  placeholder="nome_mae_benef_3"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_mae_benef_3'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="data_nascimento_benef_3" type="date" placeholder="data_nascimento_benef_3"  class="form-control" value="<?php echo $retorno['data_nascimento_benef_3'];?>">  
            </div>
        </div>
            
        <div class="col-lg-12" id="benef_4">
            <br>            
            <div class="col-lg-3">
                <input name="nome_benef_4"  placeholder="nome_benef_4" class="form-control" maxlength="45" value="<?php echo $retorno['nome_benef_4'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="cpf_benef_4"  placeholder="cpf_benef_4"  class="form-control" maxlength="11"  onkeyup="mascara(this,event,'###########')" value="<?php echo $retorno['cpf_benef_4'];?>">  
            </div>
            <div class="col-lg-2">
                <select name="parentesco_benef_4" id="parentesco_benef_4" class="form-control">
                    <option><?php echo $retorno['parentesco_benef_4'];?></option>
                </select>
            </div>
            <div class="col-lg-3">
                <input name="nome_mae_benef_4"  placeholder="nome_mae_benef_4"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_mae_benef_4'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="data_nascimento_benef_4" type="date" placeholder="data_nascimento_benef_4"  class="form-control" value="<?php echo $retorno['data_nascimento_benef_4'];?>">  
            </div>
        </div>
        
        <div class="col-lg-12" id="benef_5">
            <br>            
            <div class="col-lg-3">
                <input name="nome_benef_5"  placeholder="nome_benef_5"      class="form-control" maxlength="45" value="<?php echo $retorno['nome_benef_5'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="cpf_benef_5"  placeholder="cpf_benef_5"  class="form-control" maxlength="11"  onkeyup="mascara(this,event,'###########')" value="<?php echo $retorno['cpf_benef_5'];?>">  
            </div>
            <div class="col-lg-2">
                <select name="parentesco_benef_5" id="parentesco_benef_5" class="form-control">
                    <option><?php echo $retorno['parentesco_benef_5'];?></option>
                </select> 
            </div>
            <div class="col-lg-3">
                <input name="nome_mae_benef_5"  placeholder="nome_mae_benef_5"  class="form-control" maxlength="45" value="<?php echo $retorno['nome_mae_benef_5'];?>">  
            </div>
            <div class="col-lg-2">
                <input name="data_nascimento_benef_5" type="date" placeholder="data_nascimento_benef_5"  class="form-control" value="<?php echo $retorno['data_nascimento_benef_5'];?>">  
            </div>
        </div>
        
        
        <div class="col-lg-12">
            <br>            
            <div class="col-lg-3">
                <label>Banco</label>
                <input name="banco"         placeholder="banco"  id="banco" class="form-control" maxlength="45" value="<?php echo $retorno['banco'];?>">    
            </div>
            <div class="col-lg-2">
                <label>Agência</label>
                <input name="agencia"       placeholder="agencia"       class="form-control" maxlength="10" value="<?php echo $retorno['agencia'];?>">    
            </div>            
            <div class="col-lg-2">
                <label>Conta</label>
                <input name="conta"         placeholder="conta"         class="form-control" maxlength="10" value="<?php echo $retorno['conta'];?>">    
            </div>
            <div class="col-lg-2">
                <label>Renda Mensal</label>
                <div class="input-group">
                    <span class="input-group-addon">R$</span>
                    <input class="form-control" placeholder="renda" name="renda" maxlength="8" onkeyup="mascara(this,event,'########')" value="<?php echo $retorno['renda'];?>">
<!--                    <span class="input-group-addon">.00</span>-->
                </div>           
            </div>            
        </div>
        
        <div class="col-lg-12">
            <br>  
            <div class="col-lg-4">
                <label>Produto</label>
                <select name="idProduto" id="idProduto" class="form-control" onkeyup="mascara(this,event,'#########')" required >
                    <option value="<?php echo $retorno['idProduto']?>"><?php echo $retorno['produto']." - ".$retorno['precoVenda'];?></option>
                </select>
            </div>
        </div>
        <div class="col-lg-12" align="right">
            <hr>  
            <div class="col-lg-10" >
                <input value="<?php echo $retorno['idCliente']?>" name="idCliente" hidden>
                <input type="submit"   id="add"     class="btn btn-primary" value="<?php echo $tipoPedido ?>">  
            </div>
        </div>           
    </form>
</div>
<?php 
require_once ("src/lib/footer.php");
?>