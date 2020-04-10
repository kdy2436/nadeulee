package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.N_BoardDAO;
import co.nadeulee.pjt.VO.N_BoardVO;

@WebServlet("/noticelist.do")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeListController() {
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

		N_BoardDAO dao = new N_BoardDAO();
		ArrayList<N_BoardVO> list = new ArrayList<N_BoardVO>();
		list = dao.noticeList();

		request.setAttribute("noticeList", list);
		String path = "/notice/noticeList.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
