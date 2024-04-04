package service;

import javax.servlet.http.HttpServletRequest;

import dao.DogDAO;
import dao.DogDAOImpl;
import dto.Dog;
import dto.Member;

public class DogServiceImpl implements DogService {
    DogDAO dogDao = new DogDAOImpl();
    
    public void doginsert(HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("utf-8");

        String dogName = request.getParameter("dogName");
        int dogAge = Integer.parseInt(request.getParameter("dogAge"));
        String dogGender = request.getParameter("dogGender");
        String dogProfile = request.getParameter("dogProfile");

        Member user =(Member)request.getSession().getAttribute("user");
        String memId = user.getMemId();
        
        Dog dog = new Dog(dogName, memId, dogAge, dogGender, dogProfile);
        dogDao.insertDog(dog);
    }

    
}
