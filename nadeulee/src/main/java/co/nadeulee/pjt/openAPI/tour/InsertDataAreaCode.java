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

public class InsertDataAreaCode {

	/*
	 *****
	 * 관공데이터 중 지역 코드로 검색하여 얻을 수 있는 데이터를 인서트 하는 클래스이다.
	 *
	 *****
	 */
	public static void main(String[] args) {

		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
		String parameter = "&contentTypeId=&areaCode=4&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC"
				+ "&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=537&pageNo=1";

		GetData data = new GetData(url, parameter);
		String result = data.GetTourData();
		JSONArray array = data.OutJarray(result);
		List<AreaBean> list = makeList(array);
		int i = 1;
		for (AreaBean bean : list) {
			ApiTourDAO dao = ApiTourDAO.getInstance();
			dao.insert(bean);
			System.out.println("-------------구분선------------------" + i++);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/*
	 *****
	 * 받아온 데이터를 JSONArray 데이터를 가지고 List<AreaBean>를 만들어 반환한다.
	 *
	 *****
	 */
	public static List<AreaBean> makeList(JSONArray array) {

		List<AreaBean> list = new ArrayList<AreaBean>();
		for (int i = 0; i < array.size(); i++) {
			JSONObject jobj = (JSONObject) array.get(i);
			AreaBean bean = makeBean(jobj);
			if (bean != null)
				list.add(bean);

		}
		return list;

	}

	/*
	 * ******
	 * 유효성검사와 함께 bean을 생성하여 반환한다.
	 * *******
	*/
	public static AreaBean makeBean(JSONObject obj) {
		// 없는 항목들은 널포인트가 나기 때문에 유효성 검사를 해준다.
		AreaBean bean = new AreaBean();
		
		bean.setAddr(isChceck("addr1", obj).toString());
		bean.setCat1(isChceck("cat1", obj).toString());
		System.out.println(bean.getCat1());
		bean.setCat2(isChceck("cat2", obj).toString());
		bean.setContentid(isChceck("contentid", obj).toString());
		bean.setImage(isChceck("firstimage", obj).toString());
		bean.setMap_x(isChceck("mapx", obj).toString());
		bean.setMap_y(isChceck("mapy", obj).toString());
		bean.setTel(isChceck("tel", obj).toString());
		bean.setSigungucode(0);
		bean.setTitle(isChceck("title", obj).toString());
		bean.setTypeid(isChceck("contenttypeid", obj).toString());
		

		return bean;

	}
	
	
	/*
	 * ******
	 * makeBean()함수의 유효성검사 기능이다.
	 * *******
	*/
	
	public static Object isChceck(String key, JSONObject obj) {
		if((obj.get(key))!= null) {
			return obj.get(key);
		}
		
		return "";
		
		
	}

}
