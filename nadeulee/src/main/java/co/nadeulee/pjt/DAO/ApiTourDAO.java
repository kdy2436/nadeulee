package co.nadeulee.pjt.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import co.nadeulee.pjt.VO.TourVO;
import co.nadeulee.pjt.VO.TourVO2;
import co.nadeulee.pjt.VO.TourVO;
import co.nadeulee.pjt.VO.TourVO2;

public class ApiTourDAO {
 
	// 각 관광지의 아이디와 타입을 불러오기 위한 함수
	public List<TourVO2> selectId() {

		// 필요 객체들을 불러옴

		// sql 객체들
		String sql = "SELECT * FROM TOUR";
		PreparedStatement psmt = null;
		ResultSet rs = null;
		Connection conn = GetConnection.getConn();

		// 저장을 위한 객체들
		TourVO2 dto = null;
		List<TourVO2> list = new ArrayList<TourVO2>();

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new TourVO2();
				dto.setContent_id(rs.getString("content_id"));
				dto.setTypeid(rs.getString("typeid"));
				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		GetConnection.close(rs, psmt, conn);

		return list;

	}

	// 주차, 연령제한, 운영시간, 요금을 저장하는 함수.
	public void updateParking(TourVO2 dto) {
		// parking, age, time, pay

		String SQL = "UPDATE TOUR SET PARKING = ?, AGE = ?, TIME=?, PAY = ? WHERE CONTENT_ID=? ";

		// sql 객체들
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 성공여부 확인을 위한 변수
		int n = 0;

		// null이면 값이 없음으로 변경
		if (dto.getParking() == null) {
			dto.setParking("없음");
		}
		if (dto.getAge() == null) {
			dto.setAge("없음");
		}
		if (dto.getPay() == null) {
			dto.setPay("없음");
		}
		if (dto.getTime() == null) {
			dto.setTime("없음");
		}

		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, dto.getParking());
			psmt.setString(2, dto.getAge());
			psmt.setString(3, dto.getTypeid());
			psmt.setString(4, dto.getPay());
			psmt.setString(5, dto.getContent_id());
			n = psmt.executeUpdate();

			if (n != 0)
				System.out.println("등록성공");

		} catch (Exception e) {
			e.printStackTrace();
		}

		GetConnection.close(conn, psmt);

	}

	// 시군구 코드를 변경하는 쿼리
	public void updateSigungu(TourVO2 dto) {

		String sql = "UPDATE TOUR SET SIGUNGUCODE = ? WHERE CONTENT_ID = ?";

		// sql 객체들
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt = null;
		ResultSet rs = null;

		// 성공여부 확인을 위한 변수
		int n = 0;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getSigungucode());
			psmt.setString(2, dto.getContent_id());
			n = psmt.executeUpdate();

			if (n != 0)
				System.out.println("등록성공");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		GetConnection.close(conn, psmt);

	}
	
	//googleMap에 필요한 위도 경도 받아오는 함수
	public TourVO getLatLng(TourVO dto) {
		Connection conn = GetConnection.getConn();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select map_x, map_y, title from tour where content_id=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getContent_id());
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setMap_x(rs.getString("map_x"));
				dto.setMap_y(rs.getString("map_y"));
				dto.setTitle(rs.getString("title"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			GetConnection.close(conn);
		}
		
		
		return dto;
	}
	

}
