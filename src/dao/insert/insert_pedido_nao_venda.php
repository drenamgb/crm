<?php

    $nome           =   strtoupper(trim(filter_input(INPUT_POST, "nome",            FILTER_DEFAULT)));
    $cpf            =   filter_input(INPUT_POST,                 "cpf",             FILTER_DEFAULT);
    $rg             =   strtoupper(trim(filter_input(INPUT_POST, "rg",              FILTER_DEFAULT)));
    $orgaoEmissor   =   strtoupper(trim(filter_input(INPUT_POST, "orgaoEmissor",    FILTER_DEFAULT)));
    $sexo           =   strtoupper(trim(filter_input(INPUT_POST, "sexo",            FILTER_DEFAULT)));
    $estadoCivil    =   strtoupper(trim(filter_input(INPUT_POST, "estadoCivil",     FILTER_DEFAULT)));
    $dataNascimento =   filter_input(INPUT_POST,                 "dataNascimento",  FILTER_DEFAULT);
    $endereco       =   strtoupper(trim(filter_input(INPUT_POST, "endereco",        FILTER_DEFAULT)));
    $complemento    =   strtoupper(trim(filter_input(INPUT_POST, "complemento",     FILTER_DEFAULT)));
    $bairro         =   strtoupper(trim(filter_input(INPUT_POST, "bairro",          FILTER_DEFAULT)));
    $cep            =   filter_input(INPUT_POST,                 "cep",             FILTER_DEFAULT);
    $cidade         =   strtoupper(trim(filter_input(INPUT_POST, "cidade",          FILTER_DEFAULT)));
    $estado         =   strtoupper(trim(filter_input(INPUT_POST, "estado",          FILTER_DEFAULT)));
    $email          =   strtoupper(trim(filter_input(INPUT_POST, "email",           FILTER_DEFAULT)));
    $telefone_1     =   filter_input(INPUT_POST,                 "telefone_1",      FILTER_DEFAULT);
    $telefone_2     =   filter_input(INPUT_POST,                 "telefone_2",      FILTER_DEFAULT);    
    $ocupacao       =   strtoupper(trim(filter_input(INPUT_POST, "ocupacao",        FILTER_DEFAULT)));
    $peso           =   filter_input(INPUT_POST,                 "peso",            FILTER_DEFAULT);
    $altura         =   filter_input(INPUT_POST,                 "altura",          FILTER_DEFAULT);
    $renda          =   filter_input(INPUT_POST,                 "renda",           FILTER_DEFAULT);
    $banco          =   strtoupper(trim(filter_input(INPUT_POST, "banco",           FILTER_DEFAULT)));
    $agencia        =   filter_input(INPUT_POST,                 "agencia",         FILTER_DEFAULT);
    $conta          =   filter_input(INPUT_POST,                 "conta",           FILTER_DEFAULT);
    $nome_benef_1   =   strtoupper(trim(filter_input(INPUT_POST, "nome_benef_1",    FILTER_DEFAULT)));
    $nome_benef_2   =   strtoupper(trim(filter_input(INPUT_POST, "nome_benef_2",    FILTER_DEFAULT)));
    $nome_benef_3   =   strtoupper(trim(filter_input(INPUT_POST, "nome_benef_3",    FILTER_DEFAULT)));
    $nome_benef_4   =   strtoupper(trim(filter_input(INPUT_POST, "nome_benef_4",    FILTER_DEFAULT)));
    $nome_benef_5   =   strtoupper(trim(filter_input(INPUT_POST, "nome_benef_5",    FILTER_DEFAULT)));
    $parentesco_benef_1   =   filter_input(INPUT_POST,           "parentesco_benef_1",        FILTER_DEFAULT);
    $parentesco_benef_2   =   filter_input(INPUT_POST,           "parentesco_benef_2",        FILTER_DEFAULT);
    $parentesco_benef_3   =   filter_input(INPUT_POST,           "parentesco_benef_3",        FILTER_DEFAULT);
    $parentesco_benef_4   =   filter_input(INPUT_POST,           "parentesco_benef_4",        FILTER_DEFAULT);
    $parentesco_benef_5   =   filter_input(INPUT_POST,           "parentesco_benef_5",        FILTER_DEFAULT);
    $mailing        =   strtoupper(trim(filter_input(INPUT_POST, "mailing",         FILTER_DEFAULT)));
    $nomeMae        =   strtoupper(trim(filter_input(INPUT_POST, "nomeMae",         FILTER_DEFAULT)));
    $deficienteFisico     =   strtoupper(trim(filter_input(INPUT_POST, "deficienteFisico",  FILTER_DEFAULT)));
    $parentePolitico      =   (trim(filter_input(INPUT_POST,     "parentePolitico",   FILTER_DEFAULT)));
    
    session_start();
    $idEmpresa      =   $_SESSION['idEmpresa'];
    $idUsuario      =   filter_input(INPUT_POST,                 "idUsuario",          FILTER_DEFAULT);
    $idProduto      =   filter_input(INPUT_POST,                 "idProduto",          FILTER_DEFAULT);    
    $idMotivo       =   filter_input(INPUT_POST,                 "idMotivo",           FILTER_VALIDATE_INT);
    
    $cpf_benef_1       =   filter_input(INPUT_POST,              "cpf_benef_1",        FILTER_DEFAULT);
    $cpf_benef_2       =   filter_input(INPUT_POST,              "cpf_benef_2",        FILTER_DEFAULT);
    $cpf_benef_3       =   filter_input(INPUT_POST,              "cpf_benef_3",        FILTER_DEFAULT);
    $cpf_benef_4       =   filter_input(INPUT_POST,              "cpf_benef_4",        FILTER_DEFAULT);
    $cpf_benef_5       =   filter_input(INPUT_POST,              "cpf_benef_5",        FILTER_DEFAULT);
    $nome_mae_benef_1  =   filter_input(INPUT_POST,              "nome_mae_benef_1",   FILTER_DEFAULT);
    $nome_mae_benef_2  =   filter_input(INPUT_POST,              "nome_mae_benef_2",   FILTER_DEFAULT);
    $nome_mae_benef_3  =   filter_input(INPUT_POST,              "nome_mae_benef_3",   FILTER_DEFAULT);
    $nome_mae_benef_4  =   filter_input(INPUT_POST,              "nome_mae_benef_4",   FILTER_DEFAULT);
    $nome_mae_benef_5  =   filter_input(INPUT_POST,              "nome_mae_benef_5",   FILTER_DEFAULT);
    $data_nascimento_benef_1  =   filter_input(INPUT_POST,       "data_nascimento_benef_1",   FILTER_DEFAULT);
    $data_nascimento_benef_2  =   filter_input(INPUT_POST,       "data_nascimento_benef_2",   FILTER_DEFAULT);
    $data_nascimento_benef_3  =   filter_input(INPUT_POST,       "data_nascimento_benef_3",   FILTER_DEFAULT);
    $data_nascimento_benef_4  =   filter_input(INPUT_POST,       "data_nascimento_benef_4",   FILTER_DEFAULT);
    $data_nascimento_benef_5  =   filter_input(INPUT_POST,       "data_nascimento_benef_5",   FILTER_DEFAULT);
    
    if($data_nascimento_benef_1==""){$data_nascimento_benef_1=null;}
    if($data_nascimento_benef_2==""){$data_nascimento_benef_2=null;}
    if($data_nascimento_benef_3==""){$data_nascimento_benef_3=null;}
    if($data_nascimento_benef_4==""){$data_nascimento_benef_4=null;}
    if($data_nascimento_benef_5==""){$data_nascimento_benef_5=null;}
    
     require_once ("../../connect/config.php");
    if($idMotivo){
         
   
    $stmt       =   $PDO->prepare("call insert_pedido_nao_venda ("
            . ":nome,"
            . ":cpf,"
            . ":rg,"
            . ":orgaoEmissor,"
            . ":sexo,"
            . ":estadoCivil,"
            . ":dataNascimento,"
            . ":endereco,"
            . ":complemento,"
            . ":bairro,"
            . ":cep,"
            . ":cidade,"
            . ":estado,"
            . ":email,"
            . ":telefone_1,"
            . ":telefone_2,"
            . ":ocupacao,"
            . ":peso,"
            . ":altura,"
            . ":renda,"
            . ":banco,"
            . ":agencia,"
            . ":conta,"
            . ":nome_benef_1,"
            . ":nome_benef_2,"
            . ":nome_benef_3,"
            . ":nome_benef_4,"
            . ":nome_benef_5,"
            . ":parentesco_benef_1,"
            . ":parentesco_benef_2,"
            . ":parentesco_benef_3,"
            . ":parentesco_benef_4,"
            . ":parentesco_benef_5,"
            . ":mailing,"
            . ":nomeMae,"
            . ":deficienteFisico,"
            . ":parentePolitico,"
            . ":idEmpresa,"
            . ":idUsuario,"
            . ":idMotivo,"
            . ":cpf_benef_1,"
            . ":cpf_benef_2,"
            . ":cpf_benef_3,"
            . ":cpf_benef_4,"
            . ":cpf_benef_5,"
            . ":nome_mae_benef_1,"
            . ":nome_mae_benef_2,"
            . ":nome_mae_benef_3,"
            . ":nome_mae_benef_4,"
            . ":nome_mae_benef_5,"
            . ":data_nascimento_benef_1,"
            . ":data_nascimento_benef_2,"
            . ":data_nascimento_benef_3,"
            . ":data_nascimento_benef_4,"
            . ":data_nascimento_benef_5)");
    
   
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":cpf",$cpf);
    $stmt->bindParam(":rg",$rg);
    $stmt->bindParam(":orgaoEmissor",$orgaoEmissor);
    $stmt->bindParam(":sexo",$sexo);
    $stmt->bindParam(":estadoCivil",$estadoCivil);
    $stmt->bindParam(":dataNascimento",$dataNascimento);
    $stmt->bindParam(":endereco",$endereco);   
    $stmt->bindParam(":complemento",$complemento);
    $stmt->bindParam(":bairro",$bairro);
    $stmt->bindParam(":cep",$cep);
    $stmt->bindParam(":cidade",$cidade);
    $stmt->bindParam(":estado",$estado);
    $stmt->bindParam(":email",$email);
    $stmt->bindParam(":telefone_1",$telefone_1);
    $stmt->bindParam(":telefone_2",$telefone_2);
    $stmt->bindParam(":ocupacao",$ocupacao);
    $stmt->bindParam(":peso",$peso);
    $stmt->bindParam(":altura",$altura);
    $stmt->bindParam(":renda",$renda);
    $stmt->bindParam(":banco",$banco);
    $stmt->bindParam(":agencia",$agencia);
    $stmt->bindParam(":conta",$conta);
    $stmt->bindParam(":ocupacao",$ocupacao);
    $stmt->bindParam(":nome_benef_1",$nome_benef_1);
    $stmt->bindParam(":nome_benef_2",$nome_benef_2);
    $stmt->bindParam(":nome_benef_3",$nome_benef_3);
    $stmt->bindParam(":nome_benef_4",$nome_benef_4);
    $stmt->bindParam(":nome_benef_5",$nome_benef_5);
    $stmt->bindParam(":parentesco_benef_1",$parentesco_benef_1);
    $stmt->bindParam(":parentesco_benef_2",$parentesco_benef_2);
    $stmt->bindParam(":parentesco_benef_3",$parentesco_benef_3);
    $stmt->bindParam(":parentesco_benef_4",$parentesco_benef_4);
    $stmt->bindParam(":parentesco_benef_5",$parentesco_benef_5);
    $stmt->bindParam(":mailing",$mailing);
    $stmt->bindParam(":nomeMae",$nomeMae);
    $stmt->bindParam(":deficienteFisico",$deficienteFisico);
    $stmt->bindParam(":parentePolitico",$parentePolitico);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idMotivo",$idMotivo);
    $stmt->bindParam(":cpf_benef_1",$cpf_benef_1);
    $stmt->bindParam(":cpf_benef_2",$cpf_benef_2);
    $stmt->bindParam(":cpf_benef_3",$cpf_benef_3);
    $stmt->bindParam(":cpf_benef_4",$cpf_benef_4);
    $stmt->bindParam(":cpf_benef_5",$cpf_benef_5);
    $stmt->bindParam(":nome_mae_benef_1",$nome_mae_benef_1);
    $stmt->bindParam(":nome_mae_benef_2",$nome_mae_benef_2);
    $stmt->bindParam(":nome_mae_benef_3",$nome_mae_benef_3);
    $stmt->bindParam(":nome_mae_benef_4",$nome_mae_benef_4);
    $stmt->bindParam(":nome_mae_benef_5",$nome_mae_benef_5);
    $stmt->bindParam(":data_nascimento_benef_1",$data_nascimento_benef_1,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_2",$data_nascimento_benef_2,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_3",$data_nascimento_benef_3,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_4",$data_nascimento_benef_4,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_5",$data_nascimento_benef_5,PDO::PARAM_NULL);
    $rs = $stmt->execute();
    
   
//              $sp = "call insert_pedido_nao_venda ('{$nome}',
//            '{$cpf}',
//            '{$rg}',
//            '{$orgaoEmissor}',
//            '{$sexo}',
//            '{$estadoCivil}',
//            '{$dataNascimento}',
//            '{$endereco}',
//            '{$complemento}',
//            '{$bairro}',
//            '{$cep}',
//            '{$cidade}',
//            '{$estado}',
//            '{$email}',
//            '{$telefone_1}',
//            '{$telefone_2}',
//            '{$ocupacao}',
//            '{$peso}',
//            '{$altura}',
//            '{$renda}',
//            '{$banco}',
//            '{$agencia}',
//            '{$conta}',
//            '{$nome_benef_1}',
//            '{$nome_benef_2}',
//            '{$nome_benef_3}',
//            '{$nome_benef_4}',
//            '{$nome_benef_5}',
//            '{$parentesco_benef_1}',
//            '{$parentesco_benef_2}',
//            '{$parentesco_benef_3}',
//            '{$parentesco_benef_4}',
//            '{$parentesco_benef_5}',
//            '{$mailing}',
//            '{$nomeMae}',
//            '{$deficienteFisico}',
//            '{$parentePolitico}',
//            '{$idEmpresa}',
//            '{$idUsuario}',
//            '{$idMotivo}',
//            '{$cpf_benef_1}',
//            '{$cpf_benef_2}',
//            '{$cpf_benef_3}',
//            '{$cpf_benef_4}',
//            '{$cpf_benef_5}',
//            '{$nome_mae_benef_1}',
//            '{$nome_mae_benef_2}',
//            '{$nome_mae_benef_3}',
//            '{$nome_mae_benef_4}',
//            '{$nome_mae_benef_5}',
//            '{$data_nascimento_benef_1}',
//            '{$data_nascimento_benef_2}',
//            '{$data_nascimento_benef_3}',
//            '{$data_nascimento_benef_4}',
//            '{$data_nascimento_benef_5}')";
//            echo $sp;    
            
            
    header("location:../../../list_pedido_nao_venda.php");
        
    }else{
        
       
    $stmt       =   $PDO->prepare("call insert_pedido_venda ("
            . ":nome,"
            . ":cpf,"
            . ":rg,"
            . ":orgaoEmissor,"
            . ":sexo,"
            . ":estadoCivil,"
            . ":dataNascimento,"
            . ":endereco,"
            . ":complemento,"
            . ":bairro,"
            . ":cep,"
            . ":cidade,"
            . ":estado,"
            . ":email,"
            . ":telefone_1,"
            . ":telefone_2,"
            . ":ocupacao,"
            . ":peso,"
            . ":altura,"
            . ":renda,"
            . ":banco,"
            . ":agencia,"
            . ":conta,"
            . ":nome_benef_1,"
            . ":nome_benef_2,"
            . ":nome_benef_3,"
            . ":nome_benef_4,"
            . ":nome_benef_5,"
            . ":parentesco_benef_1,"
            . ":parentesco_benef_2,"
            . ":parentesco_benef_3,"
            . ":parentesco_benef_4,"
            . ":parentesco_benef_5,"
            . ":mailing,"
            . ":nomeMae,"
            . ":deficienteFisico,"
            . ":parentePolitico,"
            . ":idEmpresa,"
            . ":idUsuario,"
            . ":idProduto,"
            . ":cpf_benef_1,"
            . ":cpf_benef_2,"
            . ":cpf_benef_3,"
            . ":cpf_benef_4,"
            . ":cpf_benef_5,"
            . ":nome_mae_benef_1,"
            . ":nome_mae_benef_2,"
            . ":nome_mae_benef_3,"
            . ":nome_mae_benef_4,"
            . ":nome_mae_benef_5,"
            . ":data_nascimento_benef_1,"
            . ":data_nascimento_benef_2,"
            . ":data_nascimento_benef_3,"
            . ":data_nascimento_benef_4,"
            . ":data_nascimento_benef_5)");
    
    
    $stmt->bindParam(":nome",$nome);
    $stmt->bindParam(":cpf",$cpf);
    $stmt->bindParam(":rg",$rg);
    $stmt->bindParam(":orgaoEmissor",$orgaoEmissor);
    $stmt->bindParam(":sexo",$sexo);
    $stmt->bindParam(":estadoCivil",$estadoCivil);
    $stmt->bindParam(":dataNascimento",$dataNascimento);
    $stmt->bindParam(":endereco",$endereco);   
    $stmt->bindParam(":complemento",$complemento);
    $stmt->bindParam(":bairro",$bairro);
    $stmt->bindParam(":cep",$cep);
    $stmt->bindParam(":cidade",$cidade);
    $stmt->bindParam(":estado",$estado);
    $stmt->bindParam(":email",$email);
    $stmt->bindParam(":telefone_1",$telefone_1);
    $stmt->bindParam(":telefone_2",$telefone_2);
    $stmt->bindParam(":ocupacao",$ocupacao);
    $stmt->bindParam(":peso",$peso);
    $stmt->bindParam(":altura",$altura);
    $stmt->bindParam(":renda",$renda);
    $stmt->bindParam(":banco",$banco);
    $stmt->bindParam(":agencia",$agencia);
    $stmt->bindParam(":conta",$conta);
    $stmt->bindParam(":ocupacao",$ocupacao);
    $stmt->bindParam(":nome_benef_1",$nome_benef_1);
    $stmt->bindParam(":nome_benef_2",$nome_benef_2);
    $stmt->bindParam(":nome_benef_3",$nome_benef_3);
    $stmt->bindParam(":nome_benef_4",$nome_benef_4);
    $stmt->bindParam(":nome_benef_5",$nome_benef_5);
    $stmt->bindParam(":parentesco_benef_1",$parentesco_benef_1);
    $stmt->bindParam(":parentesco_benef_2",$parentesco_benef_2);
    $stmt->bindParam(":parentesco_benef_3",$parentesco_benef_3);
    $stmt->bindParam(":parentesco_benef_4",$parentesco_benef_4);
    $stmt->bindParam(":parentesco_benef_5",$parentesco_benef_5);
    $stmt->bindParam(":mailing",$mailing);
    $stmt->bindParam(":nomeMae",$nomeMae);
    $stmt->bindParam(":deficienteFisico",$deficienteFisico);
    $stmt->bindParam(":parentePolitico",$parentePolitico);
    $stmt->bindParam(":idEmpresa",$idEmpresa);
    $stmt->bindParam(":idUsuario",$idUsuario);
    $stmt->bindParam(":idProduto",$idProduto);    
    $stmt->bindParam(":cpf_benef_1",$cpf_benef_1);
    $stmt->bindParam(":cpf_benef_2",$cpf_benef_2);
    $stmt->bindParam(":cpf_benef_3",$cpf_benef_3);
    $stmt->bindParam(":cpf_benef_4",$cpf_benef_4);
    $stmt->bindParam(":cpf_benef_5",$cpf_benef_5);
    $stmt->bindParam(":nome_mae_benef_1",$nome_mae_benef_1);
    $stmt->bindParam(":nome_mae_benef_2",$nome_mae_benef_2);
    $stmt->bindParam(":nome_mae_benef_3",$nome_mae_benef_3);
    $stmt->bindParam(":nome_mae_benef_4",$nome_mae_benef_4);
    $stmt->bindParam(":nome_mae_benef_5",$nome_mae_benef_5);
    $stmt->bindParam(":data_nascimento_benef_1",$data_nascimento_benef_1,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_2",$data_nascimento_benef_2,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_3",$data_nascimento_benef_3,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_4",$data_nascimento_benef_4,PDO::PARAM_NULL);
    $stmt->bindParam(":data_nascimento_benef_5",$data_nascimento_benef_5,PDO::PARAM_NULL);
    $rs = $stmt->execute();
    
//   $sp = "call insert_pedido_venda ('{$nome}',
//            '{$cpf}',
//            '{$rg}',
//            '{$orgaoEmissor}',
//            '{$sexo}',
//            '{$estadoCivil}',
//            '{$dataNascimento}',
//            '{$endereco}',
//            '{$complemento}',
//            '{$bairro}',
//            '{$cep}',
//            '{$cidade}',
//            '{$estado}',
//            '{$email}',
//            '{$telefone_1}',
//            '{$telefone_2}',
//            '{$ocupacao}',
//            '{$peso}',
//            '{$altura}',
//            '{$renda}',
//            '{$banco}',
//            '{$agencia}',
//            '{$conta}',
//            '{$nome_benef_1}',
//            '{$nome_benef_2}',
//            '{$nome_benef_3}',
//            '{$nome_benef_4}',
//            '{$nome_benef_5}',
//            '{$parentesco_benef_1}',
//            '{$parentesco_benef_2}',
//            '{$parentesco_benef_3}',
//            '{$parentesco_benef_4}',
//            '{$parentesco_benef_5}',
//            '{$mailing}',
//            '{$nomeMae}',
//            '{$deficienteFisico}',
//            '{$parentePolitico}',
//            '{$idEmpresa}',
//            '{$idUsuario}',
//            '{$idProduto}',            
//            '{$cpf_benef_1}',
//            '{$cpf_benef_2}',
//            '{$cpf_benef_3}',
//            '{$cpf_benef_4}',
//            '{$cpf_benef_5}',
//            '{$nome_mae_benef_1}',
//            '{$nome_mae_benef_2}',
//            '{$nome_mae_benef_3}',
//            '{$nome_mae_benef_4}',
//            '{$nome_mae_benef_5}',
//            '{$data_nascimento_benef_1}',
//            '{$data_nascimento_benef_2}',
//            '{$data_nascimento_benef_3}',
//            '{$data_nascimento_benef_4}',
//            '{$data_nascimento_benef_5}')";
//            echo $sp;
//            var_dump($rs);
//            exit;
    
  header("location:../../../list_pedido_venda_pendente.php");
    }       
     

    
    