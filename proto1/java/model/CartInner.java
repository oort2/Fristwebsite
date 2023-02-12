package model;

public class CartInner {
	private String cart_serial;
	private String drink_serial;
	private int cart_qty;
	private int cart_price;
	private String name;
	private int price;
	private String file1;
	

	public String getCart_serial() {
		return cart_serial;
	}
	public void setCart_serial(String cart_serial) {
		this.cart_serial = cart_serial;
	}
	public String getDrink_serial() {
		return drink_serial;
	}
	public void setDrink_serial(String drink_serial) {
		this.drink_serial = drink_serial;
	}
	public int getCart_qty() {
		return cart_qty;
	}
	public void setCart_qty(int cart_qty) {
		this.cart_qty = cart_qty;
	}
	public int getCart_price() {
		return cart_price;
	}
	public void setCart_price(int cart_price) {
		this.cart_price = cart_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "CartInner [cart_serial=" + cart_serial + ", drink_serial=" + drink_serial + ", cart_qty=" + cart_qty
				+ ", cart_price=" + cart_price + ", name=" + name + ", price=" + price + ", file1=" + file1 + "]";
	}
	
	
	
	
	

}
