package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import db.ConnectionPoolMgr;

public class NoticeDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();
	
	public int insertNotice(NoticeVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps =null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into notice(no, title, content)"
						+" values(seq_notice.nextval, ? ,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		} finally{
			pool.dbClose(ps, con);
		}
		
	}
	
	public List<NoticeVO> selectAll(String condition, String keyword) 
			throws SQLException {
		/*
		select * from reBoard
		where title like '%안녕%';
		select * from reBoard
		where name like '%길동%';
		select * from reBoard
		where content like '%내용%';
		*/
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select * from notice";
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
				int no=rs.getInt("no");
				String title=rs.getString("title");
				String content=rs.getString("content");
				String email=rs.getString("email");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				//자료실 추가
				String fileName=rs.getString("filename");
				String originalFileName=rs.getString("originalFilename");
				int downcount=rs.getInt("downcount");
				long fileSize=rs.getLong("fileSize");
				
				NoticeVO vo = new NoticeVO(no, title, content, email, readcount, fileName, fileSize, downcount, originalFileName, regdate);
						
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
