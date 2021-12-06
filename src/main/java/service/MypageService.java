package service;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import db.ConnectionPoolMgr;
import model.AccountVO;
import model.InfoEditDAO;
import model.WithdrawalDAO;
import util.HashingUtil;

public class MypageService {
	// 아이디 중복확인시 필요한 상수
	public static final int EXIST_ID = 1; // 해당 아이디가 이미 존재함
	public static final int NON_EXIST_ID = 2; // 해당 아이디가 존재하지 않음-사용가능

	// 로그인 처리시 필요한 상수
	public static final int LOGIN_OK = 1; // 로그인 성공
	public static final int DISAGREE_PWD = 2; // 비번 불일치
	public static final int USERID_NONE = 3; // 아이디 존재하지 않음

	private InfoEditDAO infodao;
	private WithdrawalDAO wdao;
	public MypageService() {
		infodao = new InfoEditDAO();
		wdao = new WithdrawalDAO();
	}


	public AccountVO selectByName(String name) throws SQLException {
		return infodao.selectByName(name);

	}
	public AccountVO selectByEmail(String email) throws SQLException {
		return infodao.selectByEmail(email);

	}

	public int deleteAccount(String email, String pw) throws SQLException, NoSuchAlgorithmException {
		return wdao.deleteAccount(email, pw);
		
	}
	public int loginCheck(String email, String pw) throws SQLException {
	      return wdao.loginCheck(email, pw);
	   }
}
