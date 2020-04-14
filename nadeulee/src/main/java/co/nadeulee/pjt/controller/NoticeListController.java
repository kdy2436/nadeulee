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
import co.nadeulee.pjt.common.Paging;

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

		Paging paging = new Paging();

		N_BoardDAO dao = new N_BoardDAO();

		paging.setPageUnit(10);
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);

		N_BoardVO vo = new N_BoardVO();

		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		ArrayList<N_BoardVO> list = dao.noticeList(vo);

		int count = dao.count();
		paging.setTotalRecord(count);

		request.setAttribute("noticeList", list);
		request.setAttribute("page", paging);
		String path = "/notice/noticeList.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
