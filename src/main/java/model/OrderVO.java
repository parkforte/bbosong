package model;

import java.sql.Timestamp;

public class OrderVO {
	private int orderNo;
	private String email;
	private int storeNo;
	private int laundryNo;
	private int qty;
	private Timestamp orderDate;
	private Timestamp pickupDate;
	private String orderState;
	private int serialNo;
	private int totalQty;
	private int totalPrice;
	
	public OrderVO() {
		super();
	}

	
	

	public OrderVO(int orderNo, String email, int storeNo, int laundryNo, int qty, Timestamp orderDate,
			Timestamp pickupDate, String orderState, int serialNo, int totalQty, int totalPrice) {
		super();
		this.orderNo = orderNo;
		this.email = email;
		this.storeNo = storeNo;
		this.laundryNo = laundryNo;
		this.qty = qty;
		this.orderDate = orderDate;
		this.pickupDate = pickupDate;
		this.orderState = orderState;
		this.serialNo = serialNo;
		this.totalQty = totalQty;
		this.totalPrice = totalPrice;
	}


	public OrderVO(int orderNo, String email, int storeNo, int laundryNo, int qty, Timestamp orderDate,
			Timestamp pickupDate, String orderState, int serialNo) {
		super();
		this.orderNo = orderNo;
		this.email = email;
		this.storeNo = storeNo;
		this.laundryNo = laundryNo;
		this.qty = qty;
		this.orderDate = orderDate;
		this.pickupDate = pickupDate;
		this.orderState = orderState;
		this.serialNo = serialNo;
	}




	public OrderVO(int orderNo, String email, int storeNo, Timestamp orderDate, Timestamp pickupDate, String orderState,
			int totalQty, int totalPrice) {
		super();
		this.orderNo = orderNo;
		this.email = email;
		this.storeNo = storeNo;
		this.orderDate = orderDate;
		this.pickupDate = pickupDate;
		this.orderState = orderState;
		this.totalQty = totalQty;
		this.totalPrice = totalPrice;
	}




	public OrderVO(String email, String name, String tel, Timestamp joindate) {
		super();
	}




	public OrderVO(int orderNo, String email, int storeNo, int qty, Timestamp pickupDate, String orderState,
			int serialNo2) {
		super();
		this.orderNo = orderNo;
		this.email = email;
		this.storeNo = storeNo;
		this.qty = qty;
		this.pickupDate = pickupDate;
		this.orderState = orderState;
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




	public int getStoreNo() {
		return storeNo;
	}




	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
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




	public String getOrderState() {
		return orderState;
	}




	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}




	public int getSerialNo() {
		return serialNo;
	}




	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}




	public int getTotalQty() {
		return totalQty;
	}




	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}




	public int getTotalPrice() {
		return totalPrice;
	}




	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}




	@Override
	public String toString() {
		return "OrderVO [orderNo=" + orderNo + ", email=" + email + ", storeNo=" + storeNo + ", laundryNo=" + laundryNo
				+ ", qty=" + qty + ", orderDate=" + orderDate + ", pickupDate=" + pickupDate + ", orderState="
				+ orderState + ", serialNo=" + serialNo + ", totalQty=" + totalQty + ", totalPrice=" + totalPrice + "]";
	}

	
	
	
	
}
