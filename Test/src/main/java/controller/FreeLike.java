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

@WebServlet("/boardlike")
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
         String memberId=(String)jobj.get("memberId");
         String boardNum=(String)jobj.get("boardNum");
         
         BoardLikeService boardLikeServie=new BoardLikeServiceImpl();
         boolean like=boardLikeServie.togleBoardLike(memberId,Integer.parseInt(boardNum));
         response.getWriter().write(String.valueOf(like));
      } catch(Exception e){
         e.printStackTrace();
      }
   }

}
