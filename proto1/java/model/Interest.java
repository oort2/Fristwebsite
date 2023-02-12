package model;

public class Interest {
	private String interestserial;
	private String consumerid;
	private String drinkserial;
	
	
	public String getInterestserial() {
		return interestserial;
	}
	public void setInterestserial(String interestserial) {
		this.interestserial = interestserial;
	}
	public String getConsumerid() {
		return consumerid;
	}
	public void setConsumerid(String consumerid) {
		this.consumerid = consumerid;
	}
	public String getDrinkserial() {
		return drinkserial;
	}
	public void setDrinkserial(String drinkserial) {
		this.drinkserial = drinkserial;
	}
	@Override
	public String toString() {
		return "Interest [interestserial=" + interestserial + ", consumerid=" + consumerid + ", drinkserial="
				+ drinkserial + "]";
	}
	
	
	
	
}