package model;

import java.util.Date;

public class OrderDetail{
	
	private String ordserial;
	private String drinkserial;
	private String ordqty;
	private String ordprice;
	public String getOrdserial() {
		return ordserial;
	}
	public void setOrdserial(String ordserial) {
		this.ordserial = ordserial;
	}
	public String getDrinkseria() {
		return drinkserial;
	}
	public void setDrinkseria(String drinkseria) {
		this.drinkserial = drinkseria;
	}
	public String getOrdqty() {
		return ordqty;
	}
	public void setOrdqty(String ordqty) {
		this.ordqty = ordqty;
	}
	public String getOrdprice() {
		return ordprice;
	}
	public void setOrdprice(String ordprice) {
		this.ordprice = ordprice;
	}
	@Override
	public String toString() {
		return "OrderDetail [ordserial=" + ordserial + ", drinkserial=" + drinkserial + ", ordqty=" + ordqty
				+ ", ordprice=" + ordprice + "]";
	}


	
}