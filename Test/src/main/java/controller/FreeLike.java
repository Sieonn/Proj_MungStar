package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import service.BoardLikeServiceImpl;
import service.BoardLikeService;

@WebServlet("/freelike")
public class FreeLike extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public FreeLike() {
        super();
    }
   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      
      String jsonParam=request.getParameter("like");
      JSONParser parser=new JSONParser();
      try {
         JSONObject jobj=(JSONObject)parser.parse(jsonParam);
         String memId=(String)jobj.get("memId");
         String freeNum=(String)jobj.get("freeNum");
         
         BoardLikeService boardLikeServie=new BoardLikeServiceImpl();
         boolean like=boardLikeServie.togleBoardLike(memId,Integer.parseInt(freeNum));
         response.getWriter().write(String.valueOf(like));
      } catch(Exception e){
         e.printStackTrace();
      }
   }

}
