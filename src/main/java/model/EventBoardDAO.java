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
			String sql="insert into eventboard (no, title, content,email,readcount) "
					+ " values(SEQ_EVENTBOARD.nextval,?,?,?,0)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getEmail());
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
	
	public List<EventBoardVO> selectAll(String condition, String keyword) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<EventBoardVO> list=new ArrayList<EventBoardVO>();
		try {
			con=pool.getConnection();
			String sql="select * from eventboard";
			if(keyword!=null && !keyword.isEmpty()) { 				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			sql += " order by no desc";			
			ps=con.prepareStatement(sql);
			
			if(keyword!=null && !keyword.isEmpty()) { 	
				ps.setString(1, keyword);
			}
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
	
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update eventboard set readcount=readcount+1 "					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 cnt="+cnt+", 매개변수 no="+no);	
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public EventBoardVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		EventBoardVO vo=new EventBoardVO();
		try {
			con=pool.getConnection();
			String sql="select * from eventboard where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs=ps.executeQuery();
			if(rs.next()) {
				int no1=rs.getInt("no");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String email=rs.getString("email");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				vo.setTitle(title);
				vo.setContent(content);
				vo.setNo(no1);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setEmail(email);
			}
			System.out.println("매개변수 vo="+vo+", no="+no);
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	
}
