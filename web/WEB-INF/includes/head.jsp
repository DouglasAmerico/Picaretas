<!-- Arquivo head.jsp que contém o código referente a tag <head> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8" />

<script type="text/javascript">

    function validarEmail(email) {
        var filtro = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if (filtro.test(email)) {
            return true;
        }
        return false;
    }

    function validarTamanho(texto, num) {
        if (texto.length < num) {
            return false;
        } else {
            return true;
        }
    }
    
    function validarValorMenor(texto, num) {
        if (texto.length > num){
            return false;
        } else{
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

    function validarCadastro() {
        var apelido = document.formlogin.apelido.value;
        var senha = document.formlogin.senha.value;
        var email = document.FormCadastro.email.value;

        if (!validarVazio(login)) {
            alert('Campo apelido é obrigatorio');
            return false;
        }

        if (!validarVazio(senha)) {
            alert('Campo senha é obrigatorio');
            return false;
        }
        
        if (!validarVazio(email)) {
            alert('Campo E-mail é obrigatorio');
            return false;
        }        
        
        if (!validarValorMenor(email, 100)) {
            alert('A campo Email não pode ter mais que 100 caracteres');
            return false;
        }
        
        if (!validarValorMenor(senha, 64)) {
            alert('O campo senha não pode ter mais que 64 caracteres');
            return false;
        }
        
        if (!validarValorMenor(apelido,50)) {
            alert('O campo Apelido não pode ter mais de 50 carecteres');
            return false;
        }
        
        if (!validarTamanho(login, 8)) {
                alert('O campo apelido/ deve serum apelido de no minimo 8 caracteres');
                return false;
        }
        if (!validarTamanho(senha, 8)) {
            alert('Senha deve ter no minimo 8 caracteres');
            return false;
        }
        
        if (!validarTamanho(email, 10)) {
            alert('E-mail deve ter no minimo 10 caracteres')
        }
        return true;        
    }

</script>

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