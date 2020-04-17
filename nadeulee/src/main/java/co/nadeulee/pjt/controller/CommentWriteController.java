package co.nadeulee.pjt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.nadeulee.pjt.DAO.R_BoardDAO;
import co.nadeulee.pjt.VO.R_BoardVO;

/**
 * Servlet implementation class CommentWriteController
 */
@WebServlet("/commentWrite.do")
public class CommentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CommentWriteController() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		R_BoardVO vo = new R_BoardVO();
		R_BoardDAO dao = new R_BoardDAO();
		
		//session 추출
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nickname");
		

		vo.setCcontent(request.getParameter("ccontent"));
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		vo.setEmail(email);
		System.out.println(email);

		String path = null;
		int n = dao.commentWrite(vo);
		if (n != 0) {
			path = "reviewList.do";
		} else {
			path = "reviewList.do";
		}

		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
