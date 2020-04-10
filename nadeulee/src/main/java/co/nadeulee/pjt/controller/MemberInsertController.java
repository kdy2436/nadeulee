package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nadeulee.pjt.DAO.MemberDAO;
import co.nadeulee.pjt.VO.MemberVO;

@WebServlet("/memberInsert.do")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// utf-8인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		// 필요객체를 불러옴
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String auth = request.getParameter("auth");
		String nickName = request.getParameter("nickName");

		String profile = "null"; // 파일 업로드 기능은 후에 추가.

		// DTO를 초기화 한다.
		member.setEmail(email);
		member.setGender(gender);
		member.setNickname(nickName);
		member.setProfile(profile);
		member.setPw(pw);

		int n = dao.memberInsert(member);
		if (n != 0) {
			request.setAttribute("msg", "가입에 성공하셨습니다 축하드립니다");
		} else
			request.setAttribute("msg", "가입에 실패하셨습니다 정보를 올바르게 입력해주세요");
		System.out.println(n);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/insertResult.tiles");
		dispatcher.forward(request, response);

	}

}
