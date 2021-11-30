package com.semiproject.board.model;

public class MyCouponVO {
	private int serialNo;
	private int couponNo;
	private String email;
	
	public MyCouponVO() {
		super();
	}

	public MyCouponVO(int serialNo, int couponNo, String email) {
		super();
		this.serialNo = serialNo;
		this.couponNo = couponNo;
		this.email = email;
	}

	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MyCouponVO [serialNo=" + serialNo + ", couponNo=" + couponNo + ", email=" + email + "]";
	}
	
	
}
