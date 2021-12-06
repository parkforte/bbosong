package model;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;
import util.HashingUtil;

public class AccountDAO {
	private ConnectionPoolMgr2 pool;
	
	public AccountDAO() {
		pool=ConnectionPoolMgr2.getInstance();
	}
	
	public boolean insertUser(AccountVO vo) throws SQLException {
		HashingUtil hash = new HashingUtil();
		Connection con = null;
		PreparedStatement ps = null;
		int cnt = 0;
		boolean isSucceed = false;
		
		try {
			con = pool.getConnection();
			con.setAutoCommit(false);

			// -------------- Transaction --------------

			String sql = "insert into account(email, name, nickname, birth, address, tel) "
					+ " values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, vo.getEmail());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getNickname());
			ps.setTimestamp(4, vo.getBirth());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getTel());
			cnt = ps.executeUpdate();

			if (cnt < 1)
				throw new SQLException();

			sql = "insert into hash values(?, ?, ?)";
			ps.close();
			ps = con.prepareStatement(sql);

			String salt = hash.makeNewSalt();
			String digest = hash.hashing(vo.getPw(), salt);
			ps.setString(1, vo.getEmail());
			ps.setString(2, digest);
			ps.setString(3, salt);

			cnt = ps.executeUpdate();
			// -----------------------------------------

			con.commit();
			isSucceed = true;
		} catch (SQLException | NoSuchAlgorithmException e) {
			con.rollback();
			e.printStackTrace();
		} finally {
			con.setAutoCommit(true);
			pool.dbClose(ps, con);
		}

		return isSucceed;
	}

	public boolean signin(AccountVO vo) throws SQLException {
		HashingUtil hash = new HashingUtil();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();

			String sql = "select * from account where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			rs = ps.executeQuery();

			if (!rs.next())
				return false;

			sql = "select digest, salt from hash where email = ?";
			ps.close();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getEmail());
			rs.close();
			rs = ps.executeQuery();

			rs.next();
			String dbDigest = rs.getString("digest");
			String salt = rs.getString("salt");
			String inputDigest = hash.hashing(vo.getPw(), salt);
			
			System.out.println("inputPw    : " + vo.getPw());
			System.out.println("salt       : " + salt);
			System.out.println("dbDigest   : " + dbDigest);
			System.out.println("inputDigest: " + inputDigest);
			if (!dbDigest.equals(inputDigest))
				return false;

		} catch (SQLException | NoSuchAlgorithmException e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return true;
	}
	
	public boolean checkDuplicate(String email) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();

			String sql = "select email from account where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if (!rs.next())
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return true;
	}
	
	public boolean verifyAccount(String email) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = pool.getConnection();
			System.out.println(email);
			String sql = "update account set isverified = 1 where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			int cnt = ps.executeUpdate();
			System.out.println(cnt + "행 업데이트");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(ps, con);
		}

		return true;
	}
	
	public boolean isVerified(String email) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();

			String sql = "select isverified from account where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();

			if(!rs.next())
				return false;
			
			if(!rs.getString("isverified").equals("1"))
				return false;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pool.dbClose(rs, ps, con);
		}

		return true;
	}
	
	/**
	 * checkout.jsp용
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public AccountVO selectAll(String email) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=pool.getConnection();
			String sql="select * from account where email=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, email);
			rs=ps.executeQuery();
			AccountVO vo=null;
			if(rs.next()){
				String Email=rs.getString("email");
				String name=rs.getString("name");
				String nickname=rs.getString("nickname");
				Timestamp birth=rs.getTimestamp("birth");
				String address=rs.getString("address");
				String tel=rs.getString("tel");
				int gradeNo=rs.getInt("gradeNo");
				Timestamp joindate=rs.getTimestamp("joindate");
				vo=new AccountVO(Email, name, nickname, birth, address, tel, gradeNo, joindate);
			}
			System.out.println(vo);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
}
	// 회원목록조회에 대한 추가
	
	public List<AccountVO> selectAll(String condition, String keyword) 
			throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<AccountVO> list=new ArrayList<AccountVO>();
		try {
			//1,2 con
			con=pool.getConnection();
			
			//3 ps
			String sql="select email, name, tel, joindate from account";
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
				
				AccountVO vo = new AccountVO(email, name, tel, joindate);
				
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
