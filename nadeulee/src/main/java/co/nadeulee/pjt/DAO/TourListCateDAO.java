package co.nadeulee.pjt.DAO;

import java.util.List;

import co.nadeulee.pjt.VO.TourVO;

public class TourListCateDAO {
	
	private static TourListCateDAO dao;
	
	public static TourListCateDAO GetTourListDao() {
		
		if(dao == null) dao = new TourListCateDAO();
		return dao;
		
	}

	public List<TourVO> historyList(int firstPage, int lastPage) {
		// TODO Auto-generated method stub
		return null;
	}

}
