package model;

import java.sql.Timestamp;

public class CartVO {
	private int cartNo;
	private String email;
	private int laundryNo;
	private int qty;
	private int price;
	private Timestamp regdate;
	
	public CartVO() {
		super();
	}

	public CartVO(int cartNo, String email, int laundryNo, int qty, int price, Timestamp regdate) {
		super();
		this.cartNo = cartNo;
		this.email = email;
		this.laundryNo = laundryNo;
		this.qty = qty;
		this.price = price;
		this.regdate = regdate;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartVO [cartNo=" + cartNo + ", email=" + email + ", laundryNo=" + laundryNo + ", qty=" + qty
				+ ", price=" + price + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
	
}
