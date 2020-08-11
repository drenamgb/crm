<?php       
       
session_start(); //preciso inicializar, para destruir tudo que esta em sessao, para depois iniciar uma nova sessao!!!
session_destroy();

header("location:../../form_login.php");