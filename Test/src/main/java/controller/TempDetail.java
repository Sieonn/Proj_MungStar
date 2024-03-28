package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Temp;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/tempDetail")
public class TempDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("tempNum"));
		Integer tempNum=Integer.parseInt(request.getParameter("tempNum"));
		System.out.println(tempNum);
		try {
			TempService tempService=new TempServiceImplement();
			Temp temp=tempService.tempDetail(tempNum);
			System.out.println(temp.getTempName());
			request.setAttribute("temp", temp);
			request.getRequestDispatcher("tempDetail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
