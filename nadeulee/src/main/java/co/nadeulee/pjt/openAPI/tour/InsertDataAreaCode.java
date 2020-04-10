package co.nadeulee.pjt.openAPI.tour;

import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.ApiTourDAO;
import co.nadeulee.pjt.VO.TourVO2;

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

		// 필요한 객체들을 받아온다.
		GetData data = new GetData(url, parameter);
		String result = data.GetTourData();
		JSONArray array = data.OutJarray(result);
		List<TourVO2> list = makeList(array);

		int i = 1;
		for (TourVO2 dto : list) {

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

	public static List<TourVO2> makeList(JSONArray array) {
		List<TourVO2> list = new ArrayList<TourVO2>();
		for (int i = 0; i < array.size(); i++) {
			TourVO2 dto = new TourVO2();
			JSONObject jobj = (JSONObject) array.get(i);

			// 시군구 코드가 없는 항목은 0으로 만들어준다.
			if (jobj.get("sigungucode") != null) {
				dto.setSigungucode(Integer.parseInt(jobj.get("sigungucode").toString()));
			} else if (jobj.get("sigungucode") == null) {
				dto.setSigungucode(0);
			}

			dto.setContent_id(jobj.get("contentid").toString());

			list.add(dto);
		}
		return list;
	}

}
