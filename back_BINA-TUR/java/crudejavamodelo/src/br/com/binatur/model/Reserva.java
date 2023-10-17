package br.com.binatur.model;

public class Reserva {
	
	private int id_reserva;
	private String embarque;
	private String checkin;
	private String desembarque;
	private String checkout;
	private String data_reserva;
	public int getId_reserva() {
		return id_reserva;
	}
	public String getEmbarque() {
		return embarque;
	}
	public void setEmbarque(String embarque) {
		this.embarque = embarque;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getDesembarque() {
		return desembarque;
	}
	public void setDesembarque(String desembarque) {
		this.desembarque = desembarque;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getData_reserva() {
		return data_reserva;
	}
	public void setData_reserva(String data_reserva) {
		this.data_reserva = data_reserva;
	}
	public void setId_reserva(int id_reserva) {
		this.id_reserva = id_reserva;
	}
	
	
		
}