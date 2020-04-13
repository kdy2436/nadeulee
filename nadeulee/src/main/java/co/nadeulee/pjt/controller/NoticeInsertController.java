package co.nadeulee.pjt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.N_BoardDAO;
import co.nadeulee.pjt.VO.N_BoardVO;

@WebServlet("/noticeinsert.do")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeInsertController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		N_BoardVO vo = new N_BoardVO();
		N_BoardDAO dao = new N_BoardDAO();

		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));

		String path = null;
		int n = dao.noticeInsert(vo);
		if (n != 0) {
			path = "noticelist.do";
		} else {
			path = "noticewrite.do";
		}

		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
