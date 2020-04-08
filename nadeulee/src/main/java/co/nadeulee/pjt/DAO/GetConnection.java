package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GetConnection {
	
	static String driver = "oracle.jdbc.driver.OracleDriver";
	static String url = "jdbc:oracle:thin:@39.116.34.40:1521:xe";
	static String user = "pjt";
	static String password = "pjt";
	
	
	/**********
	 * 커넥션 풀을 이용해서 커넥션 객체를 가지고 온다.
	 * 
	*/
	public static Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		try {
//			InitialContext initialContext = new InitialContext();
//			DataSource source = (DataSource) initialContext.lookup("java:/comp/env/jdbc/myoracle");
//			conn = source.getConnection();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return conn;
		
	}

	/****************	
	 * clsose 함수를 미리 정의해서 사용한다.
	 * connection객체만 매개값으로 받오는 함수
	 */
	public static void close(Connection conn) {
		try {
			if( conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/****************	
	 * clsose 함수를 미리 정의해서 사용한다.
	 * connection, PreparedStatement객체를 매개값으로 받오는 함수
	 */
	public static void close(Connection conn, PreparedStatement psmt) {
		try {
			if( conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if( psmt != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/****************	
	 * clsose 함수를 미리 정의해서 사용한다.
	 * connection, PreparedStatement , Connection객체를 매개값으로 받오는 함수
	 */
	public static void close(ResultSet rs, PreparedStatement psmt, Connection conn) {
		if(rs != null) {			
			try {
				if(! rs.isClosed()) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}
		
		if(psmt != null) {
			try {
				if(! psmt.isClosed()) psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null) {
			try {
				if(! conn.isClosed())  conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
		

}
