package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nadeulee.pjt.VO.TourListVO;

public class TourListCateDAO {
	
	//싱글턴 패턴
	private static TourListCateDAO dao;
	
	public static TourListCateDAO GetTourListDao() {
		
		if(dao == null) dao = new TourListCateDAO();
		return dao;
		
	}

	//전체 리스트를 가져오는 쿼리
	public List<TourListVO> allList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "
				 + "where cat1 not in ('A05','B02') order by content_id)a) b "
				 + "where rn between ? and ?";
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getFirst());
			psmt.setInt(2, vo.getLast());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				vo = new TourListVO();
				vo.setContent_id(rs.getString("content_id"));
				vo.setTitle(rs.getString("title"));
				vo.setImage(rs.getString("image"));
				vo.setContent_id(rs.getString("content_id"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			GetConnection.close(rs, psmt, conn);
		}
		
		return list;
	}
	
	//대구 지역별 관광리스트를 조회하는 기능
	public List<TourListVO> SigunguList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		String sigungu = "where sigungucode=?";
		
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "+sigungu 
				 + " and cat1 not in ('A05','B02')  order by content_id)a) b "
				 + "where rn between ? and ?";
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getSigungucode());
			psmt.setInt(2, vo.getFirst());
			psmt.setInt(3, vo.getLast());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				vo = new TourListVO();
				vo.setContent_id(rs.getString("content_id"));
				vo.setTitle(rs.getString("title"));
				vo.setImage(rs.getString("image"));
				vo.setContent_id(rs.getString("content_id"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			GetConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	//여러가지 테마별로 관광지를 조회하는 기능
	public List<TourListVO> courseList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		String course = "where cat2=?";
		
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "+ course 
				 + " and cat1 not in ('A05','B02') order by content_id)a) b "
				 + "where rn between ? and ?";
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getCat2());
			psmt.setInt(2, vo.getFirst());
			psmt.setInt(3, vo.getLast());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				vo = new TourListVO();
				vo.setContent_id(rs.getString("content_id"));
				vo.setTitle(rs.getString("title"));
				vo.setImage(rs.getString("image"));
				vo.setContent_id(rs.getString("content_id"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			GetConnection.close(rs, psmt, conn);
		}
		return list;
	}
	

	
	public int count() {
		int count = 0;
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) count FROM TOUR";
		
		try {
			psmt=conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	public int sigunguCount(TourListVO vo) {
		int count = 0;
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) count FROM TOUR where cat1 not in ('A05','B02') and sigungucode=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getSigungucode());
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	public int courseCount(TourListVO vo) {
		int count = 0;
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) count FROM TOUR where cat1 not in ('A05','B02') and cat2=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getCat2());
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	

}
