<%-- 
    Document   : form_cadastrarpessoa
    Created on : 21/10/2024, 22:02:37
    Author     : Porfirio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastar Pessoa</title>
        <link rel="stylesheet" href="form_cadastrarpessoa.css">

    </head>
    <body>
    <center>
        <h1><p>Cadastrar Pessoa</p></h1>
    </center>
    <form action="cadastrapessoa.jsp" method="post">

        <label for="nome">Nome:</label><br>
        <input type="text" id="nome" name="nome" required autofocus ><br>

        <label for="telefone">Telefone:</label><br>
        <input type="tel" id="telefone" name="telefone" required ><br>

        <label for="cpf">CPF:</label><br>
        <input type="text" id="cpf" name="cpf" required ><br>

        <label for="endereco">Endereço:</label><br>
        <input type="text" id="endereco" name="endereco" required ><br>

        <input type="submit" value="Cadastrar" class="glow-on-hover" >
        <a href="apresentacao.jsp"><input type="button" class="glow-on-hover" value="Voltar"></a>


    </form>
</body>
</html>
