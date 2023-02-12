package model;

import java.util.Date;

public class Order1{
	
	private String ordserial;
	private Date orddate;
	private String consumerid;
	private String recipientsname;
	private String adderess;
	public String getOrdserial() {
		return ordserial;
	}
	public void setOrdserial(String ordserial) {
		this.ordserial = ordserial;
	}
	public Date getOrddate() {
		return orddate;
	}
	public void setOrddate(Date orddate) {
		this.orddate = orddate;
	}
	public String getConsumerid() {
		return consumerid;
	}
	public void setConsumerid(String consumerid) {
		this.consumerid = consumerid;
	}
	public String getRecipientsname() {
		return recipientsname;
	}
	public void setRecipientsname(String recipientsname) {
		this.recipientsname = recipientsname;
	}
	public String getAdderess() {
		return adderess;
	}
	public void setAdderess(String adderess) {
		this.adderess = adderess;
	}
	@Override
	public String toString() {
		return "Order [ordserial=" + ordserial + ", orddate=" + orddate + ", consumerid=" + consumerid
				+ ", recipientsname=" + recipientsname + ", adderess=" + adderess + "]";
	}
	
	
	
}