package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cadastro;
import model.CadastroDAO;

@jakarta.servlet.annotation.WebServlet("/home")
public class ListaCadastroServlet extends HttpServlet {


	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Cadastro> agenda = new ArrayList<Cadastro>();
		Cadastro cdao = new Cadastro();		
		agenda = cdao.getCadastro();		
		req.setAttribute("listaCadastro", agenda);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("cadastro.jsp");
		dispatcher.forward(req, resp);
	}

}
