package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class MyCouponDAO {
	private ConnectionPoolMgr pool;
	
	public MyCouponDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public List<MyCouponVO> getMyCoupon(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<MyCouponVO> list=new ArrayList<MyCouponVO>();
		try {
			con=pool.getConnection();
			String sql="select * from mycoupon where email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			rs=ps.executeQuery();
			while(rs.next()) {
				int serialNo=rs.getInt("serialNo");
				String Email=rs.getString("email");
				MyCouponVO vo=new MyCouponVO(serialNo, Email);
				list.add(vo);
			}
			System.out.println("list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteCoupon(String email, int serialno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="delete from mycoupon where email=? and serialno=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, serialno);
			int cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println(serialno+"쿠폰 삭제성공!");
			}else {
				System.out.println(serialno+"쿠폰 사용안함!");
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}
