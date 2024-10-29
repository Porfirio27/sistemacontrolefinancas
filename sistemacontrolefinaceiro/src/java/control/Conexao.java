package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private static final String IP = "127.0.0.1";
    //private static final String IP = "192.168.1.120";

    private static final String URL = "jdbc:mysql://" + IP + ":3306/controlefinancas";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Método para estabelecer a conexão
    public static Connection conectar() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            //save(con.toString());
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Erro ao conectar: " + e);
        }
        return con;
    }

    // Método para fechar a conexão
    public static void desconectar(Connection con) {
        if (con != null) {
            try {
                System.out.println("Fechar a conexão: ");
                con.close();
            } catch (SQLException e) {
                System.err.println("Erro ao fechar a conexão: " + e);
            }
        }
    }

    public static void testcon() throws SQLException {
        try (Connection conn = Conexao.conectar()) {
            if (conn != null) {
                System.out.println("Conexão estabelecida com sucesso!");
                desconectar(conn);
            } else {
                System.out.println("Falha ao estabelecer conexão.");
            }
        }
    }

    public static void main(String[] args) {
        Connection conexao = null;
        conexao = Conexao.conectar();
        System.out.println("Conexão estabelecida com sucesso!");
        // Aqui você pode executar suas operações no banco de dados
        Conexao.desconectar(conexao);
        System.out.println("Conexão fechada.");
    }
}
/*
UPDATE pessoas SET nome=UPPER(nome);
UPDATE pessoas SET endereco=UPPER(endereco);

*/