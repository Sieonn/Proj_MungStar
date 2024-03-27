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
		
		int boardCount=tempDao.selectBoardCount();
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
		List<Temp> tempList=tempDao.selectTempList(row);
		
		request.setAttribute("temps", tempList);
		request.setAttribute("pageInfo", pageInfo);
		
	}
	
}
