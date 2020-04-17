package co.nadeulee.pjt.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.nadeulee.pjt.DAO.N_BoardDAO;
import co.nadeulee.pjt.VO.N_BoardVO;

@WebServlet("/noticeinsert.do")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NoticeInsertController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		N_BoardVO vo = new N_BoardVO();
		N_BoardDAO dao = new N_BoardDAO();
		String filepath = request.getSession().getServletContext().getRealPath("Image");

		int filesize = 1024 * 1024 * 10;
		MultipartRequest multi = new MultipartRequest(request, filepath, filesize, "utf-8",
				new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		String str = (String) files.nextElement();

		vo.setTitle(multi.getParameter("title"));
		vo.setContent(multi.getParameter("content"));
		String ofile = multi.getOriginalFileName(str);
		vo.setN_photo(ofile);

		int n = dao.noticeInsert(vo);
		String path = null;
		if (n != 0) {
			String file = multi.getFilesystemName(str);
			path = "noticelist.do";
		} else {
			path = "noticewrite.do";
		}

		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
