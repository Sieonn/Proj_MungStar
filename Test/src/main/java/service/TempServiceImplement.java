package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.TempDao;
import dao.TempDaoImplement;
import dto.Temp;
import util.PageInfo;

public class TempServiceImplement implements TempService{
	private TempDao tempDao;
	
	public TempServiceImplement() {
		super();
		tempDao=new TempDaoImplement();
	}
	
	@Override
	public void tempListByPage(HttpServletRequest request) throws Exception {
		String paramPage=request.getParameter("page");
		Integer page=1;
		if(paramPage!=null) {
			page=Integer.parseInt(paramPage);
		}
		String searchText=request.getParameter(paramPage)
		String tempCgory=request.getParameter("tempCgory");
		if(tempCgory==null)
			tempCgory = "all";
		System.out.println(tempCgory);
		int boardCount = 0;
		List<Temp> tempList = null;
		if(tempCgory.equals("all")) {
			boardCount=tempDao.selectBoardCount();
			int row=(page-1)*9;
			tempList=tempDao.selectTempList(row);
		} else {
			boardCount=tempDao.selectBoardCountWithTempCgory(tempCgory);
			int row=(page-1)*9;
			tempList=tempDao.selectTempListWithTempCgory(row,tempCgory);
		}
		
		int maxPage=(int)Math.ceil((double)boardCount/9);
		int startPage=(page-1)/9*9+1;
		int endPage=startPage+9-1;
		if(endPage>maxPage) endPage=maxPage;	
		
		PageInfo pageInfo=new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		request.setAttribute("temps", tempList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("tempCgory", tempCgory);
	}

	@Override
	public Temp tempDetail(Integer tempNum) throws Exception {
		return tempDao.selectTemp(tempNum);
	}
	
}
