package br.com.binatur.model;

import java.util.Date;

//Nome da tabela no MySql
public class Contato {

//Campos da tabela no MySql
	private int id;
	private String nome;
	private int idade;
	private Date dataCadastro;
	public int getId() {
		return id;
	}
//Fim - Campos da tabela no MySql
	
//Aplicando os Geter's e Seter's
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
//Fim - Aplicando os Geter's e Seter's
	
}
