package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.TourDAO;
import co.nadeulee.pjt.VO.TourVO;

@WebServlet("/searchTour.do")
public class SearchTourController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchTourController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		//검색한 타이틀 값을 불러옴.
		String title = request.getParameter("title");
		
		TourDAO dao = new TourDAO();
		List<TourVO> list = dao.selectTitle(title);
		
		//가져온 결과를 제이슨으로 보내준다.
		
		JSONObject obj = new JSONObject();
		JSONArray array = new JSONArray();
		for(TourVO vo : list) {
			obj = new JSONObject();
			obj.put("title", vo.getTitle());
			obj.put("content_id", vo.getContent_id());
			array.add(obj);
		}
		out.print(array);
		
	}

}
