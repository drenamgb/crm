<?php
require_once ("src/lib/fpdf/fpdf.php");
header("Content-type: text/html; charset=utf-8");

$idPedidoVenda = filter_input(INPUT_POST,'idPedidoVenda',FILTER_VALIDATE_INT);

require_once ("src/connect/config.php");
$stmt       =   $PDO->prepare("call select_pedido_venda_idPedido (:idPedidoVenda)");
$stmt->bindParam(":idPedidoVenda",$idPedidoVenda);
$rs = $stmt->execute();
$retorno = $stmt->fetch();

$pdf=new FPDF("P","pt","A4");// Instanciando a classe FPDF
$pdf->AddPage();// Adcionando a página
$pdf->setTitle("Relatório",true);
$pdf->setAuthor("3MK",true);

   /*----------------------- Cabeçalho do Formulário ------------------------ */
    
   $pdf->SetXY(15,15);// Posicionando as células
   $pdf->Cell(563,85,"",1,1,'C');// Célula do cabeçalho
   $pdf->SetFont('Arial','B',15);
   $pdf->SetXY(205,25);
   $pdf->Cell(5,15,"PEDIDO ".$idPedidoVenda);
   $pdf->SetFont('Arial','I',9);
   
    $pdf->text(460,30,"Emitido em: ".date("d/m/Y"));   

   $pdf->SetXY(25,55);
   $pdf->Cell(15,15,"Produto:");
   $pdf->SetXY(80,55);
   $pdf->Cell(90,15,utf8_decode($retorno['produto']),'C');
// LINHA 1
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,110);// Posicionando as células
   $pdf->Cell(60,15,"Pedido",1,1,'C',false);// Configurando as células
   $pdf->SetXY(75,110);
   $pdf->Cell(200,15,"Vendedor",1,1,'C');
   $pdf->SetXY(275,110);
   $pdf->Cell(100,15,"Data Venda",1,1,'C');
   $pdf->SetXY(375,110);
   $pdf->Cell(100,15,"R$",1,1,'C');
   
    $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,125);
   $pdf->Cell(60,15,$idPedidoVenda,1,1,'C');
   $pdf->SetXY(75,125);
   $pdf->Cell(200,15,$retorno['usuario'],1,1,'C');
   $pdf->SetXY(275,125);
   $pdf->Cell(100,15,$retorno['timestamp'],1,1,'C');
   $pdf->SetXY(375,125);
   $pdf->Cell(100,15,number_format($retorno['precoVenda'],2,".","."),1,1,'C');
   
// LINHA 2
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,140);// Posicionando as células
   $pdf->Cell(350,15,"Cliente",1,1,'C',false);// Configurando as células
   $pdf->SetXY(365,140);
   $pdf->Cell(100,15,"CPF",1,1,'C');
   $pdf->SetXY(465,140);
   $pdf->Cell(100,15,"Data Nascimento",1,1,'C');
   
   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,155);
   $pdf->Cell(350,15,$retorno['cliente'],1,1,'C');
   $pdf->SetXY(365,155);
   $pdf->Cell(100,15,$retorno['cpf'],1,1,'C');
   $pdf->SetXY(465,155);
   $pdf->Cell(100,15,$retorno['dataNascimento'],1,1,'C');
   
   
 //Linha 3  
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,170);
   $pdf->Cell(35,15,"Sexo",1,1,'C');
   $pdf->SetXY(50,170);
   $pdf->Cell(70,15,"Rg",1,1,'C');
   $pdf->SetXY(120,170);
   $pdf->Cell(70,15,utf8_decode("Órgao Emissor"),1,1,'C');
   $pdf->SetXY(190,170);
   $pdf->Cell(100,15,utf8_decode("Estado Civíl"),1,1,'C');
   $pdf->SetXY(290,170);
   $pdf->Cell(75,15,utf8_decode("Parente Político"),1,1,'C');
   $pdf->SetXY(365,170);
   $pdf->Cell(200,15,utf8_decode("Nome Mãe"),1,1,'C');
   
   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,185);
   $pdf->Cell(35,15,$retorno['sexo'],1,1,'C');
   $pdf->SetXY(50,185);
   $pdf->Cell(70,15,utf8_decode($retorno['rg']),1,1,'C');
   $pdf->SetXY(120,185);
   $pdf->Cell(70,15,utf8_decode($retorno['orgaoEmissor']),1,1,'C');
   $pdf->SetXY(190,185);
   $pdf->Cell(100,15,utf8_decode($retorno['estadoCivil']),1,1,'C');
   $pdf->SetXY(290,185);
   $pdf->Cell(75,15,utf8_decode($retorno['parentePolitico']),1,1,'C');
   $pdf->SetXY(365,185);
   $pdf->Cell(200,15,utf8_decode($retorno['nomeMae']),1,1,'C');
   
   //Linha 4  
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,200);
   $pdf->Cell(60,15,"Cep",1,1,'C');
   $pdf->SetXY(75,200);
   $pdf->Cell(400,15,utf8_decode("Endereço"),1,1,'C');
   
   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,215);
   $pdf->Cell(60,15,$retorno['cep'],1,1,'C');
   $pdf->SetXY(75,215);
   $pdf->Cell(400,15,utf8_decode($retorno['endereco']),1,1,'C');
   

    //Linha 5   
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,230);
   $pdf->Cell(100,15,"Complemento",1,1,'C');
   $pdf->SetXY(115,230);
   $pdf->Cell(200,15,"Bairro",1,1,'C');
   $pdf->SetXY(315,230);
   $pdf->Cell(200,15,"Cidade",1,1,'C');
   $pdf->SetXY(515,230);
   $pdf->Cell(50,15,"UF",1,1,'C');

   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,245);
   $pdf->Cell(100,15,utf8_decode($retorno['complemento']),1,1,'C');
   $pdf->SetXY(115,245);
   $pdf->Cell(200,15,utf8_decode($retorno['bairro']),1,1,'C');
   $pdf->SetXY(315,245);
   $pdf->Cell(200,15,utf8_decode($retorno['cidade']),1,1,'C');
   $pdf->SetXY(515,245);
   $pdf->Cell(50,15,$retorno['estado'],1,1,'C');
   
   //Linha 6 
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,260);
   $pdf->Cell(250,15,"Email",1,1,'C');
   $pdf->SetXY(265,260);
   $pdf->Cell(100,15,"Telefone Discado",1,1,'C');
   $pdf->SetXY(365,260);
   $pdf->Cell(100,15,"Telefone 2",1,1,'C');

   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,275);
   $pdf->Cell(250,15,$retorno['email'],1,1,'C');
   $pdf->SetXY(265,275);
   $pdf->Cell(100,15,$retorno['telefone_1'],1,1,'C');
   $pdf->SetXY(365,275);
   $pdf->Cell(100,15,$retorno['telefone_2'],1,1,'C');
   
   
    //Linha 7   
   $pdf->SetFont('Arial','B',9);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,290);
   $pdf->Cell(250,15,utf8_decode("Profissão"),1,1,'C');
   $pdf->SetXY(265,290);
   $pdf->Cell(50,15,"Peso",1,1,'C');
   $pdf->SetXY(315,290);
   $pdf->Cell(50,15,"Altura",1,1,'C');

   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,305);
   $pdf->Cell(200,15,utf8_decode($retorno['ocupacao']),1,1,'C');
   $pdf->SetXY(265,305);
   $pdf->Cell(50,15,$retorno['peso'],1,1,'C');
   $pdf->SetXY(315,305);
   $pdf->Cell(50,15,$retorno['altura'],1,1,'C');
    
    //Linha 8   
   $pdf->SetFont('Arial','B',9);
    $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,320);
   $pdf->Cell(200,15,"Banco",1,1,'C');
   $pdf->SetXY(215,320);
   $pdf->Cell(70,15,utf8_decode("Agência"),1,1,'C');
   $pdf->SetXY(285,320);
   $pdf->Cell(70,15,"Conta",1,1,'C');
   $pdf->SetXY(355,320);
   $pdf->Cell(100,15,"Renda Mensal",1,1,'C');

   $pdf->SetFont('Arial','I',9);
   $pdf->SetTextColor(100,100,100);
   $pdf->SetXY(15,335);
   $pdf->Cell(200,15,utf8_decode($retorno['banco']),1,1,'C');
   $pdf->SetXY(215,335);
   $pdf->Cell(70,15,$retorno['agencia'],1,1,'C');
   $pdf->SetXY(285,335);
   $pdf->Cell(70,15,$retorno['conta'],1,1,'C');
   $pdf->SetXY(355,335);
   $pdf->Cell(100,15,$retorno['renda'],1,1,'C');
   
    //Linha 8   
   $pdf->SetFont('Arial','B',8);
   $pdf->SetTextColor(0,0,0);
   $pdf->SetXY(15,350);
   $pdf->Cell(10,15,"#",1,1,'C');
   $pdf->SetXY(25,350);
   $pdf->Cell(200,15,"Dependentes",1,1,'C');
   $pdf->SetXY(225,350);
   $pdf->Cell(80,15,"Grau Parentesco",1,1,'C');
   $pdf->SetXY(305,350);
   $pdf->Cell(80,15,"CPF",1,1,'C');
   $pdf->SetXY(385,350);
   $pdf->Cell(100,15,utf8_decode("Nome Mãe"),1,1,'C');
   $pdf->SetXY(485,350);
   $pdf->Cell(80,15,"Data Nascimento",1,1,'C');
 
   $pdf->SetFont('Arial','I',8);
   $pdf->SetTextColor(100,100,100);
//benef 1
   $pdf->SetXY(15,365);
   $pdf->Cell(10,15,"1",1,1,'C');
   $pdf->SetXY(25,365);
   $pdf->Cell(200,15,utf8_decode($retorno['nome_benef_1']),1,1,'C');
   $pdf->SetXY(225,365);
   $pdf->Cell(80,15,utf8_decode($retorno['parentesco_benef_1']),1,1,'C');
   $pdf->SetXY(305,365);
   $pdf->Cell(80,15,utf8_decode($retorno['cpf_benef_1']),1,1,'C');
   $pdf->SetXY(385,365);
   $pdf->Cell(100,15,utf8_decode($retorno['nome_mae_benef_1']),1,1,'C');
   $pdf->SetXY(485,365);
   $pdf->Cell(80,15,utf8_decode($retorno['data_nascimento_benef_1']),1,1,'C');
   //benef 2
   $pdf->SetXY(15,380);
   $pdf->Cell(10,15,"2",1,1,'C');
   $pdf->SetXY(25,380);
   $pdf->Cell(200,15,utf8_decode($retorno['nome_benef_2']),1,1,'C');
   $pdf->SetXY(225,380);
   $pdf->Cell(80,15,utf8_decode($retorno['parentesco_benef_2']),1,1,'C');
   $pdf->SetXY(305,380);
   $pdf->Cell(80,15,utf8_decode($retorno['cpf_benef_1']),1,1,'C');
   $pdf->SetXY(385,380);
   $pdf->Cell(100,15,utf8_decode($retorno['nome_mae_benef_1']),1,1,'C');
   $pdf->SetXY(485,380);
   $pdf->Cell(80,15,utf8_decode($retorno['data_nascimento_benef_1']),1,1,'C');
   //benef 3
   $pdf->SetXY(15,395);
   $pdf->Cell(10,15,"3",1,1,'C');
   $pdf->SetXY(25,395);
   $pdf->Cell(200,15,utf8_decode($retorno['nome_benef_3']),1,1,'C');
   $pdf->SetXY(225,395);
   $pdf->Cell(120,15,utf8_decode($retorno['parentesco_benef_3']),1,1,'C');
   $pdf->SetXY(305,395);
   $pdf->Cell(80,15,utf8_decode($retorno['cpf_benef_1']),1,1,'C');
   $pdf->SetXY(385,395);
   $pdf->Cell(100,15,utf8_decode($retorno['nome_mae_benef_1']),1,1,'C');
   $pdf->SetXY(485,395);
   $pdf->Cell(80,15,utf8_decode($retorno['data_nascimento_benef_1']),1,1,'C');
   //benef 4
   $pdf->SetXY(15,410);
   $pdf->Cell(10,15,"4",1,1,'C');
   $pdf->SetXY(25,410);
   $pdf->Cell(200,15,utf8_decode($retorno['nome_benef_4']),1,1,'C');
   $pdf->SetXY(225,410);
   $pdf->Cell(120,15,utf8_decode($retorno['parentesco_benef_4']),1,1,'C');
   $pdf->SetXY(305,410);
   $pdf->Cell(80,15,utf8_decode($retorno['cpf_benef_1']),1,1,'C');
   $pdf->SetXY(385,410);
   $pdf->Cell(100,15,utf8_decode($retorno['nome_mae_benef_1']),1,1,'C');
   $pdf->SetXY(485,410);
   $pdf->Cell(80,15,utf8_decode($retorno['data_nascimento_benef_1']),1,1,'C');
   //benef 5
   $pdf->SetXY(15,425);
   $pdf->Cell(10,15,"5",1,1,'C');
   $pdf->SetXY(25,425);
   $pdf->Cell(200,15,utf8_decode($retorno['nome_benef_5']),1,1,'C');
   $pdf->SetXY(225,425);
   $pdf->Cell(120,15,utf8_decode($retorno['parentesco_benef_5']),1,1,'C');
   $pdf->SetXY(305,425);
   $pdf->Cell(80,15,utf8_decode($retorno['cpf_benef_1']),1,1,'C');
   $pdf->SetXY(385,425);
   $pdf->Cell(100,15,utf8_decode($retorno['nome_mae_benef_1']),1,1,'C');
   $pdf->SetXY(485,425);
   $pdf->Cell(80,15,utf8_decode($retorno['data_nascimento_benef_1']),1,1,'C');
   //*----------------------------------------------------------------------------*/
   //obs
   $pdf->SetXY(15,450);
   $pdf->Cell(40,15,"OBS",1,1,'C');
   $pdf->SetXY(55,450);
   $pdf->Cell(300,15,utf8_decode($retorno['obs']),1,1,'C');
   
   //deficiencia ********************************************************//
   
   
   
   $pdf->SetXY(15,465);
   $pdf->Cell(50,15,utf8_decode("Deficiência"),1,1,'C');
   $pdf->SetXY(65,465);
   $pdf->Cell(500,15,utf8_decode($retorno['deficienteFisico']),1,1,'C');
   
  
   /*------------------------------ Rodapé ---------------------------------*/
   $pdf->text(260,800,"Versao 1.0");

   $pdf->Close();
$pdf->Output();// Saída do documento
?>