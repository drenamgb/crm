<?php 
require_once ("src/connect/check_sessao.php");

?>
<div id="container">
    <ol class="breadcrumb">
        <li><a href="list_produto.php">Retrabalho Mailing</a></li>
        <li class="active">Gerar Mailing</li>
    </ol>
    <form action="src/dao/procedure/select_nao_vendas_mes_ano_empresa.php" method="post">
        <div class="col-lg-12">            
            <div class="col-lg-2">
                <label>Mês</label>
                <select name="mes" class="form-control">
                    <option value="1">Janeiro</option>
                    <option value="2">Fevereiro</option>
                    <option value="3">Março</option>
                    <option value="4">Abril</option>
                    <option value="5">Maio</option>
                    <option value="6">Junho</option>
                    <option value="7">Julho</option>
                    <option value="8">Agosto</option>
                    <option value="9">Setembro</option>
                    <option value="10">Outubro</option>
                    <option value="11">Novembro</option>
                    <option value="12">Dezembro</option>
                </select>
            </div> 
            <div class="col-lg-2">
                <label>Ano</label>
                <select name="ano" class="form-control">
                    <option>2017</option>
                    <option>2018</option>
                    <option>2019</option>
                    <option>2020</option>
                </select>
            </div>
            
            <div class="col-lg-2">   
                <br>
                <input type="submit" class="btn btn-danger" value="Gerar"> 
            </div>            
        </div>        
    </form>
    <div class="col-lg-12"> 
        <p></p>
        obs: O processamento pode demorar até 1 minuto
    </div>
</div>
<?php 
require_once ("src/lib/footer.php");
?>