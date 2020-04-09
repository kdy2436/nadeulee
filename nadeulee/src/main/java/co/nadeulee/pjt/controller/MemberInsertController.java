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
import co.nadeulee.pjt.DTO.MemberDTO;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/memberInsert.do")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();
		String filepath = request.getSession().getServletContext().getRealPath("uploadFile");
		int filesize = 1024 * 1024 * 10;
		
		MultipartRequest multi = new MultipartRequest(request, filepath, filesize, "utf-8", new DefaultFileRenamePolicy());
		
		Enumeration <?> files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		member.setEmail(multi.getParameter("email"));
		member.setNickname(multi.getParameter("nickname"));
		member.setPw(multi.getParameter("pw"));
		member.setGender(multi.getParameter("gender"));
		member.setProfile(multi.getParameter("profile"));
		
		String origFile = multi.getOriginalFileName(str);
		member.setProfile(origFile);
		int n = dao.memberInsert(member);
		
		 String view = null;
		 if( n != 0) {
			 String file = multi.getFilesystemName(str);
			 out.println(	 "<script>"
			 				+ " alert('회원가입이 완료 되었습니다'); "
			 				+ "location.href='home.do'; "
			 				+ "</script>");
			 out.flush();
		 } else 
			 view = "views/member/JoinFail.jsp";
		 
		 RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		 dispatcher.forward(request, response);
	}

}
