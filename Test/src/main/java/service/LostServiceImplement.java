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
		String searchText=request.getParameter("searchText");
		String lostCgory=request.getParameter("lostCgory");
		
		if(lostCgory!=null && lostCgory.equals("")) lostCgory=null;
//		if(tempCgory==null)
//			tempCgory = "all";
//		System.out.println(tempCgory);
//		int boardCount = 0;
//		List<Temp> tempList = null;
//		if(tempCgory=="") {
//			boardCount=tempDao.selectBoardCount();
//			int row=(page-1)*9;
//			tempList=tempDao.selectTempList(row);
//		} else {
//			boardCount=tempDao.selectBoardCountWithTempCgory(tempCgory);
//			int row=(page-1)*9;
//			tempList=tempDao.selectTempListWithTempCgory(row,tempCgory);
//		}
		int boardCount=lostDao.selectLostCountWithCgoryAndSearch(lostCgory, searchText);
		
		int maxPage=(int)Math.ceil((double)boardCount/9);
		int startPage=(page-1)/9*9+1;
		int endPage=startPage+9-1;
		if(endPage>maxPage) endPage=maxPage;	
		
		int row=(page-1)*9;
		List<Lost> lostList=lostDao.selectLostListWithCgoryAndSearch(row, lostCgory, searchText);
		
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		request.setAttribute("losts", lostList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("lostCgory", lostCgory);
	}

	@Override
	public Lost lostDetail(Integer lostNum) throws Exception {
		return lostDao.selectLost(lostNum);
	}
	
}
