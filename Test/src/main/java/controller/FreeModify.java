package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.FBoard;
import service.FreeService;
import service.FreeServiceImpl;

/**
 * Servlet implementation class FreeModify
 */
@WebServlet("/freeBoard/freemodify")
public class FreeModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	      Integer freeNum = Integer.parseInt(request.getParameter("freeNum"));
	      try {
	         FreeService boardService = new FreeServiceImpl();
	         FBoard board = boardService.freeDetail(freeNum);
	         request.setAttribute("board", board);
	         request.getRequestDispatcher("freeModify.jsp").forward(request, response);
	      } catch(Exception e) {
	         e.printStackTrace();
	         request.setAttribute("err","게시글 불러오기 실패");
	         request.getRequestDispatcher("error.jsp").forward(request, response);
	      }
	}
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	       try {
	          FreeService boardService = new FreeServiceImpl();
	          boardService.freeModify(request);
	          //response.sendRedirect("freeDetail.jsp");
	       } catch (Exception e) {
	          e.printStackTrace();
	          request.setAttribute("err", "게시글 수정 실패");
	          request.getRequestDispatcher("error.jsp").forward(request, response);
	       }
	}

}
