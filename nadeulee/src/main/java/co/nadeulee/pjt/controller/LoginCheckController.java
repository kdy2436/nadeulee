package co.nadeulee.pjt.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nadeulee.pjt.DAO.MemberDAO;
import co.nadeulee.pjt.VO.MemberVO;

@WebServlet("/logincheck.do")
public class LoginCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginCheckController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		vo.setEmail(email);
		vo.setPw(pw);

		vo = dao.login(vo);

		if (vo != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.do");
			session.setAttribute("nickname", vo.getNickname()); // 이름담고
			session.setAttribute("email", vo.getEmail()); // 이메일담고
			session.setAttribute("pw", vo.getPw()); 
			session.setAttribute("auth", vo.getAuth());// 권한담고
			dispatcher.forward(request, response);

		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.do");
			dispatcher.forward(request, response);

		}
	}
}
