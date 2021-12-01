package model;

public class StoreVO {
	private int storeNo;
	private String storeName;
	private String address;
	private String tel;
	private String email;
	public StoreVO() {
		super();
	}
	public StoreVO(int storeNo, String storeName, String address, String tel, String email) {
		super();
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.address = address;
		this.tel = tel;
		this.email = email;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "StoreVO [storeNo=" + storeNo + ", storeName=" + storeName + ", address=" + address + ", tel=" + tel
				+ ", email=" + email + "]";
	}
	
	
}
