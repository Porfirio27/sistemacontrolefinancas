<%-- 
    Document   : form_editarpessoa
    Created on : 26/10/2024, 00:56:45
    Author     : Porfirio
--%>

<%@page import="model.Pessoa"%>
<%@page import="control.PessoaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link rel="stylesheet" href="form_cadastrarpessoa.css">
    </head>
    <body>
        <h1>Editar dados da Pessoa</h1>

      <%

            String idStr = request.getParameter("id");
            
            int id = Integer.parseInt(idStr);
            PessoaDAO pessoaDAO = new PessoaDAO();
            Pessoa pessoa = pessoaDAO.listaPessoa(id);
            if (pessoa != null) {
                
            }else{
                
            }

        %>


        

            <label for="nome">Nome:</label><br>
            <input type="text" id="nome" name="nome" required autofocus ><br>

            <label for="telefone">Telefone:</label><br>
            <input type="tel" id="telefone" name="telefone" required ><br>

            <label for="cpf">CPF:</label><br>
            <input type="text" id="cpf" name="cpf" required ><br>

            <label for="endereco">Endereço:</label><br>
            <input type="text" id="endereco" name="endereco" required ><br>

            <input type="submit" value="Cadastrar" class="glow-on-hover" >



        
    </body>
</html>
