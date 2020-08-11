<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");


?>
<script>
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
            //console.log(retorno);
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
        
    $.ajax({
        url: "src/dao/select/select_operacao.php",
        dataType: "json",
        type:"POST",
        data:{idEmpresa : '<?php echo $_SESSION['idEmpresa']?>'},
        async : true
    }).done(function(retorno) {
        $("#idOperacao").append("<optgroup>");
            for(i=0; i < retorno.length; i++){
                $("#idOperacao").append("<option value="+retorno[i]['idOperacao']+">"+retorno[i]['nome']+"</option>");                           
            }
        $("#idOperacao").append("</optgroup>");
        //console.log(retorno);
    }); 
</script>
<div id="container">   
    <div class="row col-lg-12">
         <ol class="breadcrumb">
            <li class="active">Relatório de Vendas</li>
        </ol>
    </div>
    <div class="row col-lg-12">
        <form action="src/dao/procedure/select_report_vendas.php" method="post">
            <div class="col-lg-2">
                <label>Data Início</label>
                <input type="date" name="dataInicio" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Data Fim</label>
                <input type="date" name="dataFim" required value="<?php echo date("Y-m-d");?>" class="form-control">
            </div>
            <div class="col-lg-2">
                <label>Status</label>
                <select name="idStatus" id="idStatus" class="form-control">
                    <option value="">TODOS</option>
                </select>  
            </div>
            <div class="col-lg-2">
                <label>Vendedor</label>
                <select name="idUsuario" id="idUsuario" class="form-control" >
                    <option value="">TODOS</option>
                </select>  
            </div>
            <div class="col-lg-2">
                <label>Operação</label>
                <select name="idOperacao" id="idOperacao" class="form-control" >
                    <option value="">TODOS</option>        
                </select>   
            </div>
            <div class="col-lg-1">
                <label>Qualidade</label>
                <select name="idQualidadePedidoVendaInicio" id="idQualidadePedidoVendaInicio" class="form-control" >
                    <option value="0">0</option> 
                    <optgroup></optgroup> 
                    <option value="1">1</option> 
                    <option value="2">2</option> 
                    <option value="3">3</option> 
                    <option value="4">4</option> 
                    <option value="5">5</option> 
                </select>
            </div>
            <div class="col-lg-1">
                <font size="1" color="gray">Entre</font>
                 <select name="idQualidadePedidoVendaFim" id="idQualidadePedidoVendaFim" class="form-control" >
                    <option value="5">5</option> 
                    <optgroup></optgroup> 
                    <option value="0">0</option> 
                    <option value="1">1</option> 
                    <option value="2">2</option> 
                    <option value="3">3</option> 
                    <option value="4">4</option>
                </select>
            </div>
            <div class="col-lg-2">                
                <div class="col-lg-2">
                    <br>
                    <button type="submit" class="btn btn-success" title="Exportar">
                        Exportar CSV
                    </button>
                </div>
            </div>            
        </form>
    </div>
   
    
</div>
<?php 
require_once ("src/lib/footer.php");
?>