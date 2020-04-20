package co.nadeulee.pjt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.nadeulee.pjt.DAO.R_BoardDAO;

@WebServlet("/commentDelete.do")
public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentDeleteController() {
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
		String c_no = request.getParameter("c_no");

		R_BoardDAO dao = new R_BoardDAO();
		dao.commentDeleteOne(Integer.parseInt(c_no));
		
		

		request.setAttribute("delete", dao);
		RequestDispatcher dispatcher = request.getRequestDispatcher("memberInfoView.do");
		dispatcher.forward(request, response);

	}

}
