package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.LostDao;
import dao.LostDaoImplement;
import dto.Lost;
import util.PageInfo;

public class LostServiceImplement implements LostService {
	private LostDao lostDao;

	public LostServiceImplement() {
		super();
		lostDao = new LostDaoImplement();
	}

	@Override
	public void lostListByPage(HttpServletRequest request) throws Exception {
		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		String searchText = request.getParameter("searchText");
		String lostCgory = request.getParameter("lostCgory");

		if (lostCgory != null && lostCgory.equals(""))
			lostCgory = null;
//		
		int boardCount = lostDao.selectLostCountWithCgoryAndSearch(lostCgory, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 8);
		int startPage = (page - 1) / 8 * 8 + 1;
		int endPage = startPage + 8 - 1;
		if (endPage > maxPage)
			endPage = maxPage;
		int row = (page - 1) * 8;

		List<Lost> lostList = lostDao.selectLostListWithCgoryAndSearch(row, lostCgory, searchText);

		PageInfo pageInfo = new PageInfo();
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

	@Override
	public void lostWrite(HttpServletRequest request) throws Exception {
		Lost lost = new Lost();

		// 파일업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		dto.File uploadFile = new dto.File();
		uploadFile.setDirectory(uploadPath);
		uploadFile.setName(multi.getOriginalFileName(uploadPath));
		uploadFile.setSize(multi.getFile("file").length());
		uploadFile.setContenttype(multi.getContentType("file"));
		lostDao.insertFile(uploadFile);

		java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
		file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

		lost.setLostPhoto(uploadFile.getNum());
		lost.setLostName(multi.getParameter("tempName"));
		lost.setLostAddress(multi.getParameter("tempAddress"));

		// 문자열 -> Date
		lost.setLostChar(multi.getParameter("tempChar"));
		lost.setLostEtc(multi.getParameter("tempEtc"));
		lost.setLostCgory(multi.getParameter("tempCgory"));
		lost.setMemId("hong");

		lostDao.insertLost(lost);
	}

	@Override
	public void lostModify(HttpServletRequest request) throws Exception {
		Lost lost = new Lost();

		// 파일업로드
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
				new DefaultFileRenamePolicy());

		if (multi.getFile("file") != null) {
			dto.File uploadFile = new dto.File();
			uploadFile.setDirectory(uploadPath);
			uploadFile.setName(multi.getOriginalFileName(uploadPath));
			uploadFile.setSize(multi.getFile("file").length());
			uploadFile.setContenttype(multi.getContentType("file"));
			lostDao.insertFile(uploadFile);

			java.io.File file = new java.io.File(uploadPath, multi.getFilesystemName("file"));
			file.renameTo(new java.io.File(file.getParent(), uploadFile.getNum() + ""));

			lost.setLostPhoto(uploadFile.getNum());
		}
		
		lost.setLostName(multi.getParameter("tempName"));
		lost.setLostAddress(multi.getParameter("tempAddress"));

		// 문자열 -> Date
		lost.setLostChar(multi.getParameter("tempChar"));
		lost.setLostEtc(multi.getParameter("tempEtc"));
		lost.setLostCgory(multi.getParameter("tempCgory"));
		lost.setMemId("hong");

		lostDao.updateLost(lost);
	}

	@Override
	public void lostDelete(Integer lostNum) throws Exception {
		// TODO Auto-generated method stub

	}

}
