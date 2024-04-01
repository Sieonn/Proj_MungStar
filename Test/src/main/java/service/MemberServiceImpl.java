package service;

import dao.MemberDAO;
import dao.MemberDAOImpl;
import dto.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDAO memberDAO = new MemberDAOImpl();

	@Override
	public void join(Member member) throws Exception {
		Member smember = memberDAO.selectMember(member.getId());
		if(smember!=null) throw new Exception("이미 가입된 아이디입니다");
		memberDAO.insertMember(member);
	}

	@Override
	public void login(String id, String password) throws Exception {
		Member member = memberDAO.selectMember(id);
		if(member==null) throw new Exception("아이디 오류입니다");
		if(!member.getPassword().equals(password)) 
			throw new Exception("비밀번호 오류입니다");
	}

	@Override
	public boolean checkDoubleId(String id) throws Exception {
		Member member = memberDAO.selectMember(id);
		if(member==null) return false;
		return true;
	}
}
