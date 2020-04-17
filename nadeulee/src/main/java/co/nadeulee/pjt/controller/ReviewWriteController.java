package co.nadeulee.pjt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import co.nadeulee.pjt.DAO.MemberDAO;
import co.nadeulee.pjt.DAO.R_BoardDAO;
import co.nadeulee.pjt.VO.MemberVO;
import co.nadeulee.pjt.VO.R_BoardVO;
import co.nadeulee.pjt.common.FileRenamePolicy;

@WebServlet("/reviewWrite.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
maxFileSize = 1024 * 1024 * 30, //파일1개
maxRequestSize = 1024 * 1024 * 50) //전체파일
public class ReviewWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewWriteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String SAVE_DIR = "\\Image"; //이미지 폴더의 이름
		
		//인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//session 추출
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String nickname = (String) session.getAttribute("nickname");
		
		//이미지를 제외한 파라미터 추출
		String content_id = request.getParameter("searchResult");
		String message = request.getParameter("message");
		
		//인서트할때 필요한 vo 정의.
		R_BoardDAO dao = new R_BoardDAO();
		R_BoardVO rvo = new R_BoardVO();
		
		//이미지를 제외한 vo를 SET
		rvo.setTcontent_id(request.getParameter("searchResult"));
		rvo.setEmail(email);
		rvo.setRcontent(request.getParameter("message"));
		rvo.setNickname(nickname);
		
		//실제로 저장되는 정보는 톰캣 work스페이스 안이다. 배포 후 시도해 보아야 한다.
		
		String savePath = SAVE_DIR;
		String uploadFile = "";
		
		File fileSaveDir = new File(savePath);
		
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if(!fileName.equals("")) {
				uploadFile = fileName;
				System.out.println(uploadFile);
				File f = new FileRenamePolicy().rename(new File(uploadFile));
				String uploadFileName = f.getParent() + ":" + f.getName();
				part.write(uploadFile);
				
				System.out.println(part.getName());
				//파일 순서에 따라 다른 컬럼에 저장한다.
				if(part.getName().equals("File1")) {
					rvo.setImg1(uploadFile);
				System.out.println(uploadFile);
				}
				
				if(part.getName().equals("File2")) {
					rvo.setImg2(uploadFile);
					System.out.println(uploadFile);
				}
				
				
				if(part.getName().equals("File3")) {
					rvo.setImg3(uploadFile);
					System.out.println(uploadFile);
				}
				
			}
		}
		
		dao.insertReview(rvo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("reviewList.do");
		dispatcher.forward(request, response);
		
		
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
}
