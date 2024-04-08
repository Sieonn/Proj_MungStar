package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dto.Comment;
import service.TempService;
import service.TempServiceImplement;

/**
 * Servlet implementation class FreeComment
 */
@WebServlet("/freeBoard/freecomment")
public class FreeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer tempNum=Integer.parseInt(request.getParameter("freeNum"));
		
		try {
			TempService tempService=new TempServiceImplement();
			List<Comment> comments= tempService.tempCommentList(tempNum);
			request.setAttribute("comments", comments);
			request.getRequestDispatcher("freeDetail.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		try {
			TempService tempService=new TempServiceImplement();
			Comment comment=tempService.addTempComment(request);
//			JSONParser parser=new JSONParser();
			JSONObject jsonObj=new JSONObject();
			jsonObj.put("commContent", comment.getCommContent());
			jsonObj.put("memNick",comment.getCommNick());
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(jsonObj.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
