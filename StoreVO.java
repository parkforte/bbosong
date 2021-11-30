package com.semiproject.board.model;

public class StoreVO {
	private int storeNo;
	private String storeName;
	private String address;
	private String tel;
	
	public StoreVO() {
		super();
	}

	public StoreVO(int storeNo, String storeName, String address, String tel) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.address = address;
		this.tel = tel;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
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

	@Override
	public String toString() {
		return "StoreVO [storeNo=" + storeNo + ", storeName=" + storeName + ", address=" + address + ", tel=" + tel
				+ "]";
	}	
	
}
