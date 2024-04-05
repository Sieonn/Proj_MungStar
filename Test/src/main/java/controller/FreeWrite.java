package controller;


import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import service.FreeService;
import service.FreeServiceImpl;

/**
 * Servlet implementation class FreeWrite
 */
@WebServlet("/freeBoard/freeWriteForm")
public class FreeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("freeWriteForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			FreeService freeService = new FreeServiceImpl();
			Integer freeNum = freeService.freeWrite(request);
			response.sendRedirect(request.getContextPath()+"/freeBoard/boarddetail?freeNum="+freeNum);			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "게시물 생성 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
		
	

	}
}
