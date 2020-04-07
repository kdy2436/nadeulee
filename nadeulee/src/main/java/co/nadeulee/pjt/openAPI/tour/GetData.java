package co.nadeulee.pjt.openAPI.tour;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

	public class GetData extends JsonParser{
		
		private String url;
		private String serviceKey = "?ServiceKey=8NUgxrufwRZ21gpHqigjOu4hDUuwlC4Awv8NxqnKNGOe%2BUcLw8tTw0atfQD1NMuVf0qPou%2FchRFSoXurhKIw1Q%3D%3D";
		private String parameter;
		private String json="&_type=json";

		
		/*
		 디폴트 생성자
		*/
		public GetData() {
			
		}
		
		/*
		 url과 parameter값을 초기화 해주는 생성자
		*/
		public GetData(String url, String parameter) {
			this.url =url;
			this.parameter=parameter;
		}
		
		
		/*
		 파라미터 중에 한글은 urt8인코딩이 필요함.
		 매개 값으로 parameter를 넣으면 인코딩해서 리턴.
		*/
		
		public String utfEncoding(String parameter) {
			String encoding ="";
			try {
				encoding = URLEncoder.encode(parameter,"utf-8");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return encoding;
		}
		
		/*
		 파라미터를 이용하여 호출하면 제이슨 타입으로
		 데이터가 반환된다.
		*/
		
		public String GetTourData() {
			String result ="";
			String line="";
			String urlstr = new String(url + serviceKey + parameter + json);
			
			
			try {
				URL urlEn = new URL(urlstr);
				HttpURLConnection conn = (HttpURLConnection)urlEn.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-Type", "application/json");
				
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				
				while((line = br.readLine()) != null) {
					result += line;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return result;
			
		}

	}

