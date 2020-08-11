<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <title>Call Center</title>
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
        <nav id="menuSuperior" class="navbar navbar-inverse">               
            <a class="navbar-brand" href="#">Call Center</a>        
            <div id="containerLogin" style="margin-top:8px;margin-right: 10px;">
                <form class="form-inline" action="src/connect/check_login.php" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control input-group-sm" id="exampleInputName2" name="login" placeholder="Login" required maxlength="20">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="exampleInputEmail2" name="senha" placeholder="Senha" required maxlength="20">
                    </div>
                    <button type="submit" class="btn btn-primary">Entrar</button>
                </form>
                <div id="containerLoginEsqueceuSenha" hidden>
                    <a href="form_esqueceu_senha.php">Esqueceu sua senha?</a>
                </div>
            </div>
        </nav>
<?php 
require_once ("src/lib/footer.php");
?>