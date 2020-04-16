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
		String sql = "select rno, r.content_id, title, r.email, r.nickname, profile, rcontent, rdate, likes, img1, img2, img3\r\n"
				+ "from r_board r, tour t, member m\r\n"
				+ "where r.content_id = t.content_id and r.email = m.email order by 1 desc";
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
	
	public int commentWrite(R_BoardVO rboard) { // 공지사항 등록
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

}
