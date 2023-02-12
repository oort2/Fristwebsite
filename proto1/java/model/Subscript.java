package model;

public class Subscript {
	private String subscriptserial;
	private String drinkserial;
	private String product;
	
	public String getSubscriptserial() {
		return subscriptserial;
	}

	public void setSubscriptserial(String subscriptserial) {
		this.subscriptserial = subscriptserial;
	}

	public String getDrinkserial() {
		return drinkserial;
	}

	public void setDrinkserial(String drinkserial) {
		this.drinkserial = drinkserial;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}

		@Override
	public String toString() {
		return "Subscript [subscriptserial=" + subscriptserial + ", drinkserial="
				+ drinkserial + ", product=" + product + "]";
				}
}
