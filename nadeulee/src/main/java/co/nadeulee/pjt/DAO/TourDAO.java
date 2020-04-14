package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nadeulee.pjt.VO.TourVO;

public class TourDAO {

	Connection conn = GetConnection.getConn();
	private PreparedStatement psmt;
	private ResultSet rs;

	public TourVO select(String id) {
		
		String sql = "select * from tour where content_id=?";
		TourVO vo = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new TourVO();
				vo.setContent_id(rs.getString("content_id"));
				vo.setAddr(rs.getString("addr"));
				vo.setAge(rs.getString("age"));
				vo.setCat1(rs.getString("cat1"));
				vo.setCat2(rs.getString("cat2"));
				vo.setImage(rs.getString("image"));
				vo.setMap_x(rs.getString("map_x"));
				vo.setMap_y(rs.getString("map_y"));
				vo.setOverview(rs.getString("overview"));
				vo.setParking(rs.getString("parking"));
				vo.setPay(rs.getString("pay"));
				vo.setSigungucode(rs.getInt("sigungucode"));
				vo.setTel(rs.getString("tel"));
				vo.setTypeid(rs.getString("typeid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;

	}
	
	public List<TourVO> selectTitle(String title) {
		
		String sql = "select * from tour where title like '%' || ? || '%'";
		List<TourVO> list = new ArrayList<TourVO>();
		
		
		TourVO vo = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new TourVO();
				vo.setContent_id(rs.getString("content_id"));
				vo.setTitle(rs.getString("title"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;

	}
	
}
