package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.DTO.MemberDTO;

public class MemberDAO {
 
	Connection conn =GetConnection.getConn();
	private PreparedStatement psmt;
	private ResultSet rs;
	
	
	public ArrayList<MemberDTO> selectAll() {
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		String sql = "";
			
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				while(rs.next()) {
					member = new MemberDTO();
					member.setEmail(rs.getString("email"));
					member.setNickname(rs.getString("nickname"));
					member.setPw(rs.getString("pw"));
					member.setGender(rs.getString("gender"));
					member.setAuth(rs.getString("auth"));
					list.add(member);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				GetConnection.close(conn);
			}
			return list;
	}
	
	public int memberInsert(MemberDTO member) {
		int n = 0;
		String sql ="insert into member (email, nickname, pw, gender, profile) values (?,?,?,?,?)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getEmail());
			psmt.setString(2, member.getNickname());
			psmt.setString(3,  member.getPw());
			psmt.setString(4,  member.getGender());
			psmt.setString(5, member.getProfile());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			GetConnection.close(conn);
		}
		return n;
	}
	
	public int memberEmailCheck(String email) {
		int n = 0;
		String sql = "select email from member where email=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			if(rs.next()) {
				n=1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
}
