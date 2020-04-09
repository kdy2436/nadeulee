package co.nadeulee.pjt.openAPI.tour;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonParser {
	
	
	//한번의 검색에 여러 개의 항목이 Json배열 형태로 날아올 때 사용하는 함수이다.
	public JSONArray OutJarray(String obj) {
		
		
		JSONArray array = null;
		JSONParser parser = new JSONParser();
		JSONObject jobj;
		try {
			jobj = (JSONObject) parser.parse(obj);
			jobj = (JSONObject) jobj.get("response");
			jobj = (JSONObject) jobj.get("body");
			jobj = (JSONObject) jobj.get("items");
			array = (JSONArray)jobj.get("item");
			System.out.println(array);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return array;
		
		
	}
	
	//한번의 검색에 한개의 항목만이 날아오는 검색에 이용한다.
public JSONObject outJobj(String obj) {
		
		
		JSONParser parser = new JSONParser();
		JSONObject jobj = null;
		try {
			jobj = (JSONObject) parser.parse(obj);
			jobj = (JSONObject) jobj.get("response");
			jobj = (JSONObject) jobj.get("body");
			jobj = (JSONObject) jobj.get("items");
			jobj = (JSONObject)jobj.get("item");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return jobj;
}

}
