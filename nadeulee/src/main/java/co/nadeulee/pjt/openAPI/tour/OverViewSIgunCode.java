package co.nadeulee.pjt.openAPI.tour;

import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.ApiTourDAO;
import co.nadeulee.pjt.DTO.TourDTO2;

public class OverViewSIgunCode {

	public static void main(String[] args) {
		
		//필요한 객체들을 얻어온다.
		ApiTourDAO dao = new ApiTourDAO();
		List<TourDTO2> list = dao.selectId();
		JSONObject obj = null;

		
		for(TourDTO2 dto : list) {
			
			
			String typeId = dto.getTypeid(); // 타입코드를 가져온다.
			
			//url과 parameter를 정의하고 공공데이터 db로 보낸다.
			
			String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
			String parameter = "&MobileOS=ETC&MobileApp=nadeulee&contentTypeId="+dto.getTypeid() +"&contentId="+dto.getContent_id();
			
			//json데이터를 가져와 파싱한다.
			GetData data = new GetData(url,parameter); 
			String result = data.GetTourData();
			obj = data.outJobj(result);
			System.out.println(obj);
			dto = getKeyword(typeId, dto, obj);
			
			update(obj,dto);
			
			try {
				Thread.sleep(800);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}

	/**************************
	 * 
	 * 저장하는 함수
	 * 
	 */
	static void update(JSONObject obj, TourDTO2 dto) {
		
		ApiTourDAO dao = new ApiTourDAO();
		
			dao.updateParking(dto);
		}
		
		
	
	/******************
	 * 
	 * 타입코드별로 나타나는 결과가 다르다.
	 * 다른 값을 dto에 저장해서 반환해주는 함수
	 * 
	 */
	static TourDTO2 getKeyword(String typeid, TourDTO2 dto,JSONObject obj) {
		
		try {
		if(typeid.equals("12")) {
			dto.setParking((String)obj.get("parking"));
			dto.setTime((String)obj.get("usetime"));
			return dto;
		}
		

		if(typeid.equals("14")) {
			dto.setParking((String)obj.get("parkingculture"));
			System.out.println((String)obj.get("parkingculture"));
			dto.setPay(obj.get("usefee").toString());
			return dto;
		}
		

		if(typeid.equals("14")) {
			dto.setParking((String)obj.get("parkingculture"));
			dto.setPay((String)obj.get("usefee"));
			return dto;
		}
		
		if(typeid.equals("28")) {
			dto.setParking((String)obj.get("parkingleports"));
			System.out.println((String)obj.get("parkingleports"));
			dto.setPay((String)obj.get("usefeeleports"));
			dto.setTime((String)obj.get("usetimeleports"));
			return dto;
		}
		
		if(typeid.equals("39")) {
			dto.setParking((String)obj.get("parkingfood"));
			dto.setTime((String)obj.get("opentimefood"));
			return dto;
		}
		}catch(Exception e) {
			System.out.println("에러러러러발생");
		}
		
		return dto;
		
	}
	
	
	

}
