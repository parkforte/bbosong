package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class SelectAccountDAO {
	private ConnectionPoolMgr2 pool;
	
	public SelectAccountDAO() {
		pool=ConnectionPoolMgr2.getInstance();
	}
	// 회원목록조회에 대한 추가
	
	public List<SelectAccountVO> selectAll(String condition, String keyword) 
			throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SelectAccountVO> list=new ArrayList<SelectAccountVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select email, name, tel, joindate from account ";
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			sql += " order by groupno desc, sortno";			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(1, keyword);
			}
			
			//4 exec
			rs=ps.executeQuery();
			while(rs.next()) {
				String email=rs.getString("email");
				String name=rs.getString("name");
				String tel=rs.getString("tel");
				Timestamp joindate=rs.getTimestamp("joindate");
				
				SelectAccountVO vo = new SelectAccountVO(email, name, tel, joindate);
				
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
				+", keyword="+keyword+", condition="+condition);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
