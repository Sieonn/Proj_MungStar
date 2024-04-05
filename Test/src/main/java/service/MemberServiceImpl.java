package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.DogDAO;
import dao.DogDAOImpl;
import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Dog;
import dto.Member;

public class MemberServiceImpl implements MemberService {
	MemberDAO memberDao=new MemberDAOImpl();
	DogDAO dogDao=new DogDAOImpl();
	
	@Override
	public void login(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Member member=memberDao.selectMember(request.getParameter("memId"));
		if(member==null) throw new Exception("아이디 오류");
		if(!member.getMemPw().equals(request.getParameter("memPw"))) {
			throw new Exception("비밀번호 오류");
		}
		
		HttpSession session=request.getSession();
		member.setMemPw("");
		session.setAttribute("user", member);
	}

	@Override
	public void signup(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String memId=request.getParameter("memId");
		Member smember=memberDao.selectMember(memId);
		if(smember!=null) throw new Exception("아이디 중복 오류");
		
		String memNick=request.getParameter("memNick");
		String memPw=request.getParameter("memPw");
		String memEmail=request.getParameter("memEmail");
		String memPhone= request.getParameter("memPhone");
		String memAddress1=request.getParameter("memAddress1");
		String memAddress2=request.getParameter("memAddress2");
		
		Member member=new Member(memId, memNick, memPw, memEmail,memPhone, memAddress1, memAddress2);
		memberDao.insertMember(member);
		
	}

	@Override
	public boolean memberIdCheck(String memId) throws Exception {
		Member member=memberDao.selectMember(memId);
		if(member==null) return false;
		return true;
	}
	@Override
	public boolean memberNickCheck(String memNick) throws Exception {
		Member member=memberDao.selectMember(memNick);
		if(member==null) return false;
		return true;
	}

	@Override
	public void getMypage(HttpServletRequest request) throws Exception {
		Member member = (Member)request.getSession().getAttribute("user");
		if(member==null) throw new Exception("로그인 하세요");
		List<Dog> dogs=dogDao.selectDog(member.getMemId());
		request.setAttribute("dogs", dogs);
	}
}
