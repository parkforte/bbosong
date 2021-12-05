package model;

import java.sql.Timestamp;

public class AccountVO {
	private String email;
	private String name;
	private String nickname;
	private Timestamp birth;
	private String address;
	private String tel;
	private int gradeNo;
	private Timestamp joinDate;
	private String pw;
	private String isVerified;
	
	public AccountVO() {
		super();		
	}

	public AccountVO(String email, String name, String nickname, Timestamp birth, String address, String tel,
			int gradeNo, Timestamp joinDate, String pw, String isVerified) {
		super();
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.address = address;
		this.tel = tel;
		this.gradeNo = gradeNo;
		this.joinDate = joinDate;
		this.pw = pw;
		this.isVerified = isVerified;
	}
	
	
	/**
	 * checkout.jsp용
	 * @param email
	 * @param name
	 * @param nickname
	 * @param birth
	 * @param address
	 * @param tel
	 * @param gradeNo
	 * @param joinDate
	 */
	public AccountVO(String email, String name, String nickname, Timestamp birth, String address, String tel,
			int gradeNo, Timestamp joinDate) {
		super();
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.address = address;
		this.tel = tel;
		this.gradeNo = gradeNo;
		this.joinDate = joinDate;
	}

	public AccountVO(String email2, String name2, String tel2, Timestamp joinDate2) {
		super();
		this.email = email2;
		this.name = name2;
		this.tel = tel2;
		this.joinDate = joinDate2;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
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

	public int getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getIsVerified() {
		return isVerified;
	}

	public void setIsVerified(String isVerified) {
		this.isVerified = isVerified;
	}

	@Override
	public String toString() {
		return "AccountVO [email=" + email + ", name=" + name + ", nickname=" + nickname + ", birth=" + birth
				+ ", address=" + address + ", tel=" + tel + ", gradeNo=" + gradeNo + ", joinDate=" + joinDate + ", pw="
				+ pw + ", isVerified=" + isVerified + "]";
	}
	
}
