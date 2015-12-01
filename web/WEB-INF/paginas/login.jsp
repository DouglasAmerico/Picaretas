<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String mensagemErro = (String) request.getAttribute("mensagem_erro");
    String ape = (String) request.getAttribute("ape");
    ape = ape == null ? "" : ape;
    String sen = (String) request.getAttribute("sen");
    sen = sen == null ? "" : sen;
%>
<html>
    <head>
        <%@include file="/WEB-INF/includes/head.jsp" %>               
        <title>Login</title>
    </head>
    <body>
        <% if (mensagemErro != null) {%>
        <p class="erro"><%= mensagemErro%></p>
        <% }%>
        <h1>Login</h1>
        <form name="form-login" method="POST" action="Login" onsubmit="return validar()" >
            <input type="hidden" name="acao" value="login" />
            <label>Apelido/E-mail:</label>
            <input type="text" id="apelido1" name="apelido" value="<%= ape%>" />
            <br />
            <label>Senha:</label>
            <input type="password" id="senha1" name="senha" value="<%= sen%>" />  
            <br />
            <input type="submit" value="Entrar" />
        </form>
        <h1>Cadastro</h1>
        <form name="form-cadastro" method="POST" action="Login" onsubmit="return validarCadastroUsuario()">
            <input type="hidden" name="acao" value="cadastro" />
            <label>Apelido:</label>
            <input type="text" id="apelido2" name="apelido" value="" />
            <br />
            <label>E-mail:</label>
            <input type="text" id="email2" name="email" value="" />
            <br />
            <label>Senha:</label>
            <input type="password" id="senha2" name="senha" value="" />
            <br />
            <input type="submit" value="Cadastrar" />
        </form>
        <%@include file="/WEB-INF/includes/footer.jsp" %>
    </body>
</html>