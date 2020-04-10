package co.nadeulee.pjt.controller.infocate;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*******
 * Servlet implementation class CateFrontController
 */
@WebServlet("*.cate")
public class CateFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Map<String,Controller> map = new HashMap<String, Controller>();
  
    public CateFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	public void init(ServletConfig config) throws ServletException {
		
		map.put("/history.cate", new historyController());
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String url = request.getRequestURI();
		String context = request.getContextPath();
		String path = url.substring(context.length()+5);
		System.out.println(path);
		Controller subCon = map.get(path);
		subCon.execute(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		service(request, response);
	}

}
