package com.semiproject.board.model;

import java.sql.Timestamp;

public class OrderVO {
	private int orderNo;
	private String email;
	private int laundryNo;
	private int qty;
	private Timestamp orderDate;
	private Timestamp pickupDate;
	private String orederState;
	private int serialNo;
	
	public OrderVO() {
		super();
	}

	public OrderVO(int orderNo, String email, int laundryNo, int qty, Timestamp orderDate, Timestamp pickupDate,
			String orederState, int serialNo) {
		super();
		this.orderNo = orderNo;
		this.email = email;
		this.laundryNo = laundryNo;
		this.qty = qty;
		this.orderDate = orderDate;
		this.pickupDate = pickupDate;
		this.orederState = orederState;
		this.serialNo = serialNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getLaundryNo() {
		return laundryNo;
	}

	public void setLaundryNo(int laundryNo) {
		this.laundryNo = laundryNo;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public Timestamp getPickupDate() {
		return pickupDate;
	}

	public void setPickupDate(Timestamp pickupDate) {
		this.pickupDate = pickupDate;
	}

	public String getOrederState() {
		return orederState;
	}

	public void setOrederState(String orederState) {
		this.orederState = orederState;
	}

	public int getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", email=" + email + ", laundryNo=" + laundryNo + ", qty=" + qty
				+ ", orderDate=" + orderDate + ", pickupDate=" + pickupDate + ", orederState=" + orederState
				+ ", serialNo=" + serialNo + "]";
	}
	
}
