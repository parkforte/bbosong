package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class EventBoardDAO {
	private ConnectionPoolMgr pool;
	
	public EventBoardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	/**
	 *글작성메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertEvent(EventBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="insert into eventboard (no, title, content, email) "
					+ " values(SEQ_EVENTBOARD.nextval,?,?,'bbosong1001@dream.com')";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			int result=ps.executeUpdate();
			if(result>0) {
				System.out.println("글등록 성공! result="+result);
			}else {
				System.out.println("글등록 실패! result="+result);
			}
			return result;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<EventBoardVO> selectAll() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<EventBoardVO> list=new ArrayList<EventBoardVO>();
		try {
			con=pool.getConnection();
			String sql="select * from eventboard";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt("no");
				String title=rs.getString("title");
				String email=rs.getString("email");
				String content=rs.getString("content");
				int readount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				EventBoardVO vo=new EventBoardVO(no, title, content, email, readount, regdate);
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
}
