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
		
		
		map.put("/allList.cate", new AllListController());
		map.put("/jungu.cate", new JunguController());
		map.put("/suseonggu.cate", new SuseongguController());
		map.put("/bukgu.cate", new BukguController());
		map.put("/namgu.cate", new NamguController());
		map.put("/seogu.cate", new SeoguController());
		map.put("/dalseogu.cate", new DalseoguController());
		map.put("/dalseonggun.cate", new DalseonggunController());
		map.put("/family.cate", new FamilyController());
		map.put("/festival.cate",new FestivalController());
		map.put("/history.cate", new historyController());
		map.put("/healing.cate", new HealingController());
		map.put("/alone.cate", new AloneController());
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String url = request.getRequestURI();
		String context = request.getContextPath();
		String path = url.substring(context.length());
		System.out.println(path);
		Controller subCon = map.get(path);
		subCon.execute(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		service(request, response);
	}

}
