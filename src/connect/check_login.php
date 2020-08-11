<?php
    $login      = strtoupper(trim(filter_input(INPUT_POST,'login',  FILTER_DEFAULT)));
    $senha      = filter_input(INPUT_POST,'senha',                  FILTER_DEFAULT);

    session_start(); //preciso inicializar, para destruir tudo que esta em sessao, para depois iniciar uma nova sessao!!!
    session_destroy();
    session_start();

//if($login=="1" && $senha=="1"){
//   
//    $_SESSION['idUsuario']     = "?";
//    $_SESSION['idEmpresa']     = "?";
//    $_SESSION['usuario']       = "root";
//    $_SESSION['cpf']           = "?";
//    $_SESSION['login']         = "root";
//    $_SESSION['perfil']        = "root";         
//    $_SESSION['ip_pabx']       = "0.0.0.0";         
//    $_SESSION['empresa']       = "Suporte";  
//    $_SESSION['idAgent']       = "1";  
//    header("location:../../index_root.php");
//}else{
    try{    
        require_once ("config.php");
        $PDO =  new PDO( "mysql:host={$host};dbname={$dbname}",$user,$pass);
        $PDO->exec("set names utf8");
        $stmt       =   $PDO->prepare("call select_login (:login,:senha)");

        $stmt->bindParam(":login",$login);
        $stmt->bindParam(":senha",$senha);
        $stmt->execute();
        if($stmt->rowCount()==1){
            $retorno = $stmt->fetch();        
            $_SESSION['idUsuario']     = $retorno['idUsuario'];
            $_SESSION['idEmpresa']     = $retorno['idEmpresa'];
            $_SESSION['usuario']       = $retorno['usuario'];
            $_SESSION['cpf']           = $retorno['cpf'];
            $_SESSION['login']         = $retorno['login'];
            $_SESSION['perfil']        = $retorno['perfil'];         
            $_SESSION['ip_pabx']       = $retorno['ip_pabx'];         
            $_SESSION['empresa']       = $retorno['empresa'];   
            
        }else{
            header("location:../../form_login.php");
        }
         
    }catch(PDOException $e){
            echo ($e->getMessage());     
           // header("location:../../form_login.php");
    }finally{
        unset($stmt);
        unset($PDO);
        unset($_REQUEST);
        header("location:../../result_vendas.php");
    }
//}