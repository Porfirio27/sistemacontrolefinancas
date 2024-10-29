package control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Pessoa;

public class PessoaDAO {

    ArrayList<Pessoa> listaPessoa = new ArrayList();

    public boolean cadastrapessoa(Pessoa pessoa) {
        String sql = "INSERT INTO pessoas (nome, telefone, cpf, endereco) VALUES(?, ?, ?, ?)";
        try (Connection con = Conexao.conectar();
                PreparedStatement pstm = con.prepareStatement(sql)) {
            pstm.setString(1, pessoa.getNome());
            pstm.setString(2, pessoa.getTelefone());
            pstm.setString(3, pessoa.getCpf());
            pstm.setString(4, pessoa.getEndereco());
            int rowInserted = pstm.executeUpdate();
            if (rowInserted > 0) {
                System.out.println("Dados inserido com Sucesso.");
                return true;
            }

        } catch (SQLException e) {
            System.out.println("Erro " + e);
            System.out.println("Erro ao cadastrar pessoa " + e.getMessage());
        }

        return false;

    }

    public Pessoa listaPessoa(int id) {
        Pessoa pessoa = null;
        String sql = "SELECT id, nome, CONCAT('(',SUBSTRING(telefone, 1, 2), ') ', SUBSTRING(telefone, 3, 5), '-',SUBSTRING(telefone, 8, 4)) AS 'telefone,CONCAT(SUBSTRING(cpf, 1, 3), '.', SUBSTRING(cpf, 4, 3),'.',SUBSTRING(cpf, 7, 3),'-',SUBSTRING(cpf,10, 2)) AS ''cpf, endereco FROM pessoas"; 
                  // Supondo que a tabela se chama 'pessoas'
        try (Connection con = Conexao.conectar();
                PreparedStatement pstm = con.prepareStatement(sql)) {

            pstm.setInt(1, id);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    pessoa = new Pessoa();
                    pessoa.setId(rs.getInt("id"));
                    pessoa.setNome(rs.getString("nome"));
                    pessoa.setTelefone(rs.getString("telefone"));
                    pessoa.setCpf(rs.getString("cpf"));
                    pessoa.setEndereco(rs.getString("endereco"));
                }
            }
        } catch (Exception e) {
            System.err.println("Erro   "+e);
        }
        return pessoa;

    }

    public ArrayList<Pessoa> listaPessoas() {
    String sql = "SELECT * FROM pessoas";
    ArrayList<Pessoa> listaPessoa = new ArrayList<>();

    try (Connection con = Conexao.conectar();
         PreparedStatement pstm = con.prepareStatement(sql);
         ResultSet rs = pstm.executeQuery()) {

        while (rs.next()) {
            Pessoa pessoa = new Pessoa();
            pessoa.setId(rs.getInt("id"));
            pessoa.setNome(rs.getString("nome"));
            pessoa.setTelefone(rs.getString("telefone"));
            pessoa.setCpf(rs.getString("cpf"));
            pessoa.setEndereco(rs.getString("endereco"));
            listaPessoa.add(pessoa);
        }

    } catch (SQLException ex) {
        Logger.getLogger(PessoaDAO.class.getName()).log(Level.SEVERE, "Erro no banco de dados", ex);
    } catch (Exception e) {
        System.err.println("Erro inesperado: " + e.getMessage());
    }

    return listaPessoa;
}


    public static void main(String[] args)  {

        String nome = "TESTE";
        String telefone = "2126645383";
        String cpf = "1326549810";
        String endereco = "Rua bla bla 10";

        Pessoa pessoa = new Pessoa();

        pessoa.setNome(nome);
        pessoa.setTelefone(telefone);
        pessoa.setCpf(cpf);
        pessoa.setEndereco(endereco);

        PessoaDAO pessoadao = new PessoaDAO();

        boolean sucesso = pessoadao.cadastrapessoa(pessoa);
        if (sucesso == true) {
            System.out.println("OK");
        } else {
            System.out.println("Erro");
        }
    }

}


