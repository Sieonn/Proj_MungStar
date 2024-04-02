package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;


@WebServlet("/memberDoubleNick")
public class MemberDoubleNick extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDoubleNick() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			MemberService memberService=new MemberServiceImpl();
			boolean doubleNick=memberService.memberNickCheck(request.getParameter("memNick"));
			response.getWriter().write(String.valueOf(doubleNick));
		} catch(Exception e) {
			response.sendError(500);
		}
	}

}
