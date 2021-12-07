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
	
	 public int deleteAccount(String email, String pw) throws SQLException, NoSuchAlgorithmException {
	      Connection con=null;
	      PreparedStatement ps =null;
	      ResultSet rs = null;
	      HashingUtil hash = new HashingUtil();
	      AccountVO vo= new AccountVO();
	      int cnt = 0;
	      String salt = hash.makeNewSalt();
	      String digest = hash.hashing(pw, salt);
	      
	      boolean isSucceed = false;
	      try {
	          con=pool.getConnection();
	          String sql = "select salt from hash where email = ?";
	          ps=con.prepareStatement(sql);
	          ps.setString(1, vo.getEmail());
	          System.out.println("DBUG cnt = "+cnt);
	          cnt = ps.executeUpdate();
	          rs = ps.executeQuery();
	          while(rs.next()) {
	         String digest1 = rs.getString("digest");
	         String salt1 = rs.getString("salt");
	         
	          if(digest == digest1 && salt == salt1) {
	             ps.close();
	             
	             sql = "delete from account where email = ?";
	             ps.setString(1, vo.getEmail());
	             System.out.println("DBUG cnt2 = "+cnt);
	             cnt = ps.executeUpdate();
	             }
	          } 
	          System.out.println("DBUG cnt3 ="+cnt+"매개변수 email,pw"+email+pw);
	         isSucceed = true;
	      }catch(SQLException e) {
	         e.printStackTrace();
	      } 
	      finally {
	    	 
	         pool.dbClose(ps, con);
	      }
		return cnt;
	      
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
	        	 return MypageService.NON_EXIST_ID;
	         
	         String dbDigest = rs.getString("digest");
	         String dbSalt = rs.getString("digest");
	         
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
}
