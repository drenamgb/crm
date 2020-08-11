<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$idQualidadePedidoVenda = filter_input(INPUT_POST,'idQualidadePedidoVenda',FILTER_VALIDATE_INT);
if(!$idQualidadePedidoVenda){
    $idQualidadePedidoVenda = (filter_input(INPUT_GET,'idQualidadePedidoVenda',FILTER_DEFAULT));
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");  
    $stmt       =   $PDO->prepare("call select_lib_qualidade_pedido_venda_idQualidadePedidoVenda (:idQualidadePedidoVenda)");
    $stmt->bindParam(":idQualidadePedidoVenda",$idQualidadePedidoVenda);
    $stmt->execute();
    $retorno = $stmt->fetch();
  }else{
    //$idQualidadePedidoVenda = filter_input(INPUT_POST,'idQualidadePedidoVenda',FILTER_VALIDATE_INT);
    $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
    $PDO->exec("set names utf8");
    $stmt       =   $PDO->prepare("call select_lib_qualidade_pedido_venda_idQualidadePedidoVenda (:idQualidadePedidoVenda)");
    $stmt->bindParam(":idQualidadePedidoVenda",$idQualidadePedidoVenda);
    $stmt->execute();
    $retorno = $stmt->fetch();
  }  
  
    $stmt       =   $PDO->prepare("call select_lib_status_pedido_venda (:idPedido)");
    $stmt->bindParam(":idPedido",$retorno['idPedidoVenda']);
    $stmt->execute();
    $retorno2 = $stmt->fetchall();
    
  switch ($_SESSION['perfil']){
    case "agente":      $hidden= "hidden";  $disabled   = "disabled";  break;
    case "supervisor":  $hidden="";         $disabled   = "disabled";  break;
    case "backoffice":  $hidden="";         $disabled   = "";          break;
    case "gerente":     $hidden="";         $disabled   = "";          break;
    case "admin":       $hidden="";         $disabled   = "";          break;
    
}

$stmt       =   $PDO->prepare("call select_gravacao_empresa_idPedidoVenda_telefone_1 (:idEmpresa,:idPedidoVenda,:telefone_1)");
$stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
$stmt->bindParam(":idPedidoVenda",$retorno['idPedidoVenda']);
$stmt->bindParam(":telefone_1",$retorno['telefone_1']);
$stmt->execute();
$retorno3 = $stmt->fetch();

$action ="src/dao/update/update_lib_qualidade_pedido_venda.php";
?>

<script> 
    $(document).ready(function () {
            //$('.rb-rating').rating();          
        });
        
        $.ajax({
                url: "src/dao/select/view_status_pedido.php",
                dataType: "json",
                async : true
            }).done(function(retorno) {
                $("#idStatus").append("<optgroup>");
                    for(i=0; i < retorno.length; i++){
                        $("#idStatus").append("<option value="+retorno[i]['idStatus']+">"+retorno[i]['nome']+"</option>");                           
                    }

                    $("#idStatus").append("</optgroup>");
                console.log(retorno);
            }); 
</script>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_pedido_venda.php">Pedidos</a></li>
        <li class="active">Classificação de Pedido</li>
    </ol>
    <div class="col-lg-12">
        <div class="col-lg-6">
            <form action="<?php echo $action;?>" method="post">
                <table class="table table-hover table-striped">
                    <thead>
                        <th colspan="2">Parâmetros de avaliação:</th>                        
                    </thead>
                    <tbody class="small">
                        <tr>
                            <td>Apresentação</td>
                            <td width="400px"><input  value="<?php echo $retorno['apresentacao']?>" <?php echo $disabled ?>  name="apresentacao"    class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Rítmo</td>
                            <td><input value="<?php echo $retorno['ritmo']?>"   name="ritmo"       <?php echo $disabled ?>    class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Benefícios</td>
                            <td><input value="<?php echo $retorno['beneficio']?>" name="beneficio"  <?php echo $disabled ?>     class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Perguntas</td>
                            <td><input value="<?php echo $retorno['pergunta']?>" name="pergunta"   <?php echo $disabled ?>     class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Valor</td>
                            <td><input value="<?php echo $retorno['valor']?>" name="valor"         <?php echo $disabled ?>  class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Objeção</td>
                            <td><input value="<?php echo $retorno['objecao']?>" name="objecao"     <?php echo $disabled ?>    class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Pronúncia</td>
                            <td><input value="<?php echo $retorno['pronuncia']?>" name="pronuncia"  <?php echo $disabled ?>     class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Intonação</td>
                            <td><input value="<?php echo $retorno['intonacao']?>" name="intonacao"  <?php echo $disabled ?>     class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Cordialidade</td>
                            <td><input value="<?php echo $retorno['cordialidade']?>" name="cordialidade" <?php echo $disabled ?>   class="rating" data-size="xs" required></td>
                        </tr>
                        <tr>
                            <td>Conclusão</td>
                            <td><input value="<?php echo $retorno['conclusao']?>" name="conclusao"  <?php echo $disabled ?>     class="rating" data-size="xs" required></td>
                        </tr>
                        <tr  <?php echo $hidden ?>>
                            <input value="<?php echo ($idQualidadePedidoVenda)?>" name="idQualidadePedidoVenda"  hidden >
                            <td colspan="2" align="right"><input type="submit" class="btn btn-primary" value="Classificar"  ></td>
                        </tr>
                    </tbody>
                </table>
            </form>    
        </div>
        <div class="col-lg-6">
            <table class="table table-hover table-striped small">
                <thead>
                        <th>Informações:</th>                        
                </thead>
                <tbody>
                    <tr>
                        <td><b>Pedido Nº</b></td>
                        <td><?php echo $retorno['idPedidoVenda']?></td>
                        <td><b>Data Venda</b></td>
                        <td><?php echo $retorno['timestamp']?></td>  
                    </tr>                    
                    <tr>
                        <td><b>Vendedor</b></td>
                        <td><?php echo $retorno['usuario']?></td>
                    
                        <td><b>Cliente</b></td>
                        <td><?php echo $retorno['cliente']?></td> 
                    </tr>
                    <tr>
                        <td><b>Produto</lable></td>
                        <td><?php echo $retorno['produto']?> </td>      
                        <td><label>Valor</label></td>
                        <td>R$ <?php echo number_format($retorno['precoVenda'],2,",",".")?></td>
                    </tr>
                    <tr>
                        <td><b>Telefone Discado</b></td>
                        <td><?php echo $retorno['telefone_1']?></td> 
                        <td><b>Nota de Avaliação</b></td>
                        <td><?php echo $retorno['mediaPonderada']?></td> 
                    </tr>
                    <tr>
                        <td><b>Escutar Gravação</b></td>
                        <td colspan="3">
                            <a href="<?php echo "../".$retorno3['recordingfile'];?>">Aqui</a>
                            <audio src="<?php echo $retorno3['recordingfile'];?>" controls>
                                <button type="submit" class="btn btn-default" title="Escutar">                                
                                    <span class="glyphicon glyphicon-volume-up" aria-hidden="true"></span>                                
                                </button>
                            </audio>                         
                        </td>  
                    </tr>
                    <tr>
                        <td><label>Status:</label></td>
                        <td colspan="3">
                            <form action="src/dao/update/update_status_pedido.php" method="post">                                        
                                <select name="idStatus" id="idStatus" class="form-control" required onchange="this.form.submit()" <?php echo $disabled ?>>
                                    <option value="<?php echo $retorno['idStatus'] ?>"><?php echo $retorno['nomeStatus'] ?></option>
                                </select>
                                <input name="idPedidoVenda" hidden value="<?php echo $retorno['idPedidoVenda'] ?>">  
                                <input name="idQualidadePedidoVenda"  hidden value="<?php echo $idQualidadePedidoVenda?>"> 
                            </td>
                    </tr>
                    <tr>
                        <td><b>Detalhes</b></td>
                        <td colspan="3">
                            <textarea name="obs" placeholder="Detalhar motivo" <?php echo $disabled ?> required rows="5" cols="50"><?php echo $retorno['obs'] ?></textarea>
                        </td>  
                    </tr>
                                       
                </tbody>
            </table>
            <hr>
            <label>Histórico do Status do Pedido</label>
            <table class="table table-hover table-striped small">
                <thead>
                    <th>Data Alteração</th>
                    <th>Status</th>
                    <th>Alterado Por</th>
                </thead>
                <?php 
                $total = count($retorno2);
                for($i=0;$i<$total;$i++){
                    echo "<tr>";
                    echo "<td>{$retorno2[$i]['timestamp']}</td>";
                    echo "<td>{$retorno2[$i]['statusPedido']}</td>";
                    echo "<td>{$retorno2[$i]['alteradoPor']}</td>";
                }
                ?>
            </table>
        </div>
    </div>    
    <a href="list_qu"><button class="btn btn-default">Voltar</button></a>
</div>
<?php 
require_once ("src/lib/footer.php");
?>