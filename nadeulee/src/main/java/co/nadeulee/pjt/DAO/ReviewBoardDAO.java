package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.nadeulee.pjt.VO.R_BoardVO;

public class ReviewBoardDAO {
	
	
	

	
	public ArrayList<R_BoardVO> selectAll() {
		
		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
		R_BoardVO rboard;
		String sql = "select * from r_board";
		PreparedStatement psmt = null;   
		ResultSet rs = null;
		Connection conn = GetConnection.getConn();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rboard = new R_BoardVO();
				rboard.setR_no(rs.getInt("r_no"));
				rboard.setContent(rs.getString("content"));
				rboard.setRdate(rs.getDate("rdate"));
				rboard.setR_photo(rs.getString("r_photo"));
				rboard.setLike(rs.getInt("like"));
				rboard.setContent_id(rs.getString("content_id"));
				list.add(rboard);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		}
			GetConnection.close(rs, psmt, conn);
			return list;
			
		
		
	}
	

}
