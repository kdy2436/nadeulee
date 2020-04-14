package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.R_BoardVO;

public class R_BoardDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@39.116.34.40:1521:xe";
	private String user = "pjt";
	private String password = "pjt";

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	public R_BoardDAO() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<R_BoardVO> selectReview() {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select rno, r.content_id, title, r.email, r.nickname, profile, rcontent, rdate, likes, img1, img2, img3\r\n"
				+ "from r_board r, tour t, member m\r\n"
				+ "where r.content_id = t.content_id and r.email = m.email order by 1 desc";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setRno(rs.getInt(1));
				rboard.setRcontent_id(rs.getString(2));
				rboard.setTitle(rs.getString(3));
				rboard.setRemail(rs.getString(4));
				rboard.setRnickname(rs.getString(5));
				rboard.setProfile(rs.getString(6));
				rboard.setRcontent(rs.getString(7));
				rboard.setRdate(rs.getDate(8));
				rboard.setLikes(rs.getInt(9));
				rboard.setImg1(rs.getString(10));
				rboard.setImg2(rs.getString(11));
				rboard.setImg3(rs.getString(12));
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);
		return list;

	}

	public ArrayList<R_BoardVO> selectComment() {
		ArrayList<R_BoardVO> list2 = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select cno, ccontent, cdate, c.rno, c.email, c.nickname, profile\r\n" + 
		"from c_board c, member m, r_board r\r\n" + 
				"where c.email = m.email and c.rno = r.rno";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setCno(rs.getInt(1));
				rboard.setCcontent(rs.getString(2));
				rboard.setCdate(rs.getDate(3));
				rboard.setCrno(rs.getInt(4));
				rboard.setEmail(rs.getString(5));
				rboard.setNickname(rs.getString(6));
				rboard.setProfile(rs.getString(7));
				list2.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);
		return list2;

	}

//	public R_BoardVO selectComment(R_BoardVO vo) {
//		ArrayList<R_BoardVO> list2 = new ArrayList<R_BoardVO>();
//		R_BoardVO rboard = null;
//		String sql = "select c_no, c.content, cdate, c.r_no, c.email, nickname, profile\r\n"
//				+ "from c_board c , member m, r_board r\r\n" + "where c.email = m.email and c.r_no = r.r_no";
//		
//		String aaa="ddddddd where=?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, vo.getRno());
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				rboard = new R_BoardVO();
//				rboard.setCno(rs.getInt(1));
//				rboard.setCcontent(rs.getString(2));
//				rboard.setCdate(rs.getDate(3));
//				rboard.setCrno(rs.getInt(4));
//				rboard.setCemail(rs.getString(5));
//				rboard.setNickname(rs.getString(6));
//				rboard.setProfile(rs.getString(7));
//				list2.add(rboard);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		GetConnection.close(rs, psmt, conn);
//		return rboard;
//
//	}
//	
//	
//	

//	public R_BoardVO selectComment(R_BoardVO vo) {
//		ArrayList<R_BoardVO> list2 = new ArrayList<R_BoardVO>();
//		R_BoardVO rboard = null;
//		String sql = "select c_no, c.content, cdate, c.r_no, c.email, nickname, profile\r\n"
//				+ "from c_board c , member m, r_board r\r\n" + "where c.email = m.email and c.r_no = r.r_no";
//		
//		String aaa="ddddddd where=?";
//
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, vo.getRno());
//			rs = psmt.executeQuery();
//			while (rs.next()) {
//				rboard = new R_BoardVO();
//				rboard.setCno(rs.getInt(1));
//				rboard.setCcontent(rs.getString(2));
//				rboard.setCdate(rs.getDate(3));
//				rboard.setCrno(rs.getInt(4));
//				rboard.setCemail(rs.getString(5));
//				rboard.setNickname(rs.getString(6));
//				rboard.setProfile(rs.getString(7));
//				list2.add(rboard);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		GetConnection.close(rs, psmt, conn);
//		return rboard;
//
//	}

}
