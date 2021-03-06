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

@WebServlet("/memberInfoView.do")
public class MemberInfoViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberInfoViewController() {
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
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("email");
		vo.setEmail(email);
		vo = dao.select(vo);
		request.setAttribute("view", vo);
		

		
		
		R_BoardDAO rdao = new R_BoardDAO();
		ArrayList<R_BoardVO> list = rdao.selectMyReview(email);
		request.setAttribute("boards", list);
		
		rdao = new R_BoardDAO();
		ArrayList<R_BoardVO> list2 = rdao.selectMyComment(email);
		request.setAttribute("comments", list2);
		
		
		
		
		String path = "/member/memberInfo.tiles";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

}