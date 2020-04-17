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

/**
 * Servlet implementation class MemberInfoUpdate
 */
@WebServlet("/memberProfileUpdate.do")
public class MemberProfileUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberProfileUpdateController() {
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
		//String profile = request.getParameter("profile");
		
		// 파일이 저장되는 경로
	    String path = request.getSession().getServletContext().getRealPath("uploadProfile");

	    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기
	    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
	    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

	    // 실제로 파일 업로드하는 과정
	    try{
	        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());

	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

	        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
	        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
			
		vo.setEmail(email);
		vo.setProfile(file);
		int n = dao.profileUpdate(vo);
		request.setAttribute("profileUpdate", n);
		
		if ( n != 0) {
			response.setContentType("text/html; charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('프로필 사진 수정이 완료 되었습니다.');");
			out.println("location.href = 'memberInfoView.do';"); 
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
