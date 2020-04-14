package co.nadeulee.pjt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.N_BoardDAO;

@WebServlet("/noticedelete.do")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeDeleteController() {
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
		String n_no = request.getParameter("n_no");

		N_BoardDAO dao = new N_BoardDAO();
		dao.noticeDelete(Integer.parseInt(n_no));

		request.setAttribute("delete", dao);
		RequestDispatcher dispatcher = request.getRequestDispatcher("noticelist.do");
		dispatcher.forward(request, response);

	}

}
