package model;  

import java.sql.CallableStatement;
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
			
			String sql="insert into notice (no, title, content, email, filename, filesize, originalFilename)"
					+" values(seq_notice.nextval,?,?,'bbosong1001@dream.com',?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getFileName());
	        ps.setLong(4, vo.getFileSize());
	        ps.setString(5, vo.getOriginalFileName());
			
	        int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		} finally{
			pool.dbClose(ps, con);
		}
		
	}
	
	public List<NoticeVO> selectAll(String condition, String keyword) 
			throws SQLException {
		
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
			sql += " order by no desc";			
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
	public NoticeVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		NoticeVO vo=new NoticeVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from notice where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String content=rs.getString("content");
				String email=rs.getString("email");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				//자료실 추가
				String fileName=rs.getString("filename");
				long fileSize=rs.getLong("fileSize");
				String originalFileName=rs.getString("originalFilename");
				int downcount=rs.getInt("downcount");
				
				vo.setContent(content);
				vo.setEmail(email);
				vo.setNo(no);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setTitle(title);
				
				
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setOriginalFileName(originalFileName);
				vo.setDowncount(downcount);
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int updatenotice(NoticeVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update notice";
			sql+= " set title=?, content=?";
			
			//파일이 첨부된 경우
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) { 
				sql+=", filename=?, filesize=?, originalFilename=?";
			}
			sql+= " where no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				ps.setString(3, vo.getFileName());
				ps.setLong(4, vo.getFileSize());
				ps.setString(5, vo.getOriginalFileName());
				ps.setInt(6, vo.getNo());				
			}else {			
				ps.setInt(3, vo.getNo());
			}
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public boolean checkPwd(NoticeVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql="select pwd from notice where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd!=null) {
					bool=true;
				}
			}
			System.out.println("비밀번호 체크 결과 bool="+bool+", 매개변수 vo="+vo);
			
			return bool;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update notice set readcount=readcount+1"					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deletenotice(int no) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="delete from notice where no=?";
			ps=con.prepareCall(sql);
			ps.setInt(1, no);
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 삭제 cnt="+ cnt +", 매개변수 no="+no);	
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateDownCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update notice set downcount=downcount+1"					
					+ " where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			int cnt=ps.executeUpdate();
			System.out.println("다운로드수 증가 결과 cnt="+cnt+", 매개변수 no="+no);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
}
