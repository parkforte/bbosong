package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;

public class ConnectionPoolMgr2 {
	private String url,user,pwd;
	private HashMap<Connection, Boolean> hmap;
	private int increment; 
	
	//static 변수
	private static ConnectionPoolMgr2 instance;
	
	//private 생성자
	private ConnectionPoolMgr2(){
		increment=5;	//5만큼씩 증가
		hmap=new HashMap<Connection,Boolean>(10);	
		Connection con=null;	
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공!");
			url="jdbc:oracle:thin:@DESKTOP-D49IIIH:1521:xe";	
			user="herb"; 	
			pwd="herb123";
			
			//커넥션 객체를 미리 생성해 놓기 - 10개
			for(int i=0;i<10;i++){	
				con=DriverManager.getConnection(url,user,pwd);		
				//해시맵의 key에 커넥션 저장
				
				hmap.put(con, Boolean.FALSE);		
				//해시맵의 value에 true, false 저장, false - 쉬는 커넥션이라는 표시	
			}//for
			
			System.out.println("ConnectionPool 생성!");
		}catch (ClassNotFoundException e) {			
			e.printStackTrace();
			System.out.println("Class Not Found!"); 
		}catch (SQLException e) {			
			e.printStackTrace();
			System.out.println("sql 예외발생!"); 
		}
	}//생성자
		
	//static메서드
	public static ConnectionPoolMgr2 getInstance() {
		if(instance==null) {
			instance=new ConnectionPoolMgr2();
		}
		
		return instance;
	}
	
	public synchronized Connection getConnection() 
			throws SQLException{
		Iterator<Connection> iterKeys=hmap.keySet().iterator();	
		Connection con=null;	
		while(iterKeys.hasNext() ){ 
			con=iterKeys.next();
			Boolean b=hmap.get(con);	
			if(b==Boolean.FALSE){	
				hmap.put(con, Boolean.TRUE);	
				return con; 
			}//if	
		}//while
		
		//쉬고 있는 컨넥션이 없으면 일할 Connection을 5개 증가시킨다	
		for(int i=0;i<increment;i++){	
			Connection con2=DriverManager.getConnection(url,user,pwd);	
			hmap.put(con2, Boolean.FALSE);	
		}//for
		
		return getConnection();
	}
	
	//커넥션을 사용하고 난 후 다시 되돌려주는 메소드	
	public void returnConnection(Connection returnCon){
		Iterator<Connection> iterKeys=hmap.keySet().iterator();	
		Connection con=null;	
		while(iterKeys.hasNext() ){	
			con=iterKeys.next();		
			if(con==returnCon){
				hmap.put(con, Boolean.FALSE);
				break;
			}//if
		}//while
		
		try{	
			removeConnection();
		}catch(SQLException e){	
			e.printStackTrace();	
			System.out.println("sqlerror:" + e.getMessage());
		}
	}
	
	//Connection 10개만 유지해주는 메서드
	public void removeConnection() throws SQLException{
		Connection con=null;
		Iterator<Connection> iterKeys=hmap.keySet().iterator();
		int count=0;
		while(iterKeys.hasNext() ){ 	
			con=iterKeys.next();	
			Boolean b=hmap.get(con);
			boolean b_pre=b.booleanValue();
			if(!b_pre){
				count++;
				if(count>10){ 
					hmap.remove(con);
					con.close();
				}
			}//if
		}//while
	}
	
	//모든 커넥션 close하는 메서드
	public void closeAll() throws SQLException{
		Iterator<Connection> iterKeys=hmap.keySet().iterator();	
		Connection con=null;	
		while(iterKeys.hasNext() ){ 	
			con=iterKeys.next();	
			con.close();
		}//while
	}
	
	
	//자원해제하는 메서드
	public void dbClose(PreparedStatement ps,  Connection con) throws SQLException{
		if(ps!=null) ps.close();
		if(con!=null)returnConnection(con);
	}
	
	public void dbClose(ResultSet rs,  PreparedStatement ps,  
			Connection con) throws SQLException{
		if(rs!=null)rs.close();
		if(ps!=null) ps.close();
		if(con!=null)returnConnection(con);				
	}
	
	
}//class
