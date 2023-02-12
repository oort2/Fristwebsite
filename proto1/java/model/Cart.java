package model;

import java.util.Date;

public class Cart {
	
	private String cart_serial;
	private Date cart_date;
	private String consumer_serial;
	private int sequence;
	
	
	
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	public String getCart_serial() {
		return cart_serial;
	}
	public void setCart_serial(String cart_serial) {
		this.cart_serial = cart_serial;
	}
	public Date getCart_date() {
		return cart_date;
	}
	public void setCart_date(Date cart_date) {
		this.cart_date = cart_date;
	}
	public String getConsumer_serial() {
		return consumer_serial;
	}
	public void setConsumer_serial(String consumer_serial) {
		this.consumer_serial = consumer_serial;
	}
	@Override
	public String toString() {
		return "Cart [cart_serial=" + cart_serial + ", cart_date=" + cart_date + ", consumer_serial=" + consumer_serial
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
