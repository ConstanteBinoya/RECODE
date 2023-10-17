package br.com.binatur.main;

import br.com.binatur.dao.ReservaDAO;
import br.com.binatur.model.Reserva;

public class MainReserva {

    public static void main(String[] args) {
// Adicionar dados na tabela "Reserva"
        ReservaDAO reservaDao = new ReservaDAO();

        Reserva reserva = new Reserva();
        reserva.setEmbarque("Gramado-RS");
        reserva.setCheckin("2023-11-01 12:00:00");
        reserva.setDesembarque("Rio Branco-AC");
        reserva.setCheckout("2023-11-02 00:30:00");
        reserva.setData_reserva("2023-04-26");

        // Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
        //=======================
        reservaDao.save(reserva);
        //=======================
// Fim - Adicionar dados na tabela "Reserva"

// =================================================================================================
// Atualizar o reserva.
        Reserva r1 = new Reserva();
        r1.setEmbarque("Caruaru-PE");
        r1.setCheckin("2023-12-23 23:30:00");
        r1.setDesembarque("Natal-RN");
        r1.setCheckout("2023-12-24 00:00:00");
        r1.setData_reserva("2023-02-28");
        r1.setId_reserva(4); // É o número que está no banco de dados da PK

        // Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
        //====================
        reservaDao.update(r1);
        //====================
// Fim - Atualizar o contato.

// =================================================================================================
// Deletar o contato pelo seu número de ID.
        // Deixe esta linha de código abaixo comentada caso não queira deletar dados.
        //=================================
        //reservaDao.deleteByID_reserva(4);
        //=================================

// Fim - Deletar o contato pelo seu número de ID.

// =================================================================================================
// Visualização dos registros do banco de dados TOTODOS
        for (Reserva r : reservaDao.getReservas()) {
            System.out.println("Reserva: " + r.getEmbarque() + "/" + r.getDesembarque());
        }
// Fim - Visualização dos registros do banco de dados TOTODOS
// =================================================================================================
    }
}