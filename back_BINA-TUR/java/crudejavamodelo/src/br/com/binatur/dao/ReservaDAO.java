package br.com.binatur.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import br.com.binatur.factory.ConnectionFactory;
import br.com.binatur.model.Reserva;

public class ReservaDAO {

    // Método para salvar uma reserva no banco de dados
    public void save(Reserva reserva) {
        String sql = "INSERT INTO reserva (embarque, checkin, desembarque, checkout, data_reserva) VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, reserva.getEmbarque());
            pstm.setString(2, reserva.getCheckin());
            pstm.setString(3, reserva.getDesembarque());
            pstm.setString(4, reserva.getCheckout());
            pstm.setString(5, reserva.getData_reserva());
            pstm.execute();

            System.out.println("Reserva realizada com sucesso!");
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

    // Método para obter uma lista de reservas do banco de dados
    public List<Reserva> getReservas() {
        String sql = "SELECT * FROM reserva";
        List<Reserva> reservas = new ArrayList<Reserva>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rset = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            rset = pstm.executeQuery();

            while (rset.next()) {
                Reserva reserva = new Reserva();
                reserva.setId_reserva(rset.getInt("id_reserva"));
                reserva.setEmbarque(rset.getString("embarque"));
                reserva.setCheckin(rset.getString("checkin"));
                reserva.setDesembarque(rset.getString("desembarque"));
                reserva.setCheckout(rset.getString("checkout"));
                reserva.setData_reserva(rset.getString("data_reserva"));
                reservas.add(reserva);
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

        return reservas;
    }

    // Método para atualizar uma reserva no banco de dados
    public void update(Reserva reserva) {
        String sql = "UPDATE reserva SET embarque = ?, checkin = ?, desembarque = ?, checkout = ?, data_reserva = ? WHERE id_reserva = ?";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, reserva.getEmbarque());
            pstm.setString(2, reserva.getCheckin());
            pstm.setString(3, reserva.getDesembarque());
            pstm.setString(4, reserva.getCheckout());
            pstm.setString(5, reserva.getData_reserva());
            pstm.setInt(6, reserva.getId_reserva());
            pstm.execute();

            System.out.println("Reserva atualizada com sucesso!");
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

    // Método para excluir uma reserva do banco de dados pelo ID
    public void deleteByID_reserva(int id_reserva) {
        String sql = "DELETE FROM reserva WHERE id_reserva = ?";

        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            conn = ConnectionFactory.createConnectionToMySQL();
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, id_reserva);
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