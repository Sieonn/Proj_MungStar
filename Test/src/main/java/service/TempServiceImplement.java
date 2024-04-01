package service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.TempDao;
import dao.TempDaoImplement;
import dto.Temp;
import util.PageInfo;

public class TempServiceImplement implements TempService {
	private TempDao tempDao;

	public TempServiceImplement() {
		super();
		tempDao = new TempDaoImplement();
	}

	@Override
	public void tempListByPage(HttpServletRequest request) throws Exception {
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		String searchText = request.getParameter("searchText");
		String tempCgory = request.getParameter("tempCgory");

		if (tempCgory != null && tempCgory.equals(""))
			tempCgory = null;
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
		int boardCount = tempDao.selectTempCountWithCgoryAndSearch(tempCgory, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 9);
		int startPage = (page - 1) / 9 * 9 + 1;
		int endPage = startPage + 9 - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		int row = (page - 1) * 9;
		List<Temp> tempList = tempDao.selectTempListWithCgoryAndSearch(row, tempCgory, searchText);

		PageInfo pageInfo = new PageInfo();
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

	@Override
	public void tempWrite(HttpServletRequest request) throws Exception {
		Temp temp = new Temp();

		// 파일업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());
		
		temp.setTempName(multi.getParameter("tempName"));
		temp.setTempAddress(multi.getParameter("tempAddress"));
		  // 문자열
		String dateStr=multi.getParameter("protectDate");        
		// 포맷터
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");         
		// 문자열 -> Date
		temp.setProtectDate((Date) formatter.parse(dateStr));
		temp.setTempChar(multi.getParameter("tempChar"));
		temp.setTempEtc(multi.getParameter("tempEtc"));
		temp.setTempCgory(multi.getParameter("tempCgory"));
		
		tempDao.insertTemp(temp);
	}

}
