package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cadastro;
import model.CadastroDAO;

@jakarta.servlet.annotation.WebServlet("/editar")
public class AlterarContatoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id_clienteCadastro = Integer.parseInt(req.getParameter("id_cliente"));
            CadastroDAO cdao = new CadastroDAO();
            Cadastro cadastroSelecionado = cdao.getCadastroById_cliente(id_clienteCadastro);
            req.setAttribute("cadastro", cadastroSelecionado);
            RequestDispatcher rd = req.getRequestDispatcher("/alterarCadastro.jsp");
            rd.forward(req, resp);
        } catch (NumberFormatException e) {
            // Lidar com erro de conversão de parâmetro
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de cliente inválido.");
        } catch (Exception e) {
            // Lidar com outros erros
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar a solicitação.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Cadastro cadastroAlterado = new Cadastro();
            cadastroAlterado.setNome(req.getParameter("nome"));
            cadastroAlterado.setFone(req.getParameter("fone"));
            cadastroAlterado.setEmail(req.getParameter("email"));
            cadastroAlterado.setId_cliente(Integer.parseInt(req.getParameter("id_cliente")));
            CadastroDAO cd = new CadastroDAO();
            cd.update(cadastroAlterado);
            resp.sendRedirect("home");
        } catch (NumberFormatException e) {
            // Lidar com erro de conversão de parâmetro
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de cliente inválido.");
        } catch (Exception e) {
            // Lidar com outros erros
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao processar a solicitação.");
        }
    }
}

