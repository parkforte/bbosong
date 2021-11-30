package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolMgr {
	DataSource ds;

	public ConnectionPoolMgr() {
		Context initctx;
		try {
			initctx = new InitialContext();
			ds = (DataSource) initctx.lookup("java:comp/env/jdbc/oracledb");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws SQLException {
		Connection conn = ds.getConnection();
		System.out.println("db연결 여부, conn=" + conn);
		return conn;
	}

	public void dbClose(PreparedStatement psmt, Connection conn) throws SQLException {
		if (psmt != null) psmt.close();
		if (conn != null) conn.close();
	}

	public void dbClose(ResultSet rs, PreparedStatement psmt, Connection conn) throws SQLException {
		if (rs != null) rs.close();
		if (psmt != null) psmt.close();
		if (conn != null) conn.close();
	}
}