package br.com.binatur.main;

import br.com.binatur.dao.PagamentoDAO;
import br.com.binatur.model.Pagamento;

public class MainPagamento {

	public static void main(String[] args) {
// Adicionar dados na tabela "Reserva"
        PagamentoDAO pagamentoDao = new PagamentoDAO();

        Pagamento pagamento = new Pagamento();
        pagamento.setValor(100.00);//Mudar para double
        pagamento.setForma_pagamento("Fígado");
        pagamento.setQtd_parcelas(5);

        // Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
        //=============================
        pagamentoDao.save(pagamento);
        //=============================
// Fim - Adicionar dados na tabela "Reserva"

// =================================================================================================
// Atualizar o pagamento.
        Pagamento p1 = new Pagamento();
        p1.setValor(550.99);
        p1.setForma_pagamento("PIX");
        p1.setQtd_parcelas(1);
        p1.setNota_fiscal(3); // É o número que está no banco de dados da PK

        // Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
        //========================
        pagamentoDao.update(p1);
        //========================
// Fim - Atualizar o pagamento.

// =================================================================================================
// Deletar o pagamento pelo número da Nota_fiscal.
        // Deixe esta linha de código abaixo comentada caso não queira deletar dados.
        //====================================
        //pagamentoDao.deleteByNota_fiscal();
        //====================================

// Fim - Deletar o contato pelo número da Nota_fiscal.

// =================================================================================================
// Visualização dos registros do banco de dados TOTODOS
        for (Pagamento p : pagamentoDao.getPagamentos()) {
            System.out.println("Pagamento: NF-nº (" + p.getNota_fiscal() + ") // " + p.getValor());
        }
// Fim - Visualização dos registros do banco de dados TOTODOS
// =================================================================================================
      }		
	}