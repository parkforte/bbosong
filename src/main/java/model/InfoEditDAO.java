package model;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;
import util.HashingUtil;

public class InfoEditDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	public int updateInfo(AccountVO vo) throws SQLException, NoSuchAlgorithmException {
		Connection con=null;
		PreparedStatement ps=null;
		HashingUtil hash = new HashingUtil();
		boolean isSucceed = false;
		try {
			con=pool.getConnection();
			con.setAutoCommit(false);
			String sql="update account";
			sql+=" set nickname=?, address=?, tel=? ";
			sql+=" where email=?";
			
			ps=con.prepareStatement(sql);
			
			String salt = hash.makeNewSalt();
			String digest = hash.hashing(vo.getPw(), salt);
			ps.setString(1, vo.getNickname());
			ps.setTimestamp(2, vo.getBirth());
			ps.setString(3, vo.getAddress());
			ps.setString(4, vo.getTel());
			ps.setString(5, vo.getEmail());
			
			int cnt = ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt+"매개변수 vo="+vo);
			
			return cnt;
		}finally{
			pool.dbClose(ps, con);
		}

	}
	
	public AccountVO selectByName(String name) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		
		AccountVO vo = new AccountVO();
		
		try {
			con=pool.getConnection();
			String sql="select * from account where name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,name);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String email=rs.getString("email");
				name=rs.getString("name");
				String nickname=rs.getString("nickname");
				Timestamp birth = rs.getTimestamp("birth");
				String address = rs.getString("address");
				String tel = rs.getString("tel");
				int gradeNo = rs.getInt("gradeNo");
				Timestamp joindate=rs.getTimestamp("joindate");
				String isverified = rs.getString("isverified");
				
				vo.setEmail(email);
				vo.setName(name);
				vo.setNickname(nickname);
				vo.setBirth(birth);
				vo.setAddress(address);
				vo.setTel(tel);
				vo.setGradeNo(gradeNo);
				vo.setJoinDate(joindate);
				vo.setIsVerified(isverified);
				
				vo=new AccountVO(email, name, nickname, birth, address, tel, gradeNo, joindate, tel, isverified);
			}
			System.out.println("vo="+vo);
			return vo;
		}finally{
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public AccountVO selectByEmail(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		
		AccountVO vo = new AccountVO();
		
		try {
			con=pool.getConnection();
			String sql="select * from account where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				email=rs.getString("email");
				String name=rs.getString("name");
				String nickname=rs.getString("nickname");
				Timestamp birth = rs.getTimestamp("birth");
				String address = rs.getString("address");
				String tel = rs.getString("tel");
				int gradeNo = rs.getInt("gradeNo");
				Timestamp joindate=rs.getTimestamp("joindate");
				String isverified = rs.getString("isverified");
				
				vo.setEmail(email);
				vo.setName(name);
				vo.setNickname(nickname);
				vo.setBirth(birth);
				vo.setAddress(address);
				vo.setTel(tel);
				vo.setGradeNo(gradeNo);
				vo.setJoinDate(joindate);
				vo.setIsVerified(isverified);
				
				vo=new AccountVO(email, name, nickname, birth, address, tel, gradeNo, joindate, tel, isverified);
			}
			System.out.println("vo="+vo);
			return vo;
		}finally{
			pool.dbClose(rs, ps, con);
		}
		
	}
	
}
