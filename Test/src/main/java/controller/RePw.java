package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RePw
 */
@WebServlet("/repw")
public class RePw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RePw() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memId = request.getParameter("memId");
        if (memId != null && !memId.isEmpty()) {
            // 비밀번호 재설정 페이지로 이동
            RequestDispatcher dispatcher = request.getRequestDispatcher("/main/rePw.jsp");
            request.setAttribute("memId", memId); // memId를 request attribute로 설정
            dispatcher.forward(request, response);
        } else {
            // memId가 제대로 전달되지 않은 경우 예외 처리
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
    }
}
