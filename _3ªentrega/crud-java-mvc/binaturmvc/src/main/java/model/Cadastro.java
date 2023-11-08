package model;

import java.util.List;

public class Cadastro {

	//Campos da tabela no MySql
		private int id_cliente;
		private String nome;
		private String fone;
		private String email;
		public int getId_cliente() {
			return id_cliente;
		}
		public void setId_cliente(int id_cliente) {
			this.id_cliente = id_cliente;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public String getFone() {
			return fone;
		}
		public void setFone(String fone) {
			this.fone = fone;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public List<Cadastro> getCadastro() {
			// TODO Auto-generated method stub
			return null;
		}
		public void add(Cadastro cadastro) {
			// TODO Auto-generated method stub
			
		}
		
		
}