package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.ReviewBoardVO;

import db.ConnectionPoolMgr2;

public class ReviewBoardDAO {
	private ConnectionPoolMgr2 pool;
	
	public ReviewBoardDAO() {
		pool=ConnectionPoolMgr2.getInstance();
	}
	

	public int insertReviewBoard(ReviewBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="insert into review(no, name, pwd, title, email, "
					+ "content, groupno, filename, filesize, originalFilename)"
					+ " values(reviewboard_seq.nextval, ?,?,?,?,?,"
					+ " reviewboard_seq.nextval,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getFileName());
			ps.setLong(7, vo.getFileSize());
			ps.setString(8, vo.getOriginalFileName());
						
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public List<ReviewBoardVO> selectAll(String condition, String keyword) 
			throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewBoardVO> list=new ArrayList<ReviewBoardVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select * from review";
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
				int readcount=rs.getInt("readcount");
				String title=rs.getString("title");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String content=rs.getString("content");
				Timestamp regdate=rs.getTimestamp("regdate");
				int score=rs.getInt("score");
				//답변형 추가
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				//자료실 추가
				String fileName=rs.getString("filename");
				String originalFileName=rs.getString("originalFilename");
				int downCount=rs.getInt("downcount");
				long fileSize=rs.getLong("fileSize");
				
				ReviewBoardVO vo = new ReviewBoardVO(no, name, pwd, title, content, 
						email, readcount, groupNo, step, sortNo, delFlag, fileName, 
						fileSize, downCount, originalFileName, regdate, score);
				
				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
				+", keyword="+keyword+", condition="+condition);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	

	public ReviewBoardVO selectByNo(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ReviewBoardVO vo=new ReviewBoardVO();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from review where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String title=rs.getString("title");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String content=rs.getString("content");
				int readcount=rs.getInt("readcount");
				Timestamp regdate=rs.getTimestamp("regdate");
				
				//답변형 추가
				int groupNo=rs.getInt("groupno");
				int step=rs.getInt("step");
				int sortNo=rs.getInt("sortno");
				String delFlag=rs.getString("delflag");
				
				//자료실 추가
				String fileName=rs.getString("filename");
				String originalFileName=rs.getString("originalFilename");
				int downCount=rs.getInt("downcount");
				long fileSize=rs.getLong("fileSize");
				
				vo.setContent(content);
				vo.setEmail(email);
				vo.setName(name);
				vo.setNo(no);
				vo.setPwd(pwd);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setTitle(title);
				
				vo.setGroupNo(groupNo);
				vo.setSortNo(sortNo);
				vo.setStep(step);
				vo.setDelFlag(delFlag);
				
				vo.setFileName(fileName);
				vo.setFileSize(fileSize);
				vo.setOriginalFileName(originalFileName);
				vo.setDowncount(downCount);
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 no="+no);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int updateReviewBoard(ReviewBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="update review";
			sql+= " set name=?,title=?, email=?, content=?";
			
			//파일이 첨부된 경우
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) { 
				sql+=", filename=?, filesize=?, originalFilename=?";
			}
			sql+= " where no=?";
			
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getEmail());
			ps.setString(4, vo.getContent());
			
			if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
				ps.setString(5, vo.getFileName());
				ps.setLong(6, vo.getFileSize());
				ps.setString(7, vo.getOriginalFileName());
				ps.setInt(8, vo.getNo());				
			}else {			
				ps.setInt(5, vo.getNo());
			}
			
			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}	
	
	
	public boolean checkPwd(ReviewBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		boolean bool=false;
		try {
			//1,2
			con=pool.getConnection();
			
			//3.
			String sql="select pwd from review where no=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				if(dbPwd.equals(vo.getPwd())) {
					bool=true;
				}
			}
			System.out.println("비밀번호 체크 결과 bool="+bool+", 매개변수 vo="+vo);
			
			return bool;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public void deleteReviewBoard(ReviewBoardVO vo) throws SQLException {
		Connection con=null;
		CallableStatement ps=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="call deleteReview(?,?,?)";
			ps=con.prepareCall(sql);
			ps.setInt(1, vo.getNo());
			ps.setInt(2, vo.getStep());
			ps.setInt(3, vo.getGroupNo());
			
			//4
			boolean bool=ps.execute();
			System.out.println("글 삭제 bool="+ bool +", 매개변수 vo="+vo);			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateReadCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update review set readcount=readcount+1"					
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
	
	public int reply(ReviewBoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		int cnt=0;
		try {
			//1,2 con
			con=pool.getConnection();
			
			//transaction 시작
			con.setAutoCommit(false);  //자동커밋 안되게 막는다
			
			//3. ps
			//[1] update - sortNo를 1씩 증가시켜 자리확보
			String sql="update review"
					+ " set sortno=sortno+1"
					+ " where groupno=? and sortno > ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, vo.getGroupNo());
			ps.setInt(2, vo.getSortNo());
			
			//4. exec
			cnt=ps.executeUpdate();
			System.out.println("답변달기 - update 결과 cnt="+cnt
					+", 매개변수 vo="+vo);
			
			//[2] insert
			sql="insert into review(no, name, pwd, title, email, content, "
				+ "groupno, step, sortno)"
				+ "values(reviewboard_seq.nextval, ?,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getTitle());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getContent());
			ps.setInt(6, vo.getGroupNo());
			ps.setInt(7, vo.getStep()+1);
			ps.setInt(8, vo.getSortNo()+1);
			
			
			cnt=ps.executeUpdate();
			System.out.println("답변하기 결과 cnt="+cnt);
			
			con.commit();
		}catch(SQLException e) {
			con.rollback();
			e.printStackTrace();
		}finally {			
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}
		
		return cnt;
	}
	
	public int updateDownCount(int no) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="update review set downcount=downcount+1"					
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
	
	public List<ReviewBoardVO> selectMainNotice() throws SQLException {
		/*select no,title
		from
		(
		    select no,title from board order by no desc
		)
		where rownum<=6*/
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ReviewBoardVO> list=new ArrayList<ReviewBoardVO>();
		try {
			con=pool.getConnection();
			
			String sql="select no, content"
					+ " from"
					+ " ("
					+ "     select no, content from review order by no desc"
					+ " )"
					+ " where rownum<=6";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int no=rs.getInt(1);
				String content=rs.getString(2);
				
				ReviewBoardVO vo = new ReviewBoardVO();
				vo.setNo(no);
				vo.setContent(content);
				list.add(vo);
			}
			System.out.println("메인 공지사항 결과 list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}

