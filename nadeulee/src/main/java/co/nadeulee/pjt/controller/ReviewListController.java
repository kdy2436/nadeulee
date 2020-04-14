package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.ReviewBoardDAO;
import co.nadeulee.pjt.VO.R_BoardVO;

@WebServlet("/reviewList.do")
public class ReviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewListController() {
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
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=UTF-8");
//		ReviewBoardDAO dao = new ReviewBoardDAO();
//		ArrayList<R_BoardVO> list = new ArrayList<R_BoardVO>();
//		list = dao.selectAll();
//		
//		
//		
//		
//		request.setAttribute("boards", list);
//		
//	
		String path = "/reviewBoard/ReviewListOriginal.tiles";
		 RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		 dispatcher.forward(request, response);
		 
		/*
		 * String path = "/reviewBoard/ReviewWriteForm.tiles"; RequestDispatcher
		 * dispatcher = request.getRequestDispatcher(path); dispatcher.forward(request,
		 * response);
		 */
		 
	}

}
