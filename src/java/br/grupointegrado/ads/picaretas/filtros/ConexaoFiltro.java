package br.grupointegrado.ads.picaretas.filtros;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ConexaoFiltro implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        /*
         Alguns servidores como o TOMCAT, vem por padrão com codificação ISO-8859-1, sendo assim é necessário mudar essa configuração para UTF-8. Caso contrário teremos problemas com acentuação nos parâmetros.
         Para evitar de ter que mudar a configuração no Servidor, podemos alterar o Encoding do Request e do Response em todas as requisições.
         Neste caso, podemos aproveitar o filtro ConexaoFilter para tal ação.
         */
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Connection conexao = null;
        try {
            conexao = abrirConexao();
            // adiciona a conexão como atributo na requisição
            request.setAttribute("conexao", conexao);
            // encaminha a requisição a diante
            chain.doFilter(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            // continua lançando a exceção, para não ignorá-la
            throw new RuntimeException(ex);
        } finally {
            // fecha a conexão, idependente de erros
            fecharConexao(conexao);
        }

    }

    /**
     * Abre uma conexão com o banco de dados MySQL
     *
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public Connection abrirConexao() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/picaretas";
        return DriverManager.getConnection(url, "root", "xy234786");
    }

    /**
     * Fecha a conexão com o banco de dados MySQL, e ignora possíveis erros.
     *
     * @param conn Conexão a ser fechada.
     */
    public void fecharConexao(Connection conn) {
        try {
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public void destroy() {
    }

}
