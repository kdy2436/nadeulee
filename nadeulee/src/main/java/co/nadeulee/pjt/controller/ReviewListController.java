package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nadeulee.pjt.DAO.MemberDAO;
import co.nadeulee.pjt.DAO.R_BoardDAO;
import co.nadeulee.pjt.VO.MemberVO;
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
		String path = "/reviewBoard/ReviewList.tiles";
		//session 추출
		HttpSession session = request.getSession();
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
	
		R_BoardDAO dao = new R_BoardDAO();
		
		

		ArrayList<R_BoardVO> list = dao.selectReview();
		request.setAttribute("boards", list);
		
		
		MemberDAO mdao = new MemberDAO();
		MemberVO vo = new MemberVO();
		String email = (String)session.getAttribute("email");
		vo.setEmail(email);
		vo = mdao.select(vo);
		request.setAttribute("view", vo);
		

		/*
		 * dao = new R_BoardDAO(); // dao를 초기화안하면 밤을새서 염병해도 오류를 해결할수없음 주의
		 * ArrayList<R_BoardVO> list2 = new ArrayList<R_BoardVO>(); list2 =
		 * dao.selectComment(); request.setAttribute("comments", list2);
		 * System.out.println(list2);
		 * 
		 */

		// String path = "/ReviewListReal.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

		/*
		 * String path = "/reviewBoard/ReviewWriteForm.tiles"; RequestDispatcher
		 * dispatcher = request.getRequestDispatcher(path); dispatcher.forward(request,
		 * response);
		 */

	}

}
