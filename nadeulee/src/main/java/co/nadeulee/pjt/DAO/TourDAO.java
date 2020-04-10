package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.TourVO;

public class TourDAO {

	Connection conn = GetConnection.getConn();
	private PreparedStatement psmt;
	private ResultSet rs;

	public ArrayList<TourVO> infoList() {
		ArrayList<TourVO> list = new ArrayList<TourVO>();
		TourVO tour = null;
		String sql = "select image,title, overview from tour where typeid=12";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				tour = new TourVO();
				tour.setImage(rs.getString("image"));
				tour.setTitle(rs.getString("title"));
				tour.setOverview(rs.getString("overview"));
				list.add(tour);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;

	}
}
