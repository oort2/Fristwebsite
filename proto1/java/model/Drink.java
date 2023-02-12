package model;

public class Drink {
	private String serial;
	private String regdate;
	private String name;
	private int capacity;
	private int alcohol;
	private String brand;
	private int released;
	private int price;
	private String location;
	private int saled;
	private String file1;
	private int qty;
	private String dtype;
	private String s_product;
	
	
	public String getSerial() {
		return serial;
	}
	public void setSerial(String serial) {
		this.serial = serial;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(int alcohol) {
		this.alcohol = alcohol;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getReleased() {
		return released;
	}
	public void setReleased(int released) {
		this.released = released;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getSaled() {
		return saled;
	}
	public void setSaled(int saled) {
		this.saled = saled;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getDtype() {
		return dtype;
	}
	public void setDtype(String dtype) {
		this.dtype = dtype;
	}
	public String getS_product() {
		return s_product;
	}
	public void setS_product(String s_product) {
		this.s_product = s_product;
	}
	
	@Override
	public String toString() {
		return "Drink [serial=" + serial + ", regdate=" + regdate + ", name=" + name + ", capacity=" + capacity
				+ ", alcohol=" + alcohol + ", brand=" + brand + ", released=" + released + ", price=" + price
				+ ", location=" + location + ", saled=" + saled + ", file1=" + file1 + ", qty=" + qty + ", dtype="
				+  dtype  + "s_product"+ s_product +"]";
	}
	
	
	
	
}
