package com.semiproject.board.model;

public class LaundryMenuVO {
	private int laundryNo;
	private String laundryName;
	private int  price;
	
	public LaundryMenuVO() {
		super();
	}

	public LaundryMenuVO(int laundryNo, String laundryName, int price) {
		super();
		this.laundryNo = laundryNo;
		this.laundryName = laundryName;
		this.price = price;
	}

	public int getLaundryNo() {
		return laundryNo;
	}

	public void setLaundryNo(int laundryNo) {
		this.laundryNo = laundryNo;
	}

	public String getLaundryName() {
		return laundryName;
	}

	public void setLaundryName(String laundryName) {
		this.laundryName = laundryName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "LaundryMenuVO [laundryNo=" + laundryNo + ", laundryName=" + laundryName + ", price=" + price + "]";
	}
	
	
}
