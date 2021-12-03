package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr;

public class TipBoardDAO {
private ConnectionPoolMgr pool;
	
	public TipBoardDAO() {
		pool=new ConnectionPoolMgr();
	}
	
	public int insertTip(TipBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			String sql="insert into tipboard(no, title, pwd, content, email) "
					+ " values(TipBoard_seq.nextval,?,?,'bbosong@dream.com')";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			int result=ps.executeUpdate();
			if(result>0) {
				System.out.println("글등록 성공, result="+result);
			}else {
				System.out.println("글등록 실패, result="+result);
			}
			return result;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
