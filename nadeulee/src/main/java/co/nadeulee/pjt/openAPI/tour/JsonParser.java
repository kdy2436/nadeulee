package co.nadeulee.pjt.openAPI.tour;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonParser {
	
	public JSONArray OutJarray(String obj) {
		
		
		JSONArray array = null;
		JSONParser parser = new JSONParser();
		JSONObject jobj;
		try {
			jobj = (JSONObject) parser.parse(obj);
			System.out.println(jobj);
			jobj = (JSONObject) jobj.get("response");
			System.out.println(jobj);
			jobj = (JSONObject) jobj.get("body");
			System.out.println(jobj);
			jobj = (JSONObject) jobj.get("items");
			System.out.println(jobj);
			array = (JSONArray)jobj.get("item");
			System.out.println(array);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return array;
		
		
	}

}
