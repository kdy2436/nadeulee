package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GetConnection {
	
	/*
	 커넥션 객체를 전역변수로 사용 
	*/
	public Connection conn;
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@39.116.34.40:1521:xe";
	String user = "pjt";
	String password = "pjt";
	
	
	public GetConnection() {
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		try {
//			InitialContext initialContext = new InitialContext();
//			DataSource source = (DataSource) initialContext.lookup("java:comp/env/jdbc/teamPjtDB");
//			conn = source.getConnection();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
	
		

}
