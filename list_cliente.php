<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/check_sessao_agente.php");
require_once ("src/connect/config.php");

$cpfNaoExiste="";
$naoMostra="";
try{
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    if($_SESSION['perfil']==="root"){
        $stmt = $PDO->prepare("SELECT * FROM view_cliente");
        $stmt->execute();
        $retorno = $stmt->fetchall();
    }else{
        $cpf = filter_input(INPUT_POST,'cpf',FILTER_DEFAULT);
        if($cpf){
            $stmt = $PDO->prepare("call select_pedido_venda_cliente_cpf(:idEmpresa,:cpf)");
            $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
            $stmt->bindParam(":cpf",$cpf);
            $stmt->execute();
            if(!$stmt->rowCount()){
                $stmt = $PDO->prepare("call select_pedido_nao_venda_cliente_cpf(:idEmpresa,:cpf)");
                $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
                $stmt->bindParam(":cpf",$cpf);
                $stmt->execute();
                if(!$stmt->rowCount()){
                    $naoMostra="hidden";
                    $cpfNaoExiste = " Desculpe, mas esse CPF <b>{$cpf}</b> não existe na base";
                }
            }
            $retorno = $stmt->fetchall();


        }else{
            $stmt = $PDO->prepare("call select_cliente(:idEmpresa)");
            $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
            $stmt->execute();
            $retorno = $stmt->fetchall();
        }
    }
}catch(Exception $e){
    echo json_encode($e->getMessage());
}finally{
    unset($PDO);
    unset($stmt);
}

//var_dump($retorno);
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

 

    
</script>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Clientes</li>
    </ol>
    <div class="col-lg-12" >
        <form action="list_cliente.php" method="post">
            <div class="col-lg-2" >
                <br>
                <input name="cpf" placeholder="cpf" id="cpf" class="form-control" maxlength="11" onblur="validaCPF2(this.value);"  onkeyup="mascara(this,event,'###########')" required>
            </div>
            <div class="col-lg-1">
                <br>
                <span id="msg"></span>
            </div>
            <div class="col-lg-1">
                <br>
                <button type="submit" class="btn btn-default" title="Pesquisar">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </div>
        </form>
    </div>
    
    <?php echo $cpfNaoExiste;?>
    <div class="col-lg-12" <?php echo $naoMostra;?> >
        <hr>
        
        <label>Total <span class="badge"><?php echo count($retorno) ?></span></label>
        <table class="table table-hover table-striped small" >
            <thead >
                <th>#</th>
                <th>Nome</th>
                <th>CPF</th>
                <th>Data Cadastro</th>
            </thead>
            <?php 
            $total = count($retorno);
            for($i=0;$i<$total;$i++){
                echo "<tr>";
                echo "<td>{$retorno[$i]['idCliente']}</td>";
                echo "<td>{$retorno[$i]['nome']}</td>";
                echo "<td>{$retorno[$i]['cpf']}</td>";
                echo "<td>{$retorno[$i]['timestamp']}</td>";
            }
            ?>        
        </table>
    </div>
</div>
<?php 
require_once ("src/lib/footer.php");
?>