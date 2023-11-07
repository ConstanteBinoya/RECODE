package br.com.binatur.servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/meuservlet")
public class CadastroServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        // Lógica do Servlet para manipular solicitações GET
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        // Lógica do Servlet para manipular solicitações POST
    }
}
