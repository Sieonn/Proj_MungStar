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
@WebServlet("/freewrite")
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
		request.getRequestDispatcher("freeWriteForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
			FreeService freeService = new FreeServiceImpl();
			freeService.freeWrite(request);
			request.getRequestDispatcher("boardlist").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "글쓰기 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
		
	

	}
}
