<%-- 
    Document   : index
    Created on : 21/10/2024, 01:30:00
    Author     : Porfirio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Home</title>
        <link rel="stylesheet" href="index.css">
    <header>    
        <h1>
            Sistema Controle Finanças
        </h1>
    </header>
</head>
<body>   

    <nav>
        <a href="apresentacao.jsp" target="centro"> <button class="glow-on-hover" type="button">Home</button></a>
        <a href="form_cadastrarpessoa.jsp" target="centro"> <button class="glow-on-hover" type="button">Cadastrar Pessoa</button></a>
        <a href="listartodaspessoas.jsp" target="centro"> <button class="glow-on-hover" type="button">Listar Pessoa</button></a>
        <a href="pesquisapessoa.jsp" target="centro"> <button class="glow-on-hover" type="button">Pesquisar Pessoa</button></a>
    </nav>

    <main>
        <iframe src="apresentacao.jsp" name="centro" ></iframe>
    </main>

    <footer>
        <p>
            Desenvolvido por: Vinícius Porfirio de Oliveira!
        </p>
    </footer>





</body>
</html>
