package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.DogServiceImpl;

@WebServlet("/petinfo")
public class PetInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Autowired
    private DogServiceImpl service;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private void detail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerVO vo = service.customer_detail(id);
        request.setAttribute("vo", vo);
        request.getRequestDispatcher("/customer/detail.jsp").forward(request, response);
    }

    private void customer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/customer/new.jsp").forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerVO vo = new CustomerVO();
        vo.setXXX(request.getParameter("XXX"));
        // 다른 파라미터들도 마찬가지로 설정

        service.customer_insert(vo);
        response.sendRedirect("list.cu");
    }

    private void modify(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CustomerVO vo = service.customer_detail(id);
        request.setAttribute("vo", vo);
        request.getRequestDispatcher("/customer/modify.jsp").forward(request, response);
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CustomerVO vo = new CustomerVO();
        vo.setId(Integer.parseInt(request.getParameter("id")));
        vo.setXXX(request.getParameter("XXX"));
        // 다른 파라미터들도 마찬가지로 설정

        service.customer_update(vo);
        response.sendRedirect("detail.cu?id=" + vo.getId());
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.customer_delete(id);
        response.sendRedirect("list.cu");
    }
}