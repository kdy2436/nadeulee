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
import co.nadeulee.pjt.VO.TourListVO;
import co.nadeulee.pjt.VO.TourVO;
import co.nadeulee.pjt.common.Paging;
import co.nadeulee.pjt.openAPI.tour.JsonParser;

public class historyController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Paging paging = new Paging();
		TourListCateDAO dao = TourListCateDAO.GetTourListDao();
		
		//페이징처
		paging.setPageUnit(9);
		//현재 페이지번호
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);
		
		TourListVO vo = new TourListVO();
		
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setCat2("A0201");
		
		//리스트를 얻음.
		List<TourListVO> list = dao.courseList(vo);		
		//전체 레코드수를 가지고 옴.
		int count = dao.count();
		paging.setTotalRecord(count);
		
		
		request.setAttribute("list", list);
		request.setAttribute("page", paging);
		
		foward(request, response, "info/infoList.tiles");

		
	}

}
