package co.nadeulee.pjt.openAPI.tour;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.ApiTourDAO;
import co.nadeulee.pjt.DTO.TourDTO2;

public class InsertDataAreaCode {

	/*
	 *****
	 * 관공데이터 중 지역 코드로 검색하여 얻을 수 있는 데이터를 인서트 하는 클래스이다.
	 *
	 *****
	 */
	static ApiTourDAO dao = new ApiTourDAO();

	public static void main(String[] args) {

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		String parameter = "&areaCode=4&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC"
				+ "&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=537&pageNo=1";

		//필요한 객체들을 받아온다.
		GetData data = new GetData(url, parameter);
		String result = data.GetTourData();
		JSONArray array = data.OutJarray(result);
		List<TourDTO2> list = makeList(array);
		
		int i = 1;
		for (TourDTO2 dto : list) {

			System.out.println("-------------구분선------------------" + i++);
			dao.updateSigungu(dto);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static List<TourDTO2> makeList(JSONArray array) {
		List<TourDTO2> list = new ArrayList<TourDTO2>();
		for (int i = 0; i<array.size(); i++ ) {
			TourDTO2 dto = new TourDTO2();
			JSONObject jobj = (JSONObject) array.get(i);
			
			//시군구 코드가 없는 항목은 0으로 만들어준다.
			if(jobj.get("sigungucode") != null) {
				dto.setSigungucode(Integer.parseInt(jobj.get("sigungucode").toString()));
			}else if(jobj.get("sigungucode") == null) {
				dto.setSigungucode(0);
			}
			
			dto.setContent_id(jobj.get("contentid").toString());
			
			list.add(dto);
		}  
		return list;
	}


}
