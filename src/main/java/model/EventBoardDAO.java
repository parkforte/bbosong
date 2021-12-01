package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr;

public class EventBoardDAO {
	private ConnectionPoolMgr pool;
	
	public EventBoardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
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
				System.out.println("글등록 성공="+result);
			}else {
				System.out.println("글등록 실패!");
			}
			return result;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
