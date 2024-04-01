package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		try {
			MemberService memberService = new MemberServiceImpl();
			memberService.login(id, password);
			
			//login success시 cookie check & 저장
			String autologin=request.getParameter("autologin");
			
			Cookie autoLoginCookie = null;
			Cookie idCookie = null;
			Cookie passwordCookie = null;
			if(autologin!=null) {
				autoLoginCookie = new Cookie("autologin", autologin);
				idCookie = new Cookie("id", id);
				passwordCookie = new Cookie("password", password);
			} else {
				autoLoginCookie = new Cookie("autologin", "false");
				idCookie = new Cookie("id", "");
				passwordCookie = new Cookie("password", "");
			}
			response.addCookie(autoLoginCookie);
			response.addCookie(idCookie);
			response.addCookie(passwordCookie);

			//session 저장
			request.getSession().setAttribute("user", id);
			request.getRequestDispatcher("makeaccount.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}

