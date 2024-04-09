package dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.Member;
import util.MybatisSqlSessionFactory;

public class MemberDAOImpl implements MemberDAO{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	@Override
	public void insertMember(Member member) throws Exception {
		sqlSession.insert("mapper.member.insertMember",member);
		sqlSession.commit();
	}

	@Override
	public Member selectMember(String memId) throws Exception {
		return sqlSession.selectOne("mapper.member.selectMember",memId);
	}

	@Override
	public Member selectMemberN(String memNick) throws Exception {
		return sqlSession.selectOne("mapper.member.selectMemberN",memNick);
	}


	@Override
	public String selectFindId(String memNick, String memPhone) throws Exception {
		 // Member 객체를 생성하고 닉네임과 전화번호를 설정합니다.
		Map<String, String> param = new HashMap<>();
		param.put("memNick", memNick);
		param.put("memPhone", memPhone);

	    // sqlSession을 이용하여 DB에서 아이디를 조회한 후 결과를 반환합니다.
	    return sqlSession.selectOne("mapper.member.selectFindId", param);
	}

	@Override
	public String selectFindPw(String memId, String memEmail) throws Exception {
		Map<String, String> param = new HashMap<>();
		param.put("memId", memId);
		param.put("memEmail", memEmail);
		
		  return sqlSession.selectOne("mapper.member.selectFindPw", param);
	}
}
