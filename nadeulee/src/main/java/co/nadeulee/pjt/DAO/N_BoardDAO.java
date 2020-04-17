package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.N_BoardVO;

public class N_BoardDAO {

	Connection conn = GetConnection.getConn();
	private PreparedStatement psmt;
	private ResultSet rs;

	public ArrayList<N_BoardVO> noticeList(N_BoardVO notice) { // 공지사항 목록
		ArrayList<N_BoardVO> list = new ArrayList<N_BoardVO>();

		String sql = "select rownum, b.* from (select rownum rn, a.* from(select n_no, title, nickname, ndate from n_board order by n_no desc)a) b where rn between ? and ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, notice.getFirst());
			psmt.setInt(2, notice.getLast());
			rs = psmt.executeQuery();

			while (rs.next()) {
				notice = new N_BoardVO();
				notice.setN_no(rs.getInt("n_no"));
				notice.setTitle(rs.getString("title"));
				notice.setNickname(rs.getString("nickname"));
				notice.setNdate(rs.getDate("ndate"));
				list.add(notice);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int noticeInsert(N_BoardVO notice) { // 공지사항 등록
		int n = 0;
		String sql = "insert into n_board (n_no, title, content, n_photo) values (NB_SEQ.nextval,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, notice.getTitle());
			psmt.setString(2, notice.getContent());
			psmt.setString(3, notice.getN_photo());
			n = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public N_BoardVO select(N_BoardVO vo) { // 글보기
		try {
			String sql = "select * from n_board where n_no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getN_no());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setTitle(rs.getString("title"));
				vo.setNdate(rs.getDate("ndate"));
				vo.setNickname(rs.getString("nickname"));
				vo.setContent(rs.getString("content"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vo;
	}

	public int noticeDelete(int n_no) {
		int n = 0;
		try {
			String sql = "DELETE FROM N_BOARD WHERE n_no=? ";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, n_no);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public int noticeUpdate(N_BoardVO vo) {
		int n = 0;
		StringBuffer query = new StringBuffer();
		query.append("update n_board set title =?, ");
		query.append("content = ?");
		query.append("where n_no = ?");

		try {
			psmt = conn.prepareStatement(query.toString());
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getN_no());
			rs = psmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public N_BoardVO selectNoticeNum(int n_no) {
		N_BoardVO notice = null;
		try {
			String sql = "select title, content, nickname from n_board where n_no=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, n_no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				notice = new N_BoardVO();
				notice.setN_no(n_no);
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setNickname(rs.getString("nickname"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return notice;
	}

	public int count() {
		int count = 0;

		psmt = null;
		rs = null;

		String sql = "SELECT COUNT(*) count FROM n_board";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;

	}

}
