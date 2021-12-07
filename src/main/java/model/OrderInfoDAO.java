package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class OrderInfoDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	public List<OrderVO> selectAll(String condition, String keyword, String email) throws SQLException{
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<OrderVO> list= new  ArrayList<OrderVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from order_ where email=?";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	and " + condition +" like '%' || ? || '%'";
			}
			sql+=" order by orderNo desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(2, keyword);
			}
			rs=ps.executeQuery();
			System.out.println("이메일은 ?"+email);
			while(rs.next()) {
				int orderNo=rs.getInt("orderNo");
				email=rs.getString("email");
				int storeNo=rs.getInt("storeNo");
				int laundryNo=rs.getInt("laundryNo");
				int qty=rs.getInt("qty");
				Timestamp orderDate=rs.getTimestamp("orderDate");
				Timestamp pickupDate=rs.getTimestamp("pickupDate");
				String orderState=rs.getString("orderState");
				int serialNo=rs.getInt("serialNo");
				OrderVO vo = new OrderVO(orderNo, email, storeNo, laundryNo, qty, orderDate, pickupDate, orderState, serialNo);
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
			+", keyword="+keyword+", condition="+condition);
			return list;
		} finally{
			pool.dbClose(rs, ps, con);
		}
		
		
	}
	
	public List<OrderVO> selectAllAcc(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<OrderVO> list= new  ArrayList<OrderVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from order_";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	and " + condition +" like '%' || ? || '%'";
			}
			sql+=" order by orderNo desc";
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(2, keyword);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int orderNo=rs.getInt("orderNo");
				int storeNo=rs.getInt("storeNo");
				int laundryNo=rs.getInt("laundryNo");
				int qty=rs.getInt("qty");
				Timestamp orderDate=rs.getTimestamp("orderDate");
				Timestamp pickupDate=rs.getTimestamp("pickupDate");
				String orderState=rs.getString("orderState");
				int serialNo=rs.getInt("serialNo");
				OrderVO vo = new OrderVO(orderNo, storeNo, laundryNo, qty, orderDate, pickupDate, orderState, serialNo);
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
			+", keyword="+keyword+", condition="+condition);
			return list;
		} finally{
			pool.dbClose(rs, ps, con);
		}
		
		
	}
}
