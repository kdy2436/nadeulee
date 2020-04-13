package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nadeulee.pjt.VO.TourListVO;
import co.nadeulee.pjt.VO.TourVO;

public class TourListCateDAO {
	
	//싱글턴 패턴
	private static TourListCateDAO dao;
	
	public static TourListCateDAO GetTourListDao() {
		
		if(dao == null) dao = new TourListCateDAO();
		return dao;
		
	}

	public List<TourListVO> allList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		
		
		System.out.println(vo.getFirst());
		System.out.println(vo.getLast());
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "
				 + "order by content_id)a) b "
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
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			GetConnection.close(rs, psmt, conn);
		}
		
		

		
		return list;
	}
	
	public List<TourListVO> SigunguList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		String sigungu = "where sigungucode=?";
		
		System.out.println(vo.getFirst());
		System.out.println(vo.getLast());
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "+sigungu 
				 + " order by content_id)a) b "
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
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			GetConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	public List<TourListVO> courseList(TourListVO vo) {
		
		List<TourListVO> list = new ArrayList<TourListVO>(); 
		String course = "where cat2=?";
		
		System.out.println(vo.getFirst());
		System.out.println(vo.getLast());
		String sql = "select rownum,b.* from " 
				 +"(select rownum rn, a.* from(select * from tour "+ course 
				 + " order by content_id)a) b "
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
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	public int sigunguCount(TourListVO vo) {
		int count = 0;
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) count FROM TOUR where sigungucode=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, vo.getSigungucode());
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	public int courseCount(TourListVO vo) {
		int count = 0;
		
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) count FROM TOUR where cat2=?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, vo.getCat2());
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count;
		
	}
	
	

}
