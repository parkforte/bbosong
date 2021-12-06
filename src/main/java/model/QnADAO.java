package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr;

public class QnADAO {
	private ConnectionPoolMgr pool = null;

	public QnADAO() {
		pool = new ConnectionPoolMgr();
	}

	public boolean insertNewWrite(QnAVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into qna (no, title, content,email)"
					+ " values(SEQ_EVENTBOARD.nextval,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getEmail());
			int result = ps.executeUpdate();
			
			if (result < 1)
				return false;
			
			return true;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public List<QnAVO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<QnAVO> list = new ArrayList<QnAVO>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select q.*, a.nickname from qna q, account a"
						+ " where q.email = a.email"
						+ " order by no desc ";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String email = rs.getString("email");
				String content = rs.getString("content");
				int readount = rs.getInt("readcount");
				Timestamp regdate = rs.getTimestamp("regdate");
				String nickname = rs.getString("nickname");
				
				QnAVO vo = new QnAVO(no, title, content, email
									, readount, regdate, nickname);
				list.add(vo);
			}
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public boolean updateReadCount(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();

			String sql = "update qna set readcount=readcount+1 where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt = ps.executeUpdate();
			if(cnt < 1)
				return false;
			
			return true;
			
		} finally {
			pool.dbClose(ps, con);
		}
	}

	public QnAVO selectByNo(int no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		QnAVO vo = new QnAVO();
		
		try {
			con = pool.getConnection();
			
			String sql = "select * from qna where no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				int no1 = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String email = rs.getString("email");
				int readcount = rs.getInt("readcount");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				vo.setTitle(title);
				vo.setContent(content);
				vo.setNo(no1);
				vo.setReadcount(readcount);
				vo.setRegdate(regdate);
				vo.setEmail(email);
			}
			
			return vo;

		} finally {
			pool.dbClose(rs, ps, con);
		}

	}
}
