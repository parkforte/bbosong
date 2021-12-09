package model;

import java.sql.SQLException;

public class AdminService {
	//아이디 중복확인시 필요한 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재함
	public static final int NON_EXIST_ID=2;  //해당 아이디가 존재하지 않음-사용가능	

	//로그인 처리시 필요한 상수
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2; //비번 불일치
	public static final int USERID_NONE=3; //아이디 존재하지 않음
	
	private AdminDAO AdminDao;

	public AdminService() {
		AdminDao=new AdminDAO();
	}
	
	public int loginCheck(String email, String pwd) throws SQLException {
		return AdminDao.loginCheck(email, pwd);
	}
	
	public AdminVO selectByEmail(String email) throws SQLException {
		return AdminDao.selectByUserid(email);
	}
}
