package br.com.binatur.model;

public class Pagamento {

	private int nota_fiscal;
	private double valor;
	private String forma_pagamento;
	private int qtd_parcelas;
	public int getnota_fiscal() {
		return nota_fiscal;
	}
	public int getNota_fiscal() {
		return nota_fiscal;
	}
	public void setNota_fiscal(int nota_fiscal) {
		this.nota_fiscal = nota_fiscal;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public String getForma_pagamento() {
		return forma_pagamento;
	}
	public void setForma_pagamento(String forma_pagamento) {
		this.forma_pagamento = forma_pagamento;
	}
	public int getQtd_parcelas() {
		return qtd_parcelas;
	}
	public void setQtd_parcelas(int qtd_parcelas) {
		this.qtd_parcelas = qtd_parcelas;
	}
	
	
}
