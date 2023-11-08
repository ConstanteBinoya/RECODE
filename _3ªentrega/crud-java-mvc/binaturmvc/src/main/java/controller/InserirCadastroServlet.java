package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cadastro;
import model.CadastroDAO;


@jakarta.servlet.annotation.WebServlet("/Inserir")
public class InserirCadastroServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// recebendo os dados do formulario via parametro
		String nome = request.getParameter("nome");
		String fone = request.getParameter("fone");
		String email = request.getParameter("email");
		
		// criando o objeto contato 
		Cadastro objCadastro =  new Cadastro();
		
		// guardando os dados do formulario do objeto
		objCadastro.setNome(nome);
		objCadastro.setFone(fone);
		objCadastro.setEmail(email);
		
		
		// criando um objeto DAO para enviar o objeto Contato para o banco de dados
		// usando o método save da classe ContatoDAO
		CadastroDAO cdao = new CadastroDAO();		
		cdao.save(objCadastro);
		
		// Redirecionando o usuario para a pagina inicial da aplicação.
		response.sendRedirect("home");
		
		
		
	}

}
