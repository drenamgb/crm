<?php 
require_once ("src/connect/check_sessao.php");
require_once ("src/connect/config.php");




switch ($_SESSION['perfil']){
    case "agente":      $hidden    = "hidden";  break;
    case "supervisor":  $hidden    = "hidden";  break;
    case "backoffice":  $hidden    = "hidden";  break;
    case "gerente":     $hidden    = "";        break;
    case "admin":       $hidden    = "";        break;
    case "root":        $hidden    = "hidden";  break;
    
}


  
?>
<div id="container">
    <ol class="breadcrumb">
        <li class="active">Gravações</li>
    </ol>

    <?php
    
    if (filter_var($_SESSION['ip_pabx'], FILTER_VALIDATE_IP)) {
        require("src/lib/filemanager/{$_SESSION['ip_pabx']}/filemanager.php");
    }else {
        echo("O IP: <b>{$_SESSION['ip_pabx']}</b> da empresa <b>{$_SESSION['empresa']}</b> é inválido");
    }
?>

    
    
</div>
<?php 
require_once ("src/lib/footer.php");
?>