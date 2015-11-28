<!-- Arquivo head.jsp que cont�m o c�digo referente a tag <head> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript">
    function validarEmail(email) {
        var filtro = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if (filtro.test(email)) {
            return true;
        }
        return false;
    }
    
    function validarTamanho(texto, num) {
        alert('Valor Texto = '+texto.length + 'valor numero = '+num);
        if (texto.length < num) {
            return false;
        } else {
            return true;
        }
    }
    function validarVazio(texto) {
        if (texto === '') {
            return false;
        } else {
            return true;
        }
    }
    
    function validarCampoMaior(texto, num) {
        if (texto.length > num){
            return false;
        } else{
            return true;
        }
    }    
    
    function validar() {                
        var login = document.getElementById("apelido1").value;
        var senha = document.getElementById("senha1").value;
        if (!validarVazio(login)) {
            alert('Campo apelido/email � obrigatorio');
            return false;
        }
        if (!validarVazio(senha)) {
            alert('Campo senha � obrigatorio');
            return false;
        }
        if (!validarTamanho(login, 8)) {
            if (!validarEmail(login)) {
                alert('O campo apelido/email deve ser um email v�lido ou um apelido de no minimo 8 caracteres');
                return false;
            }            
        }
        if (!validarTamanho(senha, 8)) {
            alert('Senha deve ter no minimo 8 caracteres');
            return false;
        }
        return true;
    }
    
    function validarCadastroUsuario() {
        var apelido = document.getElementById('apelido2').value;
        var senha = document.getElementById('senha2').value;
        var email = document.getElementById('email2').value;
        
        if (!validarVazio(apelido)) {
            alert('Campo apelido � obrigatorio');
            return false;
        }
        if (!validarVazio(senha)) {
            alert('Campo senha � obrigatorio');
            return false;
        }
        
        if (!validarVazio(email)) {
            alert('Campo E-mail � obrigatorio');
            return false;
        }        
        
        if (!validarCampoMaior(email, 100)) { 
            alert('A campo Email n�o pode ter mais que 100 caracteres');
            return false;
        }
        
        if (!validarCampoMaior(senha, 64)) {
            alert('O campo senha n�o pode ter mais que 64 caracteres');
            return false;
        }
        
        if (!validarCampoMaior(apelido,50)) {
            alert('O campo Apelido n�o pode ter mais de 50 carecteres');
            return false;
        }
        
        if (!validarTamanho(apelido, 8)) {
                alert('O campo apelido deve ter no minimo 8 caracteres');
                return false;
        }
        if (!validarTamanho(senha, 8)) {
            alert('Senha deve ter no minimo 8 caracteres');
            return false;
        }
        
        if (!validarTamanho(email, 10)) {
            alert('E-mail deve ter no minimo 10 caracteres');
            return false;
        }
        return true;        
    }
    
</script>
<meta charset="utf-8" />
<style type="text/css">
    .erro {
        color: red;
        font-weight: bold;
        font-size: 20px;
    }
    table { border-collapse: collapse; }
    table, th, td { border: 1px solid black; }
    th, td { padding: 5px; }
</style> 