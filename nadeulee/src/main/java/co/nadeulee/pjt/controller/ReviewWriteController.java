package co.nadeulee.pjt.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import co.nadeulee.pjt.common.*;

/**
 * Servlet implementation class ReviewWriteController
 */
@WebServlet("/reviewWrite.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
maxFileSize = 1024 * 1024 * 30, //파일1개
maxRequestSize = 1024 * 1024 * 50) //전체파일
public class ReviewWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "Image";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String content_id = request.getParameter("searchResult");
		String message = request.getParameter("message");
		
		String appPath = request.getServletContext().getRealPath("/");
		String savePath = appPath +File.separator+ SAVE_DIR;
		
		File fileSaveDir = new File(savePath);
		if(!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		
		String uploadFile = "";
		for(Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if(!fileName.equals("")) {
				
				uploadFile = savePath + File.separator + fileName;
				File f = new FileRenamePolicy().rename(new File(uploadFile));
				String uploadFileName = f.getParent() + ":" + f.getName();
				part.write(uploadFileName);
			}
		
		}
		
	}
	
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
