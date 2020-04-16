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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int n_no = Integer.parseInt(request.getParameter("n_no"));
		N_BoardDAO dao = new N_BoardDAO();
		N_BoardVO vo = dao.selectNoticeNum(n_no);

		request.setAttribute("noticeupdate", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/notice/noticeUpdate.tiles");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int n_no = Integer.parseInt(request.getParameter("n_no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		N_BoardVO vo = new N_BoardVO();
		N_BoardDAO dao = new N_BoardDAO();

		vo.setN_no(n_no);
		vo.setTitle(title);
		vo.setContent(content);

		dao.noticeUpdate(vo);

		response.sendRedirect(request.getContextPath() + "/noticedetail.do?n_no=" + n_no);
	}

}
