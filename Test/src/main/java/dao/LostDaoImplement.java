package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Lost;
import util.MybatisSqlSessionFactory;

public class LostDaoImplement implements LostDao{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<Lost> selectLostList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.lost.selectLostList",row);
	}

	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.lost.selectBoardCount");
	}

	@Override
	public Lost selectLost(Integer lostNum) throws Exception {
		return sqlSession.selectOne("mapper.lost.selectLost",lostNum);
	}

}
