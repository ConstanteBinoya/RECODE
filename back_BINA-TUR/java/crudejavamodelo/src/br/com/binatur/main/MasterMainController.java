package br.com.binatur.main;

import java.util.Date;

import br.com.binatur.dao.ContatoDAO;
import br.com.binatur.dao.ReservaDAO;
import br.com.binatur.dao.PagamentoDAO;
import br.com.binatur.model.Contato;
import br.com.binatur.model.Reserva;
import br.com.binatur.model.Pagamento;

public class MasterMainController {

	public static void main(String[] args) {
		ContatoDAO contatoDao = new ContatoDAO();
        ReservaDAO reservaDao = new ReservaDAO();
        PagamentoDAO pagamentoDao = new PagamentoDAO();	
        
// Lógica para operações de Contato:
        //CREATE:
        Contato contato = new Contato();
        contato.setNome("Nome do Contato");
        contato.setIdade(30);
        contato.setDataCadastro(new java.util.Date());

        // Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
        //=========================
      	//contatoDao.save(contato); 
      	//=========================        
        //FIM - CREATE.

        //READ:
      	for(Contato c : contatoDao.getContatos()) {
      		System.out.println("Contato: "+c.getNome());
      	}
        //FIM - READ:        
        
        //UPDATE:
      	Contato c1 = new Contato();
      	c1.setNome("Enzo Ferrari Uno da Silva");
      	c1.setIdade(18);
      	c1.setDataCadastro(new Date());
      	c1.setId(3);//É o número que está no banco de dados da PK
      		
      	//Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
      	//====================
      	//contatoDao.update(c1);
      	//====================
        //FIM - UPDATE. 
      	
        //DELETE:
      	//Deixe esta linha de código abaixo comentada caso não queira deletar dados.
      	//=========================
      	//contatoDao.deleteByID(6);
      	//=========================	
        //FIM - DELETE: 
      	      	       
// Fim - Lógica para operações de Contato.
      	
//-------------------------------------------------------------------------------------------------------------- 
      	
// Lógica para operações de Reserva:
        //CREATE:
        Reserva reserva = new Reserva();
        reserva.setEmbarque("Local de Embarque");
        reserva.setCheckin("2023-10-16 13:30:00");
        reserva.setDesembarque("Local de Desembarque");
        reserva.setCheckout("2023-10-16 19:00:00");
        reserva.setData_reserva("2023-10-16"); 
        
        // Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
        //=========================
        //reservaDao.save(reserva);
        //=========================
        //FIM - CREATE.
        
        //READ:
        for (Reserva r : reservaDao.getReservas()) {
            System.out.println("Reserva: " + r.getEmbarque() + "/" + r.getDesembarque());
        } 
        //FIM - READ.
        
        //UPDATE:
        Reserva r1 = new Reserva();
        r1.setEmbarque("Caruaru-PE");
        r1.setCheckin("2023-12-23 23:30:00");
        r1.setDesembarque("Natal-RN");
        r1.setCheckout("2023-12-24 00:00:00");
        r1.setData_reserva("2023-02-28");
        r1.setId_reserva(4); // É o número que está no banco de dados da PK

        // Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
        //====================
        //reservaDao.update(r1);
        //==================== 
        //FIM - UPDATE:
        
        //DELETE:
        // Deixe esta linha de código abaixo comentada caso não queira deletar dados.
        //=================================
        //reservaDao.deleteByID_reserva(4);
        //=================================
        //FIM - DELETE:
        
// fIM - Lógica para operações de Reserva. 
        
//--------------------------------------------------------------------------------------------------------------        

// Lógica para operações de Pagamento:
        //CREATE:
        Pagamento pagamento = new Pagamento();
        pagamento.setValor(100.00); 
        pagamento.setForma_pagamento("Fígado");
        pagamento.setQtd_parcelas(5);        
        
        // Deixe esta linha de código abaixo comentada caso não queira adicionar dados.
        //=============================
        //pagamentoDao.save(pagamento);
        //============================= 
        //FIM - CREATE:
        
        //READ:
        for (Pagamento p : pagamentoDao.getPagamentos()) {
            System.out.println("Pagamento: NF-nº (" + p.getNota_fiscal() + ") // " + p.getValor());
        } 
        //FIM - READ.
        
        //UPDATE:
        Pagamento p1 = new Pagamento();
        p1.setValor(550.99);
        p1.setForma_pagamento("PIX");
        p1.setQtd_parcelas(1);
        p1.setNota_fiscal(3); // É o número que está no banco de dados da PK

        // Deixe esta linha de código abaixo comentada caso não queira alterar dados existentes.
        //========================
        //pagamentoDao.update(p1);
        //======================== 
        //FIM - UPDATE:
        
        //DELETE:
        // Deixe esta linha de código abaixo comentada caso não queira deletar dados.
        //====================================
        //pagamentoDao.deleteByNota_fiscal();
        //====================================
        //FIM - DELETE:
// Fim - Lógica para operações de Pagamento.        
        
	}
}	
