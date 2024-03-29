package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<Lost> selectLostListWithCgoryAndSearch(Integer row, String lostCgory, String searchText)
			throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("lostCgory",lostCgory);
		param.put("searchText", searchText);
		System.out.println(param.get("lostCgory"));
		return sqlSession.selectList("mapper.lost.selectLostListWithCgoryAndSearch",param);
	}

	@Override
	public Integer selectLostCountWithCgoryAndSearch(String lostCgory, String searchText) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("lostCgory",lostCgory);
		param.put("searchText", searchText);
		System.out.println(param.get("lostCgory"));
		return sqlSession.selectOne("mapper.lost.selectLostCountWithCgoryAndSearch", param);
	}

}
