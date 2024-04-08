package dao;

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

}
