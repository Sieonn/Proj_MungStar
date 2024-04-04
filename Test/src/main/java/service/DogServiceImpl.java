package service;

import javax.servlet.http.HttpServletRequest;
import dao.DogDAO;
import dao.DogDAOImpl;
import dto.Dog;

public class DogServiceImpl implements DogService {
    DogDAO dogDao = new DogDAOImpl();
    
    @Override
    public void mypage(HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("utf-8");

        String dogName = request.getParameter("dogName");
        int dogNum = Integer.parseInt(request.getParameter("dogNum"));
        String memId = request.getParameter("memId");
        int dogAge = Integer.parseInt(request.getParameter("dogAge"));
        String dogGender = request.getParameter("dogGender");
        String dogProfile = request.getParameter("dogProfile");

        Dog dog = new Dog(dogName, dogNum, memId, dogAge, dogGender, dogProfile);
        dogDao.insertDog(dog);
    }
    
}
