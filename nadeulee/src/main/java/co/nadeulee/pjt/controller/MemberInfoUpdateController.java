package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nadeulee.pjt.DAO.MemberDAO;
import co.nadeulee.pjt.VO.MemberVO;

/**
 * Servlet implementation class MemberInfoUpdate
 */
@WebServlet("/memberInfoUpdate.do")
public class MemberInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		
		String email = (String)session.getAttribute("email");
		String nickName = request.getParameter("nickName");
		String profile = request.getParameter("profile");
		String pw = request.getParameter("pw");
			
		vo.setEmail(email);
		vo.setNickname(nickName);
		vo.setPw(pw);
		vo.setProfile(profile);
		int n = dao.update(vo);
		
		if ( n != 0) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('정보수정이 완료 되었습니다.');");
			out.println("location.href = 'home.do';"); 
			out.println("</script>");
			out.close();
			
		} else {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('수정 실패시 뜨는 에러');");
			out.println("location.href = 'memberInfoView.do';"); 
			out.println("</script>");
			out.close();
		}
		
	}

}
