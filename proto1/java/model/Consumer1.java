package model;

public class Consumer1 {

	private String id;
	private String pass;
	private String name;
	private String jumin;
	private String address;
	private String tel;
	private String email;
	private int subscript;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSubscript() {
		return subscript;
	}
	public void setSubscript(int subscript) {
		this.subscript = subscript;
	}
	@Override
	public String toString() {
		return "Consumer1 [id=" + id + ", pass=" + pass + ", name=" + name + ", jumin=" + jumin + ", address=" + address
				+ ", tel=" + tel + ", email=" + email + ", subscript=" + subscript + "]";
	}
	
	
}
	