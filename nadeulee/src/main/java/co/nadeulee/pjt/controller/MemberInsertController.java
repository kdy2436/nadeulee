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
import javax.servlet.http.HttpSession;

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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();

		// 필요객체를 불러옴
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
		
		// 파일이 저장되는 경로
	    String path = request.getSession().getServletContext().getRealPath("uploadProfile");

	    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
	    String profile = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
	    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

	    // 실제로 파일 업로드하는 과정
	    try{
	        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

	        profile = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
	        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

	        String email = multi.getParameter("email");
	        String pw = multi.getParameter("pw");
	        String gender = multi.getParameter("gender");
	        String auth = multi.getParameter("auth");
	        String nickName = multi.getParameter("nickName");

	        // DTO를 초기화 한다.
	        member.setEmail(email);
	        member.setGender(gender);
	        member.setNickname(nickName);
	        member.setProfile(profile);
	        member.setPw(pw);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

		int n = dao.memberInsert(member);
		if (n != 0) {
//			request.setAttribute("msg", "가입에 성공하셨습니다 축하드립니다");
			
			out.println("<script language='javascript'>");
			out.println("alert('회원가입이 완료 되었습니다.');");
			out.println("location.href = 'home.do';"); 
			out.println("</script>");
			out.close();

			dao.login(member);
			HttpSession session = request.getSession();
			session.setAttribute("nickname", member.getNickname());
			session.setAttribute("email", member.getEmail());
			session.setAttribute("pw", member.getPw());
			session.setAttribute("auth", member.getAuth());

		} else {
			out.println("<script language='javascript'>");
			out.println("alert('가입 실패시 뜨는 에러');");
			out.println("location.href = 'memberInsert.do';"); 
			out.println("</script>");
			out.close();
		}

//		RequestDispatcher dispatcher = request.getRequestDispatcher("member/insertResult.tiles");
//		dispatcher.forward(request, response);

	}

}
