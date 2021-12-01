package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr;

public class StoreDAO {
	private ConnectionPoolMgr pool;
	
	public StoreDAO() {
		pool=new ConnectionPoolMgr();
	}
	
}
