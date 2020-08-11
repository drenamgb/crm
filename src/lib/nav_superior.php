<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>i9 - Call Center</title>
        <meta charset="UTF-8">
        <link rel="icon" href="src/lib/img/icone.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="src/lib/img/icone.ico" type="image/x-icon" />
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>       
        <link rel="stylesheet" href="bootstrap/css/star-rating.css" type="text/css"/>       
        <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css"/>       
        <script src="bootstrap/jquery-3.2.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/star-rating.js"></script>
        <script src="bootstrap/js/function.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <nav id="menuSuperior" class="navbar navbar-inverse">               
            <a class="navbar-brand" href="#"><?php echo $_SESSION['empresa'];?></a>
            <a class="navbar-brand" href="#"><?php echo $_SESSION['usuario'];?></a>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Cadastrar</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="list_empresa.php">                 Empresas                </a></li>
                    <li><a href="list_usuario.php">                 Usuários                </a></li>
                    <li><a href="list_produto.php">                 Produtos                </a></li>
                    <li><a href="list_operacao.php">                Operação                </a></li>
                    <li><a href="list_cliente.php">                 Clientes                </a></li>    
                    <li><a href="list_banco.php">                   Bancos                  </a></li>
                    <li><a href="list_estado_civil.php">            Estado Civíl            </a></li>    
                    <li><a href="list_parentesco.php">              Parentesco              </a></li>        
                    <li><a href="list_motivo_pedido_nao_venda.php"> Motivos                 </a></li>   
                    <li><a href="list_meta_usuario.php">            Meta x Usuários         </a></li> 
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Pedidos</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="form_pedido_venda.php">            Novo                    </a></li>
                    <li><a href="form_localizador.php">             Localizador             </a></li>                
                    <li><a href="list_pedido_venda.php">            Consultar               </a></li>
                    <li><a href="list_pedido_nao_venda.php">        Não Venda               </a></li>
                    <li><a href="list_gravacoes.php">               Gravações               </a></li>
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Liberações</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="list_lib_usuario_operacao.php">    Usuario x Operação      </a></li> 
                    <li><a href="list_lib_produto_operacao.php">    Produto x Operação      </a></li>
                    <li><a href="list_lib_usuario_empresa.php">     Usuário x Empresa        </a></li>                
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Financeiro</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="list_pedido_venda_comissao.php">   Pagamentos              </a></li>
                    <li><a href="list_pedido_venda_comissao_cancelado.php">   Cancelados    </a></li>
                  </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Relatórios</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="form_report_pausa.php">            Pausa / Ligação                   </a></li>  
                    <li><a href="form_report_vendas.php" >          Vendas                  </a></li>  
                    <li><a href="form_report_comissao.php" >        Pagamentos              </a></li>  
                    <li><a href="form_report_comissao_detalhada.php" >        Pagamentos Detalhados             </a></li> 
                  </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Dados Pessoais</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#"><strong>EMPRESA:</strong> <?php echo $_SESSION['empresa'];?></a></li>
                    <li><a href="#"><strong>USUÁRIO:</strong> <?php echo $_SESSION['usuario'];?></a></li>
                    <li><a href="#"><strong>PERFIL:</strong> <?php echo $_SESSION['perfil'];?></a></li>
                    <li><a href="#"><strong>IP DISCADORA:</strong> <?php echo $_SESSION['ip_pabx'];?></a></li>
                  </ul>
                </li>
            </ul>
            <div class="container-fluid">
              <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Ferramentas</strong> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="http://www.buscacep.correios.com.br/sistemas/buscacep/" target="_blank">Consulta de CEP</a></li>
                        <li><a href="https://www.receita.fazenda.gov.br/Aplicacoes/SSL/ATCTA/CPF/ConsultaSituacao/ConsultaPublica.asp" target="_blank">Verificação CPF</a></li>
                        <li><a href="form_suporte.php">Suporte</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><strong> Configuração</strong> <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Dúvidas</a></li>
                    <li><a href="form_usuario.php">Alterar Senha</a></li>
                    <li><a href=""  data-toggle="modal" data-target="#sairModal">Sair</a></li>
                  </ul>
                </li>
              </ul>
            </div>
        </nav>   

<!-- Modal do SAIR-->
            <div class="modal fade" id="sairModal" role="dialog">
              <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Desconectar</h4>
                    </div>
                    <div class="modal-body">
                        Você deseja sair?<p>
                                  
                    </div>
                    <p></p>
                    <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                    <a href="src/connect/logout.php" ><button value="sim" class="btn btn-primary">SIM</button></a>
                  </div>
                </div>

              </div>
            </div>