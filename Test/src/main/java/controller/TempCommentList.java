package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Comment;
import service.TempService;
import service.TempServiceImplement;

@WebServlet("/temp/tempCommentList")
public class TempCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TempCommentList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer tempNum=Integer.parseInt(request.getParameter("tempNum"));
		
		try {
			TempService tempService=new TempServiceImplement();
			List<Comment> comments= tempService.tempCommentList(tempNum);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("tempDetail.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utr-8");
		
		try {
			TempService tempService=new TempServiceImplement();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
