package br.com.binatur.main;

import java.util.Date;

import br.com.binatur.dao.ContatoDAO;
import br.com.binatur.model.Contato;

public class MainContato {

	public static void main(String[] args) {
		
//Adicionar dados na tabela "Contatos"
		ContatoDAO contatoDao = new ContatoDAO();
		
		Contato contato = new Contato();
		contato.setNome("Strombofoxmiliano de Alencar Cardoso Sobrinho");
		contato.setIdade(3);
		contato.setDataCadastro(new Date());
		
		//Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
		//=========================
		contatoDao.save(contato); 
		//=========================
//Fim - Adicionar dados na tabela "Contatos"

//=================================================================================================
//Atualizar o contato.
		Contato c1 = new Contato();
		c1.setNome("Enzo Ferrari Uno da Silva");
		c1.setIdade(18);
		c1.setDataCadastro(new Date());
		c1.setId(3);//É o número que está no banco de dados da PK
		
		//Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
		//====================
		//contatoDao.update(c1);
		//====================
//Fim - Atualizar o contato.
		
//=================================================================================================		
//Deletar o contato pelo seu número de ID.
		//Deixe esta linha de código abaixo comentada caso não queira deletar dados.
		//=========================
		//contatoDao.deleteByID(6);
		//=========================
		
//Fim - Deletar o contato pelo seu número de ID.
		
//=================================================================================================
//Visualização dos registros do banco de dados TOTODOS
		for(Contato c : contatoDao.getContatos()) {
			System.out.println("Contato: "+c.getNome());
		}
//Fim - Visualização dos registros do banco de dados TOTODOS
//=================================================================================================
		
   }
}
