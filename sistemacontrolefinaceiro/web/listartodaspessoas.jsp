<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pessoa"%>
<%@page import="control.PessoaDAO"%>

<html>
    <head>
        <title>Lista de Pessoas</title>
        <link rel="stylesheet" href="listartodaspessoas.css">
    </head>
    <body>
        <div class="container">
            <h1>Lista de Pessoas</h1>
            <table border="1" class="table">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>CPF</th>
                    <th>Endereço</th>
                    <th>Editar</th>
                    <th>Deletar</th>
                </tr>
                <%
                    // Cria uma instância do DAO e obtém a lista de pessoas
                    PessoaDAO pessoaDAO = new PessoaDAO();
                    ArrayList<Pessoa> listarpessoas = pessoaDAO.listaPessoas();
                    // Itera sobre a lista de pessoas e exibe na tabela
                    for (Pessoa pessoa : listarpessoas) {
                %>
                <tr>
                    <td><%= pessoa.getId()%></td>
                    <td><%= pessoa.getNome()%></td>
                    <td><%= pessoa.getTelefone()%></td>
                    <td><%= pessoa.getCpf()%></td>
                    <td><%= pessoa.getEndereco()%></td>
                    <td>
                        <form action="form_editarpessoa.jsp" method="POST">
                            <input type="hidden" name="id" value="<%= pessoa.getId()%>" />
                            <input type="submit" class="glow-on-hover" value="Editar">
                        </form>
                    </td>
                    <td>
                        <form action="excluir.jsp" method="POST" onsubmit="return confirm('Deseja realmente deletar?')">
                            <input type="hidden" name="id" value="<%= pessoa.getId()%>" />
                            <input type="hidden" name="nome" value="<%= pessoa.getNome()%>" />
                            <input type="button" class="glow-on-hover" value="Deletar">
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
</html>
