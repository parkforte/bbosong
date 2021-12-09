package model;

public class AdminVO {
	
	private String email;
	private String pwd; 
	private String name;
	private int storeNo;
	
	public AdminVO() {
		super();
	}

	public AdminVO(String email, String pwd, String name, int storeNo) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.storeNo = storeNo;
	}
	
	public AdminVO(String email, String pwd) {
		super();
		this.email = email;
		this.pwd = pwd;
	}
	
	public AdminVO(String email) {
		super();
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	@Override
	public String toString() {
		return "AdminVO [email=" + email + ", pwd=" + pwd + ", name=" + name + ", storeNo=" + storeNo + "]";
	} 
	
}
