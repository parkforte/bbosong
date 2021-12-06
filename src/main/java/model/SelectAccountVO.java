package model;

import java.sql.Timestamp;

public class SelectAccountVO {
	private String email;
	private String name;
	private String tel;
	private Timestamp joinDate;
	
	public SelectAccountVO() {
		super();
	}

	public SelectAccountVO(String email, String name, String tel, Timestamp joinDate) {
		super();
		this.email = email;
		this.name = name;
		this.tel = tel;
		this.joinDate = joinDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "SelectAccountVO [email=" + email + ", name=" + name + ", tel=" + tel + ", joinDate=" + joinDate + "]";
	}		
	
}


