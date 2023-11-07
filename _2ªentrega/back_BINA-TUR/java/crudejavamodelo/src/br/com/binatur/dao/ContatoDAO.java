package br.com.binatur.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.binatur.factory.ConnectionFactory;
import br.com.binatur.model.Contato;

public class ContatoDAO {

	/*
	 * CRUD 
	 * c: CREATE - INSERT (inserir dados);
	 * r: READ  - SELECT (recuperar dados;
	 * u: UPDATE - UPDATE (alterar dados);
	 * d: DELETE - DELET (apagar dados).
	 */

//Aplicando o "c: CREATE - INSERT" (adicionando dados ao Banco).
	public void save(Contato contato) {

		String sql = "INSERT INTO contatos(nome, idade, datacadastro) VALUES (?,?,?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			// Criar uma conexãqo com o banco de dados
			conn = ConnectionFactory.createConnectionToMySQL();

			// Criado uma PreparedStatement, para executar uma query
			pstm = (PreparedStatement) conn.prepareStatement(sql);
			// Adicionar os valores que são esperados pela query
			pstm.setString(1, contato.getNome());
			pstm.setInt(2, contato.getIdade());
			pstm.setDate(3, new Date(contato.getDataCadastro().getTime()));

			// Executar a query
			pstm.execute();

			System.out.println("Contato salvo com sucesso!");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			// Fechar as conexões
			try {
				if (pstm != null) {
					pstm.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
//Fim - Criando o "c: CREATE - INSERT" (adicionandoi dados no Banco de Dados).	
//================================================================================================

//Criando o "r: READ - SELECT" (recuperar, consultar, visualizar dados no Banco).	
		public List<Contato> getContatos(){
			
			String sql = "SELECT * FROM contatos";
			
			List<Contato> contatos = new ArrayList<Contato>();
			
			Connection conn = null;
			PreparedStatement pstm = null;
			//Classe que vai recuperar os dados do banco. ***SELECT***
			ResultSet rset = null;
			
			try {
				conn = ConnectionFactory.createConnectionToMySQL();
				
				pstm = (PreparedStatement) conn.prepareStatement(sql);
				
				rset = pstm.executeQuery();

				while (rset.next()) {
					Contato contato = new Contato();
					
					//Recuperar o id
					contato.setId(rset.getInt("id"));
					//Recuperar o nome
					contato.setNome(rset.getString("nome"));
					//Recuperar a idade
					contato.setIdade(rset.getInt("idade"));
					//Recuperar a data de cadastro
					contato.setDataCadastro(rset.getDate("datacadastro"));
							
					contatos.add(contato);
			    }	
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
					    if(rset!=null) {
						rset.close();
					    }
					
					    if(pstm!=null) {
						pstm.close();
					    }
					
					    if(conn!=null) {
						conn.close();
					    }
		           }catch(Exception e) {
		        	   e.printStackTrace();
		           }
		        }
				
				return contatos;
		}
//Fim - Criando o "r: READ - SELECT" (recuperar, consultar, visualizar dados no Banco).
//================================================================================================

//Criando o "u: UPDATE - UPDATE" (alterar, atualizar, modificar dados no Banco).	
	public void update(Contato contato) {
		String sql = "UPDATE contatos SET nome = ?, idade = ?, dataCadastro = ?"+ "WHERE id = ?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		try {
			//Criar conexão com o banco
			conn = ConnectionFactory.createConnectionToMySQL();
			
			//Criar a classe para executar a query
			pstm = (PreparedStatement) conn.prepareStatement(sql);
			
			//Adicionar os valores para atualizar
			pstm.setString(1, contato.getNome());
			pstm.setInt(2, contato.getIdade());
			pstm.setDate(3, new Date(contato.getDataCadastro().getTime()));
			
			//Qual é o ID do registro que deseja atualizar?
			pstm.setInt(4, contato.getId());
			
			//Executar a query
			pstm.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm!=null) {
					pstm.close();
				}
				
				if(conn!=null) {
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
//Fim - Criando o "u: UPDATE - UPDATE" (alterar, atualizar, modificar dados no Banco).
//================================================================================================
		
//Criando o "d: DELET - DELET" (apagar, remover, deletar dados no Banco).	
	public void deleteByID(int id) {
		
		String sql = "DELETE FROM contatos WHERE id = ?";
		
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		try {
			conn = ConnectionFactory.createConnectionToMySQL();
			
			pstm = (PreparedStatement) conn.prepareStatement(sql);
			
			pstm.setInt(1, id);
			
			pstm.execute();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm!=null) {
					pstm.close();
				}
				
				if(conn!=null) {
					conn.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		} 		
//Fim - Criando o "d: DELET - DELET" (apagar, remover, deletar dados no Banco).
//================================================================================================		
	}
}