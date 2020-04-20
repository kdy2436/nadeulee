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
@WebServlet("/updateLikes.do")
public class UpdateLikesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateLikesController() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		R_BoardDAO dao = new R_BoardDAO();
		int rno;
		rno = Integer.parseInt(request.getParameter("rno"));
		
		dao.updateLikes(rno);
		String path = "reviewList.do";

		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
