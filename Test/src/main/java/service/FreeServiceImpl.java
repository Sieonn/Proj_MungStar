package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FreeDAO;
import dao.FreeDAOImpl;
import dto.FBoard;
import dto.File;
import dto.Temp;
import util.PageInfo;

public class FreeServiceImpl implements FreeService{

	private FreeDAO freeDAO;
	public FreeServiceImpl() {
		freeDAO = new FreeDAOImpl();
	}
	@Override
	public void freeWrite(HttpServletRequest request) throws Exception {
		FBoard board = new FBoard();
		
		//업로드 경로 & 파일크기
		String uploadPath = request.getServletContext().getRealPath("upload");
		int size = 10*1024*1024;
		
		//파일 업로드
		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		
	    //2. 업로드 파일이 있을경우
		if(multi.getFile("file")!=null) {
			//2-1. 파일정보를 uploadFile 객체에 담아 file 테이블에 삽입
			File uploadFile = new File();
			uploadFile.setName(multi.getOriginalFileName("file"));
			uploadFile.setDirectory(uploadPath);
			uploadFile.setContenttype(multi.getContentType("file"));
			uploadFile.setSize(multi.getFile("file").length());
			freeDAO.insertFile(uploadFile);
			
			//파일번호로 업로드한 파일명 변경
			java.io.File file = new java.io.File(uploadPath,multi.getFilesystemName("file"));
			file.renameTo(new java.io.File(file.getParent(),uploadFile.getNum()+""));
			
		}
		
		//파일 정보 테이블에 저장
		File uploadFile = new File();
		uploadFile.setName(multi.getOriginalFileName("file"));
		uploadFile.setDirectory(uploadPath);
		uploadFile.setContenttype(multi.getContentType("file"));
		uploadFile.setSize(multi.getFile("file").length());
		freeDAO.insertFile(uploadFile);
	
		
	    //3. 파라미터에서 파일 이외의 정보 가져와 Board 객체에 담아 Board 테이블에 삽입
	    board.setFreeSub(multi.getParameter("freesub"));
	    board.setFreeContent(multi.getParameter("freecontent"));
	    board.setFreeNick(multi.getParameter("freeNick"));
	    freeDAO.insertBoard(board);
		
	}

	@Override
	public void freeListByPage(HttpServletRequest request) throws Exception {
		//1. 페이지를 가져오고 없으면 페이지번호를 1로 한다.
//	    String paramPage = request.getParameter("page");
//	    Integer page = 1;
//	    if (paramPage != null) {
//	        page = Integer.parseInt(paramPage);
//	    }
//
//	    //2. PageInfo 계산하여 설정하기
//	    int boardCount = freeDAO.selectBoardCount();
//	    int maxPage = (int) Math.ceil((double) boardCount / 10);
//	    int startPage = (page - 1) / 10 * 10 + 1; //페이지 10을 고려하여 page-1을 한다.
//	    int endPage = startPage + 10 - 1;
//	    if (endPage > maxPage) endPage = maxPage;
//
//	    PageInfo pageInfo = new PageInfo();
//	    pageInfo.setCurPage(page);
//	    pageInfo.setAllPage(maxPage);
//	    pageInfo.setStartPage(startPage);
//	    pageInfo.setEndPage(endPage);
//
//	    //3. 해당 페이지에 해당하는 게시판 글 목록 조회
//	    int row = (page - 1) * 10;
//	    List<FBoard> boardList = freeDAO.selectBoardList(row);
//	
//	    //5. 응답으로 보내기 위해 request 영역에 담는다
//	    request.setAttribute("freeBoard", boardList);
//	    request.setAttribute("pageInfo", pageInfo);

		String paramPage = request.getParameter("page");
		Integer page = 1;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		String searchText = request.getParameter("searchText");
		String freeTag = request.getParameter("freeTag");
		System.out.println(freeTag);

		if (freeTag != null && freeTag.equals(""))
			freeTag = null;
		int boardCount = freeDAO.selectBoardCountByTagAndSearch(freeTag, searchText);

		int maxPage = (int) Math.ceil((double) boardCount / 8);
		int startPage = (page - 1) / 8 * 8 + 1;
		int endPage = startPage + 8 - 1;
		if (endPage > maxPage)
			endPage = maxPage;

		int row = (page - 1) * 8;
		List<FBoard> boardList = freeDAO.selectBoardListByTagAndSearch(row, freeTag, searchText);

		PageInfo pageInfo = new PageInfo();
		pageInfo.setCurPage(page);
		pageInfo.setAllPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		request.setAttribute("freeBoard", boardList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("freeTag", freeTag);
	}

	@Override
	public FBoard freeDetail(Integer freeNum) throws Exception {
		freeDAO.updateBoardViewCount(freeNum);
		return freeDAO.selectBoard(freeNum);
	}
	@Override
	public void freeModify(HttpServletRequest request) throws Exception {
		FBoard board = new FBoard();
	      // 파일업로드
	      //1-1. 업로드할 경로 설정
	      String uploadPath = request.getServletContext().getRealPath("upload");
	      int size = 10 * 1024 * 1024;
	      //1-2. 설정한 경로에 파일 업로드
	      MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
	            new DefaultFileRenamePolicy());
	      //2. 업로드 파일이 있을경우
	      if(multi.getFile("file")!=null) {
	    	//2-1. 파일정보 모아모아 uploadFile 객체 생성하여 파일 테이블에 삽입
	         dto.File uploadFile = new dto.File();
	         uploadFile.setDirectory(uploadPath);
	         uploadFile.setName(multi.getOriginalFileName(uploadPath));
	         uploadFile.setSize(multi.getFile("file").length());
	         uploadFile.setContenttype(multi.getContentType("file"));
	         freeDAO.insertFile(uploadFile);
	         //2-2. 저장된 파일번호로 업로드한 파일의 변경
	         java.io.File file=new java.io.File(uploadPath,multi.getFilesystemName("file"));
	         file.renameTo(new java.io.File(file.getParent(),uploadFile.getNum()+""));
	         //2-3. 저장된 파일번호로 Board의 파일번호 셋팅
	         board.setFreePhoto(uploadFile.getNum());
	      }
	      //3. 수정된 Board 정보를 파라미터에서 가져다가 Board 객체 생성하여 Board 테이블 갱신
	      board.setFreeNum(Integer.parseInt(multi.getParameter("num")));
	      board.setFreeSub(multi.getParameter("subject"));
	      board.setFreeContent(multi.getParameter("content"));
	      
	      freeDAO.updateBoard(board);
	   }
	
}
