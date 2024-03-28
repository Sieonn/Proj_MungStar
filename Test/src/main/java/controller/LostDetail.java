package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Lost;
import service.LostService;
import service.LostServiceImplement;

@WebServlet("/lostDetail")
public class LostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LostDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("lostNum"));
		Integer lostNum=Integer.parseInt(request.getParameter("lostNum"));
		System.out.println(lostNum);
		try {
			LostService lostService=new LostServiceImplement();
			Lost lost=lostService.lostDetail(lostNum);
			System.out.println(lost.getLostName());
			request.setAttribute("lost", lost);
			request.getRequestDispatcher("lostDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
