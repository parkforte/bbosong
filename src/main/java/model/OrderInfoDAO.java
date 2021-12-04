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
	public List<OrderVO> selectAll(String condition, String keyword) throws SQLException{
		Connection con=null;
		PreparedStatement ps= null;
		ResultSet rs=null;
		
		List<OrderVO> list= new  ArrayList<OrderVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from order_ order by orderNo desc";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			ps=con.prepareStatement(sql);
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(1, keyword);
			}
			rs=ps.executeQuery();
			while(rs.next()) {
				int orderNo=rs.getInt("orderNo");
				String email=rs.getString("email");
				int storeNo=rs.getInt("storeNo");
				int laundryNo=rs.getInt("laundryNo");
				int qty=rs.getInt("qty");
				Timestamp orderDate=rs.getTimestamp("orderDate");
				Timestamp pickupDate=rs.getTimestamp("pickupDate");
				String orderState=rs.getString("orderState");
				int serialNo=rs.getInt("serialNo");
				
				OrderVO vo = new OrderVO(orderNo, email, storeNo, laundryNo, qty, orderDate, pickupDate, orderState, serialNo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
			+", keyword="+keyword+", condition="+condition);
			return list;
		} finally{
			pool.dbClose(rs, ps, con);
		}
		
		
	}
}
