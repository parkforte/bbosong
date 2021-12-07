package model;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import model.AdminService;
import model.AdminVO;

import db.ConnectionPoolMgr;
import util.HashingUtil;

public class AdminDAO {
	private ConnectionPoolMgr pool;
	
	public AdminDAO() {
		pool = new ConnectionPoolMgr();
	}

	public int loginCheck(String email, String pwd) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		try {
			con=pool.getConnection();
			
			String sql="select pwd from admin"
					+ " where email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(pwd.equals(dbPwd)) {
					result=AdminService.LOGIN_OK;
				}else {
					result=AdminService.DISAGREE_PWD;					
				}
			}else {
				result=AdminService.USERID_NONE;
			}
			
			System.out.println("로그인 처리 결과 result="+ result
				+", 매개변수 email="+email+", pwd="+pwd);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public AdminVO selectByUserid(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		AdminVO vo=new AdminVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from admin"
					+ " where email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				int storeNo=rs.getInt("storeNo");
				
				
				vo.setEmail(email);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setStoreNo(storeNo);
			}
			
			System.out.println("회원조회 결과 vo="+ vo
				+", 매개변수 email="+email);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
