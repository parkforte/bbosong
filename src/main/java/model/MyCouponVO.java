package model;

public class MyCouponVO {
	private int serialNo;
	private String email;
	
	public MyCouponVO() {
		super();
	}

	public MyCouponVO(int serialNo, String email) {
		super();
		this.serialNo = serialNo;
		this.email = email;
	}

	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MyCouponVO [serialNo=" + serialNo + ", email=" + email + "]";
	}

	
	
}
