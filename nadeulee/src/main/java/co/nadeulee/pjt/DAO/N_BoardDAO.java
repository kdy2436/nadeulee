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

	public ArrayList<N_BoardVO> noticeList() {
		ArrayList<N_BoardVO> list = new ArrayList<N_BoardVO>();
		N_BoardVO notice = null;
		String sql = "select n_no, title, nickname, ndate from n_board";
		try {
			psmt = conn.prepareStatement(sql);
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

}
