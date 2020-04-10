package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import co.nadeulee.pjt.DAO.MemberDAO;

@WebServlet("/idCheck.do")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// utf-8인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 필요한 객체들을 불러옴
		MemberDAO dao = new MemberDAO();
		JSONObject obj = new JSONObject();

		String email = request.getParameter("email");

		// 결과 값을 대입
		int n = dao.memberEmailCheck(email);

		// 결과를 응답한다.
		if (n != 0) {
			obj.put("msg", "이미 사용중인 아이디입니다.");
			obj.put("able", "disabled");
			out.print(obj);
		} else if (n == 0) {
			obj.put("msg", "사용 가능한 아이디입니다.");
			obj.put("able", "able");
			out.print(obj);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
