package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.Comment;
import dto.Hospital;
import util.MybatisSqlSessionFactory;

public class HospitalDAOImpl implements HospitalDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public List<Hospital> selectHospitalList() throws Exception{		
		return sqlSession.selectList("mapper.hospital.selectHospitalList");
		
		
		
	}
	@Override
	public Hospital selectHospital(Integer hosNum) throws Exception{
		return sqlSession.selectOne("mapper.hospital.selectHospital",hosNum);
	}
	
	
	@Override
	public List<Comment> selectHosComment(Integer hosNum) throws Exception {
		return sqlSession.selectList("mapper.hospital.selectHosComment",hosNum);
	}
	@Override
	public void insertHosComment(Comment comment) throws Exception {
		sqlSession.insert("mapper.hospital.insertHosComment",comment);
		sqlSession.commit();
	}
	@Override
	public String selectHosNick(String memId) throws Exception {
		return sqlSession.selectOne("mapper.hospital.selectHosNick",memId);
	}
	
}
