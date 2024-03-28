package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.LostDao;
import dao.LostDaoImplement;
import dto.Lost;
import util.PageInfo;

public class LostServiceImplement implements LostService{
	private LostDao lostDao;

	public LostServiceImplement() {
		super();
		lostDao=new LostDaoImplement();
	}	

	@Override
	public void lostListByPage(HttpServletRequest request) throws Exception {
		String paramPage=request.getParameter("page");
		Integer page=1;
		if(paramPage!=null) {
			page=Integer.parseInt(paramPage);
		}
		
		int boardCount=lostDao.selectBoardCount();
		int maxPage=(int)Math.ceil((double)boardCount/9);
		int startPage=(page-1)/9*9+1;
		int endPage=startPage+9-1;
		if(endPage>maxPage) endPage=maxPage;
		
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row=(page-1)*9;
		List<Lost> lostList=lostDao.selectLostList(row);
		
		request.setAttribute("losts", lostList);
		request.setAttribute("pageInfo", pageInfo);
	}

	@Override
	public Lost lostDetail(Integer lostNum) throws Exception {
		return lostDao.selectLost(lostNum);
	}
	
}
