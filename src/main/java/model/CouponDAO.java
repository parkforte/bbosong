package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class CouponDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	
	public int insertCoupon(MyCouponVO vo ,String email) throws SQLException {
		Connection con= null;
		PreparedStatement ps = null;
		
		int cnt=0;
		try {
			con=pool.getConnection();
			
			String sql="insert into mycoupon(serialno,email)"
					+" values(?,?)";
			ps=con.prepareStatement(sql);
			System.out.println("dddafwetlqkf");
			ps.setInt(1, vo.getSerialNo());
			ps.setString(2,email);
			System.out.println("dd");
			cnt=ps.executeUpdate();
			System.out.println("쿠폰 등록 결과 cnt="+cnt+"매개변수 vo"+vo);
			return cnt;
		} finally{
			pool.dbClose(ps, con);
		}
	}
	public List<CouponVO> showAllCoupon(String email) throws SQLException{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<CouponVO> list=new ArrayList<CouponVO>();
		try {
			con=pool.getConnection();
			
			String sql="select m1.serialno,c1.couponname, c1.discount, c1.expire from mycoupon m1 join coupon c1"
					+ " on m1.serialno=c1.serialno"
					+" where email=?"
					+ " order by c1.expire desc";
			
			ps=con.prepareStatement(sql);
			ps.setString(1,email);
			
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int serialno = rs.getInt("serialno");
				String couponname=rs.getString("couponname");
				int discount=rs.getInt("discount");
				Timestamp expire = rs.getTimestamp("expire");
				
				CouponVO vo =new CouponVO(serialno,couponname, discount, expire);
				
				list.add(vo);
			
			}
			System.out.println("글목록 list.size()="+list.size());
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
