package co.nadeulee.pjt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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

		vo.setCcontent(request.getParameter("ccontent"));
		vo.setRno(Integer.parseInt(request.getParameter("rno")));
		vo.setEmail(request.getParameter("email"));
		

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
