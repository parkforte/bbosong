package model;

import java.sql.Timestamp;

public class CouponVO {
	private int couponNo;
	private String couponName;
	private int discount;
	private Timestamp expire;
	
	public CouponVO() {
		super();
	}

	public CouponVO(int couponNo, String couponName, int discount, Timestamp expire) {
		super();
		this.couponNo = couponNo;
		this.couponName = couponName;
		this.discount = discount;
		this.expire = expire;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
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
		return "CouponVO [couponNo=" + couponNo + ", couponName=" + couponName + ", discount=" + discount + ", expire="
				+ expire + "]";
	}
	
	
}
