package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.FactoryConnection;
import model.Cadastro;

public class CadastroDAO {
	
	/*
	 * CRUD 
	 * c: CREATE - INSERT (inserir dados);
	 * r: READ  - SELECT (recuperar dados;
	 * u: UPDATE - UPDATE (alterar dados);
	 * d: DELETE - DELETE (apagar dados).
	 */

	// Aplicando o "c: CREATE - INSERT" (adicionando dados ao Banco).
	public void save(Cadastro cadastro) {
		String sql = "INSERT INTO cadastro(nome, fone, email) VALUES (?,?,?)";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			// Criar uma conexão com o banco de dados
			conn = FactoryConnection.createConnectionToMySQL();

			// Criar uma PreparedStatement, para executar uma query
			pstm = conn.prepareStatement(sql);
			
			// Adicionar os valores que são esperados pela query
			pstm.setString(1, cadastro.getNome());
			pstm.setString(2, cadastro.getFone());
			pstm.setString(3, cadastro.getEmail());

			// Executar a query
			pstm.execute();

			System.out.println("Cliente cadastrado com sucesso!");
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

	// Fim - Criando o "c: CREATE - INSERT" (adicionando dados no Banco de Dados).

	// Criando o "r: READ - SELECT" (recuperar, consultar, visualizar dados no Banco).
	public List<Cadastro> getCadastro() {
		String sql = "SELECT * FROM cadastro";
		List<Cadastro> cadastro = new ArrayList<Cadastro>();
		Connection conn = null;
		PreparedStatement pstm = null;
		// Classe que vai recuperar os dados do banco. ***SELECT***
		ResultSet rset = null;

		try {
			conn = FactoryConnection.createConnectionToMySQL();
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();

			while (rset.next()) {
				Cadastro cadastro1 = new Cadastro();

				// Recuperar o id
				cadastro1.setId_cliente(rset.getInt("id_cliente"));
				// Recuperar o nome
				cadastro1.setNome(rset.getString("nome"));
				// Recuperar o telefone
				cadastro1.setFone(rset.getString("fone"));
				// Recuperar o email
				cadastro1.setEmail(rset.getString("email"));

				cadastro.add(cadastro1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}

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

		return cadastro;
	}

	// Fim - Criando o "r: READ - SELECT" (recuperar, consultar, visualizar dados no Banco).

	// Criando o "u: UPDATE - UPDATE" (alterar, atualizar, modificar dados no Banco).
	public void update(Cadastro cadastro) {
		String sql = "UPDATE cadastro SET nome = ?, fone = ?, email = ? WHERE id_cliente = ?";

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			// Criar conexão com o banco
			conn = FactoryConnection.createConnectionToMySQL();

			// Criar a classe para executar a query
			pstm = conn.prepareStatement(sql);

			// Adicionar os valores para atualizar
			pstm.setString(1, cadastro.getNome());
			pstm.setString(2, cadastro.getFone());
			pstm.setString(3, cadastro.getEmail());
			pstm.setInt(4, cadastro.getId_cliente());

			// Executar a query de atualização
			pstm.executeUpdate();

			System.out.println("Cliente atualizado com sucesso!");
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

	public Cadastro getCadastroById_cliente(int id_clienteCadastro) {
		return null;
		// TODO Auto-generated method stub
		
	}
}
