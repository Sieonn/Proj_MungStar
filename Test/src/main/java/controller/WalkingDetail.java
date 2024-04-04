package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Walking;
import service.WalkingService;
import service.WalkingServiceImpl;

/**
 * Servlet implementation class WalkingDetail
 */
@WebServlet("/walking/walkingDetail")
public class WalkingDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WalkingDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer walkNum = Integer.parseInt(request.getParameter("walkNum"));
		try {
			WalkingService walkingService = new WalkingServiceImpl();
			Walking walking = walkingService.walkingDetail(walkNum);
			request.setAttribute("walking",walking);
			request.getRequestDispatcher("walkingDetail.jsp").forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err","잘못된 페이지입니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
	}

}
