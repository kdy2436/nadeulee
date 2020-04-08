package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.DTO.MemberDTO;

public class MemberDAO {
 
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	public ArrayList<MemberDTO> selectAll() {
		Connection conn =GetConnection.getConn();
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		String sql = "";
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					member = new MemberDTO();
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				GetConnection.close(conn, psmt, rs);
			}
	}
}
