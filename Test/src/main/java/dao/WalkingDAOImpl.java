package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.File;
import dto.Walking;
import util.MybatisSqlSessionFactory;

public class WalkingDAOImpl implements WalkingDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertWalking(Walking walk) throws Exception {
		sqlSession.insert("mapper.walking.insertWalking",walk);
		sqlSession.commit();
		
	}
	public List<Walking> selectWalkingList() throws Exception{		
		return sqlSession.selectList("mapper.walking.selectWalkingList");
		
		
		
	}
	
	public Walking selectWalking(Integer walkNum) throws Exception{
		return sqlSession.selectOne("mapper.walking.selectWalking",walkNum);
	}
	
	@Override
	public void insertFile(File file) throws Exception {
		sqlSession.insert("mapper.file.insertFile", file);
	    sqlSession.commit();
	    // dto에 있는 파일 import
		
	}
	
	
}
