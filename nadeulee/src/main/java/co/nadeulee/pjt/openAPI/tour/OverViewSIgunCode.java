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
		
		List<TourDTO2> list = dao.getId();
		JSONArray array = null;
		JSONObject obj = null;
		
		for(TourDTO2 dto : list) {
			//url과 parameter를 정의하고 공공데이터 db로 보낸다.
			String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
			String parameter = "&contentId="+dto.getContent_id()+"&defaultYN=Y&MobileOS=ETC&MobileApp=nadeulee&firstImageYN=N&areacodeYN=N&catcodeYN=N&"
					+ "addrinfoYN=N&mapinfoYN=Y&overviewYN=Y";
			
			
			GetData data = new GetData(url,parameter);
			String result = data.GetTourData();
			//메소드를 이용해 파싱한 JSON데이터를 얻는다.
			obj = data.outJobj(result);
			System.out.println(obj);
			//update(obj,dto);
			
		}
		
		
	}

	/**************************
	 * 
	 * 시군구코드, 개요를 가져오는 함수
	 * 
	 */
	static void update(JSONObject obj, TourDTO2 dto) {
		
		ApiTourDAO dao = new ApiTourDAO();
		
		
		Object[] ary = obj.keySet().toArray();
		for(int i =0; i<ary.length; i++) {
			dto = new TourDTO2();
			dto.setContent_id(obj.get("contentid").toString());
			dto.setOverView(obj.get("overview").toString());
			
			if(obj.get("contentTypeId") == null) {
				dto.setSigungucode(0);
			}else{
				dto.setSigungucode(Integer.parseInt(obj.get("contentTypeId").toString()));
			}
			dao.update(dto);
		}
		
		
	}

}
