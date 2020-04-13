package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.MemberVO;

public class MemberDAO {

	private PreparedStatement psmt;
	private ResultSet rs;

	public ArrayList<MemberVO> selectAll() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO member = null;
		String sql = "";
		Connection conn = GetConnection.getConn();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				member = new MemberVO();
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

	public int memberInsert(MemberVO member) {
		int n = 0;
		String sql = "INSERT INTO MEMBER (EMAIL, NICKNAME, PW, GENDER, PROFILE) VALUES (?,?,?,?,?)";
		Connection conn = GetConnection.getConn();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getEmail());
			psmt.setString(2, member.getNickname());
			psmt.setString(3, member.getPw());
			psmt.setString(4, member.getGender());
			psmt.setString(5, member.getProfile());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			GetConnection.close(conn);
		}
		return n;
	}

	public int memberEmailCheck(String email) {
		Connection conn = GetConnection.getConn();
		int n = 0;
		String sql = "select email from member where email=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			if (rs.next()) {
				n = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			GetConnection.close(rs, psmt, conn);
		}
		return n;
	}

	public int memberNameCheck(String nickName) {
		Connection conn = GetConnection.getConn();
		int n = 0;
		String sql = "select email from member where nickname=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, nickName);
			rs = psmt.executeQuery();
			if (rs.next()) {
				n = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			GetConnection.close(rs, psmt, conn);
		}
		return n;
	}

	public MemberVO login(MemberVO member) {
		Connection conn = GetConnection.getConn();
		String sql = "select email , auth from member where email = ? and pw =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getEmail());
			psmt.setString(2, member.getPw());
			rs = psmt.executeQuery();
			if (rs.next()) {
				member.setAuth(rs.getString("auth"));
				return member;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
