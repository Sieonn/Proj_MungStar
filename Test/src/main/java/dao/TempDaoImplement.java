package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.File;
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
	@Override
	public List<Temp> selectTempListWithTempCgory(Integer row, String tempCgory) throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("tempCgory",tempCgory);
		return sqlSession.selectList("mapper.temp.selectTempListWithTempCgory",param);
	}
	@Override
	public Integer selectBoardCountWithTempCgory(String tempCgory) throws Exception {
		return sqlSession.selectOne("mapper.temp.selectBoardCountWithTempCgory", tempCgory);
	}
	@Override
	public List<Temp> selectTempListWithCgoryAndSearch(Integer row, String tempCgory, String searchText)
			throws Exception {
		Map<String,Object> param = new HashMap<>();
		param.put("row", row);
		param.put("tempCgory",tempCgory);
		param.put("searchText", searchText);
		return sqlSession.selectList("mapper.temp.selectTempListWithCgoryAndSearch",param);
	}
	@Override
	public Integer selectTempCountWithCgoryAndSearch(String tempCgory, String searchText) throws Exception {
		Map<String,Object> param = new HashMap<>();
		
		param.put("tempCgory",tempCgory);
		param.put("searchText", searchText);
		return sqlSession.selectOne("mapper.temp.selectTempCountWithCgoryAndSearch", param);
	}
	@Override
	public void insertTemp(Temp temp) throws Exception {
		sqlSession.insert("mapper.temp.insertTemp",temp);
		sqlSession.commit();
	}
	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile",file);
		sqlSession.commit();
	}

}
