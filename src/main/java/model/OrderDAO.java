package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr;

public class OrderDAO {

	private ConnectionPoolMgr pool;
	
	public OrderDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertOrder(OrderVO vo, String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="insert into order_ (orderNo, email, storeno, totalQty, totalPrice, pickupDate, orderState )"
					+" values(seq_order.nextval, ?,?,?,?,?,'배송중')";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, vo.getStoreNo());
			ps.setInt(3, vo.getTotalQty());
			ps.setInt(4, vo.getTotalPrice());
			ps.setTimestamp(5, vo.getPickupDate());
			int cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println("order성공! cnt="+cnt+", vo="+vo);
			}else {
				System.out.println("order실패! vo="+vo);
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
