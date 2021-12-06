package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class CartDAO {
	private ConnectionPoolMgr pool;
	
	public CartDAO() {
		pool=new ConnectionPoolMgr();
	}

	//insert
	public int insertCart(CartVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			
			String sql="insert into cart (cartno,laundryno, qty, price, email) "
					+" values(seq_cart.nextval,?, ?,? , ?)";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getLaundryNo());
			ps.setInt(2, vo.getQty());
			ps.setInt(3, vo.getPrice());
			ps.setString(4, vo.getEmail());
			int cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println("장바구니 등록성공 cnt="+cnt+", vo="+vo);
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<CartVO> selectAll(String email) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<CartVO> list=new ArrayList<CartVO>();
		try {
			con=pool.getConnection();
			String sql="select * from cart where email=? order by regdate desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			rs=ps.executeQuery();
			while(rs.next()){
				int cartNo=rs.getInt("cartNo");
				String cartEmail=rs.getString("email");
				int qty=rs.getInt("qty");
				int price=rs.getInt("price");
				int laundryNo=rs.getInt("laundryNo");
				Timestamp regdate=rs.getTimestamp("regdate");
				CartVO vo=new CartVO(cartNo, cartEmail, laundryNo, qty, price, regdate);
				list.add(vo);
			}
			System.out.println("list.size()="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteCart(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="delete from cart where email=?";
			ps=con.prepareCall(sql);
			ps.setString(1, email);
			int cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println("장바구니비우기 성공! cnt="+cnt);
			}else {
				System.out.println("장바구니비우기 실패! cnt="+cnt);
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteItem(int cartNo, String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="delete from cart where cartNo=? and email=?";
			ps=con.prepareCall(sql);
			ps.setInt(1, cartNo);
			ps.setString(2, email);
			int cnt=ps.executeUpdate();
			if(cnt>0) {
				System.out.println("아이템 삭제 성공! cnt="+cnt);
			}else {
				System.out.println("아이템 삭제 실패! cnt="+cnt);
			}
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
