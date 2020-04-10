package co.nadeulee.pjt.controller.infocate;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.TourListCateDAO;
import co.nadeulee.pjt.VO.TourVO;
import co.nadeulee.pjt.openAPI.tour.JsonParser;

public class historyController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/plain; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int firstPage = Integer.parseInt(request.getParameter("firstPage"));
		int lastPage = Integer.parseInt(request.getParameter("lastPage"));
		
		//list를 가져옴.
		List<TourVO> list = new ArrayList<TourVO>();		
		
		list = TourListCateDAO.GetTourListDao().historyList(firstPage, lastPage);
		
		//json파싱
		
		JSONArray array = new JSONArray();
		
		for(TourVO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("title", dto.getTitle());
			obj.put("overview", dto.getOverview());
			obj.put("img", dto.getImage());
			System.out.println(obj);
			array.add(obj);
		}
		System.out.println(array);
		out.print(array);
		
	}

}
