package model;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr;
import util.HashingUtil;

public class AdminDAO {
	ConnectionPoolMgr pool = new ConnectionPoolMgr();

	public boolean signin(AdminVO vo) throws SQLException {
		HashingUtil hash = new HashingUtil();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();

			String sql = "select * from admin where email = ?";
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
			String inputDigest = hash.hashing(vo.getPwd(), salt);
			
			System.out.println("inputPw    : " + vo.getPwd());
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
}
