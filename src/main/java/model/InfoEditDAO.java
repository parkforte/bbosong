package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import db.ConnectionPoolMgr;

public class InfoEditDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	
	public int updateInfo(AccountVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update account";
			sql+=" set nickname=?, birth=?, address=?, tel=? ";
			sql+=" where name=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getNickname());
			ps.setTimestamp(4, vo.getBirth());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getTel());
			ps.setInt(7, vo.getGradeNo());
			ps.setTimestamp(8, vo.getJoinDate());
			ps.setString(9, vo.getIsVerified());
			
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
}
