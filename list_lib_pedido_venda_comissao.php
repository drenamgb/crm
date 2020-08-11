<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");

$idPedidoVenda  = filter_input(INPUT_REQUEST,'idPedidoVenda',FILTER_DEFAULT);

$stmt = $PDO->prepare("call select_pedido_venda_idPedidoVenda_idEmpresa(:idPedidoVenda,:idEmpresa)");
        $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
        $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
        $stmt->execute();
        $retorno = $stmt->fetchall();
       // var_dump($retorno);
        if($retorno[0]['idStatus']==4){
            $bloquearPgto="disabled";
            $reativarPedido = "";
        }else{
            $bloquearPgto="";
            $reativarPedido = "disabled";
        }
        
       
        
$lancamento = "";
$naoMostra = "";
$naoExiste ="";
$msg = "";

if(!empty($retorno)){  
    $stmt = $PDO->prepare("call select_pedido_venda_comissoes(:idEmpresa,:idPedidoVenda)");
    $stmt->bindParam(":idEmpresa",$_SESSION['idEmpresa']);
    $stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
    $stmt->execute();
    $retorno2 = $stmt->fetchall();
    //var_dump($retorno2);
}
else{
    $msg = "O pedido <b>{$idPedidoVenda}</b> não consta no sistema.";
    $naoExiste="";   
    $naoMostra="hidden";
}


switch ($_SESSION['perfil']){
    case "agente":      $hidden    = "hidden";  break;
    case "supervisor":  $hidden    = "hidden";  break;
    case "backoffice":  $hidden    = "";          break;
    case "gerente":     $hidden    = "";          break;
    case "admin":       $hidden    = "";          break;
    case "root":        $hidden    = "hidden";          break;
    
}
?>
<div id="container">
    <ol class="breadcrumb">
         <li><a href="list_pedido_venda_comissao.php">Lista de Pagamentos</a></li> 
        <li class="active">Ficha de Pagamento</li>
    </ol>

    <hr>
    <div <?php echo $naoExiste?>>
           <?php echo $msg?>
    </div>
    <div class="col-lg-12" <?php echo $naoMostra?>>
        
        <div class="col-lg-4">
            <label>Detalhes do Pedido  - nº <?php echo $retorno[0]['idPedidoVenda']?></label>
            <table class="table table-hover table-striped small">
                
                <tr>
                    <td><b>Cliente</b></td>
                    <td><?php echo $retorno[0]['cliente']?></td>
                </tr>
                <tr>
                    <td><b>CPF</b></td>
                    <td><?php echo $retorno[0]['cpf']?></td>
                </tr>
                <tr>
                    <td><b>Telefone</b></td>
                    <td><?php echo $retorno[0]['telefone_1']?></td>
                </tr>
                <tr>
                    <td><b>Produto</b></td>
                    <td><?php echo $retorno[0]['produto']?></td>
                </tr>
                <tr>
                    <td><b>Valor</b></td>
                    <td>R$ <?php echo number_format($retorno[0]['precoVenda'],2,",",".")?></td>
                </tr>
                <tr>
                    <td><b>Data Venda</b></td>
                    <td><?php echo $retorno[0]['timestamp']?></td>
                </tr>
                <tr>
                    <td><b>Status</b></td>
                    <td><?php echo $retorno[0]['nomeStatus']?></td>
                </tr>
                <tr>
                    <td><b>Vitalício</b></td>
                    <td><?php echo $retorno[0]['vitalicio']?> %</td>
                </tr>
                <tr>
                    <td><b>1º Parcela</b></td>
                    <td><?php echo $retorno[0]['primeiraParcela']?> %</td>
                </tr>
                <tr>
                    <td><b>Observação</b></td>
                    <td><textarea disabled cols="40" rows="10"><?php echo $retorno[0]['obs']?></textarea></td>
                </tr>
            </table>
        </div>
        <div class="col-lg-8">
        <div class="col-lg-3"><label>Ficha de Pagamentos</label>
        </div>
        <div class="col-lg-1"></div>
        <div class="col-lg-3">
            <button type="button" <?php echo $bloquearPgto; ?>  class="btn btn-info" align="right" data-toggle="modal" data-target="#pagamentoModal">Registrar Pagamento</button>
        </div>
        <div class="col-lg-2">
            <button type="button" <?php echo $bloquearPgto; ?> class="btn btn-warning" align="right" data-toggle="modal" data-target="#cancelamentoModal">Cancelamento</button>
        </div>
        <div class="col-lg-2">
            <button type="button" class="btn btn-danger" align="right" data-toggle="modal" data-target="#myModal">Estorno</button>
        </div>
        <div class="col-lg-1">
            <button type="button" <?php echo $reativarPedido;?> class="btn btn-success" align="right" data-toggle="modal" data-target="#reativacaoModal">Reativar</button>
        </div>
           
        
  
            
            
           

            <!-- Modal do PAGAMENTO-->
            <div class="modal fade" id="pagamentoModal" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Adicionar Pagamento</h4>
                    </div>
                    <div class="modal-body">
                        <form action="src/dao/insert/insert_lib_pedido_venda_comissao.php" method="POST">
                            <label>Data de Pagamento</label>
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <div class='input-group date lg-2'>
                                        <input type="date" id="dataPagamento" name="dataPagamento" class="form-control" value="<?php echo date("Y-m-d");?>" required/>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>         
                                        <input name="idPedidoVenda" value="<?php echo $retorno[0]['idPedidoVenda']?>" hidden>
                                    </div>  
                                </div>  
                                <div class="col-lg-2">                            
                                    <input type="submit" class="btn btn-primary" value="Salvar"> 
                                </div>
                            </div>                        
                        </form>                
                    </div>
                    <p></p>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                  </div>
                </div>

              </div>
            </div>
            
           

            <!-- Modal do CANCELAMENTO-->
            <div class="modal fade" id="cancelamentoModal" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Cancelamento</h4>
                    </div>
                    <div class="modal-body">
                        <form action="src/dao/update/update_status_pedido_pagamento.php" method="POST">
                            Voce deseja fazer o <strong>CANCELAMENTO</strong> do Pedido Nº <strong><?php echo $idPedidoVenda;?> ? </strong>
                            <p></p>
                            <div>Informe o motivo no histórico<br>
                            <textarea name="obs" placeholder="Detalhar motivo" required rows="5" cols="50"><?php echo $retorno[0]['obs'] ?></textarea>
                            <input name="idStatus" value="4" hidden>
                            <input name="idPedidoVenda" value="<?php echo $retorno[0]['idPedidoVenda']?>" hidden>
                            </div>
                            <div class="col-lg-2">                            
                                    <input type="submit" class="btn btn-primary" value="Sim"> 
                                </div>                  
                        </form>                    
                    </div>
                    <p></p>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                  </div>
                </div>

              </div>
            </div>
            
            <!-- Modal do REATIVACAO-->
            <div class="modal fade" id="reativacaoModal" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Reativação</h4>
                    </div>
                    <div class="modal-body">
                        <form action="src/dao/update/update_status_pedido_pagamento.php" method="POST">
                            Voce deseja fazer a <strong>REATIVAÇÃO</strong> do Pedido Nº <strong><?php echo $idPedidoVenda;?></strong> para <strong>APROVADO</strong>? </strong>
                            <p></p>
                            <div>Informe o motivo no histórico<br>
                            <textarea name="obs" placeholder="Detalhar motivo" required rows="5" cols="50"><?php echo $retorno[0]['obs'] ?></textarea>
                            <input name="idStatus" value="1" hidden>
                            <input name="idPedidoVenda" value="<?php echo $retorno[0]['idPedidoVenda']?>" hidden>
                            </div>
                            <div class="col-lg-2">                            
                                    <input type="submit" class="btn btn-primary" value="Sim"> 
                                </div>                  
                        </form>                    
                    </div>
                    <p></p>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                  </div>
                </div>

              </div>
            </div>
            
            
            
            <table class="table table-hover table-striped small">
                <thead>
                    <th>Nº Parcela</th>
                    <th>Data da Movimentação</th>
                    <th>Data da Baixa</th>
                    <th>Usuário</th>
                    <th>Tipo</th>                    
                    <th <?php echo $hidden?>>Pago</th>
                    <th>A Receber</th>
                </thead>
                <?php 
                $total = count($retorno2);
                $soma=0;
                $soma2=0;
                $estorno=0;
                for($i=0;$i<$total;$i++){
                    echo "<tr>";                    
                    echo "<td>".($i+1)."</td>";                    
                    echo "<td>{$retorno2[$i]['dataPagamento']}</td>";
                    echo "<td>{$retorno2[$i]['timestamp']}</td>";
                    echo "<td>{$retorno2[$i]['usuario']}</td>";
                    if($retorno2[$i]['tipoComissao']=="pago"){
                        $img = "<img src=src/lib/img/check.png width=13 alt=pago>";
                    }else{
                        $img = "<img src=src/lib/img/error.png width=13 alt=estorno>";
                    }
                    if($retorno2[$i]['tipoComissao']=="estorno"){
                        $estorno+=$retorno[$i]['precoVenda'];
                    }
                    echo "<td>".$img."</td>";
                    
                    echo "<td {$hidden}>".number_format($retorno2[$i]['precoVenda'],2,",",".")."</td>";
                     //regra para a primeira parcela
                            if($i==0 && $retorno2[$i]['tipoComissao']=='pago'){
                                echo "<td>".number_format(($retorno2[$i]['precoVenda']*$retorno2[$i]['primeiraParcela'])/100,2,",",".")."</td>";
                                $soma2 +=($retorno2[$i]['precoVenda']*$retorno2[$i]['primeiraParcela'])/100;
                            }else{
                                echo "<td>".number_format(($retorno2[$i]['precoVenda']*$retorno2[$i]['vitalicio'])/100,2,",",".")."</td>";
                                $soma2 +=($retorno2[$i]['precoVenda']*$retorno2[$i]['vitalicio'])/100;
                            }
                            $soma +=$retorno2[$i]['precoVenda'];

                    ?> 
                        <td <?php echo $hidden?>>              
                            <form action="src/dao/delete/delete_lib_pedido_venda_comissao.php" method="post">
                                <input name="idComissao" value="<?php echo ($retorno2[$i]['idComissao'])?>" hidden>
                                <input name="idPedidoVenda" value="<?php echo ($retorno2[$i]['idPedidoVenda'])?>" hidden>
                                    <button type="submit" class="btn btn-danger" title="Deletar"   onclick="return confirm('Deseja Excluir?')">
                                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    </button>
                            </form>        
                        </td>
                        <?php
                }
                echo "</tr>";
                echo "<tr>";
                echo "<td colspan=5 align=right><strong>TOTAL Pago</strong> <img src=src/lib/img/check.png alt=pago width=15></td>";
                echo "<td><strong>".number_format($soma,2,",",".")."</strong></td>";
                echo "<td colspan=3></td>";
                echo "</tr>";
                echo "</tr>";
                ?>
            </table>
        </div>
    </div>
    
</div>
<?php
require_once ("src/lib/footer.php");
?>