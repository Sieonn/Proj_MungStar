package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Temp;
import util.MybatisSqlSessionFactory;

public class TempDaoImplement implements TempDao{
	SqlSession sqlSession=MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override
	public List<Temp> selectTempList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.temp.selectTempList",row);
	}
	@Override
	public Integer selectBoardCount() throws Exception {
		return sqlSession.selectOne("mapper.temp.selectBoardCount");
	}
	@Override
	public Temp selectTemp(Integer tempNum) throws Exception {
		return sqlSession.selectOne("mapper.temp.selectTemp",tempNum);
	}

}
