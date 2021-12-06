package model;

import java.sql.Time;
import java.sql.Timestamp;

public class CouponVO {
	private int serialno;
	private String email;
	private String couponname;
	private int discount;
	private Timestamp expire; 
	
	public CouponVO() {
		super();
	}
	
	public CouponVO(int serialno, String email) {
		super();
		this.serialno = serialno;
		this.email = email;
	}

	public CouponVO(int serialno, String email, String couponname, int discount, Timestamp expire) {
		super();
		this.serialno = serialno;
		this.email = email;
		this.couponname = couponname;
		this.discount = discount;
		this.expire = expire;
	}

	public CouponVO(int serialno, String couponname, int discount, Timestamp expire) {
		super();
		this.serialno = serialno;
		this.couponname = couponname;
		this.discount = discount;
		this.expire = expire;
	}

	public int getSerialno() {
		return serialno;
	}

	public void setSerialno(int serialno) {
		this.serialno = serialno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCouponname() {
		return couponname;
	}

	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Timestamp getExpire() {
		return expire;
	}

	public void setExpire(Timestamp expire) {
		this.expire = expire;
	}

	@Override
	public String toString() {
		return "CouponVO [serialno=" + serialno + ", email=" + email + ", couponname=" + couponname + ", discount="
				+ discount + ", expire=" + expire + "]";
	}

}
