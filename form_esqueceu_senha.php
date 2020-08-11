<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Call Center - beta 1.0</title>
        <meta charset="UTF-8">
        <link rel="icon" href="src/lib/img/icone.ico" type="image/x-icon" />
        <link rel="shortcut icon" href="src/lib/img/icone.ico" type="image/x-icon" />
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css"/>       
        <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css"/>       
        <script src="bootstrap/jquery-3.2.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/function.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <script> 
             $(document).ready(function() { 
                $("#recuperar").click(function(){
                //    window.location.href = 'http://www.google.com'
                   var cpf = $("#cpf").val();
                    $.ajax({
                        url: "src/connect/check_senha.php",
                        dataType: "json",
                        type:"POST",
                        data: {cpf:cpf},
                        async : true
                    }).done(function(retorno) {
                        if(retorno){
                            alert('Usuário: '+retorno['nome']+'\n'+'Login: '+retorno['login']+'\n'+'Senha: '+retorno['senha']);
                        }else{
                            alert('AGENTE não encontrado!');
                        }
                       // console.log(retorno);
                    }); 
                });
            });
        </script>
        <nav id="menuSuperior" class="navbar navbar-inverse">               
            <a class="navbar-brand"  href="#">Gestão +</a>         
            <div id="containerLogin">
                <form class="form-inline"  method="post">
                    <div class="form-group">
                        <input type="text" class="form-control input-group-sm" id="cpf" name="cpf" placeholder="CPF" required maxlength="11"  onkeyup="mascara(this,event,'###########')">
                    </div>
                    <button type="submit" class="btn btn-primary" id="recuperar">Recuperar</button>
                </form>
                <div id="containerLoginEsqueceuSenha">
                        <a href="form_login.php">Entrar</a>
                    </div>

            </div>
        </nav>
<?php 
require_once ("src/lib/footer.php");
?>