package br.com.binatur.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.binatur.factory.ConnectionFactory;
import br.com.binatur.model.Pagamento;

public class PagamentoDAO {

    // Método para salvar um pagamento no banco de dados
    public void save(Pagamento pagamento) {
        String sql = "INSERT INTO pagamento ( valor, forma_pagamento, qtd_parcelas) VALUES (?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setDouble(1, pagamento.getValor());
            pstm.setString(2, pagamento.getForma_pagamento());
            pstm.setInt(3, pagamento.getQtd_parcelas());
            pstm.execute();

            System.out.println("Pagamento lançado com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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

    // Método para obter uma lista de pagamentos do banco de dados
    public List<Pagamento> getPagamentos() {
        String sql = "SELECT * FROM pagamento";
        List<Pagamento> pagamentos = new ArrayList<Pagamento>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rset = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            rset = pstm.executeQuery();

            while (rset.next()) {
                Pagamento pagamento = new Pagamento();
                pagamento.setNota_fiscal(rset.getInt("nota_fiscal"));
                pagamento.setValor(rset.getDouble("valor"));
                pagamento.setForma_pagamento(rset.getString("forma_pagamento"));
                pagamento.setQtd_parcelas(rset.getInt("qtd_parcelas"));
                pagamentos.add(pagamento);
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

        return pagamentos;
    }

    // Método para atualizar um lançamento de pagamento no banco de dados
    public void update(Pagamento pagamento) {
        String sql = "UPDATE pagamento SET valor = ?, forma_pagamento = ?, qtd_parcelas = ? WHERE nota_fiscal = ?";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setDouble(1, pagamento.getValor());
            pstm.setString(2, pagamento.getForma_pagamento());
            pstm.setInt(3, pagamento.getQtd_parcelas());
            pstm.setInt(4, pagamento.getNota_fiscal());
            pstm.execute();

            System.out.println("Pagamento atualizado com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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

    // Método para excluir um pagamento do banco de dados pelo ID
    public void deleteByNota_fiscal(int nota_fiscal) {
        String sql = "DELETE FROM pagamento WHERE nota_fiscal = ?";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, nota_fiscal);
            pstm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
}	