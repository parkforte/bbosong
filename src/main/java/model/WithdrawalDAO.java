package model;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr;
import service.MypageService;
import util.HashingUtil;

public class WithdrawalDAO {
	private ConnectionPoolMgr pool=new ConnectionPoolMgr();
	
	 public int deletePW(String pw) throws SQLException, NoSuchAlgorithmException {
	      Connection con =null;
	      PreparedStatement ps= null;
	      boolean insSucceed = false;
	      HashingUtil hash = new HashingUtil();
	      try {
	      con=pool.getConnection();
	      String salt=hash.makeNewSalt();
	      String digest=hash.hashing(pw, salt);
	      
	      String slq="delete  from hash where digest=? and salt=?";
	      
	      ps=con.prepareStatement(slq);
	      
	      ps.setString(1, digest);
	      ps.setString(2, salt);
	      
	      int cnt = ps.executeUpdate();
	      return cnt;
	      
	      }finally {
	    	  pool.dbClose(ps, con);
	      }
	      
	   }
	public int loginCheck(String email, String pw) throws SQLException, NoSuchAlgorithmException {
	      Connection con = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      AccountVO vo= new AccountVO();
	      HashingUtil hash = new HashingUtil();
	      
	      int result = 0;
	      try {
	         con = pool.getConnection();
	         
	         String sql = "select digest, salt from hash where email=?";
	         ps = con.prepareStatement(sql);
	         ps.setString(1, email);
	         
	         rs = ps.executeQuery();
	         
	         if(!rs.next())
	        	 return MypageService.USERID_NONE;
	         
		         String dbDigest = rs.getString("digest");
		         String dbSalt = rs.getString("salt");
	         
		         String inputDigest = hash.hashing(pw, dbSalt);
	         
	         if(!dbDigest.equals(inputDigest))
	        	 return MypageService.DISAGREE_PWD;
	         
				/*
				 * String sql = "select pw from account " + " where email = ?"; ps =
				 * con.prepareStatement(sql); ps.setString(1, vo.getEmail()); rs =
				 * ps.executeQuery();
				 */
	         
				/*
				 * if(rs.next()) { if(pw.equals(rs.getString(1))){ result =
				 * MypageService.LOGIN_OK; } else { result = MypageService.DISAGREE_PWD; } }
				 * else { result = MypageService.USERID_NONE; }
				 */
	         
	         return MypageService.LOGIN_OK;
	      } finally {
	         pool.dbClose(rs, ps, con);
	      }
	   }

	public int deleteAccount(String email) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from account where email=?";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, email);
			
			int cnt = ps.executeUpdate();
			
			return cnt;
		} finally{
			pool.dbClose(ps, con);
		}
		
	}

}
