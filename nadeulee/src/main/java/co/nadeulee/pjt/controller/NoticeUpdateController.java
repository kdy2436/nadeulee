package co.nadeulee.pjt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.N_BoardDAO;
import co.nadeulee.pjt.VO.N_BoardVO;

@WebServlet("/noticeupdate.do")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeUpdateController() {
		super();
	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String n_no = request.getParameter("n_no");
//		N_BoardVO vo = new N_BoardVO();
//		N_BoardDAO dao = dao.select(vo);
//		vo = dao.select(n_no);

//		request.setAttribute("noticeupdate", vo);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("");
//		dispatcher.forward(request, response);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

//		N_BoardDAO dao = dao.
//		N_BoardVO vo = new N_BoardVO();
//		String n_no = request.getParameter("n_no");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");

	}

}
