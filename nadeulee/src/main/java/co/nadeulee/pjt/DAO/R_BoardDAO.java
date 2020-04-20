package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.R_BoardVO;

public class R_BoardDAO {
	private PreparedStatement psmt;
	private ResultSet rs;

	public ArrayList<R_BoardVO> selectReview() {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select rno, r.content_id, title, r.email, r.nickname, profile, rcontent, rdate, likes, img1, img2, img3, (select count(*) from c_board where rno = r.rno) as comments\r\n" + 
				"from r_board r, tour t, member m\r\n" + 
				"where r.content_id = t.content_id and r.email = m.email order by 1 desc";
		Connection conn = GetConnection.getConn();
		
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
				rboard.setComments(rs.getInt(13));
				rboard.setCommentlist(selectComment(rboard.getRno()));
				
				
				
				
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);
		return list;

	}
	
	//코맨트를 등록하는 쿼리문
		public void insertReview(R_BoardVO vo) {
			
			Connection conn = GetConnection.getConn();
			
			String sql ="insert into r_board values(\r\n" + 
					"(RNO_SEQ.nextval),\r\n" + 
					"?," +  // content_id (1)
					"?," +  // email(2)
					"?," +  // rcontent(3)
					"sysdate," + 
					"0," +
					"?," + // img1(4)
					"?," + // img2(5)
					"?," + // img3(6)
					"?)"; // nickname(7)
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getTcontent_id());
				psmt.setString(2, vo.getEmail());
				psmt.setString(3, vo.getRcontent());
				psmt.setString(4, vo.getImg1());
				psmt.setString(5, vo.getImg2());
				psmt.setString(6, vo.getImg3());
				psmt.setString(7, vo.getNickname());
				psmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				GetConnection.close(rs, psmt, conn);
			}
			
		}

	
	
	public ArrayList<R_BoardVO> selectComment(int rno) {
		ArrayList<R_BoardVO> list2 = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select cno, ccontent, cdate, c.rno, c.email, m.nickname, profile\r\n" + 
				"from c_board c, member m, r_board r\r\n" + 
				"where c.email = m.email and c.rno = r.rno and c.rno=? order by 1";
		Connection conn = GetConnection.getConn();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rno);
			
			ResultSet rs = psmt.executeQuery();
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
		
		return list2;

	}
	
	
	
	
	public int commentWrite(R_BoardVO rboard) {
		int n = 0;
		String sql = "insert into c_board values (CNO_SEQ.nextval,?,sysdate,?,?)";
		
		Connection conn = GetConnection.getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, rboard.getCcontent());
			psmt.setInt(2, rboard.getRno());
			psmt.setString(3, rboard.getEmail());
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int reviewDelete(int rno) {
		int n = 0;
		try {
			Connection conn = GetConnection.getConn();
			String sql = "DELETE FROM R_BOARD WHERE rno=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,rno);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int commentDelete(int rno) {
		int n = 0;
		try {
			Connection conn = GetConnection.getConn();
			String sql = "DELETE FROM C_BOARD WHERE rno=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,rno);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public int commentDeleteOne(int cno) {
		int n = 0;
		try {
			Connection conn = GetConnection.getConn();
			String sql = "DELETE FROM C_BOARD WHERE cno=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,cno);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
	
	public ArrayList<R_BoardVO> selectMyReview(String email) {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select rno, content_id, email, rcontent, rdate, likes, img1, img2, img3, nickname from r_board where email=? order by 1 desc";
		Connection conn = GetConnection.getConn();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setRno(rs.getInt(1));
				rboard.setRcontent_id(rs.getString(2));
				rboard.setEmail(rs.getString(3));
				rboard.setRcontent(rs.getString(4));
				rboard.setRdate(rs.getDate(5));
				rboard.setLikes(rs.getInt(6));
				rboard.setImg1(rs.getString(7));
				rboard.setImg2(rs.getString(8));
				rboard.setImg3(rs.getString(9));
				rboard.setNickname(rs.getString(10));
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;

	}
	
	public ArrayList<R_BoardVO> selectMyComment(String email) {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select cno, ccontent, cdate, rno, email from c_board where email=? order by 1 desc";
		Connection conn = GetConnection.getConn();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setCno(rs.getInt(1));
				rboard.setCcontent(rs.getString(2));
				rboard.setCdate(rs.getDate(3));
				rboard.setRno(rs.getInt(4));
				rboard.setEmail(rs.getString(5));
			
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;

	}
	
	public ArrayList<R_BoardVO> selectBestReview() {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select * from\r\n" + 
				"(select rownum rn, b.* from\r\n" + 
				"(select rno, r.content_id, title, r.email, r.nickname, profile, rcontent, rdate, likes, img1, img2, img3\r\n" + 
				"from r_board r, tour t, member m\r\n" + 
				"where r.content_id = t.content_id and r.email = m.email order by likes desc)b)a\r\n" + 
				"where rn between 1 and 6";
		Connection conn = GetConnection.getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setRno(rs.getInt(2));
				rboard.setRcontent_id(rs.getString(3));
				rboard.setTitle(rs.getString(4));
				rboard.setRemail(rs.getString(5));
				rboard.setRnickname(rs.getString(6));
				rboard.setProfile(rs.getString(7));
				rboard.setRcontent(rs.getString(8));
				rboard.setRdate(rs.getDate(9));
				rboard.setLikes(rs.getInt(10));
				rboard.setImg1(rs.getString(11));
				rboard.setImg2(rs.getString(12));
				rboard.setImg3(rs.getString(13));
				rboard.setCommentlist(selectComment(rboard.getRno()));
				
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);
		return list;

	}
	
	
	public ArrayList<R_BoardVO> ContentBestReview(String content_id) {
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select rownum rn, b.* from " + 
				"(select * from r_board " + 
				"where content_id = ? " + 
				"order by likes desc)b " +
				"where likes BETWEEN 1 and 3";
		Connection conn = GetConnection.getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, content_id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				rboard = new R_BoardVO();
				rboard.setRno(rs.getInt("rno"));
				rboard.setRcontent_id(rs.getString("content_id"));
				rboard.setRemail(rs.getString("email"));
				rboard.setRnickname(rs.getString("nickname"));
				rboard.setRcontent(rs.getString("rcontent"));
				rboard.setRdate(rs.getDate("rdate"));
				rboard.setLikes(rs.getInt("likes"));
				rboard.setImg1(rs.getString("img1"));
				rboard.setImg2(rs.getString("img2"));
				rboard.setImg3(rs.getString("img3"));
				
				list.add(rboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);
		return list;

	}
	
	
	
	public void updateLikes(int rno){
		Connection conn = GetConnection.getConn();
		String sql = "update r_board set likes=likes+1 where rno=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rno);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}
		
	
}
