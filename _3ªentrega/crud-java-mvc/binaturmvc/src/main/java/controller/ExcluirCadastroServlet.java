package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CadastroDAO;

@jakarta.servlet.annotation.WebServlet("/excluir")
public class ExcluirCadastroServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id_clienteCadastro = Integer.parseInt(req.getParameter("id_clienteCadastro"));


		CadastroDAO cdao = new CadastroDAO();

		cdao.getCadastroById_cliente(id_clienteCadastro);

		resp.sendRedirect("home");
	}

}
