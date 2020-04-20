package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.R_BoardDAO;
import co.nadeulee.pjt.DAO.TourDAO;
import co.nadeulee.pjt.VO.R_BoardVO;
import co.nadeulee.pjt.VO.TourVO;

@WebServlet("/infoDetail.do")
public class InfoDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InfoDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		TourDAO dao = new TourDAO();
		R_BoardDAO Rdao = new R_BoardDAO();
		
		String id = request.getParameter("id");
		
		TourVO vo = dao.select(id);
		
		System.out.println(vo.getContent_id());
		
		ArrayList<R_BoardVO> list = Rdao.ContentBestReview(vo.getContent_id());
		
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("info/infoDetail.tiles");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
