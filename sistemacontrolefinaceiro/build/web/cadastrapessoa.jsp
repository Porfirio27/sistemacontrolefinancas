<%-- 
    Document   : cadastrapessoa
    Created on : 21/10/2024, 21:33:40
    Author     : Porfirio
--%>

<%@page import="control.PessoaDAO"%>
<%@page import="model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Pessoa</title>
        <link rel="stylesheet" href="cadastrapessoa.css">

    </head>
    <body>
    <center>
        <h1>Usuários Cadastrados</h1>

        <%

            String nome = request.getParameter("nome");
            String telefone = request.getParameter("telefone").replaceAll("\\D", "");
            String cpf = request.getParameter("cpf").replaceAll("\\D", "");
            String endereco = request.getParameter("endereco");

            Pessoa pessoa = new Pessoa();

            pessoa.setNome(nome);
            pessoa.setTelefone(telefone);
            pessoa.setCpf(cpf);
            pessoa.setEndereco(endereco);

            PessoaDAO pessoadao = new PessoaDAO();

            boolean sucesso = pessoadao.cadastrapessoa(pessoa);
            if (sucesso == true) {
                out.println("Dados Salvo!!!");
            } else {
                out.println("Erro ao Salvar!!!");
            }

        %>
        <br>
        <br>
        <a href="form_cadastrarpessoa.jsp"><input type="button" class="glow-on-hover" value="Voltar"></a><br><br>
    </center>    
</body>
</html>
