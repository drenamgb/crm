<?php
session_start();
//if(count($_SESSION)!=10){
if(count($_SESSION)!=8){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['idUsuario'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['idEmpresa'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}

if(($_SESSION['usuario'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['cpf'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['login'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['perfil']!="agente") && ($_SESSION['perfil']!="supervisor") && ($_SESSION['perfil']!="gerente")&& ($_SESSION['perfil']!="backoffice")&& ($_SESSION['perfil']!="admin")&& ($_SESSION['perfil']!="root")){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['ip_pabx'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
if(($_SESSION['empresa'])==""){
    session_start();
    session_destroy();
    header("location:form_login.php");
}
//controlo o menu de acesso, pelo perfil do usuario logado
switch ($_SESSION['perfil']){
    case "agente":      require_once ("src/lib/nav_superior.php");   break;
    case "supervisor":  require_once ("src/lib/nav_superior.php");   break;
    case "backoffice":  require_once ("src/lib/nav_superior.php");   break;
    case "gerente":     require_once ("src/lib/nav_superior.php");   break;
    case "admin":       require_once ("src/lib/nav_superior.php");   break;
    case "root":        require_once ("src/lib/nav_superior.php");   break;
    default: session_start();
            session_destroy();
            header("location:form_login.php");
}
