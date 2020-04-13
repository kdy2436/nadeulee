package co.nadeulee.pjt.controller.infocate;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.nadeulee.pjt.DAO.TourListCateDAO;
import co.nadeulee.pjt.VO.TourListVO;
import co.nadeulee.pjt.common.Paging;

public class BukguController implements Controller {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Paging paging = new Paging();
		TourListCateDAO dao = TourListCateDAO.GetTourListDao();

		// 페이징처
		paging.setPageUnit(9);
		// 현재 페이지번호
		String page = request.getParameter("page");
		int p = 1;
		if (page != null)
			p = Integer.parseInt(page);
		paging.setPage(p);

		TourListVO vo = new TourListVO();

		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		vo.setSigungucode(5);

		// 전체 레코드수를 가지고 옴.
		int count = dao.sigunguCount(vo);
		paging.setTotalRecord(count);

		// 리스트를 얻음.
		List<TourListVO> list = dao.SigunguList(vo);

		request.setAttribute("list", list);
		request.setAttribute("page", paging);

		foward(request, response, "info/infoList.tiles");

	}

}
