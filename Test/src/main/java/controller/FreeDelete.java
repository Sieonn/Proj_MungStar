package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.FBoard;
import service.FreeService;
import service.FreeServiceImpl;
import service.TempService;
import service.TempServiceImplement;

/**
 * Servlet implementation class FreeDelete
 */
@WebServlet("/freeBoard/freeDelete")
public class FreeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer freeNum = Integer.parseInt(request.getParameter("freeNum"));
//		try {
//			FreeService freeService=new FreeServiceImpl();
//			freeService.deleteBoard(freeNum);
//			response.sendRedirect("freeboard");
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
		 HttpSession session = request.getSession(false);
		 if (session != null && session.getAttribute("user") != null) {
			 try {
				 String memNick = (String) session.getAttribute("user");
				 FreeService freeService=new FreeServiceImpl();
				 FBoard board = freeService.getBoardByFreeNum(freeNum);
	            if (board != null && board.getFreeNick().equals(memNick)) {
                    freeService.deleteBoard(freeNum);
                    response.sendRedirect("freeboard");
                } else {
                    // 게시물 작성자와 로그인한 사용자가 다른 경우
                    // 에러 처리 또는 권한 없음 페이지로 리다이렉트
                	response.sendRedirect("/MoongStar/login");
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        } else {
            // 로그인하지 않은 경우
            // 로그인 페이지로 리다이렉트
            response.sendRedirect("/MoongStar/login");
        }

	        
	                
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
