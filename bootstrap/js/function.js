function isDate(txtDate)
{
    var currVal = txtDate;
    if(currVal == '')
        return false;

    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; //Declare Regex
    var dtArray = currVal.match(rxDatePattern); // is format OK?

    if (dtArray == null) 
        return false;

    //Checks for mm/dd/yyyy format.
    dtMonth = dtArray[1];
    dtDay= dtArray[3];
    dtYear = dtArray[5];        

    if (dtMonth < 1 || dtMonth > 12) 
        return false;
    else if (dtDay < 1 || dtDay> 31) 
        return false;
    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
        return false;
    else if (dtMonth == 2) 
    {
        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
        if (dtDay> 29 || (dtDay ==29 && !isleap)) 
                return false;
    }
    return true;
}

function validaCPF(strCPF){
// if(strCPF===null || strCPF==""){alert("NULO"); return false;}
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace(' ','');
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace('.','');
strCPF = strCPF.replace('-','');
strCPF = strCPF.replace('/','');
if(strCPF.length<11){
//alert("CPF Inválido");
document.getElementById('msg').innerHTML = "<img src=src/lib/img/error.png width=13></img>";
return false;
}
if(strCPF.length>11){
//alert("CPF Inválido");
return true;
}
var Soma;
var Resto;
Soma = 0;
if (strCPF == "00000000000" || strCPF == "11111111111" || strCPF == "22222222222" ||
strCPF == "33333333333" || strCPF == "44444444444" || strCPF == "55555555555" || 
strCPF == "66666666666" || strCPF == "77777777777" ||
strCPF == "88888888888" || strCPF == "99999999999" ) { 
// alert("CPF Inválido");
document.getElementById('msg').innerHTML = "<img src=src/lib/img/error.png width=13></img>";
return false;
}
for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
Resto = (Soma * 10) % 11;

if ((Resto == 10) || (Resto == 11))  Resto = 0;
if (Resto != parseInt(strCPF.substring(9, 10)) ) { 
document.getElementById('msg').innerHTML = "<img src=src/lib/img/error.png width=13></img>";
return false;
}
Soma = 0;
for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
Resto = (Soma * 10) % 11;

if ((Resto == 10) || (Resto == 11))  Resto = 0;
if (Resto != parseInt(strCPF.substring(10, 11) ) ) {
document.getElementById('msg').innerHTML = "<img src=src/lib/img/error.png width=13></img>";
return false;
}
document.getElementById('msg').innerHTML = "<img src=src/lib/img/check.png width=13></img>";
return true;
}


function validaCnpj(str,msg){
document.getElementById(msg).innerHTML = "";
str = str.replace('.','');
str = str.replace('.','');
str = str.replace('.','');
str = str.replace('-','');
str = str.replace('/','');
cnpj = str;
var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
digitos_iguais = 1;
if (cnpj.length < 14 && cnpj.length < 15){
document.getElementById(msg).innerHTML = "<img src=img/error.png width=13></img>";
//alert("CPF ou CNPJ Inválido!");
return false;
}
for (i = 0; i < cnpj.length - 1; i++)
if (cnpj.charAt(i) != cnpj.charAt(i + 1))
{
digitos_iguais = 0;
break;
}
if (!digitos_iguais)
{
tamanho = cnpj.length - 2
numeros = cnpj.substring(0,tamanho);
digitos = cnpj.substring(tamanho);
soma = 0;
pos = tamanho - 7;
for (i = tamanho; i >= 1; i--)
{
soma += numeros.charAt(tamanho - i) * pos--;
if (pos < 2)
    pos = 9;
}
resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
if (resultado != digitos.charAt(0)){
//alert("CPF ou CNPJ Inválido!");
document.getElementById(msg).innerHTML = "<img src=img/error.png width=13></img>";
return false;
}
tamanho = tamanho + 1;
numeros = cnpj.substring(0,tamanho);
soma = 0;
pos = tamanho - 7;
for (i = tamanho; i >= 1; i--)
{
soma += numeros.charAt(tamanho - i) * pos--;
if (pos < 2)
    pos = 9;
}
resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
if (resultado != digitos.charAt(1)){
//alert("CPF ou CNPJ Inválido!");
document.getElementById(msg).innerHTML = "<img src=img/error.png width=13></img>";
return false;
}
document.getElementById(msg).innerHTML = "<img src=img/check.png width=13></img>";
return true;
}
else{
document.getElementById(msg).innerHTML = "<img src=img/error.png width=13></img>";
return false;
}
}

function ValidaEmail()
{
  var obj = eval("document.forms[0].email");
  var txt = obj.value;
  if ((txt.length != 0) && ((txt.indexOf("@") < 1) || (txt.indexOf('.') < 7)))
  {
    document.getElementById(msg).innerHTML = "<img src=img/error.png width=13></img>";
	
  }else{
      document.getElementById(msg).innerHTML = "<img src=img/check.png width=13></img>";
  }
}

function mascara(w, e, m, r, a) {

    // Cancela se o evento for Backspace
    if (!e)
        var e = window.event
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;

    // Variáveis da função
    var txt = (!r) ? w.value.replace(/[^\d]+/gi, '') : w.value.replace(/[^\d]+/gi, '').reverse();
    var mask = (!r) ? m : m.reverse();
    var pre = (a) ? a.pre : "";
    var pos = (a) ? a.pos : "";
    var ret = "";

    if (code == 9 || code == 8 || txt.length == mask.replace(/[^#]+/g, '').length)
        return false;

    // Loop na máscara para aplicar os caracteres
    for (var x = 0, y = 0, z = mask.length; x < z && y < txt.length; ) {
        if (mask.charAt(x) != '#') {
            ret += mask.charAt(x);
            x++;
        } else {
            ret += txt.charAt(y);
            y++;
            x++;
        }
    }

    // Retorno da função
    ret = (!r) ? ret : ret.reverse()
    w.value = pre + ret + pos;
}

function pesquisaCep(cep){
    var cepLimpo = cep.replace(/\D/g, '');    
    if(!cepLimpo){return false;}
    if(cepLimpo.length !== 8){return false;}
     $.ajax({
        url: "https://viacep.com.br/ws/"+cepLimpo+"/json/",
        dataType: "json",
        async : true
    }).done(function(retorno) {
        if(retorno['erro']){
            document.getElementById("endereco").value = "";         
            document.getElementById("bairro").value = "";         
            document.getElementById("cidade").value = "";         
            document.getElementById("estado").value = ""; 
        }else{
            document.getElementById("endereco").value = retorno['logradouro'];         
            document.getElementById("bairro").value = retorno['bairro'];         
            document.getElementById("cidade").value = retorno['localidade'];         
            document.getElementById("estado").value = retorno['uf']; 
        }        
        console.log(retorno);
    }).fail(function(jqXHR, textStatus ) {
        console.log("Request failed: " + textStatus);
         
    });
    
}